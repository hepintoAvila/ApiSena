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
		include_spip('exec/model/sena/email');	
		//include_spip('fpdf.php');	
		include_spip('inc/charsets');
		include_spip('inc/actions');
		include_spip('inc/editer');
		include_spip('inc/notifications');

		function calcularFechaFinalActualizada($fechaInicial, $horasASumar) {
			// Convertir la fecha inicial a un objeto DateTime
			$fechaInicialObj = new DateTime($fechaInicial);

			// Sumar las horas a la fecha inicial
			$fechaInicialObj->modify("+{$horasASumar} hours");
		
			// Devolver la fecha final formateada
			return $fechaInicialObj->format('Y-m-d H:i:s');
		}
		
		
function calcularFechaFinal($fechaInicio, $tiempoEstipuladoMinutos) {
  // Convierte la fecha de inicio en un objeto DateTime
  $fechaInicioObjeto = new DateTime($fechaInicio);

  // Suma el tiempo estipulado en minutos
  $fechaInicioObjeto->add(new DateInterval('PT' . $tiempoEstipuladoMinutos . 'M'));

  // Devuelve la fecha final formateada
  return $fechaInicioObjeto->format('Y-m-d H:i:s');
}	
 function formatearFecha($fecha) {
  // Convierte la fecha a un timestamp
  $timestamp = strtotime($fecha);

  // Formatea el timestamp en el formato deseado
  $fechaFormateada = date("Y-m-d H:i:s", $timestamp);

  return $fechaFormateada;
}
		$tipo = base64_decode($_POST['tipo']);	
		switch($tipo) {
			case 'addCitas':
				
				$campos = $GLOBALS['tables_principales']['sena_agenda']['field'];
				$select = implode(',',array_keys($campos));
				$tbls='sena_agenda';
				$apps=new Apis($tbls);
				
				$idSolicitudComite = isset($_GET['idSolicitudComite']) ? base64_decode($_GET['idSolicitudComite']) : base64_decode($_POST['idSolicitudComite']);
				$fechaCita = isset($_GET['fechaCita']) ? base64_decode($_GET['fechaCita']) : base64_decode($_POST['fechaCita']);
				$horaCita = isset($_GET['horaCita']) ? base64_decode($_GET['horaCita']) : base64_decode($_POST['horaCita']);
				$tiempoEstipulado = isset($_GET['tiempoEstipulado']) ? base64_decode($_GET['tiempoEstipulado']) : base64_decode($_POST['tiempoEstipulado']);
				$className = isset($_GET['className']) ? base64_decode($_GET['className']) : base64_decode($_POST['className']);
				$title = isset($_GET['title']) ? base64_decode($_GET['title']) : base64_decode($_POST['title']);
				$start = isset($_GET['start']) ? base64_decode($_GET['start']) : base64_decode($_POST['start']);
				$end = isset($_GET['end']) ? base64_decode($_GET['end']) : base64_decode($_POST['end']);
				$idComites = isset($_GET['idComites']) ? base64_decode($_GET['idComites']) : base64_decode($_POST['idComites']);
				$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : base64_decode($_POST['entidad']);
				$idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);
				$codigoFicha = isset($_GET['codigoFicha']) ? base64_decode($_GET['codigoFicha']) : base64_decode($_POST['codigoFicha']);

						$variablesAVerificar = [
							'idSolicitudComite' => $idSolicitudComite,
							'fechaCita' => $fechaCita,
							'horaCita' => $horaCita,
							'tiempoEstipulado' => $tiempoEstipulado,
							'MiembrosComites' => $idComites,
						    'idUsuario' => $idUsuario,
							'codigoFicha' => $codigoFicha,
							'entidad' => $entidad,
							'title' => $title,
							'start' => $start,
							'end' => calcularFechaFinal($fechaCita,$tiempoEstipulado),
							'className' => $className,
						];	
					
						$mensajeError = $apps->verificarVariables($variablesAVerificar);
						if ($mensajeError !== null) {
						$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
						}else{
							 
							  $row=$apps->consultadatos('entidad="'.$entidad.'" AND idSolicitud="'.$idSolicitudComite.'"',$select);
							  if(!empty($row)){
							 foreach($row as $a => $value){
								 $idAgenda = $value['idAgenda'];
							 }
								}
								else{
									$idAgenda=0;
								}
							 if($idAgenda>0){
								$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-002:: No se puede agenda una solicitud más de una vez, actulice la fecha','status'=>'404'); 
							 }else{
								 
							 $chartic = array();
							  $chartic['idApoyo']=$idUsuario;
							  $chartic['idSolicitud']=$idSolicitudComite;
						      $chartic['horaMinutoInicial']=$start;
							  $chartic['horaMinutoFinal']=$end;
							  $chartic['tiempoEstipulado']=$tiempoEstipulado;
							  $chartic['idComites']=$idComites;
							  $chartic['estado']='AGENDADO';//SIN AGENDA
							  $chartic['start']=formatearFecha($start);
							  $chartic['end']=calcularFechaFinal($fechaCita,$tiempoEstipulado);
							  $chartic['title']=$title;
							  $chartic['entidad']=$entidad;
							  $chartic['statut']='1';
							  $chartic = pipeline('pre_insertion',
										array(
											'args' => array(
											'table' => 'sena_agenda',
										),
										'data' => $chartic
										)
									);							
									$idAgenda=@sql_insertq("sena_agenda",$chartic);
									pipeline('post_insertion',
									array(
										'args' => array(
										'table' =>'sena_agenda',
										'id_objet' => $idAgenda
										),
										'data' => $chartic
										)
									);
							 			
								//ACTUALIZAR SOLICITUD
								 
								if (intval($idSolicitudComite)>0) {	
								 $schem = array();
									$schem['fechaHoraAgendada']=formatearFecha($start);
									$schem['estado']='AGENDADA';
									$schem = pipeline('pre_insertion',
											array(
												'args' => array(
												'table' => 'sena_solicitudcomite',
											),
											'data' => $schem
											)
										);							
										sql_updateq('sena_solicitudcomite',$schem,"idSolicitud=" . intval($idSolicitudComite) . "");
										pipeline('post_insertion',
										array(
											'args' => array(
											'table' =>'sena_solicitudcomite',
											'id_objet' => $idActaComite
											),
											'data' => $schem_act
											)
										);
										
											//ACTUALIZAR REGLAS	
																			
								}else{
								$arrayMensage[]=array(
									'id'=>1,
									'message'=>'::WARNING:: No se pudo actualizar la Solocitud!',
									'status'=>'202');
																
								} 
							 
								$arrayMensage[]=array(
								'id'=>1,
								'message'=>'::OK:: Registro guardado correctamente!',
								'status'=>'202');
							 }
							
						}
				echo var2js($arrayMensage);	
	        
			//AUDITORIA
			$appAudi=new Apis('sena_auditoria');
			$appAudi->guardar('ModuloNotificaciones','addCitas','addCitas');		
			//FIN AUDITORIA						
			break;
			case 'updateCitas':
			 $tbls='sena_agenda';
		     $apps=new Apis($tbls);

			$campos = $GLOBALS['tables_principales']['sena_agenda']['field'];
			$select = implode(',',array_keys($campos));	
			$fechaCita = isset($_GET['fechaCita']) ? base64_decode($_GET['fechaCita']) : base64_decode($_POST['fechaCita']);
			$tiempoEstipulado = isset($_GET['tiempoEstipulado']) ? base64_decode($_GET['tiempoEstipulado']) : base64_decode($_POST['tiempoEstipulado']);
			$idAgenda = isset($_GET['idAgenda']) ? base64_decode($_GET['idAgenda']) : base64_decode($_POST['idAgenda']);
			$idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);
			
				
						$variablesAVerificar = [
							'idAgenda' => $idAgenda,
							'fechaCita' => $fechaCita,
							'tiempoEstipulado' => $tiempoEstipulado,
						];
						
						$mensajeError = $apps->verificarVariables($variablesAVerificar);
						if ($mensajeError !== null) {
						$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
						}else{
							$row=$apps->consultadatos('idAgenda="'.intval($idAgenda).'"',$select);
							foreach($row as $a => $value){
								$idSolicitud = $value['idSolicitud'];
								$horaMinutoInicial = $value['horaMinutoInicial'];
							}
							
							 
							$end = calcularFechaFinalActualizada($horaMinutoInicial,$fechaCita);

							$start = substr($horaMinutoInicial, 0, 10).' '.$fechaCita;
							
							sql_updateq('sena_agenda', 
							array(
							'horaMinutoInicial' => $start,
							'horaMinutoFinal' => $end,
							'tiempoEstipulado' => $tiempoEstipulado,
							'start' => $start,
							'end' => $end,
							'title' => $fechaCita),"idAgenda=" . intval($idAgenda) . "");
							
							 //ACTUALIZAR SOLICITUD
						 
							
								if (intval($idSolicitud)) {	
									$schem['fechaHoraAgendada']=formatearFecha($start);
									$schem = pipeline('pre_insertion',
											array(
												'args' => array(
												'table' => 'sena_solicitudcomite',
											),
											'data' => $schem
											)
										);							
										sql_updateq('sena_solicitudcomite',$schem,"idSolicitud=" . intval($idSolicitud) . "");
								}else{
								$arrayMensage[]=array(
									'id'=>1,
									'message'=>'::WARNING:: No se pudo actualizar la Solocitud!',
									'status'=>'202');
									echo var2js($arrayMensage);									
								} 
							 
							$arrayMensage[]=array(
							'id'=>1,
							'message'=>'::OK:: Registro actualizado correctamente!',
							'status'=>'202');
						
						}
					
			echo var2js($arrayMensage);	 
			//AUDITORIA
			$appAudi=new Apis('sena_auditoria');
			$appAudi->guardar('ModuloNotificaciones','addCitas','updateCitas');		
			//FIN AUDITORIA					
			break;
			case 'deleteCitas':
			$tbls='sena_agenda';
		     $apps=new Apis($tbls);	
			 $idAgenda = isset($_GET['idAgenda']) ? base64_decode($_GET['idAgenda']) : base64_decode($_POST['idAgenda']);		
			 $idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);		
			$variablesAVerificar = ['idAgenda' => $idAgenda];
			
						$mensajeError = $apps->verificarVariables($variablesAVerificar);
						if ($mensajeError !== null) {
						$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
						}else{
							if (intval($idAgenda)) {
								// Obtener los datos de idAgenda
								$row = $apps->consultadatos('idAgenda="' . intval($idAgenda) . '"', 'idSolicitud');
							
								// Inicializar $idSolicitud
								$idSolicitud = null;
							
								// Verificar si $row es un array y contiene datos
								if (is_array($row) && !empty($row)) {
									foreach ($row as $a => $value) {
										$idSolicitud = $value['idSolicitud'];
									}
							
									// Verificar si $idSolicitud fue asignado
									if ($idSolicitud !== null) {
										// Preparar el esquema de actualización
										$schem = array();
										$schem['fechaHoraAgendada'] = '0000-00-00 00:00:00';
										$schem['estado'] = 'SIN AGENDA';
										$schem = pipeline('pre_insertion', array(
											'args' => array(
												'table' => 'sena_solicitudcomite',
											),
											'data' => $schem
										));
							
										// Actualizar la base de datos
										sql_updateq('sena_solicitudcomite', $schem, "idSolicitud=" . intval($idSolicitud) . "");
							
										// Eliminar la agenda
										sql_delete("sena_agenda", "idAgenda=" . intval($idAgenda));
							
										// Invalidar las cachés marcadas de esta rúbrica
										include_spip('inc/invalideur');
										suivre_invalideur("id='idAgenda/$idAgenda'");
							
										// Añadir mensaje de éxito
										$arrayMensage[] = array(
											'id' => 1,
											'message' => '::OK:: Registro eliminado correctamente!',
											'status' => '202'
										);
									} else {
										// Añadir mensaje de error si $idSolicitud no fue encontrado
										$arrayMensage[] = array(
											'id' => 0,
											'message' => '::ERROR:: No se encontró el idSolicitud correspondiente!',
											'status' => '404'
										);
									}
								} else {
									// Añadir mensaje de error si $row no es un array válido
									$arrayMensage[] = array(
										'id' => 0,
										'message' => '::ERROR:: No se encontraron datos para el idAgenda proporcionado!',
										'status' => '404'
									);
								}
							} else {
								// Añadir mensaje de error si $idAgenda no es válido
								$arrayMensage[] = array(
									'id' => 0,
									'message' => '::ERROR:: idAgenda no es válido!',
									'status' => '400'
								);
							}
						}	
			echo var2js($arrayMensage);				
			//AUDITORIA
			$appAudi=new Apis('sena_auditoria');
			$appAudi->guardar('ModuloNotificaciones','addCitas','deleteCitas');		
			//FIN AUDITORIA					
			break;
			case 'queryCitas':
			 $tbls='sena_agenda';
		     $apps=new Apis($tbls);
			$campos = $GLOBALS['tables_principales']['sena_agenda']['field'];
			$select = implode(',',array_keys($campos));	
			$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : base64_decode($_POST['entidad']);				
			$tbla_solicitudComite='sena_solicitudcomite';
			$_solicitudComite=new Apis($tbla_solicitudComite);
			$campos_solicitudComite = $GLOBALS['tables_principales']['sena_solicitudcomite']['field'];
			$select_solicitudComite = implode(',',array_keys($campos_solicitudComite));		
			$row=$apps->consultadatos('entidad="'.$entidad.'"',$select);
				
			foreach($row as $a => $val3){
				$row4=$_solicitudComite->consultadatos('idSolicitud="'.$val3['idSolicitud'].'"',$select_solicitudComite);
				if(!empty($row4)){
				foreach($row4 as $a => $val4){
				$className = $val4['tipoSolicitud']=='DISCIPLINA'? 'bg-warning':'bg-danger';
				}
			}else{
				$className='bg-danger';
			}
			$Agendas[] = array(
				'id'=>$val3['idAgenda'],
				'start'=>$val3['start'],
				'end'=>$val3['end'],
				'className'=>$className,
				'title'=>'-S'.$val3['idSolicitud'],
				);
			}

		    $apps_dir=new Apis('sena_directivo');			
			$Directivos=$apps_dir->consultadatos("rol IN ('Apoyo','Coordinador') AND entidad='".$entidad."'",'*');
			$directivo = array("Directivos"=>$Directivos);
			$agenda = array("Agenda"=>$Agendas);
			$datos = array_merge($directivo,$agenda);
			$arrayMensage = array("data"=>$datos);				
			echo var2js($arrayMensage);
			break;
			
			case 'enviarEmailAprendiz':	
			 $tbls='sena_agenda';
		     $apps=new Apis($tbls);			
				$emailEntrada     = trim(base64_decode($_POST["emailEntrada"]));
				$emailAprendiz     = trim(base64_decode($_POST["emailAprendiz"]));
				$idSolicitud     = base64_decode($_POST["idSolicitud"]);
				$idUsuario     = base64_decode($_POST["idUsuario"]);
				
						$variablesAVerificar = [
							'idSolicitud' => $idSolicitud,
							'emailAprendiz' => $emailAprendiz,
							'emailEntrada' => $emailEntrada,
						];
						$mensajeError = $app->verificarVariables($variablesAVerificar);
						if ($mensajeError !== null) {
						$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
						}else{
							
						//ENVIAR CORREO
						$corps = $apps->headersByEmail($idAprendiz,$idSolicitud,$emailEntrada);
						$corps['pieces_jointes'] =[''.$emailEntrada.''];
						$destinatario =$corps['destinatario'];
						$asunto = "".$corps['asunto']."";
						$headers = "".$corps['headers']."";
						$from = "".$corps['from']."";
						$texte=$apps->plantillaAprendizEmail($emailAprendiz,'2023-22-11  15:25:00');
						
						envoyerMail($destinatario, $asunto, $corps, $from = '', $headers = '');
						spip_log("mail $destinatario\n$asunto\n$headers", 'mails');
						
							$arrayMensage[]=array(
							'id'=>1,
							'message'=>'::OK:: Registro '.$emailEntrada.' fue enaviado!',
							'status'=>'202');						
							
						}
	
			echo var2js($arrayMensage);	
			//AUDITORIA
			$appAudi=new Apis('sena_auditoria');
			$appAudi->guardar('ModuloNotificaciones','addCitas','enviarEmailAprendiz');		
			//FIN AUDITORIA					
			break;
		}												
?>
