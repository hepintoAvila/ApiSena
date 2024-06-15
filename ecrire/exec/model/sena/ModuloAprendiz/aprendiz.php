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
		
		 
		$opcion = isset($_GET['opcion']) ? base64_decode($_GET['opcion']) : base64_decode($_POST['opcion']);
		$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : base64_decode($_POST['entidad']);
		switch ($opcion) {
			case 'listaAprendiz':
				 
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
					$nombres = isset($_GET['nombres']) ? base64_decode($_GET['nombres']) : base64_decode($_POST['nombres']);
					$apellidos = isset($_GET['apellidos']) ? base64_decode($_GET['apellidos']) : base64_decode($_POST['apellidos']);
					$tipoIdentificacion = isset($_GET['tipoIdentificacion']) ? base64_decode($_GET['tipoIdentificacion']) : base64_decode($_POST['tipoIdentificacion']);
					$identificacion = isset($_GET['identificacion']) ? base64_decode($_GET['identificacion']) : base64_decode($_POST['identificacion']);
					$telefono = isset($_GET['telefono']) ? base64_decode($_GET['telefono']) : base64_decode($_POST['telefono']);
					$correo = isset($_GET['correo']) ? base64_decode($_GET['correo']) : base64_decode($_POST['correo']);
					$direccion = isset($_GET['direccion']) ? base64_decode($_GET['direccion']) : base64_decode($_POST['direccion']);
					$programaFormacion = isset($_GET['programaFormacion']) ? base64_decode($_GET['programaFormacion']) : base64_decode($_POST['programaFormacion']);
					$proyectoFormativo = isset($_GET['proyectoFormativo']) ? base64_decode($_GET['proyectoFormativo']) : base64_decode($_POST['proyectoFormativo']);
					$jornada = isset($_GET['jornada']) ? base64_decode($_GET['jornada']) : base64_decode($_POST['jornada']);
					$etapa = isset($_GET['etapa']) ? base64_decode($_GET['etapa']) : base64_decode($_POST['etapa']);
					$ficha = isset($_GET['ficha']) ? base64_decode($_GET['ficha']) : base64_decode($_POST['ficha']);
					$municipio = isset($_GET['municipio']) ? base64_decode($_GET['municipio']) : base64_decode($_POST['municipio']);
					$idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);
		
 
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
                            'idUsuario' => $idUsuario,
						];
						$mensajeError = $app->verificarVariables($variablesAVerificar);
						if ($mensajeError !== null) {
						$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
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
				$nombres = isset($_GET['nombres']) ? base64_decode($_GET['nombres']) : base64_decode($_POST['nombres']);
				$apellidos = isset($_GET['apellidos']) ? base64_decode($_GET['apellidos']) : base64_decode($_POST['apellidos']);
				$tipoIdentificacion = isset($_GET['tipoIdentificacion']) ? base64_decode($_GET['tipoIdentificacion']) : base64_decode($_POST['tipoIdentificacion']);
				$identificacion = isset($_GET['identificacion']) ? base64_decode($_GET['identificacion']) : base64_decode($_POST['identificacion']);
				$telefono = isset($_GET['telefono']) ? base64_decode($_GET['telefono']) : base64_decode($_POST['telefono']);
				$correo = isset($_GET['correo']) ? base64_decode($_GET['correo']) : base64_decode($_POST['correo']);
				$direccion = isset($_GET['direccion']) ? base64_decode($_GET['direccion']) : base64_decode($_POST['direccion']);
				$programaFormacion = isset($_GET['programaFormacion']) ? base64_decode($_GET['programaFormacion']) : base64_decode($_POST['programaFormacion']);
				$proyectoFormativo = isset($_GET['proyectoFormativo']) ? base64_decode($_GET['proyectoFormativo']) : base64_decode($_POST['proyectoFormativo']);
				$jornada = isset($_GET['jornada']) ? base64_decode($_GET['jornada']) : base64_decode($_POST['jornada']);
				$etapa = isset($_GET['etapa']) ? base64_decode($_GET['etapa']) : base64_decode($_POST['etapa']);
				$ficha = isset($_GET['ficha']) ? base64_decode($_GET['ficha']) : base64_decode($_POST['ficha']);
				$municipio = isset($_GET['municipio']) ? base64_decode($_GET['municipio']) : base64_decode($_POST['municipio']);
				$idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);               
				$idAprendiz = isset($_GET['idAprendiz']) ? base64_decode($_GET['idAprendiz']) : base64_decode($_POST['idAprendiz']);               

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
                        'idUsuario' => $idUsuario,
						'idAprendiz' =>$idAprendiz
                    ];
					$mensajeError = $app->verificarVariables($variablesAVerificar);
					if ($mensajeError !== null) {
					$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
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
 
					$idAprendiz = isset($_GET['id']) ? base64_decode($_GET['id']) : base64_decode($_POST['id']); 
					sql_delete("sena_aprendiz","idAprendiz=" . intval($idAprendiz));
					
					$res = sql_select("*", "sena_aprendiz", "idAprendiz=" . intval($idAprendiz));
					if ($res){
					$msg[] = array('menssage'=>'OK. El Registro Del Aprendiz '.$idAprendiz.' fue eliminado correctamente!','status' => '200');
					}	
					
					$var = var2js($msg);	
					echo $var;					
			break;
			
			case 'listaSanciones':
				$idAprendiz = isset($_GET['id']) ? base64_decode($_GET['id']) : base64_decode($_POST['id']); 
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

			$idSancion = isset($_GET['idSancion']) ? base64_decode($_GET['idSancion']) : base64_decode($_POST['idSancion']); 
			$idAprendiz = isset($_GET['idAprendiz']) ? base64_decode($_GET['idAprendiz']) : base64_decode($_POST['idAprendiz']); 
			$academica = isset($_GET['academica']) ? base64_decode($_GET['academica']) : base64_decode($_POST['academica']); 
			$disciplinaria = isset($_GET['disciplinaria']) ? base64_decode($_GET['disciplinaria']) : base64_decode($_POST['disciplinaria']); 
			$inasistencias = isset($_GET['inasistencias']) ? base64_decode($_GET['inasistencias']) : base64_decode($_POST['inasistencias']); 
			$verbal = isset($_GET['verbal']) ? base64_decode($_GET['verbal']) : base64_decode($_POST['verbal']); 
			$escrito = isset($_GET['escrito']) ? base64_decode($_GET['escrito']) : base64_decode($_POST['escrito']); 
			$idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']); 

	
				$variablesAVerificar = [
					'idSancion' => $idSancion,
					'idAprendiz' => $idAprendiz,
					'academica' => $academica === '0' ? '1' : $academica,
					'disciplinaria' => $disciplinaria === '0' ? '1' : $disciplinaria,
					'inasistencias' => $inasistencias === '0' ? '1' : $inasistencias,
					'verbal' => $verbal === '0' ? '1' : $verbal,
					'escrito' => $escrito === '0' ? '1' : $escrito,
					'idUsuario' => $idUsuario,
				];
				$mensajeError = $app->verificarVariables($variablesAVerificar);
				if ($mensajeError !== null) {
				$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
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
