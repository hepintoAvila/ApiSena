<?php

/***************************************************************************\
 *  SPIP, Systeme de publication pour l'internet                           *
 *                                                                         *
 *  Copyright (c) 2001-2017                                                *
 *  Arnaud Martin, Antoine Pitrou, Philippe Riviere, Emmanuel Saint-James  *
 *                                                                         *
 *  Ce programme est un logiciel libre distribue sous licence GNU/GPL.     *
 *  Pour plus de details voir le fichier COPYING.txt ou l'aide en ligne.   *
\***************************************************************************/
 
if (!defined('_ECRIRE_INC_VERSION')) {
	return;
}
		include_spip('inc/autoriser');	
		include_spip('base/connect_sql');
		include_spip('inc/filtres_ecrire');
		include_spip('inc/filtres');
		include_spip('inc/texte_mini');
		include_spip('inc/utils');
		include_spip('inc/json');
		include_spip('exec/model/sena/claseapi');	
		//include_spip('fpdf.php');	
		include_spip('inc/charsets');
		include_spip('inc/actions');
		include_spip('inc/editer');
		include_spip('inc/notifications');

		function formatearFecha($fechaEntrada) {
			// Crear un objeto DateTime a partir de la fecha de entrada
			$fecha = new DateTime($fechaEntrada);
		
			// Definir los meses en español
			$meses = [
				1 => 'enero', 2 => 'febrero', 3 => 'marzo', 4 => 'abril',
				5 => 'mayo', 6 => 'junio', 7 => 'julio', 8 => 'agosto',
				9 => 'septiembre', 10 => 'octubre', 11 => 'noviembre', 12 => 'diciembre'
			];
		
			// Obtener el día, mes y año de la fecha
			$dia = $fecha->format('d');
			$mes = $fecha->format('n'); // Mes en formato numérico sin ceros iniciales
			$anio = $fecha->format('Y');
		
			// Formatear la fecha en el formato requerido
			$fechaFormateada = $meses[$mes] . " " . $dia . " de " . $anio;
		
			return $fechaFormateada;
		}
				 
		/**
		 * Crear PDF de acta.
		 *
		 * @param int $idActa
		 */
		function crearPdfActa($idActa,$opcion) {
			$path = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/fpdf_actas'.$idActa.'.pdf';
			if (file_exists($path)) {
				spip_log("Supprimer ancien logo '.$idActa.'", 'listaActas');
				spip_unlink($path);
			}
			require('../ecrire/exec/model/sena/ModuloActas/fpdf_actas.php');
			$pdf = new PDF();
			if($opcion=='actualizar'){
				$sql1 = sql_select('casosComite', 'sena_actas', 'idActa="'.$idActa.'" AND entidad="senaV1"');
				while ($row1 = sql_fetch($sql1)) {
					if (!empty($row1['casosComite'])) {
						$casos = $row1['casosComite'];
					}
				}
					// Obtener Acta
				$sql4 = sql_select('*', 'sena_actas', 'idActa = "'.$idActa.'" AND entidad="senaV1"');
					while ($row4 = sql_fetch($sql4)) {
						if (!empty($row4['nombre'])) {
							$idActa = $row4['idActa'];
							$NombreActa = $row4['nombre'];
							$Fecha = $row4['fecha'];
							$horaInicial = $row4['horaInicial'];
							$horaFinal = $row4['horaFinal'];
							$presentacion = $row4['presentacion'];
						}
					}
					$DatosActa =array(
						'idActa'=>$idActa,
						'nombreActa'=>$NombreActa,
						'Fecha'=>formatearFecha($Fecha),
						'horaInicial'=>$horaInicial,
						'horaFinal'=>$horaFinal,
						'presentacion'=>$presentacion,
					);
 				
			$pdf->DatosActa=$DatosActa;
			$itemsSolicitud = explode(',',$casos);
			$i=0;
			$datosAprendiz = [];
			$dataConceptos = [];
			$dataApr = [];
			foreach ($itemsSolicitud as $idSolicitud) {
				
			$sql2 = sql_select('*','sena_solicitudcomite', 'idSolicitud ="'.$idSolicitud.'" AND entidad="senaV1"');
			while ($row2 = sql_fetch($sql2)) {
				if (!empty($row2['idAprendiz'])) {
						$sql3 = sql_select('*', 'sena_aprendiz', 'idAprendiz="'.$row2['idAprendiz'].'" AND entidad="senaV1"');
					
					$j=1;
					while ($row3 = sql_fetch($sql3)) {
						if (!empty($row3['nombres'])) {
							$dataApr= array(
							'no'=>''.$j,
							'nombreAprendiz'=> ''.$row3['nombres'].' '.$row3['apellidos'].'', 
							'tipoIdentificacion'=>!empty($row3['tipoIdentificacion']) ? $row3['tipoIdentificacion']:'CC',
							'identificacion'=>!empty($row3['identificacion']) ? $row3['identificacion']:'1111111',
							'correo'=>!empty($row3['correo']) ? $row3['correo']:'sienemail@gmail.com',
							'telefono'=>!empty($row3['telefono']) ? $row3['telefono']:'5555555',
							'programaFormacion'=>!empty($row3['programaFormacion']) ? $row3['programaFormacion']:'SIN PROGRAMA FORMACION',
							'ficha'=>!empty($row3['ficha']) ? $row3['ficha']:'000001'
							);
						}
						$j++;
					}

				}
			}
			$i=1;
			//print_r('idActa ="'.$idActa.'" AND idSolicitud ="'.$idSolicitud.'" AND entidad="senaV1"');
			$sql5 = sql_select('*','sena_actas_conceptos', 'idActa ="'.$idActa.'" AND idSolicitud ="'.$idSolicitud.'" AND entidad="senaV1"');
			while ($row5 = sql_fetch($sql5)) {
							$dataConceptos= array(
							'no'=>''.$i,
							'hechos'=>!empty($row5['hechos']) ? $row5['hechos']:'sin hechos',
							'contemplacion'=>!empty($row5['contemplacion']) ? $row5['contemplacion']:'sin contemplacion',
							'frenteHechos'=>!empty($row5['frenteHechos']) ? $row5['frenteHechos']:'frenteHechos',
							'recomendacion'=>!empty($row5['recomendacion']) ? $row5['recomendacion']:'recomendacion',
							'compromisos'=>!empty($row5['compromisos']) ? $row5['compromisos']:'compromisos',
							);
				
				$i++;
			}
			
			if (!empty($dataConceptos)) {
				$dataConceptosActa = $dataConceptos;
			}else{
				$dataConceptosActa= array(
					'no'=>'1', 
					'hechos'=>'hechos', 
					'contemplacion'=>'contemplacion',
					'frenteHechos'=>'frenteHechos',
					'recomendacion'=>'recomendacion',
					'compromisos'=>'compromisos'
					);
			}
			if (!empty($dataApr)) {
				$datosAprendiz = $dataApr;
			}else{
				$datosAprendiz= array(
					'nombreAprendiz'=>'SiN REGISTRO', 
					'tipoIdentificacion'=>'cc',
					'identificacion'=>'000000',
					'correo'=>'sienemail@gmail.com',
					'telefono'=>'000000',
					'ficha'=>'000001',
					'programaFormacion'=>'SIN PROGRAMA FORMACION'
					);
			}
			
				$i++;
				$pdf->datosAprendiz=$datosAprendiz;
				$pdf->dataConceptos=$dataConceptosActa;
				$pdf->AddPage('P', 'Legal');
				$pdf->Contenido();
				$pdf->AliasNbPages();
			}
			$pdf->Output('F', 'Acta_'.$idActa.'.pdf', true);
			$pdfPath = '../ecrire/Acta_'.$idActa.'.pdf';
			if (file_exists($pdfPath)) {
				$newLocation = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/Actas_'.$idActa.'.pdf';
				$moved = rename($pdfPath, $newLocation);
				if ($moved) {
					spip_unlink($pdfPath);
				}
			}
		}
	}
		
		function corregir_conceptos($str) {
			if (isset($str)) {
				$hechos = base64_decode($str);
				
				// Assuming input data is in UTF-8 before base64 encoding
				 //$hechos_utf8 =urldecode($hechos);
				$hechos_html = decodeHtmlEnt($hechos);
				return $hechos_html;
			}
			return null;
		}
		$opcion = base64_decode($_POST['opcion']);
		
		switch ($opcion) {
			case 'generarConsolidado':

				$entidad = base64_decode($_POST['entidad']);
				$items = base64_decode($_POST['items']);
				 

				$DatosAuteurs=array();
				$select='*';
				$set = array();	
				$sql = sql_select("COUNT(*) AS total",'sena_actas','idActa IN ('.$items.') AND entidad="'.$entidad.'" AND statut="Activo"');
					while ($row = sql_fetch($sql)) {	
						$total = $row['total'];
					}
					if($total >= 1){
						$app=new Apis('sena_actas');
						//$aprendizes=$app->consultadatos('idActa IN ('.$items.') AND entidad="'.$entidad.'"',$select);				
						$sql1 = sql_select('*','sena_actas','idActa IN ('.$items.') AND entidad="'.$entidad.'" AND statut="Activo"');
						while ($row1 = sql_fetch($sql1)) {	
							$consolidado[]= array(
												"FECHA COMITE"=>$row1['fecha'],
												"HORA"=>$row1['fecha'],
												"APRENDIZ"=>'APRENDIZ',
												"TIPO DOCUMENTO"=>'TP',
												"NUMERO DE DOCUMENTO IDENTIDAD"=>'xxxx',
												"ESPECIALIDAD"=>'ESPECIALIDAD',
												"FICHA"=>'FICHA',
												"INICIO LECTIVA"=>'INICIO LECTIVA',
												"FECHA FIN FORMACION"=>'FECHA FIN FORMACION',
												"INICIO PRODUCTIVA"=>'INICIO PRODUCTIVA',
												"FIN 2 AÑOS"=>'FIN 2 AÑOS',
												"CORREO"=>'CORREO',
												"TELEFONO"=>'TELEFONO',
												"SOLICITUD"=>'SOLICITUD',
												"HECHOS"=>'La instructora informa que la empresa DELTA A SALUD SAS BIC cancela por mutuo acuerdo el contrato de aprendizaje a partir de septiembre 27/203, igualmente la aprendiz manifiesta dolencias físicas en el brazo derecho, jornadas de trabajo virtual muy extensas, se le permitió trabajar desde la casa.',
												"CITACION"=>'1',
												"ETAPA"=>'PRODUCTIVA',
												"JORNADA"=>'MAÑANA',
												"REGLA"=>'DEBERES DEL APRENDIZ. En el  articulo 9, numeral 1 "Cumplir con todas las actividades propias de su proceso de aprendizaje o del plan de mejoramiento, definidas durante su etapa lectiva y productiva.',
												"TIPO DE FALTA"=>'ACADEMICA',
												"COORDINADOR"=>'DORIS JUDITH',
												"OBSERVACIONES"=>'El Aprendiz el día 24 de octubre de 2023, comienza su fase práctica en las instalaciones de la Universidad Autónoma De Bucaramanga U.N.A.B., el 01 de noviembre a las 4:15 pm, envía un mensaje de voz informándome el cambio de sede de práctica, diciendo que no conocía la sede del Cacique. El 02 de noviembre el ingeniero Rubén Darío Pérez, Coordinador Soporte Tecnológico, mediante comunicación telefónica informa que el aprendiz no se presentó y que no se ha logrado establecer comunicación con él. Se ha intentado contactar al aprendiz por diferentes medios, sin obtener respuesta alguna a la fecha',
												);	
						}
						
						$data = array("data"=>$consolidado);
						$var = var2js($data);
						echo $var;
					}else{	
					$records[] = array('idActa'=>1,
					'nombre'=>'No existen registros',
					'fecha'=>'2024',
					'horaInicial'=>'08',
					'status' => '202');
					$data = array("data"=>$records);
					$var = var2js($data);	
					echo $var;	
					}
				break;
			case 'listActas':
				$entidad = base64_decode($_POST['entidad']);
				$DatosAuteurs=array();
				$select='*';
				$set = array();	
				$sql = sql_select("COUNT(*) AS total",'sena_actas','entidad="'.$entidad.'" AND statut="Activo"');
					while ($row = sql_fetch($sql)) {	
						$total = $row['total'];
					}
					if($total >= 1){
						$app=new Apis('sena_actas');
						$aprendizes=$app->consultadatos('entidad="'.$entidad.'"',$select);				
						$data = array("data"=>$aprendizes);
						$var = var2js($data);
						echo $var;
					}else{
						$records[] = array('idActa'=>1,
						'nombre'=>'No existen registros',
						'fecha'=>'2024',
						'horaInicial'=>'08'
					);
						$data = array("data"=>$records);
						$var = var2js($data);	
						echo $var;							
					}						
			break;
			
			case 'add':
                
					$app=new Apis('sena_actas');
					$variablesAVerificar=array();
					$desc=array();
					$id_ou_options=0;
				 	$nombre = base64_decode($_POST['nombre']);
				 	$fecha = base64_decode($_POST['fecha']);
				 	$horaInicial = base64_decode($_POST['horaInicial']);
				 	$horaFinal = base64_decode($_POST['horaFinal']);
				 	$secretario = base64_decode($_POST['secretario']);
                    $entidad = base64_decode($_POST['entidad']);
                    $ApiToken     = base64_decode($_POST["ApiToken"]);
					$Apikey     = base64_decode($_POST["Apikey"]);	
                    $idUsuario = base64_decode($_POST["idUsuario"]);
                    $presentacion = base64_decode($_POST["presentacion"]);
 						// Crea un array con las variables que deseas verificar
						$variablesAVerificar = [
							'nombre' => $nombre,
							'fecha' => $fecha,
							'horaInicial' => $horaInicial,
							'horaFinal' => $horaFinal,
                            'entidad' => $entidad,
                            'ApiToken' => $ApiToken,
                            'Apikey' => $Apikey,
                            'idUsuario' => $idUsuario,
                            'presentacion' => $presentacion,
						];
						$mensajeError = $app->verificarVariables($variablesAVerificar);
						$validarTokes = $app->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
						if (($mensajeError !== null) OR (!$validarTokes)){
							
						 $mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
						 $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
							
						}else{
                            					$table='sena_actas';
	
												$chartic['nombre'] ="".$nombre."";
												$chartic['fecha'] =$fecha;
												$chartic['horaInicial'] =$horaInicial;
                                                $chartic['horaFinal'] =$horaFinal;
                                                $chartic['ciudad'] ='Bucaramanga';
                                                $chartic['lugar'] ='Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente';
												$chartic['direccion'] ='Centro de Servicios Empresariales y Turísticos';
                                                $chartic['casosComite'] ='0';
                                                $chartic['secretario'] =$secretario;
												$chartic['asistencias'] ='';
												$chartic['presentacion'] =$presentacion;
                                                $chartic['entidad'] =$entidad;
												$chartic['statut'] ='Activo';
												$chartic = pipeline('pre_insertion',
													array(
														'args' => array(
														'table' => ''.$table.'',
													),
													'data' => $chartic
													)
												);							
												$idActa=@sql_insertq(''.$table.'',$chartic);
												pipeline('post_insertion',
												array(
													'args' => array(
													'table' =>''.$table.'',
													'id_objet' => $idActa
													),
													'data' => $chartic
													)
												);
											$msg[] = 'Acta guardado con exito';
											$arrayMensage[] = array('message'=>'¡OK!. El Acta fue GUARDADO! '.implode(',',$msg).'','status' => '202');
											crearPdfActa($idActa,'add');
										}	
				
				$var = var2js($arrayMensage);
				echo $var;
			break;
			case 'update':
                $app=new Apis('sena_actas');
                $variablesAVerificar=array();
                $desc=array();
                $id_ou_options=0;
				$nombre = base64_decode($_POST['nombre']);
				$fecha = base64_decode($_POST['fecha']);
				$horaInicial = base64_decode($_POST['horaInicial']);
				$horaFinal = base64_decode($_POST['horaFinal']);
				$secretario = base64_decode($_POST['secretario']);
				$presentacion = base64_decode($_POST['presentacion']);
                $entidad = base64_decode($_POST['entidad']);
                $ApiToken     = base64_decode($_POST["ApiToken"]);
                $Apikey     = base64_decode($_POST["Apikey"]);	
                $idUsuario = base64_decode($_POST["idUsuario"]);
				$idActa = base64_decode($_POST["idActa"]);
                     // Crea un array con las variables que deseas verificar
                    $variablesAVerificar = [
                        'nombre' => $nombre,
                        'fecha' => $fecha,
                        'horaInicial' => $horaInicial,
                        'horaFinal' => $horaFinal,
                        'secretario' => $secretario,
                        'entidad' => $entidad,
                        'ApiToken' => $ApiToken,
                        'Apikey' => $Apikey,
                        'idUsuario' => $idUsuario,
						'idAprendiz' =>$idActa
                    ];
                      //print_r($variablesAVerificar);
                    $mensajeError = $app->verificarVariables($variablesAVerificar);
                    $validarTokes = $app->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
                    if (($mensajeError !== null) OR (!$validarTokes)){
                        
                     $mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
                     $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
                        
                    }else{
                   

                                            $chartic['nombre'] ="".$nombre."";
                                            $chartic['fecha'] ="".$fecha."";
                                            $chartic['horaInicial'] ="".$horaInicial."";
                                            $chartic['horaFinal'] ="".$horaFinal."";
                                            $chartic['secretario'] ="".$secretario."";                                   
                                            $chartic['presentacion'] =''.$presentacion.'';                                   
								    	$chartic = pipeline('pre_insertion',
											array(
												'args' => array(
												'table' => 'sena_actas',
											),
											'data' => $chartic
											)
										);							
										sql_updateq('sena_actas',$chartic,"idActa=" . intval($idActa) . "");
				
										pipeline('post_insertion',
										array(
											'args' => array(
											'table' =>'sena_actas',
											'id_objet' => $idActa
											),
											'data' => $chartic
											)
										);
										$arrayMensage[]=array(
											'id'=>1,
											'message'=>'::OK:: Acta Acualizado!',
											'status'=>'202');
											crearPdfActa($idActa,'actualizar');
                                            $var = var2js($arrayMensage);
											echo $var;	
                    }						
					
			break;
			case 'delete':
					$idActa = base64_decode($_POST["id"]);

					sql_delete("sena_actas","idActa=" . intval($idActa));
					
					$res = sql_select("*", "sena_actas", "AND statut='Activo' AND idActa=" . intval($idActa));
					if ($res){
					$msg[] = array('menssage'=>'OK. El Registro Del Acta '.$idActa.' fue eliminado correctamente!','status' => '200');
					}	
					$var = var2js($msg);	
					echo $var;					
			break;
			
			case 'listaSanciones':
				$idAprendiz = base64_decode($_POST["idAprendiz"]);

				$entidad = base64_decode($_POST['entidad']);
				$DatosAuteurs=array();
				$select='*';
				$set = array();	
				
				$app=new Apis('sena_sancionesanteriores');
				$aprendizes=$app->consultadatos('idAprendiz = "'.$idAprendiz.'" AND entidad="'.$entidad.'"',$select);				
				
					$data = array("data"=>$aprendizes);
					$var = var2js($data);
					echo $var;	
							
		break;
		case 'addIds':
			$app=new Apis('sena_actas');
			$variablesAVerificar=array();
			$desc=array();
			$id_ou_options=0;
			$idActa = base64_decode($_POST['idActa']);
			$items = base64_decode($_POST['items']);
			$entidad = base64_decode($_POST['entidad']);
			$ApiToken     = base64_decode($_POST["ApiToken"]);
			$Apikey     = base64_decode($_POST["Apikey"]);	
			$idUsuario = base64_decode($_POST["idUsuario"]);
			$idActa = base64_decode($_POST["idActa"]);
				 // Crea un array con las variables que deseas verificar
				$variablesAVerificar = [
					'idActa' => $idActa,
					'entidad' => $entidad,
					'ApiToken' => $ApiToken,
					'Apikey' => $Apikey,
					'idUsuario' => $idUsuario,
				];	
				 
				$mensajeError = $app->verificarVariables($variablesAVerificar);
				$validarTokes = $app->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
				if (($mensajeError !== null) OR (!$validarTokes)){
					
				 $mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
				 $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
					
				}else{
				
				$chartic['casosComite'] ="".$items."";                                 
				$chartic = pipeline('pre_insertion',
					array(
						'args' => array(
						'table' => 'sena_actas',
					),
					'data' => $chartic
					)
				);							
				sql_updateq('sena_actas',$chartic,"idActa=" . intval($idActa) . "");

				pipeline('post_insertion',
				array(
					'args' => array(
					'table' =>'sena_actas',
					'id_objet' => $idActa
					),
					'data' => $chartic
					)
				);
				$arrayMensage[]=array(
					'id'=>1,
					'message'=>'::OK:: Acta Acualizado!',
					'status'=>'202');
				  
					$var = var2js($arrayMensage);
					echo $var;	

				}
				//CREAMOS EL PDF DE LOS ESTUDIANTES ASIGNADOS AL ACTA
				crearPdfActa($idActa);
						
				break;
		case 'addAsistente':						
			$app=new Apis('sena_asistencias');
			$variablesAVerificar=array();
			$chartic=array();
			$id_ou_options=0;
			 $nombresApellidos = base64_decode($_POST['nombresApellidos']);
			 $documento = base64_decode($_POST['documento']);
			 $contratista = base64_decode($_POST['contratista']);
			 $otroContratista = base64_decode($_POST['otroContratista']);
			 $dependencia = base64_decode($_POST['dependencia']);
			 $email = base64_decode($_POST['email']);
			 $telefono = base64_decode($_POST['telefono']);
			 $planta = base64_decode($_POST['planta']);
			 $autorizacion = base64_decode($_POST['autorizacion']);
			 $firmaDigital = base64_decode($_POST['firmaDigital']);
			 $nombresDigital = base64_decode($_POST['nombresDigital']);
			 $idActa = base64_decode($_POST['idActa']);
			$entidad = base64_decode($_POST['entidad']);
			$ApiToken     = base64_decode($_POST["ApiToken"]);
			$Apikey     = base64_decode($_POST["Apikey"]);	
			$idUsuario = base64_decode($_POST["idUsuario"]);
				 // Crea un array con las variables que deseas verificar
				$variablesAVerificar = [
					'nombresApellidos' => $nombresApellidos,
					'documento' => $documento,
					'contratista' => $contratista,
					'idActa' => $idActa,
					'dependencia' => $dependencia,
					'email' => $email,
					'telefono' => $telefono,
					'planta' => $planta,
					'autorizacion' => $autorizacion,
					'firmaDigital' => $firmaDigital,
					'nombresDigital' => $nombresDigital,
					'ApiToken' => $ApiToken,
					'Apikey' => $Apikey,
					'idUsuario' => $idUsuario,
				];	
				$mensajeError = $app->verificarVariables($variablesAVerificar);
				$validarTokes = $app->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
				if (($mensajeError !== null) OR (!$validarTokes)){
					
				 $mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
				 $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
					
				}else{
			
					$chartic['idActa'] ="".$idActa."";
					$chartic['nombresApellidos'] ="".$nombresApellidos."";
					$chartic['documento'] ="".$documento."";
					$chartic['dependencia'] ="".$dependencia."";
					$chartic['email'] ="".$email."";
					$chartic['telefono'] ="".$telefono."";                                   
					$chartic['planta'] ="".$planta."";                                   
					$chartic['contratista'] ="".$contratista."";                                   
					$chartic['contratistaOtros'] ="".$otroContratista."";                                   
					$chartic['autorizacion'] ="".$autorizacion."";                                   
					$chartic['firmaDigital'] ="".$firmaDigital."";                                   
					$chartic['entidad'] ="".$entidad."";                                   
					$chartic = pipeline('pre_insertion',
					array(
						'args' => array(
						'table' => 'sena_asistencias',
					),
					'data' => $chartic
					)
				);							
				$idAsistencia=@sql_insertq('sena_asistencias',$chartic);

				pipeline('post_insertion',
				array(
					'args' => array(
					'table' =>'sena_asistencias',
					'id_objet' => $idAsistencia
					),
					'data' => $chartic
					)
				);
				$arrayMensage[]=array(
					'id'=>1,
					'message'=>'::OK:: Asistente registrado!',
					'status'=>'202');
					$var = var2js($arrayMensage);
					echo $var;	
			
				}
				
				//ARMAR PDF PARA LA LISTA
						//CREAMOS LA SOLICITUD EN PDF
						$path = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/'.$idActa.'.pdf';
						if (@file_exists($path)){
							spip_log("Supprimer ancien logo '.$idActa.'", 'listaAsistentes');
							spip_unlink($path);
						}
						require('../ecrire/exec/model/sena/ModuloActas/fpdf_listAsistencias.php');
						$pdf = new PDF();
						$pdf->AliasNbPages();
						$pdf->AddPage('P','Legal');
						$pdf = new PDF();
						// Títulos de las columnas
						$select='*';
						$set = array();	
						$w1 = array(8, 83, 40, 20,39);
						$w2 = array(190);
						$w3 = array(95, 95);
							
						$i=1;				
						$sql = sql_select($select,'sena_asistencias','entidad="senaV1"');
							while ($row = sql_fetch($sql)) {	
								$data[$i][]= array(''.$i.'',''.$row['nombresApellidos'].'',''.$row['documento'].''.$row['planta'].'',''.$row['contratista'].'');	
								$data2[$i][]= array(''.$row['contratistaOtros'].'');	
								$data3[$i][]= array(''.$row['dependencia'].'',''.$row['email'].'');	
								$data4[$i][]= array(''.$row['autorizacion'].'','');	
								$i++;
							}
						$header1= array('#', 'NOMBRES Y APELLIDOS', 'DOCUMENTO', 'PLANTA','CONTRATISTA');						
						$header2 = array('OTRO ¿CUAL?');
						$header3 = array('DEPENDENCIA/ EMPRESA', 'CORREO ELECTRÓNICO');
						$header4 = array('AUTORIZA GRABACIÓN', 'FIRMA O PARTICIPACIÓN VIRTUAL');
						$header5 = array('');
						
						// Carga de datos
						$pdf->SetFont('Arial','',14);
						$pdf->AddPage();
						for($i = 1; $i < count($data); ++$i) {
						$pdf->SimpleTable($header1,$data[$i],$w1);
						$pdf->SimpleTable($header2,$data2[$i],$w2);
						$pdf->SimpleTable($header3,$data3[$i],$w3);
						$pdf->SimpleTable($header4,$data4[$i],$w3);
						//$pdf->SingleColumnTable($header5);
						$pdf->ln(6);
						}

						$pdf->Output('F',''.$idActa.'.pdf',true);
						$pdf='../ecrire/'.$idActa.'.pdf';
						if (@file_exists($pdf)){
							$newLocation = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/'.$idActa.'.pdf';
							$moved = rename($pdf, $newLocation);
							if($moved)
							  {
								spip_unlink($pdf);
							  }						
						}						 
					   //FIN GENERA LA FICHA

		break;
		case 'ConsultarAsistentes':	
			$entidad = base64_decode($_POST['entidad']);
			$DatosAuteurs=array();
			$select='*';
			$set = array();	
			$sql = sql_select("COUNT(*) AS total",'sena_asistencias','entidad="'.$entidad.'"');
				while ($row = sql_fetch($sql)) {	
					$total = $row['total'];
				}
				if($total >= 1){
					$app=new Apis('sena_asistencias');
					$Asistentes=$app->consultadatos('entidad="'.$entidad.'"',$select);				
					$data = array("data"=>$Asistentes);
					$var = var2js($data);
					echo $var;
				}else{
					$records[] = array('idActa'=>1,
					'nombresApellidos'=>'No existen registros',
					'documento'=>'',
					'dependencia'=>'');
					$data = array("data"=>$records);
					$var = var2js($data);	
					echo $var;							
				}						
		break;
		case 'deleteAsistente':	
			$id_asistencia  = base64_decode($_POST["id"]);
			sql_delete("sena_asistencias","id_asistencia =" . intval($id_asistencia));
			
			$res = sql_select("*", "sena_asistencias", "id_asistencia =" . intval($id_asistencia));
			if ($res){
			$msg[] = array('menssage'=>'OK. El Registro '.$id_asistencia.' fue eliminado correctamente!','status' => '200');
			}	
			$var = var2js($msg);	
			echo $var;	
		break;
		case 'addConceptos':
			$app=new Apis('sena_actas_conceptos');
			$variablesAVerificar=array();
			$chartic=array();



			// Validate and decode all necessary variables
			$postKeys = ['entidad', 'ApiToken', 'Apikey', 'idUsuario', 'idActa', 'idSolicitud', 'idConcepto',0, 1, 2, 3, 4];
			$decodedPost = [];
			foreach ($postKeys as $key) {
				if (isset($_POST[$key])) {
					$decodedPost[$key] = base64_decode($_POST[$key], true);
					if ($decodedPost[$key] === false) {
						$decodedPost[$key] = "Error: Invalid base64 encoding for key $key.";
					}
				} else {
					// Handle missing keys
					$decodedPost[$key] = null;
				}
			}
			$variablesAVerificar = [
				'idConcepto' => $decodedPost['idConcepto'],
				'idActa' => $decodedPost['idActa'],
				'idSolicitud' => $decodedPost['idSolicitud'],
				'entidad' => $decodedPost['entidad'],
				'ApiToken' => $decodedPost['ApiToken'],
				'Apikey' => $decodedPost['Apikey'],
				'idUsuario' => $decodedPost['idUsuario'],
			];

			$mensajeError = $app->verificarVariables($variablesAVerificar);
			$validarTokes = $app->verificarApikeyApiToken($decodedPost['ApiToken'],$decodedPost['ApiToken'],$decodedPost['idUsuario']);
			if (($mensajeError !== null) OR (!$validarTokes)){
				
			 $mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
			 $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
				
			}else{
				$sql = sql_select("COUNT(*) AS total",'sena_actas_conceptos','idActa="'.$decodedPost['idActa'].'" AND idSolicitud="'.$decodedPost['idSolicitud'].'"');
				while ($row = sql_fetch($sql)) {	
					$total = $row['total'];
				}
				if($total >= 1){
					$sql2 = sql_select("idConcepto",'sena_actas_conceptos','idActa="'.$decodedPost['idActa'].'" AND idSolicitud="'.$decodedPost['idSolicitud'].'"');
					while ($row2 = sql_fetch($sql2)) {	
						$idConcepto = $row2['idConcepto'];
					}	 
					switch (base64_decode($_POST['idConcepto'])) {
						case '1':
							$chartic = [
								'hechos' => corregir_conceptos($_POST[0]),
							];
						break;
						case '2':
							$chartic = [
								'contemplacion' =>corregir_conceptos($_POST[1]),
							];							
						break;
						case '3':
							$chartic = [
								'frenteHechos' =>corregir_conceptos($_POST[2]),
							];
						break;
						case '4':
							$chartic = [
								'recomendacion' => corregir_conceptos($_POST[3]),
							];
						break;
						case '5':
							$chartic = [
								'compromisos' => corregir_conceptos($_POST[4]),
							];
						break;
						}

							$chartic = pipeline('pre_insertion',
							array(
								'args' => array(
								'table' => 'sena_actas_conceptos',
							),
							'data' => $chartic
							)
						);							
						sql_updateq('sena_actas_conceptos',$chartic,"idConcepto=" . intval($idConcepto) . "");
						pipeline('post_insertion',
						array(
							'args' => array(
							'table' =>'sena_actas_conceptos',
							'id_objet' => $idConcepto
							),
							'data' => $chartic
							)
						);

					$arrayMensage[]=array(
						'id'=>1,
						'message'=>'::OK:: Conceptos Actualizados!',
						'status'=>'202');
						$var = var2js($arrayMensage);
						echo $var;	
				}else{

				$chartic = [
					'idActa' => $decodedPost['idActa'],
					'idSolicitud' => $decodedPost['idSolicitud'],
					'hechos' => corregir_conceptos($_POST[0]),
					'contemplacion' => corregir_conceptos($_POST[1]),
					'frenteHechos' => corregir_conceptos($_POST[2]),
					'recomendacion' => corregir_conceptos($_POST[3]),
					'compromisos' => corregir_conceptos($_POST[4],),
					'entidad' =>  $decodedPost['entidad'],
				];
						$chartic = pipeline('pre_insertion',
						array(
							'args' => array(
							'table' => 'sena_actas_conceptos',
						),
						'data' => $chartic
						)
					);							
					$idConcepto =@sql_insertq('sena_actas_conceptos',$chartic);

					pipeline('post_insertion',
					array(
						'args' => array(
						'table' =>'sena_actas_conceptos',
						'id_objet' => $idConcepto 
						),
						'data' => $chartic
						)
					);
					$arrayMensage[]=array(
						'id'=>1,
						'message'=>'::OK:: Conceptos registrado!',
						'status'=>'202');
						$var = var2js($arrayMensage);
						echo $var;	
				}		
			}			
		break;
		case 'listarConceptos':

			$idActa = base64_decode($_POST['idActa']);
			$idSolicitud = base64_decode($_POST['idSolicitud']);
			$entidad = base64_decode($_POST['entidad']);

			$DatosAuteurs=array();
			$select='*';
			$set = array();
			if(!empty($idActa)){	
			$sql = sql_select("COUNT(*) AS total",'sena_actas_conceptos','idActa="'.$idActa.'" AND idSolicitud="'.$idSolicitud.'" AND entidad="'.$entidad.'"');
				while ($row = sql_fetch($sql)) {	
					$total = $row['total'];
				}
				if(!empty($total) ){
				if($total >=1){
					$app=new Apis('sena_actas_conceptos');
					$row2=$app->consultadatos('idActa="'.$idActa.'" AND idSolicitud="'.$idSolicitud.'" AND entidad="'.$entidad.'"',$select);				
					foreach($row2 as $a => $val){

							$chartic[] =array(
								'hechos' => !empty($val['hechos']) ? $val['hechos']:'',
								'contemplacion' => !empty($val['contemplacion']) ? $val['contemplacion'] :'',
								'frenteHechos' => !empty($val['frenteHechos']) ? $val['frenteHechos']:'',
								'recomendacion' => !empty($val['recomendacion']) ? $val['recomendacion']:'',
								'compromisos' => !empty($val['compromisos']) ? $val['compromisos']:'',
							);
						}
					$data = array("data"=>$chartic);
					$var = var2js($data);
					echo $var;
				}else{
					$records[] = array('idActa'=>1,
					'hechos'=>'',
					'contemplacion'=>'',
					'frenteHechos'=>'',
					'recomendacion'=>'',
					'compromisos'=>'');
					$data = array("data"=>$records);
					$var = var2js($data);	
					echo $var;							
				}
			}else{
				$records[] = array('idActa'=>1,
				'hechos'=>'',
				'contemplacion'=>'',
				'frenteHechos'=>'',
				'recomendacion'=>'',
				'compromisos'=>'');
				$data = array("data"=>$records);
				$var = var2js($data);	
				echo $var;							
			}
			}else{
				$records[] = array('idActa'=>1,
				'hechos'=>'',
				'contemplacion'=>'',
				'frenteHechos'=>'',
				'recomendacion'=>'',
				'compromisos'=>'');
				$data = array("data"=>$records);
				$var = var2js($data);	
				echo $var;					
			}			
		break;
		
		
		
}				
?>
