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
	
		$tipo = base64_decode($_POST['tipo']);	

		switch($tipo) {
				case "EnviarSolicitud":
				$tbls='sena_solicitudcomite';
				$apps=new Apis($tbls);
				$chartic=array();
				$chactualiza=array();
				
				$idAprendiz     = base64_decode($_POST["idAprendiz"]);
				$tipoComite     = base64_decode($_POST["tipoComite"]);
				$tipoAtencion    = base64_decode($_POST["tipoAtencion"]);
				$nombrePrograma = base64_decode($_POST["nombrePrograma"]);
				$hechos = base64_decode($_POST["descripcion"]);
				$idUsuario = base64_decode($_POST["idUsuario"]);
				$entidad = base64_decode($_POST["entidad"]);
				$selectedFile = base64_decode($_POST["selectedFile"]);
				$fileAtribute = json_decode($selectedFile, true);
				$fechaIncidentes = base64_decode($_POST["fechaIncidente"]);				
				$fechaIncidente= date_ical($fechaIncidentes);
				$descripcion= corriger_caracteres(htmlspecialchars($hechos));


			//	$descripcionHechos= corriger_caracteres(htmlspecialchars('Atentamente le informamos que de conformidad con el Procedimiento Ejecución de la Formación Profesional en su etapa electiva y/o el Reglamento para Aprendices del SENA, se le hace este llamado de Atención por el siguiente motivo: '));
						// Crea un array con las variables que deseas verificar
						$variablesAVerificar = [
							'idAprendiz' => $idAprendiz,
							'tipoComite' => $tipoComite,
							'tipoAtencion' => $tipoAtencion,
							'fechaIncidente' => $fechaIncidente,
							//'fechaPropuesta' => $fechaPropuesta,
							'descripcion' => $descripcion,
							'nombrePrograma' => $nombrePrograma,
							'idUsuario' => $idUsuario,
							'entidad' => $entidad,
							'selectedFile' => $fileAtribute
							//'ApiToken' => $ApiToken,
							//'Apikey' => $Apikey,
						];
						// Llama a la función para verificar las variables
					// print_r($variablesAVerificar);
						$mensajeError = $apps->verificarVariables($variablesAVerificar);
					 
					 
						//$validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
						//if (($mensajeError !== null) OR (!$validarTokes)){
						
						if ($mensajeError !== null){
							$mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
							$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
							
						} else {
						//GUARDAR SOLICITUD
								$chartic = array();
               					$chartic['idInstructor'] = $idUsuario;
								$chartic['idAprendiz'] =$idAprendiz;
								$chartic['tipoSolicitud'] =$tipoComite;
								$chartic['tipoAtencion'] =$tipoAtencion;
								$chartic['codigoFicha'] ='000';
								$chartic['fechaSolicitud'] =$fechaIncidente;
								$chartic['hechos'] ="".$descripcion."";
								$chartic['nombrePrograma'] =$nombrePrograma;
								$chartic['estado'] ='SIN AGENDAR';
								$chartic['entidad'] =$entidad;
								$chartic['statut'] = '1';
								$chartic = pipeline('pre_insertion',
										array(
											'args' => array(
											'table' => 'sena_solicitudcomite',
										),
										'data' => $chartic
										)
									);							
									$idSolicitud=@sql_insertq("sena_solicitudcomite", $chartic);
									pipeline('post_insertion',
									array(
										'args' => array(
										'table' =>'sena_solicitudcomite',
										'id_objet' => $idSolicitud
										),
										'data' => $chartic
										)
									);
						//CREAR EL CODIGO
								if ($idSolicitud  < 10) {
									 $codigoFicha='SC00-'.$fechaIncidente.'-'.$idUsuario.'-'.$idSolicitud ;
									} else {
									$codigoFicha='SC-'.$fechaIncidente.'-'.$idUsuario.'-'.$idSolicitud ;
								}
							//ACTULIZO EL CODIGO
							if ($idSolicitud)
										{
											sql_updateq('sena_solicitudcomite', array('codigoFicha' => $codigoFicha),
												"idSolicitud=" . intval($idSolicitud) . "");
										}
						//FIN CREAR EL CODIGO		
												
						//GUARDAMOS EL PDF DE LOS HECHOS EN EL SERVIDOR
						$decodedImage = base64_decode($_POST['fileContent']);
						$dir_doc='../ecrire/exec/model/sena/ModuloIncidentes/';
						$path=$dir_doc.'pdf';
						$destino=$dir_doc.'pdf/';
						if (!is_dir($path)) {
										mkdir($path, 0777, true);
										closedir($destino);
						}
						$ubicacionPermanente = $destino.''.$codigoFicha.'.pdf';
						file_put_contents($ubicacionPermanente, $decodedImage);						 
						//FIN GUARDAR  PDF	
						
						
						//ENVIAR CORREO
						$corps = $apps->headersEmail($idAprendiz,$idUsuario,$descripcion,$tipoComite);
						$corps['pieces_jointes'] =['holmespinto.avila@gmail.com,hosmmer.eduardo@gmail.com'];
						$destinatario =$corps['destinatario'];
						$asunto = "".$corps['asunto']."";
						$headers = "".$corps['headers']."";
						$from = "".$corps['from']."";
						//@mail('hosmmer.eduardo@gmail.com', ',hosmmer.eduardo@gmail.com', 'SADDASDASDA', $headers);
						//envoyerMail(''.$destinatario.'', $asunto, $corps, $from = '', $headers = '');
						spip_log("mail $destinatario\n$asunto\n$headers", 'mails');
						//FIN
						 
						 $sql = sql_select("idSolicitud,
						 idAprendiz,
						 idInstructor,
						 tipoSolicitud,
						 hechos,
						 fechaIncidente,
						 tipoAtencion,
						 fechaSolicitud,
						 maj,
						 nombrePrograma",'sena_solicitudcomite','entidad="'.$entidad.'" AND codigoFicha="'.$codigoFicha.'"');
								while ($row = sql_fetch($sql)) {			
									$idSolicitud= $row['idSolicitud'];			
									$idAprendiz= $row['idAprendiz'];			
									$idInstructor= $row['idInstructor'];			
									$nombrePrograma= $row['nombrePrograma'];			
									$tipoComite= $row['tipoSolicitud'];			
									$fechaIncidente= $row['maj'];			
									$tipoAtencion= $row['tipoAtencion'];			
									$descripcion= !empty($row['hechos']) ? $row['hechos']:'';			
								  }	
						
						 //DATOS DEL APRENDIZ
						 $sql2 = sql_select("nombres,apellidos,identificacion,telefono,correo,direccion",'sena_aprendiz','idAprendiz="'.$idAprendiz.'"');
								while ($row2 = sql_fetch($sql2)) {	
									$nombresApellidosAprendis = $row2['nombres'].' '.$row2['apellidos'];		
									$identificacion2= $row2['identificacion'];		
									$direccion2= $row2['direccion'];		
									$telefono2= $row2['telefono'];		
									$correo2= $row2['correo'];		
								  }	
 						 //DATOS DEL sena_instructor
						 $sql1 = sql_select("nombres,apellidos,identificacion,telefono,correo",'sena_instructor','idInstructor="'.$idInstructor.'"');
								while ($row1 = sql_fetch($sql1)) {	
									$nombresApellidosInstructor = $row1['nombres'].' '.$row1['apellidos'];		
									$identificacion1= $row1['identificacion'];			
									$telefono1= $row1['telefono'];		
									$correo1= $row1['correo'];		
								  }	
 						 //DATOS DEL sena_instructor
					$sql3 = sql_select("*",
					'sena_sancionesanteriores','idAprendiz="'.$idAprendiz.'"');
				
								while ($row3 = sql_fetch($sql3)) {	
									$academica= $row3['academica'] ? $row3['academica']:'0';		
									$disciplinaria= $row3['disciplinaria'] ? $row3['disciplinaria']:'0';			
									$inasistencias= $row3['inasistencias'] ? $row3['inasistencias']:'0';		
									$verbal= $row3['verbal'] ? $row3['verbal']:'0';			
									$escrito= $row3['escrito']? $row3['escrito']:'0';		
									
									$Aprendices = array(
										'disciplinaria'=>$disciplinaria,
										'academica'=>$academica,
										'inasistencias'=>$inasistencias,
										'verbal'=>$verbal,
										'escrito'=>$escrito,
										); 

								  }	

							
									
						//CREAMOS LA SOLICITUD EN PDF
									$path = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$codigoFicha.'.pdf';
									if (@file_exists($path)){
										spip_log("Supprimer ancien logo $codigoFicha", 'codigoFicha');
										spip_unlink($path);
									}
							 		
							require('../ecrire/exec/model/sena/ModuloSolicitudComite/fpdf.php');	
							// Creación del objeto de la clase heredada
							$tipoComiteAcademico = ($tipoComite==='ACADEMICO' || $tipoComite==='ACADEMICO Y DISCIPLINARIO') ? 'X':'';
							$tipoComiteDisciplinario = ($tipoComite==='DISCIPLINARIO' || $tipoComite==='ACADEMICO Y DISCIPLINARIO') ? 'X':'';
							$pdf = new PDF();
							$pdf->AliasNbPages();
							$pdf->AddPage('P','Legal');
							$pdf->sanciones=$Aprendices;
							$pdf->calificacion=$tipoAtencion;
							$pdf->descripcion="".$descripcion."";
							$pdf->tipoComiteAcademico=$tipoComiteAcademico;
							$pdf->tipoComiteDisciplinario=$tipoComiteDisciplinario;
							$pdf->fechaIncidente="".$fechaIncidente."";
							$pdf->nombrePrograma="".$nombrePrograma."";
							$pdf->Aprendiz=array('idAprendiz'=>$idAprendiz,'nombres'=>$nombresApellidosAprendis,'identificacion'=>$identificacion2,'telefono'=>$telefono2,'correo'=>$correo2,'direccion'=>$direccion2,'jornada'=>'TARDE','ficha'=>'2619701');
							$pdf->Instructor=array('nombresInst'=>$nombresApellidosInstructor,'identificacionInst'=>$identificacion1,'telefonoInst'=>$telefono1,'correoInst'=>$correo1);
							$pdf->Contenido();
							$pdf->Output('F',''.$codigoFicha.'.pdf',true);
							$pdf='../ecrire/'.$codigoFicha.'.pdf';
							if (@file_exists($pdf)){
								$newLocation = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$codigoFicha.'.pdf';
								$moved = rename($pdf, $newLocation);
								if($moved)
								  {
									spip_unlink($pdf);
								  }						
							}						 
						   //FIN GENERA LA FICHA
							$arrayMensage[]=array(
							'id'=>1,
							'message'=>'::OK:: Registro guardado correctamente!',
							'status'=>'202');
						}
						 
						echo var2js($arrayMensage);
					 
			break;
			case "updateSolicitud":
				$tbls='sena_solicitudcomite';
				$apps=new Apis($tbls);
				$chartic=array();
				$chactualiza=array();
				$opcionUpdate     = base64_decode($_POST["opcionUpdate"]);
				$idUsuario     = base64_decode($_POST["idUsuario"]);
				$ApiToken     = base64_decode($_POST["ApiToken"]);
				$Apikey     = base64_decode($_POST["Apikey"]);
				$entidad     = base64_decode($_POST["entidad"]);
				$e     = base64_decode($_POST["e"]); 
				$idSolicitud     = base64_decode($_POST["idSolicitud"]);
				$fechaIncidente = base64_decode($_POST["fechaIncidente"]);				
				//$fechaIncidente= date_ical($fechaIncidentes);				
				switch($opcionUpdate) {
					case "datosAprendiz":
							$nombrePrograma     = base64_decode($_POST["nombrePrograma"]);
							$codigoFicha     = base64_decode($_POST["codigoFicha"]);
							$faltaAcademica     = base64_decode($_POST["faltaAcademica"]);
							$faltaDisciplinaria     = base64_decode($_POST["faltaDisciplinaria"]);
							$faltaInasistencias     = base64_decode($_POST["faltaInasistencias"]);
							$faltaVerbal     = base64_decode($_POST["faltaVerbal"]);
							$faltaEscrito     = base64_decode($_POST["faltaEscrito"]);
							$variablesAVerificar = [
								'idSolicitud' => $idSolicitud,
								'idAprendiz' => $e,
								'faltaAcademica' => $faltaAcademica,
								'faltaDisciplinaria' => $faltaDisciplinaria,
								'faltaInasistencias' => $faltaInasistencias,
								'faltaVerbal' => $faltaVerbal,
								'faltaEscrito' => $faltaEscrito,
								'codigoFicha' => $codigoFicha,
								'nombrePrograma' => $nombrePrograma,
								'idUsuario' => $idUsuario,
								'entidad' => $entidad,
								'ApiToken' => $ApiToken,
								'Apikey' => $Apikey,
							];
						

							$mensajeError = $apps->verificarVariables($variablesAVerificar);
					 $validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
							if (($mensajeError !== null) OR (!$validarTokes)){
								$mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
								$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
								echo var2js($arrayMensage);								
							} else {
								
									$sql2 = sql_select("max(idSolicitud), idSancion",'sena_sancionesAnteriores','idAprendiz="'.$e.'"');
									while ($row2 = sql_fetch($sql2)) {	
										$idSancion= $row2['idSancion'];		
									}	
									$saciones= array(
										'academica' => $faltaAcademica,
										'disciplinaria' => $faltaDisciplinaria,
										'inasistencias' => $faltaInasistencias,
										'verbal' => $faltaVerbal,
										'escrito' => $faltaEscrito);
									if ($idSancion)
										{
											sql_updateq('sena_sancionesAnteriores',$saciones,"idSancion=".intval($idSancion)."");
										}

									
									if ($idSolicitud)
										{
											sql_updateq('sena_solicitudcomite',array('idAprendiz' => $e,'nombrePrograma'=>$nombrePrograma),"idSolicitud=".intval($idSolicitud)."");
										}										
								
								$arrayMensage[]=array('id'=>1,'message'=>'::OK:: Registro actualizado correctamente!','status'=>'202');
								echo var2js($arrayMensage);	
							}
						
						break;
						case "datosTipoComite":

								$variablesAVerificar = [
								'idSolicitud' => $idSolicitud,
								'tipoComite' => htmlspecialchars($e),
								'idUsuario' => $idUsuario,
								'entidad' => $entidad,
								'ApiToken' => $ApiToken,
								'Apikey' => $Apikey,
							];
							
							$mensajeError = $apps->verificarVariables($variablesAVerificar);
							$validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
							if (($mensajeError !== null) OR (!$validarTokes)){
								$mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
								$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
								
							} else {
									
									if ($idSolicitud)
										{
											sql_updateq('sena_solicitudcomite',array('tipoSolicitud' => $e),"idSolicitud=".intval($idSolicitud)."");
										}
								$arrayMensage[]=array('id'=>1,'message'=>'::OK:: Registro actualizado correctamente!','status'=>'202');
							}
						echo var2js($arrayMensage);		
						break;
						case "datosTipoAtencion":
								$variablesAVerificar = [
								'idSolicitud' => $idSolicitud,
								'tipoAtencion' =>htmlspecialchars($e),
								'idUsuario' => $idUsuario,
								'entidad' => $entidad,
								'ApiToken' => $ApiToken,
								'Apikey' => $Apikey,
							];
							
							$mensajeError = $apps->verificarVariables($variablesAVerificar);
							$validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
							if (($mensajeError !== null) OR (!$validarTokes)){
								$mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
								$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
								
							} else {
								
									if ($idSolicitud)
										{
											sql_updateq('sena_solicitudcomite',array('tipoAtencion' => $e),"idSolicitud=".intval($idSolicitud)."");
										}								
								$arrayMensage[]=array('id'=>1,'message'=>'::OK:: Registro actualizado correctamente!','status'=>'202');
							}
						echo var2js($arrayMensage);							
						break;
						case "datosFechaIncidente":
								$variablesAVerificar = [
								'idSolicitud' => $idSolicitud,
								'fechaIncidente' => base64_decode($_POST["fechaIncidente"]),
								'idUsuario' => $idUsuario,
								'entidad' => $entidad,
								'ApiToken' => $ApiToken,
								'Apikey' => $Apikey,
								'e' => $e,
							];
							$fechaFormateada =base64_decode($_POST["fechaIncidente"]);
							//print_r($variablesAVerificar);
							$mensajeError = $apps->verificarVariables($variablesAVerificar);
							$validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
							if (($mensajeError !== null) OR (!$validarTokes)){
								$mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
								$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
								
							} else {
								$fechaIncidentes= date_ical($fechaIncidente);
									if ($idSolicitud)
										{
											sql_updateq('sena_solicitudcomite',array('fechaSolicitud' =>$fechaFormateada),"idSolicitud=".intval($idSolicitud)."");
										}	
								$arrayMensage[]=array('id'=>1,'message'=>'::OK:: Registro actualizado correctamente!','status'=>'202');
							}
						echo var2js($arrayMensage);								
						break;	
						case "datosDescripcion":
						//
								$descripcion     = base64_decode($_POST["descripcion"]);
								$variablesAVerificar = [
								'idSolicitud' => $idSolicitud,
								'e' => htmlspecialchars($e),
								'idUsuario' => $idUsuario,
								'entidad' => $entidad,
								'ApiToken' => $ApiToken,
								'hechos' => $descripcion,
								'Apikey' => $Apikey,
							];
							//print_r($variablesAVerificar);
							
							$mensajeError = $apps->verificarVariables($variablesAVerificar);
							$validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
							if (($mensajeError !== null) OR (!$validarTokes)){
								$mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
								$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
								
							} else {
									//$descripcions= corriger_caracteres(htmlspecialchars($descripcion));
									$texto_utf8 = utf8_encode($descripcion);
									if ($idSolicitud)
										{
											sql_updateq('sena_solicitudcomite',array('hechos' => $texto_utf8),"idSolicitud=".intval($idSolicitud)."");
										}								
								$arrayMensage[]=array('id'=>1,'message'=>'::OK:: Registro actualizado correctamente!','status'=>'202');
							}
						echo var2js($arrayMensage);	
						break;							
				}
				
				
				
				//GENERE NUEVAMENTE EL pdf
				$codigoFicha     = base64_decode($_POST["codigoFicha"]);
				$entidad = base64_decode($_POST['entidad']);
						 $sql = sql_select("idSolicitud,
						 idAprendiz,
						 idInstructor,
						 tipoSolicitud,
						 hechos,
						 fechaIncidente,
						 tipoAtencion,
						 maj,
						 nombrePrograma",'sena_solicitudcomite','entidad="'.$entidad.'" AND codigoFicha="'.$codigoFicha.'"');
								while ($row = sql_fetch($sql)) {			
									$idSolicitud= $row['idSolicitud'];			
									$idAprendiz= $row['idAprendiz'];			
									$idInstructor= $row['idInstructor'];			
									$nombrePrograma= $row['nombrePrograma'];			
									$tipoComite= $row['tipoSolicitud'];			
									$fechaIncidente= $row['maj'];					
									$tipoAtencion= $row['tipoAtencion'];			
									$descripcion= !empty($row['hechos']) ? $row['hechos']:'';			
								  }	
 		
						 //DATOS DEL APRENDIZ
						 $sql2 = sql_select("nombres,apellidos,identificacion,telefono,correo,direccion",'sena_aprendiz','idAprendiz="'.$idAprendiz.'"');
								while ($row2 = sql_fetch($sql2)) {	
									$nombresApellidosAprendis = $row2['nombres'].' '.$row2['apellidos'];		
									$identificacion2= $row2['identificacion'];		
									$direccion2= $row2['direccion'];		
									$telefono2= $row2['telefono'];		
									$correo2= $row2['correo'];		
								  }	
 						 //DATOS DEL sena_instructor
						 $sql1 = sql_select("nombres,apellidos,identificacion,telefono,correo",'sena_instructor','idInstructor="'.$idInstructor.'"');
								while ($row1 = sql_fetch($sql1)) {	
									$nombresApellidosInstructor = $row1['nombres'].' '.$row1['apellidos'];		
									$identificacion1= $row1['identificacion'];			
									$telefono1= $row1['telefono'];		
									$correo1= $row1['correo'];		
								  }	
 				//DATOS DEL sena_instructor
					$sql3 = sql_select("MAX(idSolicitud),academica,disciplinaria,inasistencias,verbal,escrito",
					'sena_sancionesanteriores','idAprendiz="'.$idAprendiz.'"');
								while ($row3 = sql_fetch($sql3)) {	
									$academica= $row3['academica'] ? $row3['academica']:0;		
									$disciplinaria= !empty($row3['disciplinaria']) ? $row3['disciplinaria']:0;			
									$inasistencias= !empty($row3['inasistencias'])? $row3['inasistencias']:0;		
									$verbal= !empty($row3['verbal'])? $row3['verbal']:0;			
									$escrito= !empty($row3['escrito'])? $row3['escrito']:0;			
								  }	
									$Aprendices[] = array(
									'disciplinaria'=>$disciplinaria,
									'academica'=>$academica,
									'inasistencias'=>$inasistencias,
									'verbal'=>$verbal,
									'escrito'=>$escrito,
									); 
									
						//CREAMOS LA SOLICITUD EN PDF
									$path = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$codigoFicha.'.pdf';
									if (@file_exists($path)){
										spip_log("Supprimer ancien logo $codigoFicha", 'codigoFicha');
										spip_unlink($path);
									}
							 		
							require('../ecrire/exec/model/sena/ModuloSolicitudComite/fpdf.php');	
							// Creación del objeto de la clase heredada
							$tipoComiteAcademico = ($tipoComite==='ACADEMICO' || $tipoComite==='ACADEMICO Y DISCIPLINARIO') ? 'X':'';
							$tipoComiteDisciplinario = ($tipoComite==='DISCIPLINARIO' || $tipoComite==='ACADEMICO Y DISCIPLINARIO') ? 'X':'';
							$pdf = new PDF();
							$pdf->AliasNbPages();
							$pdf->AddPage('P','Legal');
							$pdf->saciones=$Aprendices;
							$pdf->calificacion=$tipoAtencion;
							$pdf->descripcion="".$descripcion."";
							$pdf->tipoComiteAcademico=$tipoComiteAcademico;
							$pdf->tipoComiteDisciplinario=$tipoComiteDisciplinario;
							$pdf->fechaIncidente="".$fechaIncidente."";
							$pdf->nombrePrograma="".$nombrePrograma."";
							$pdf->Aprendiz=array('idAprendiz'=>$idAprendiz,'nombres'=>$nombresApellidosAprendis,'identificacion'=>$identificacion2,'telefono'=>$telefono2,'correo'=>$correo2,'direccion'=>$direccion2,'jornada'=>'TARDE','ficha'=>'2619701');
							$pdf->Instructor=array('nombresInst'=>$nombresApellidosInstructor,'identificacionInst'=>$identificacion1,'telefonoInst'=>$telefono1,'correoInst'=>$correo1);
							$pdf->Contenido();
							$pdf->Output('F',''.$codigoFicha.'.pdf',true);
							$pdf='../ecrire/'.$codigoFicha.'.pdf';
							if (@file_exists($pdf)){
								$newLocation = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$codigoFicha.'.pdf';
								$moved = rename($pdf, $newLocation);
								if($moved)
								  {
									spip_unlink($pdf);
								  }						
							}

							
				
		break;
		case "add_documentos":
		$tbls='sena_solicitudcomite';
		$apps=new Apis($tbls);
		
		$ApiToken     = base64_decode($_POST["ApiToken"]);
		$Apikey     = base64_decode($_POST["Apikey"]);
		$options     = base64_decode($_POST["options"]);
				$idSolicitud = base64_decode($_POST["idSolicitud"]);
				$idUsuario = base64_decode($_POST["idUsuario"]);
				$entidad = base64_decode($_POST["entidad"]);
				$codigoFicha = base64_decode($_POST["codigoFicha"]);
				$selectedFile = base64_decode($_POST["selectedFile"]);
				$fileAtribute = json_decode($selectedFile, true);	
				$decodedImage = base64_decode($_POST['fileContent']);
						$variablesAVerificar = [
							'codigoFicha' => $codigoFicha,
							'decodedImage' => $decodedImage,
							'idSolicitud' => $idSolicitud,
							'idUsuario' => $idUsuario,
							'entidad' => $entidad,
							'selectedFile' => $fileAtribute,
							'ApiToken' => $ApiToken,
							'Apikey' => $Apikey,
						];
							$mensajeError = $apps->verificarVariables($variablesAVerificar);
							$validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
							if (($mensajeError !== null) OR (!$validarTokes)){
								$mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
								$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
							}else{						
								$arrayMensage[]=array('id'=>1,'message'=>'::OK:: Documento actualizado correctamente!','status'=>'202');
								//if(options=='1'){
										//GUARDAMOS EL PDF DE LOS HECHOS EN EL SERVIDOR
										$decodedImage = base64_decode($_POST['fileContent']);
										$dir_doc='../ecrire/exec/model/sena/ModuloIncidentes/';
										$path=$dir_doc.'pdf';
										$destino=$dir_doc.'pdf/';
										if (!is_dir($path)) {
														mkdir($path, 0777, true);
														closedir($destino);
										}
										$ubicacionPermanente = $destino.''.$codigoFicha.'.pdf';
										file_put_contents($ubicacionPermanente, $decodedImage);	
									//}
						}
		 
						//FIN GUARDAR  PDF	

		echo var2js($arrayMensage);							
		break;
			
	}
	/*
	const App = () => {
  const [list, setList] = React.useState([]);
  const fetchList = () => {
    // Simulate fetching data from the server via setTimeout
    setTimeout(() => {
      setList([])
    }, 1000)
  }

  React.useEffect(() => {
    fetchList()
  }, [])
  return (
    list.length && (
      <div className="name-list-container">
        {list.map((name) => {
          return <div className="name-list-item">{name}</div>;
        })}
      </div>
    )
  );
};
ReactDOM.render(<App />, document.getElementById('app'))
	*/
?>
  
 