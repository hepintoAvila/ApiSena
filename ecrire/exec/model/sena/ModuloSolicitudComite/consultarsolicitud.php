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
header('Content-Type: text/html; charset=utf-8');
 
if (!defined('_ECRIRE_INC_VERSION')) {
	return;
}
  
		include_spip('inc/autoriser');	
		include_spip('base/connect_sql');
		include_spip('inc/json');
		include_spip('exec/model/sena/claseapi');	
		include_spip('exec/model/sena/email');	
		//include_spip('fpdf.php');	
		include_spip('inc/charsets');
		function processArraySolicitudes($idSolicituds) {
			// Validar que $idSolicituds es un array y no está vacío
			if (is_array($idSolicituds) && !empty($idSolicituds)) {
				// Eliminar elementos vacíos y elementos que no son válidos (null, false, etc.)
				$idSolicituds = array_filter($idSolicituds, function($value) {
					return !empty($value) && $value !== '';
				});

				// Eliminar elementos duplicados
				$idSolicituds = array_unique($idSolicituds);

				// Convertir el array en una cadena separada por comas
				$string = implode(',', $idSolicituds);

				return ['array' => array_values($idSolicituds), 'string' => $string];
			}
			return ['array' => [], 'string' => ''];
		}
		$obj = isset($_GET['obj']) ? $_GET['obj'] :$_POST['obj'];
		 
			switch($obj) {
				case "ConsultarSolicitud":
				case "ConsultarSolicitudByID":
				case "queryByIdComite":
				case "queryByIdAprendiz":
				case "ConsultarSolicitudSinEnviar":
				case "ConsultarSolicitudByCodigo":

				
				$campos = $GLOBALS['tables_principales']['sena_solicitudcomite']['field'];
				$select = implode(',',array_keys($campos));
				$tbls='sena_solicitudcomite';
				$apps=new Apis($tbls);
				$sw = isset($_GET['sw']) ? $_GET['sw'] : $_POST['sw'];

				$idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);
				$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : base64_decode($_POST['entidad']);
				$rol = isset($_GET['rol']) ? base64_decode($_GET['rol']) : base64_decode($_POST['rol']);
				
				$variablesAVerificar = [
							'idUsuario' => $idUsuario,
							'entidad' => $entidad,
							'rol' => $rol,
							'sw' => $sw,
						];
				
						$mensajeError = $apps->verificarVariables($variablesAVerificar);
						if ($mensajeError !== null) {
							$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');	
							
						} else {
						
							switch($sw) {
								///dashboard/ModuloNotificaciones/AgendarCitas
								case '3':
									
									$idSolicitud = null;

									if (array_key_exists('idSolicitud', $_GET) && !empty($_GET['idSolicitud'])) {
										$idSolicitud = base64_decode($_GET['idSolicitud']);
									} elseif (array_key_exists('idSolicitud', $_POST) && !empty($_POST['idSolicitud'])) {
										$idSolicitud = base64_decode($_POST['idSolicitud']);
									}
									
									// Validar si idSolicitud fue decodificado correctamente
									if (!empty($idSolicitud)) {
										// Asume que $apps y $entidad ya están definidos y inicializados
										$row = $apps->consultadatos('entidad="' . $entidad . '" AND idSolicitud="' . $idSolicitud . '" ORDER BY idSolicitud ASC', $select);
									} else {
										$row = [];
									}
									
								break;	
								//dashboard/ModuloNotificaciones/ConsultaNotificaciones
								case '1':
									$row=$apps->consultadatos('entidad="'.$entidad.'" ORDER BY idSolicitud ASC',$select);
								break;
								///dashboard/ModuloSolicitudComite/EnviarSolicitud
								case '2':
								case '0':
									$row=$apps->consultadatos('entidad="'.$entidad.'" AND idInstructor="'.$idUsuario.'" ORDER BY idSolicitud ASC',$select);
								
								break;
								case '4':
									$idAprendiz = null;

									if (array_key_exists('idAprendiz', $_GET) && !empty($_GET['idAprendiz'])) {
										$idAprendiz = base64_decode($_GET['idAprendiz']);
									} elseif (array_key_exists('idAprendiz', $_POST) && !empty($_POST['idAprendiz'])) {
										$idAprendiz = base64_decode($_POST['idAprendiz']);
									}
									// Validar si idAprendiz fue decodificado correctamente
									if (!empty($idAprendiz)) {
										// Asume que $apps y $entidad ya están definidos y inicializados
										$row=$apps->consultadatos('entidad="'.$entidad.'" AND idAprendiz="'.$idAprendiz.'" ORDER BY idSolicitud ASC',$select);
									} else {
										$row = [];
									}
						
								break;
								//CONSULTE LAS NOVEDADES DE  LAS SOLICITUDES
								//ConsultarSolicitudSinEnviar
								case '5':
								
									if(($rol=='Administrador')OR($rol=='Apoyo')){
										$row=$apps->consultadatos('entidad="'.$entidad.'" AND estado="SIN AGENDA" ORDER BY idSolicitud ASC',$select);
									}else{
										$row=$apps->consultadatos('entidad="'.$entidad.'" AND idInstructor="'.$idUsuario.'" AND estado="SIN AGENDA" ORDER BY idSolicitud ASC',$select);
									}
 
								break;
								case '6':
									$codigoFicha = null;

									if (array_key_exists('codigoFicha', $_GET) && !empty($_GET['codigoFicha'])) {
										$codigoFicha = base64_decode($_GET['codigoFicha']);
									} elseif (array_key_exists('codigoFicha', $_POST) && !empty($_POST['codigoFicha'])) {
										$codigoFicha = base64_decode($_POST['codigoFicha']);
									}
									// Validar si codigoFicha fue decodificado correctamente
									if (!empty($codigoFicha)) {
										// Asume que $apps y $entidad ya están definidos y inicializados
										$row=$apps->consultadatos('entidad="'.$entidad.'" AND codigoFicha="'.$codigoFicha.'" ORDER BY idSolicitud ASC',$select);
									} else {
										$row = [];
									}								 
									
								break;
								case '7':
								
									$row=$apps->consultadatos('entidad="'.$entidad.'" ORDER BY idSolicitud ASC',$select);

								break;
								case '8':
									//dashboard/ModuloActas/Actas?p=
									//MUESTRE TODAS LAS SOLICITUDES QUE NO ESTAN REGISTRADA EN LAS ACTAS
										$sq = sql_select("casosComite",
											'sena_actas','');
										while ($r= sql_fetch($sq)) {
											$casosComite[]= $r['casosComite'];	
										}
										$result = processArraySolicitudes($casosComite);
										if(is_array($result['array'])){
											$row=$apps->consultadatos('idSolicitud NOT IN ('.$result['string'].') AND estado="AGENDADA" AND entidad="'.$entidad.'" ORDER BY idSolicitud ASC',$select);
										}else{
											$row=[];
										}
									 
								break;
								case '9':
									 
									// Inicializar $idActa
									$idActa = null;

									// Verificar y decodificar idActa
									if (array_key_exists('idActa', $_GET) && !empty($_GET['idActa'])) {
										$idActa = base64_decode($_GET['idActa']);
									} elseif (array_key_exists('idActa', $_POST) && !empty($_POST['idActa'])) {
										$idActa = base64_decode($_POST['idActa']);
									}

									// Inicializar $idSolicituds como un array vacío
									$idSolicituds = [];

									// Validar si idActa fue decodificado correctamente
									if (!empty($idActa)) {
										$sqlact = sql_select("casosComite", 'sena_actas', 'idActa="' . $idActa . '"');
										while ($rowact = sql_fetch($sqlact)) {
											$idSolicituds[] = $rowact['casosComite'];
										}
									}

								// Procesar $idSolicituds
								$result = processArraySolicitudes($idSolicituds);

								// Realizar la consulta a la base de datos si el resultado es un array válido
								if (is_array($result['array']) && !empty($result['array'])) {
									$row = $apps->consultadatos(
										'idSolicitud IN (' . $result['string'] . ') AND estado="AGENDADA" AND entidad="' . $entidad . '" ORDER BY idSolicitud ASC',
										$select
									);
								} else {
									$row = [];
								}	
														//dashboard/ModuloActas/Actas?p=
									//MUESTREME TODA LAS SOLICITUDES ASIGNADAS A SU RESPECTIVO ID DEL ACTA
								break;																									
							}
					if (is_array($row) && !empty($row)) { 
					 		foreach($row as $a => $value){
								$sql1 = sql_select("nombres,apellidos,correo",'sena_aprendiz','idAprendiz="'.$value['idAprendiz'].'"');
								while ($row1 = sql_fetch($sql1)) {	
									$nombresApellidosAprendiz= $row1['nombres'].' '.$row1['apellidos'];		
									$correo= $row1['correo'];		
								  }	
								$sql2 = sql_select("nombres,apellidos",'sena_instructor','idInstructor="'.$value['idInstructor'].'"');
								while ($row2 = sql_fetch($sql2)) {	
									$nombresApellidosInstructor= $row2['nombres'].' '.$row2['apellidos'];		
								  }	
								$sql2 = sql_select("academica,disciplinaria,inasistencias,verbal,escrito",
									'sena_sancionesanteriores','idAprendiz="'.$value['idAprendiz'].'"');
								while ($row2 = sql_fetch($sql2)) {	
									$academica= $row2['academica'] ? $row2['academica']:0;		
									$disciplinaria= !empty($row2['disciplinaria']) ? $row2['disciplinaria']:0;			
									$inasistencias= !empty($row2['inasistencias'])? $row2['inasistencias']:0;		
									$verbal= !empty($row2['verbal'])? $row2['verbal']:0;			
									$escrito= !empty($row2['escrito'])? $row2['escrito']:0;			
								  }	
									$Aprendices[] = array(
									'disciplinaria'=>$disciplinaria,
									'academica'=>$academica,
									'inasistencias'=>$inasistencias,
									'verbal'=>$verbal,
									'escrito'=>$escrito,
									); 
								$swi='';
								$Incidentes='../ecrire/exec/model/sena/ModuloIncidentes/pdf/'.$value['codigoFicha'].'.pdf';
								if (@file_exists($Incidentes)){			 
									$swi='1'; 	 
								}else{
									$swi='0';
								}									
								$Solicitudes[] = array(
								'id'=>$value['idSolicitud'],
								'idAprendiz'=>$value['idAprendiz'],
								'aprendiz'=>"".$value['idAprendiz']."-".$nombresApellidosAprendiz,
								'email'=>$correo,
								'instructor'=>$nombresApellidosInstructor,
								'tipoSolicitud'=>$value['tipoSolicitud'],
								'codigoFicha'=>$value['codigoFicha'],
								'tipoAtencion'=>$value['tipoAtencion'],
								'fechaSolicitud'=>$value['fechaSolicitud'],
								'fechaIncidente'=>$value['fechaSolicitud'],
								'hechos'=>$value['hechos'],
								'nombrePrograma'=>''.$value['nombrePrograma'],
								'fechaHoraAgendada'=>$value['fechaHoraAgendada'],
								'estado'=>$value['estado'],
								'attachments'=> array(
									array('id'=> 1, 'name'=> '#Evidencias: '.$swi.'', 'size'=>$swi,'ext'=> '.pdf')
									),
								'sancionesAprendiz'=>$Aprendices[0]
								);
							
							 
							//CONSULTAR MIEMBROPS DEL COMITE
							$tblComite='sena_directivo';
							$comt=new Apis($tblComite);	
							$campos_comit = $GLOBALS['tables_principales']['sena_directivo']['field'];
							$select_comit = implode(',',array_keys($campos_comit));
							$row2=$comt->consultadatos(" entidad='".$entidad."'",$select_comit);
						
							foreach($row2 as $a => $val){
									$directivos[] = array(
									'id'=>$val['id_auteur'],
									'nombresApellidos'=>$val['nombres'].' '.$val['apellidos'],
									'correo'=>$val['correo']
									);
							}
							
							//CONSULTAR AGENDA
							$tblaAgenda='sena_agenda';
							$agen=new Apis($tblaAgenda);
							
							$tbla_solicitudComite='sena_solicitudcomite';
							$_solicitudComite=new Apis($tbla_solicitudComite);
							$campos_solicitudComite = $GLOBALS['tables_principales']['sena_solicitudcomite']['field'];
							$select_solicitudComite = implode(',',array_keys($campos_solicitudComite));
							
							$campos_agen = $GLOBALS['tables_principales']['sena_agenda']['field'];
							$select_agen = implode(',',array_keys($campos_agen));
							$row3=$agen->consultadatos('entidad="'.$entidad.'"',$select_agen);
						
							foreach($row3 as $a => $val3){
									$row4=$_solicitudComite->consultadatos('idSolicitud="'.$val3['idSolicitud'].'"',$select_solicitudComite);

									if(!empty($row4)){

								foreach($row4 as $a => $val4){
								$className = $val4['tipoSolicitud']=='DISCIPLINA'? 'bg-warning':'bg-danger';
								//$codigoFicha = $val4['codigoFicha'];
								}
								
							} else {
								
								$className= 'bg-danger';
							}
								
									$Agendas[] = array(
									'id'=>$val3['idAgenda'],
									'start'=>$val3['start'],
									'end'=>$val3['end'],
									'className'=>$className,
									'title'=>'-S'.$val3['idSolicitud'],
									);
							}
														
							//print_r($Solicitudes);
							$Agenda = array("Agenda"=>$Agendas);
							$Directivo = array("Directivos"=>$directivos);
							$Solicitud = array("Solicitudes"=>$Solicitudes);
							$datos = array_merge($Directivo,$Solicitud,$Agenda);
							$arrayMensage = array("data"=>$datos);
						
							$Agenda = array("Agenda"=>array());
							$Directivo = array("Directivos"=>array());
							$Solicitud = array("Solicitudes"=>$Solicitudes);
							$datos = array_merge($Directivo,$Solicitud,$Agenda);
							$arrayMensage = array("data"=>$datos);						
						}
					} else {
						$Agenda = array("Agenda"=>array());
						$Directivo = array("Directivos"=>array());
						$Solicitud = array("Solicitudes"=>array());
						$datos = array_merge($Directivo,$Solicitud,$Agenda);
						$arrayMensage = array("data"=>$datos);
					
						$Agenda = array("Agenda"=>array());
						$Directivo = array("Directivos"=>array());
						$Solicitud = array("Solicitudes"=>array());
						$datos = array_merge($Directivo,$Solicitud,$Agenda);
						$arrayMensage = array("data"=>$datos);	
					}	
				}
					echo var2js($arrayMensage);	
				break;
				
				
	}
?>
  
 