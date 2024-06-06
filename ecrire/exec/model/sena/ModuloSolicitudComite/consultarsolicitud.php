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
 
		switch($_POST['obj']) {
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
				$idUsuario = base64_decode($_POST["idUsuario"]);
				
				$entidad = base64_decode($_POST["entidad"]);
				$rol = base64_decode($_POST["rol"]);
				
						$variablesAVerificar = [
							'idUsuario' => $idUsuario,
							'entidad' => $entidad,
						];
						$mensajeError = $apps->verificarVariables($variablesAVerificar);
						if ($mensajeError !== null) {
							$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');	
							
						} else {
						
							switch($_POST['sw']) {
								///dashboard/ModuloNotificaciones/AgendarCitas
								case '3':
									$idSolicitud = empty(base64_decode($_POST["idSolicitud"])) ? 1 :base64_decode($_POST["idSolicitud"]);
									$row=$apps->consultadatos('entidad="'.$entidad.'" AND idSolicitud="'.$idSolicitud.'" ORDER BY idSolicitud ASC',$select);
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
									$row=$apps->consultadatos('entidad="'.$entidad.'" AND idAprendiz="'.base64_decode($_POST["idAprendiz"]).'" ORDER BY idSolicitud ASC',$select);
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
								 
									$row=$apps->consultadatos('entidad="'.$entidad.'" AND codigoFicha="'.base64_decode($_POST["codigoFicha"]).'" ORDER BY idSolicitud ASC',$select);
								break;
								case '7':
								
									$row=$apps->consultadatos('entidad="'.$entidad.'" ORDER BY idSolicitud ASC',$select);

								break;
								case '8':

									$idActa = base64_decode($_POST["idActa"]);
										$sqlact = sql_select("casosComite",
											'sena_actas','idActa="'.$idActa.'"');
										while ($rowact = sql_fetch($sqlact)) {
											$idSolicituds= $rowact['casosComite'];	
										}
										if($idSolicituds=='0'){
											$row=$apps->consultadatos('estado="AGENDADA" AND entidad="'.$entidad.'" ORDER BY idSolicitud ASC',$select);
										}else{
											$row=$apps->consultadatos('idSolicitud NOT IN ('.$idSolicituds.') AND estado="AGENDADA" AND entidad="'.$entidad.'" ORDER BY idSolicitud ASC',$select);
										}
								break;
								case '9':

									$idActa = base64_decode($_POST["idActa"]);
										$sqlact = sql_select("casosComite",
											'sena_actas','idActa="'.$idActa.'"');
										while ($rowact = sql_fetch($sqlact)) {
											$idSolicituds= $rowact['casosComite'];	
										}
										if($idSolicituds=='0'){
											$row=$apps->consultadatos('estado="AGENDADA" AND entidad="'.$entidad.'" ORDER BY idSolicitud ASC',$select);
										}else{
											$row=$apps->consultadatos('idSolicitud IN ('.$idSolicituds.') AND estado="AGENDADA" AND entidad="'.$entidad.'" ORDER BY idSolicitud ASC',$select);
										}
								break;																									
							}
							
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
								/*
								$sws='';
								$SolicitudComite = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$value['codigoFicha'].'.pdf';
								if (@file_exists($SolicitudComite)){			
									$sws='1'; 
								}else{
									$sws='0'; 
								}
								*/
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
								'nombrePrograma'=>$value['nombrePrograma'],
								'fechaHoraAgendada'=>$value['fechaHoraAgendada'],
								'estado'=>$value['estado'],
								'attachments'=> array(
									array('id'=> 1, 'name'=> '#Evidencias: '.$swi.'', 'size'=>$swi,'ext'=> '.pdf')
									),
								'sancionesAprendiz'=>$Aprendices[0]
								);
							}
							 
							//CONSULTAR MIEMBROPS DEL COMITE
							$tblComite='sena_directivo';
							$comt=new Apis($tblComite);	
							$campos_comit = $GLOBALS['tables_principales']['sena_directivo']['field'];
							$select_comit = implode(',',array_keys($campos_comit));
							$row2=$comt->consultadatos('entidad="'.$entidad.'"',$select_comit);
							foreach($row2 as $a => $val){
									$directivos[] = array(
									'id'=>$val['idDirectivo'],
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
						}
					echo var2js($arrayMensage);	
				break;
				
				
	}
?>
  
 