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
		include_spip('base/connect_sql');
		include_spip('inc/filtres_ecrire');
		include_spip('inc/filtres');
		include_spip('inc/utils');
		include_spip('inc/json');
		include_spip('inc/autoriser');
		include_spip('exec/model/sena/claseapi');
		
		$opcion = base64_decode($_POST['opcion']);
		
		switch ($opcion) {
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
						'horaInicial'=>'08');
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
				

		break;
}				
?>
