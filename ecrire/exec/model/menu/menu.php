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
/*
SELECT DISTINCT m.id,m.key,m.label,m.isTitle,m.icon 
FROM menu_usuarios_electric AS mu,menu_electric AS m, electry_autorizaciones AS a
WHERE mu.idChildren=a.opcion AND mu.idMenu=m.id AND a.rol='1' AND a.c='S' AND mu.idTipo=a.rol AND m.status='Active' ORDER BY m.id;
*/

if (!defined('_ECRIRE_INC_VERSION')) {
	return;
}
		include_spip('base/connect_sql');
		include_spip('inc/filtres_ecrire');
		include_spip('inc/filtres');
		include_spip('inc/utils');
		include_spip('inc/json');
 	   
		switch ($_POST['opcion']) {
		case 'consultar':
			$menus=array();
			$menu=array();
			$menuParent=array();
			$IdMenu = base64_decode($_POST['IdMenu']);
			$entidad = base64_decode($_POST['entidad']);
			$apiToken = $_POST['apiToken'];
			$apikey = $_POST['apikey'];
			$variablesAVerificar = [
				'idSolicitudComite' => $IdMenu,
				'entidad' => $entidad,
				'entidad' => $ApiToken,
				'apiToken' => $apiToken,
				'apikey' => $Apikey,
			];	
 
 
			// Llama a la función para verificar las variables
			$mensajeError = $apps->verificarVariables($variablesAVerificar);
			//$validarTokes = $apps->verificarApikeyApiToken($Apikey,$ApiToken,$idUsuario);
			if ($mensajeError !== null){
				$arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001::','status'=>'404');
				
			} else {

			 
				$res = sql_select("*", "apis_roles", "Tipo=" . sql_quote($IdMenu));
				while ($r = sql_fetch($res)) {
					$idRol=$r['idRol'];
				}	
				//print_r($IdMenu);
				//$admin = ($idTipo==1)? '': 'AND mu.idMenu!="8"';
				$q = sql_select("DISTINCT m.idRol AS idMenu,m.key,m.label,m.isTitle,m.icon",
					'apis_autorizaciones AS mu,apis_menu AS m',
					"mu.idMenu=m.idMenu AND mu.idRol='".$idRol."' AND mu.c='S' AND m.status='Active' ORDER BY m.idMenu");
				$k=0;
				while ($r = sql_fetch($q)) {
						//CHILDREN
						$child = sql_select('mc.key,mc.label,mc.icon,mc.url,m.key AS parentKey',
						'apis_autorizaciones AS a,apis_menu AS m,apis_submenus AS mc',
						'a.idRol="'.$idRol.'" AND a.idMenu="'.$r['idMenu'].'" AND a.c="S" AND a.idSubmenu =mc.idSubmenu AND a.idMenu=m.idMenu AND mc.status="Active" ORDER BY mc.idSubmenu ASC');
						
						$i=0;
						while ($ch = sql_fetch($child)) {
							$children['children'][]=array('key'=>$ch['key'],'label'=>$ch['label'],'url'=>$ch['url'],'parentKey'=>$ch['parentKey'],'icon'=>$ch['icon']);
						$i++;
						}	
					//PARENT
					if($k==0){
						$menus[]=array('key'=>'navigation','label'=>'Navigation','isTitle'=>true);
						$menus[]=array('key'=>$r['key'],'label'=>$r['label'],'isTitle'=>false,'icon'=>$r['icon'],'badge'=>Array('variant'=>'error','text'=>$i),'children'=>$children['children']);
					}else{
						$menus[]=array('key'=>$r['key'],'label'=>$r['label'],'isTitle'=>false,'icon'=>$r['icon'],'badge'=>Array('variant'=>'error','text'=>$i),'children'=>$children['children']);
					}
					unset($children['children']);
					$i=0;
					$k++;	
				 }
				if($row['id_auteur']==3){
					$ouput = var2js($menus);
					echo $ouput; 
				}else{
					$records['status'] = array('status'=>'404');
					$var = var2js($records);	
					echo $var;	 
				}
			}
				break;
 			case 'configurar':
			echo 'No registrado';
			break;
			
			
	}		
										
?>
