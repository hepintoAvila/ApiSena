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
				
				$idSolicitudComite = base64_decode($_POST["idSolicitudComite"]);
				$fechaCita = base64_decode($_POST["fechaCita"]);
				$horaCita = base64_decode($_POST["horaCita"]);
				$tiempoEstipulado = base64_decode($_POST["tiempoEstipulado"]);
				$className = base64_decode($_POST["className"]);
				$title = base64_decode($_POST["title"]);
				$start = base64_decode($_POST["start"]);
				$end = base64_decode($_POST["end"]);
				$idComites = base64_decode($_POST["idComites"]);
				$hechos = base64_decode($_POST["hechos"]);
				$reglas = base64_decode($_POST["reglas"]);
				$entidad = base64_decode($_POST["entidad"]);
				$idUsuario     = base64_decode($_POST["idUsuario"]);
				$codigoFicha     = base64_decode($_POST["codigoFicha"]);
 

				//$fechaIncidente= date_ical($fechaIncidentes);
						
						$variablesAVerificar = [
							'idSolicitudComite' => $idSolicitudComite,
							'fechaCita' => $fechaCita,
							'horaCita' => $horaCita,
							'tiempoEstipulado' => $tiempoEstipulado,
							'MiembrosComites' => $idComites,
							'reglas' => $reglas,
							'idUsuario' => $idUsuario,
							'codigoFicha' => $codigoFicha,
							'entidad' => $entidad,
							'title' => $title,
							'start' => $start,
							'end' => calcularFechaFinal($fechaCita,$tiempoEstipulado),
							'className' => $className,
						];	
					
						$mensajeError = $app->verificarVariables($variablesAVerificar);
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
							  $chartic['hechos']=$hechos;
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
									$schem['hechos']=$hechos;
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
										
										
											//ACTUALIZAR REGLAS	
										$schem_act = array();
										$act=new Apis('sena_actaComite'); 	
										$row_act=$act->consultadatos('entidad="'.$entidad.'" AND idSolicitud="'.$idSolicitudComite.'"','COUNT(*) AS existe,idActaComite');
										 foreach($row_act as $a => $value){
											 $existe_act = $value['existe'];
											 $idActaComite = $value['idActaComite'];
										 }
									if(intval($existe_act)==0){
										
										$schem_act['idSolicitud']=$idSolicitudComite;
										$schem_act['idDirectivo']='1';
										$schem_act['idApoyo']=$idUsuario;
										$schem_act['miembrosComites']=$idComites;
										$schem_act['codigoFicha']=$codigoFicha;
										$schem_act['fechaAgendada']=formatearFecha($start);
										$schem_act['reglas']=$reglas;
										$schem_act['decision']='';
										$schem_act['entidad']=$entidad;
										$schem_act = pipeline('pre_insertion',
											array(
												'args' => array(
												'table' => 'sena_actaComite',
												),
												'data' => $schem_act
												)
											);							
										$idActaComite=@sql_insertq("sena_actaComite",$schem_act);
										pipeline('post_insertion',
										array(
											'args' => array(
											'table' =>'sena_actaComite',
											'id_objet' => $idActaComite
											),
											'data' => $schem_act
											)
										);										
									}else{
										$schem_act['miembrosComites']=$idComites;
										$schem_act['fechaAgendada']=formatearFecha($start);
										
										$schem_act = pipeline('pre_insertion',
											array(
												'args' => array(
												'table' => 'sena_actaComite',
											),
											'data' => $schem_act
											)
										);							
										sql_updateq('sena_actaComite',$schem_act,"idActaComite=" . intval($idActaComite) . "");										
									}
								
										
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
			break;
			case 'updateCitas':
			 $tbls='sena_agenda';
		     $apps=new Apis($tbls);
			$campos = $GLOBALS['tables_principales']['sena_agenda']['field'];
			$select = implode(',',array_keys($campos));	
			
			$fechaCita = base64_decode($_POST["fechaCita"]);
			$tiempoEstipulado = base64_decode($_POST["tiempoEstipulado"]);
			$idAgenda = base64_decode($_POST["idAgenda"]);
			$idUsuario     = base64_decode($_POST["idUsuario"]);
				
						$variablesAVerificar = [
							'idAgenda' => $idAgenda,
							'fechaCita' => $fechaCita,
							'tiempoEstipulado' => $tiempoEstipulado,
						];
						
						$mensajeError = $app->verificarVariables($variablesAVerificar);
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
			break;
			case 'deleteCitas':
			$tbls='sena_agenda';
		     $apps=new Apis($tbls);			
			$idAgenda = base64_decode($_POST["idAgenda"]);
			$idUsuario     = base64_decode($_POST["idUsuario"]);
			$variablesAVerificar = ['idAgenda' => $idAgenda];
			
						$mensajeError = $app->verificarVariables($variablesAVerificar);
						if ($mensajeError !== null) {
						$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
						}else{
							if (intval($idAgenda)) {
								
							$row=$apps->consultadatos('idAgenda="'.intval($idAgenda).'"','idSolicitud');
							foreach($row as $a => $value){
								$idSolicitud = $value['idSolicitud'];
							}								
									$schem = array();
									$schem['fechaHoraAgendada']='0000-00-00 00:00:00';
									$schem['estado']='SIN AGENDA';
									$schem = pipeline('pre_insertion',
											array(
												'args' => array(
												'table' => 'sena_solicitudcomite',
											),
											'data' => $schem
											)
										);							
										sql_updateq('sena_solicitudcomite',$schem,"idSolicitud=" . intval($idSolicitud) . "");
										
							$app_acta=new Apis('sena_actaComite');	
							$rows=$app_acta->consultadatos('idSolicitud="'.intval($idSolicitud).'"','idActaComite');
							foreach($rows as $a => $acta){
								$idActaComite = $acta['idActaComite'];
							}
							sql_delete("sena_actaComite", "idActaComite=" . intval($idActaComite));
							sql_delete("sena_agenda", "idAgenda=" . intval($idAgenda));
									// invalider les caches marques de cette rubrique
									include_spip('inc/invalideur');
									suivre_invalideur("id='idAgenda/$idAgenda'");
								$arrayMensage[]=array(
								'id'=>1,
								'message'=>'::OK:: Registro eliminado correctamente!',
								'status'=>'202');										
							}else{
								$arrayMensage[]=array(
								'id'=>1,
								'message'=>'::WARNING:: Registro '.$idAgenda.' no fue eliminado!',
								'status'=>'202');								
							}

							 					
						}
			echo var2js($arrayMensage);				
			
			break;
			case 'queryCitas':
			 $tbls='sena_agenda';
		     $apps=new Apis($tbls);
			$campos = $GLOBALS['tables_principales']['sena_agenda']['field'];
			$select = implode(',',array_keys($campos));	
			$entidad     = base64_decode($_POST["entidad"]);
							
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
			break;
		}												
?>
