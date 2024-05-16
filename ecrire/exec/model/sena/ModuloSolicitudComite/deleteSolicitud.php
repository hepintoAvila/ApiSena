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
		include_spip('exec/model/sena/claseapi');
		
		$obj = base64_decode($_POST['obj']);	
		switch($obj) {
			case "deleteSolicitud":
				$tbls='sena_solicitudcomite';
				$apps=new Apis($tbls);
 
				$idUsuario     = base64_decode($_POST["idUsuario"]);
				$ApiToken     = base64_decode($_POST["ApiToken"]);
				$Apikey     = base64_decode($_POST["Apikey"]);
				$idSolicitud     = base64_decode($_POST["idSolicitud"]);

						$variablesAVerificar = [
							'idSolicitud' => $idSolicitud,
							'ApiToken' => $ApiToken,
							'Apikey' => $Apikey,
						];
 
						// Llama a la función para verificar las variables
					 
						$mensajeError = $apps->verificarVariables($variablesAVerificar);
						$validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
						if (($mensajeError !== null) OR (!$validarTokes)){
							$mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
							$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
							
						} else {
						 
								$sql1 = sql_select("codigoFicha",'sena_solicitudcomite','idSolicitud="'.$idSolicitud.'"');
								while ($row1 = sql_fetch($sql1)) {		
									$codigoFicha= $row1['codigoFicha'];			
								  }									
								
								$SolicitudComite = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$codigoFicha.'.pdf';
								if (@file_exists($SolicitudComite)){			
									spip_unlink($SolicitudComite);
								}
								$Incidentes='../ecrire/exec/model/sena/ModuloIncidentes/pdf/'.$codigoFicha.'.pdf';
								if (@file_exists($Incidentes)){			
									spip_unlink($Incidentes);
								}								
							    sql_delete("sena_solicitudcomite","idSolicitud=" . intval($idSolicitud));								
								$arrayMensage[]=array(
								'id'=>1,
								'message'=>'::OK:: Registro eliminado correctamente!',
								'status'=>'202');	
						}
						echo var2js($arrayMensage);
			break;
			case "deleteFile":
				$tbls='sena_solicitudcomite';
				$apps=new Apis($tbls);
				$path ='';
				$idUsuario     = base64_decode($_POST["idUsuario"]);
				$ApiToken     = base64_decode($_POST["ApiToken"]);
				$Apikey     = base64_decode($_POST["Apikey"]);
				$idOpcion     = base64_decode($_POST["idOpcion"]);
				$codigoFicha     = base64_decode($_POST["codigoFicha"]);
				$variablesAVerificar = [
							'idOpcion' => $idOpcion,
							'codigoFicha' => $codigoFicha,
							'ApiToken' => $ApiToken,
							'Apikey' => $Apikey,
						];				
						$mensajeError = $apps->verificarVariables($variablesAVerificar);
						$validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
						if (($mensajeError !== null) OR (!$validarTokes)){
							$mensajeErrors = $mensajeError == '' ? 'Error del Token':$mensajeError;
							$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeErrors.'','status'=>'404');
							
						} else {
								if($idOpcion==1){
									$path='../ecrire/exec/model/sena/ModuloIncidentes/pdf/'.$codigoFicha.'.pdf';
									if (@file_exists($path)){
										spip_log("Supprimer ancien logo $codigoFicha", 'codigoFicha');
										spip_unlink($path);
									}
								}
								if($idOpcion==2){
									$path = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$codigoFicha.'.pdf';
									if (@file_exists($path)){
										spip_log("Supprimer ancien logo $codigoFicha", 'codigoFicha');
										spip_unlink($path);
									}
								}
								$arrayMensage[]=array('id'=>1,
								'message'=>'::OK:: la opción '.$idOpcion.' fue eliminado correctamente!',
								'status'=>'202');								
						}
			echo var2js($arrayMensage);
			break;
	}
?>
  
 