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
		include_spip('exec/model/sena/claseapi');	
		 
		$campos = $GLOBALS['tables_principales']['sena_aprendiz']['field'];
		$select = implode(',',array_keys($campos));		
		$opcion = base64_decode($_POST['opcion']);	

		switch($opcion) {
			case 'queryByIdAprendiz':
				$idAprendiz = base64_decode($_POST['idAprendiz']);
				$entidad = base64_decode($_POST['entidad']);
				$table='sena_aprendiz';
				$app=new Apis($table);
				$query='idAprendiz="'.$idAprendiz.'"';
						$variablesAVerificar = [
							'idAprendiz' => $idAprendiz,
							'entidad' => $entidad,
						];
					$mensajeError = $app->verificarVariables($variablesAVerificar);
				if ($mensajeError !== null) {
					$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');	
				} else {				
						$rows=$app->consultadatos($query,$select,$table);
							if (!is_null($rows)) {
								$data = array("DatosBasicos"=>$rows);
								$var = var2js($data);
							echo $var;	
							}else{
								$records['status'] = array('status'=>'404');
								$var = var2js($records);	
							echo $var;	 						
							}
				}					
			break;
		}

													
?>
