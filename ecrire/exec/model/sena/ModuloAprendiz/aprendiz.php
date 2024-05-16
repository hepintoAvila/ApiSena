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
		//print_r(base64_decode($_POST['opcion']));
		switch ($opcion) {
			case 'listaAprendiz':
				$entidad = base64_decode($_POST['entidad']);
				$DatosAuteurs=array();
				$select='*';
				$set = array();	
				
				$app=new Apis('sena_aprendiz');
				$aprendizes=$app->consultadatos('entidad="'.$entidad.'"',$select);				
				
					$data = array("data"=>$aprendizes);
					$var = var2js($data);
					echo $var;						
			break;
			
			case 'add':
                
					$app=new Apis('sena_aprendiz');
					$variablesAVerificar=array();
					$desc=array();
					$id_ou_options=0;
				 	$nombres = base64_decode($_POST['nombres']);
				 	$apellidos = base64_decode($_POST['apellidos']);
				 	$tipoIdentificacion = base64_decode($_POST['tipoIdentificacion']);
				 	$identificacion = base64_decode($_POST['identificacion']);
				 	$telefono = base64_decode($_POST['telefono']);
				 	$correo = base64_decode($_POST['correo']);
				 	$direccion = base64_decode($_POST['direccion']);
			        $programaFormacion = base64_decode($_POST["programaFormacion"]);
					$proyectoFormativo     = base64_decode($_POST["proyectoFormativo"]);	
					$jornada = base64_decode($_POST["jornada"]);	
                    $etapa = base64_decode($_POST["etapa"]);	
                    $ficha = base64_decode($_POST["ficha"]);	
                    $municipio = base64_decode($_POST["municipio"]);	
                    $entidad = base64_decode($_POST['entidad']);
                    $ApiToken     = base64_decode($_POST["ApiToken"]);
					$Apikey     = base64_decode($_POST["Apikey"]);	
                    $idUsuario = base64_decode($_POST["idUsuario"]);
 						// Crea un array con las variables que deseas verificar
						$variablesAVerificar = [
							'nombres' => $nombres,
							'apellidos' => $apellidos,
							'tipoIdentificacion' => $tipoIdentificacion,
							'identificacion' => $identificacion,
							'telefono' => $telefono,
							'correo' => $correo,
							'direccion' => $direccion,
							'programaFormacion' => $programaFormacion,
							'proyectoFormativo' => $proyectoFormativo,
							'jornada' => $jornada,
							'etapa' => $etapa,
                            'ficha' => $ficha,
                            'municipio' => $municipio,
                            'entidad' => $entidad,
                            'ApiToken' => $ApiToken,
                            'Apikey' => $Apikey,
                            'idUsuario' => $idUsuario,
						];
                          //print_r($variablesAVerificar);
						$mensajeError = $app->verificarVariables($variablesAVerificar);
						$validarTokes = $app->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
						if (($mensajeError !== null) OR (!$validarTokes)){
							
						 $mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
						 $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
							
						}else{
                            $table='sena_aprendiz';
	
												$chartic['nombres'] ="".$nombres."";
												$chartic['apellidos'] =$apellidos;
												$chartic['tipoIdentificacion'] =$tipoIdentificacion;
                                                $chartic['identificacion'] =$identificacion;
                                                $chartic['telefono'] =$telefono;
                                                $chartic['correo'] =$correo;
												$chartic['direccion'] =$direccion;
                                                $chartic['programaFormacion'] =$programaFormacion;
                                                $chartic['proyectoFormativo'] =$proyectoFormativo;
												$chartic['jornada'] =$jornada;
                                                $chartic['etapa'] =$etapa;
                                                $chartic['ficha'] =$ficha;
                                                $chartic['municipio'] =$municipio;
                                                $chartic['entidad'] =$entidad;
                                                
												$chartic = pipeline('pre_insertion',
													array(
														'args' => array(
														'table' => ''.$table.'',
													),
													'data' => $chartic
													)
												);							
												$id_aprendiz=@sql_insertq(''.$table.'',$chartic);
												pipeline('post_insertion',
												array(
													'args' => array(
													'table' =>''.$table.'',
													'id_objet' => $id_aprendiz
													),
													'data' => $chartic
													)
												);
											 
											$msg[] = 'Aprendiz guardado con exito';
										
							
							
								$arrayMensage[] = array('message'=>'¡OK!. El Aprendiz GUARDADO! '.implode(',',$msg).'','status' => '202');
						}	
 
				$var = var2js($arrayMensage);
				echo $var;
			break;
			case 'update':
                $app=new Apis('sena_aprendiz');
                $variablesAVerificar=array();
                $desc=array();
                $id_ou_options=0;
                 $nombres = base64_decode($_POST['nombres']);
                 $apellidos = base64_decode($_POST['apellidos']);
                 $tipoIdentificacion = base64_decode($_POST['tipoIdentificacion']);
                 $identificacion = base64_decode($_POST['identificacion']);
                 $telefono = base64_decode($_POST['telefono']);
                 $correo = base64_decode($_POST['correo']);
                 $direccion = base64_decode($_POST['direccion']);
                $programaFormacion = base64_decode($_POST["programaFormacion"]);
                $proyectoFormativo     = base64_decode($_POST["proyectoFormativo"]);	
                $jornada = base64_decode($_POST["jornada"]);	
                $etapa = base64_decode($_POST["etapa"]);	
                $ficha = base64_decode($_POST["ficha"]);	
                $municipio = base64_decode($_POST["municipio"]);	
                $entidad = base64_decode($_POST['entidad']);
                $ApiToken     = base64_decode($_POST["ApiToken"]);
                $Apikey     = base64_decode($_POST["Apikey"]);	
                $idUsuario = base64_decode($_POST["idUsuario"]);
				$idAprendiz = base64_decode($_POST["idAprendiz"]);
                     // Crea un array con las variables que deseas verificar
                    $variablesAVerificar = [
                        'nombres' => $nombres,
                        'apellidos' => $apellidos,
                        'tipoIdentificacion' => $tipoIdentificacion,
                        'identificacion' => $identificacion,
                        'telefono' => $telefono,
                        'correo' => $correo,
                        'direccion' => $direccion,
                        'programaFormacion' => $programaFormacion,
                        'proyectoFormativo' => $proyectoFormativo,
                        'jornada' => $jornada,
                        'etapa' => $etapa,
                        'ficha' => $ficha,
                        'municipio' => $municipio,
                        'entidad' => $entidad,
                        'ApiToken' => $ApiToken,
                        'Apikey' => $Apikey,
                        'idUsuario' => $idUsuario,
						'idAprendiz' =>$idAprendiz
                    ];
                      //print_r($variablesAVerificar);
                    $mensajeError = $app->verificarVariables($variablesAVerificar);
                    $validarTokes = $app->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
                    if (($mensajeError !== null) OR (!$validarTokes)){
                        
                     $mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
                     $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
                        
                    }else{
                   

                                            $chartic['nombres'] ="".$nombres."";
                                            $chartic['apellidos'] ="".$apellidos."";
                                            $chartic['tipoIdentificacion'] ="".$tipoIdentificacion."";
                                            $chartic['identificacion'] ="".$identificacion."";
                                            $chartic['telefono'] ="".$telefono."";
                                            $chartic['correo'] ="".$correo."";
                                            $chartic['direccion'] ="".$direccion."";
                                            $chartic['programaFormacion'] ="".$programaFormacion."";
                                            $chartic['proyectoFormativo'] ="".$proyectoFormativo."";
                                            $chartic['jornada'] ="".$jornada."";
                                            $chartic['etapa'] ="".$etapa."";
                                            $chartic['ficha'] ="".$ficha."";
                                            $chartic['municipio'] ="".$municipio."";
                                    
								    	$chartic = pipeline('pre_insertion',
											array(
												'args' => array(
												'table' => 'sena_aprendiz',
											),
											'data' => $chartic
											)
										);							
										sql_updateq('sena_aprendiz',$chartic,"idAprendiz=" . intval($idAprendiz) . "");
				
										pipeline('post_insertion',
										array(
											'args' => array(
											'table' =>'sena_aprendiz',
											'id_objet' => $idAprendiz
											),
											'data' => $chartic
											)
										);
										$arrayMensage[]=array(
											'id'=>1,
											'message'=>'::OK:: Aprendiz Acualizado!',
											'status'=>'202');
                                          
                                            $var = var2js($arrayMensage);
											echo $var;	
                    }						

				

            	
			
			break;
			case 'delete':
					$idAprendiz = base64_decode($_POST["id"]);

					sql_delete("sena_aprendiz","idAprendiz=" . intval($idAprendiz));
					
					$res = sql_select("*", "sena_aprendiz", "idAprendiz=" . intval($idAprendiz));
					if ($res){
					$msg[] = array('menssage'=>'OK. El Registro Del Aprendiz '.$idAprendiz.' fue eliminado correctamente!','status' => '200');
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

		case 'editarSanciones':

			$app=new Apis('sena_sancionesanteriores');
			$variablesAVerificar=array();
			$idSancion = base64_decode($_POST["idSancion"]);
			$idAprendiz= base64_decode($_POST["idAprendiz"]);
			$academica = base64_decode($_POST["academica"]);
			$disciplinaria = base64_decode($_POST["disciplinaria"]);
			$inasistencias = base64_decode($_POST["inasistencias"]);
			$verbal = base64_decode($_POST["verbal"]);
			$escrito = base64_decode($_POST["escrito"]);
			$ApiToken     = base64_decode($_POST["ApiToken"]);
			$Apikey     = base64_decode($_POST["Apikey"]);	
			$idUsuario = base64_decode($_POST["idUsuario"]);

		
				$variablesAVerificar = [
					'idSancion' => $idSancion,
					'idAprendiz' => $idAprendiz,
					'academica' => $academica === '0' ? '1' : $academica,
					'disciplinaria' => $disciplinaria === '0' ? '1' : $disciplinaria,
					'inasistencias' => $inasistencias === '0' ? '1' : $inasistencias,
					'verbal' => $verbal === '0' ? '1' : $verbal,
					'escrito' => $escrito === '0' ? '1' : $escrito,
					'ApiToken' => $ApiToken,
					'Apikey' => $Apikey,
					'idUsuario' => $idUsuario,
				];
				//print_r($variablesAVerificar);

				$mensajeError = $app->verificarVariables($variablesAVerificar);
				$validarTokes = $app->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
				if (($mensajeError !== null) OR (!$validarTokes)){
					
				 $mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
				 $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
					
				}else{
			   
					$sql = sql_select("COUNT(*) AS total",'sena_sancionesanteriores','idAprendiz="'.$idAprendiz.'"');
					while ($row = sql_fetch($sql)) {	
						$total = $row['total'];
					}
					if($total >= 1){


					
										$chartic['academica'] ="".$academica."";
										$chartic['disciplinaria'] ="".$disciplinaria."";
										$chartic['inasistencias'] ="".$inasistencias."";
										$chartic['verbal'] ="".$verbal."";
										$chartic['escrito'] ="".$escrito."";
								
									$chartic = pipeline('pre_insertion',
										array(
											'args' => array(
											'table' => 'sena_sancionesanteriores',
										),
										'data' => $chartic
										)
									);							
									sql_updateq('sena_sancionesanteriores',$chartic,"idSancion=" . intval($idSancion) . "");
			
									pipeline('post_insertion',
									array(
										'args' => array(
										'table' =>'sena_sancionesanteriores',
										'id_objet' => $idSancion
										),
										'data' => $chartic
										)
									);
									$arrayMensage[]=array(
										'id'=>1,
										'message'=>'::OK:: Sancion Del Aprendiz Acualizado!',
										'status'=>'202');
									  
									}
									else{

									
										$chartic['idAprendiz'] ="".$idAprendiz."";
										$chartic['academica'] ="".$academica."";
										$chartic['disciplinaria'] ="".$disciplinaria."";
										$chartic['inasistencias'] ="".$inasistencias."";
										$chartic['verbal'] ="".$verbal."";
										$chartic['escrito'] ="".$escrito."";

										$chartic = pipeline('pre_insertion',
													array(
														'args' => array(
														'table' => 'sena_sancionesanteriores',
													),
													'data' => $chartic
													)
												);							
												$idSancion=@sql_insertq('sena_sancionesanteriores',$chartic);
												pipeline('post_insertion',
												array(
													'args' => array(
													'table' =>'sena_sancionesanteriores',
													'id_objet' => $idSancion
													),
													'data' => $chartic
													)
												);
												$arrayMensage[]=array(
													'id'=>1,
													'message'=>'::OK:: Sancion Del Aprendiz Guardada!',
													'status'=>'202');
												  
												}	
									}					
								
												
				$var = var2js($arrayMensage);
		
				echo $var;	
	break;
}				
?>
