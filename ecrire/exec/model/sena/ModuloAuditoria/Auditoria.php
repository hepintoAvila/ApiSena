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
		include_spip('exec/model/apis/claseapi');

        $opcion = isset($_GET['opcion']) ? base64_decode($_GET['opcion']) : base64_decode($_POST['opcion']);
		$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : base64_decode($_POST['entidad']);
		switch ($opcion) {
			case 'consultarAuditoria':
							$app=new Apis('sena_auditoria');
							$select='*';
							$query='
		     				entidad="'.$entidad.'"
							ORDER BY idAuditor ASC';
							$sql=$app->consultadatos($query,$select,'sena_auditoria');
							foreach($sql as $a => $val){
                                $Auditors[] = array(
									'id'=>$val['idAuditor'],
									'nombres'=>$val['usuario'],
									'rol'=>$val['rol'],
									'modulo'=>$val['menu'],
									'opcion'=>$val['submenu'],
									'accion'=>$val['accion'],
									'maj'=>$val['maj'],
									);
                            }
                            if(!empty($Auditors)){
                                $auditadas = array("Auditoria"=>$Auditors);
                                $arrayMensage = array("data"=>$auditadas);
                            }else{
                                $arrayMensage = array("data"=>array(
									'id'=>1,
									'nombres'=>'NO EXITEN REGISTROS!',
									'rol'=>'',
									'modulo'=>'',
									'opcion'=>'',
									'accion'=>'',
									'maj'=>'',
									)); 
                            }
                                	
								$var = var2js($arrayMensage);
							echo $var;								 					
			break;
		}
											
?>
