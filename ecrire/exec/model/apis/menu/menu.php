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
		include_spip('exec/model/sena/claseapi');

		$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : base64_decode($_POST['entidad']);
		$role = isset($_GET['role']) ? base64_decode($_GET['role']) : base64_decode($_POST['role']);
		$opcion = isset($_GET['opcion']) ? base64_decode($_GET['opcion']) : base64_decode($_POST['opcion']);
		switch($opcion) {
		case 'consultar':
			
			$menus=array();
			$menu=array();
			$menuParent=array();
		// Crea un array con las variables que deseas verificar
			$variablesAVerificar = [
				'role' => $role,
				'entidad' => $entidad,
			];
				$app=new Apis('apis_roles');
				$mensajeError = $app->verificarVariables($variablesAVerificar);
			if ($mensajeError !== null){
			 
				$message =array('id'=>1,'message'=>'::ERROR-001:: ','status'=>'404');
				$arrayMensage['status'] = array('status'=>'404','message'=>$message);
				$var = var2js($arrayMensage);	
				echo $var;	 
			
			} else {			
				$res = sql_select("*", "apis_roles", "entidad ='".$entidad."' AND tipo=" . sql_quote($role));
				while ($r = sql_fetch($res)) {
					$idRol=$r['idRol'];
				}	
			 
				//apis_autorizaciones
				
				$q = sql_select("DISTINCT M.idMenu,M.key,M.label,M.isTitle,M.icon",
					'apis_autorizaciones as A,apis_roles as R,apis_menu AS M',
					"A.idRol='".$idRol."'
					AND A.entidad ='".$entidad."'					
					AND M.entidad ='".$entidad."'				
					AND R.entidad ='".$entidad."'				
					AND R.idRol=A.idRol 
					AND M.idMenu=A.idMenu 
                    AND A.c='S' AND M.status='Active' ORDER BY M.idMenu");
				$k=0;
				
				while ($r = sql_fetch($q)) {
						//CHILDREN
						$child = sql_select('DISTINCT S.key,S.label,S.icon,S.url,M.key AS parentKey',
						'apis_menu AS M,apis_submenus AS S, apis_autorizaciones AS A,apis_roles as R',
						'R.idRol="'.$idRol.'" 
						AND A.idRol= R.idRol 
						AND M.idMenu= A.idMenu 
						AND A.entidad="'.$entidad.'" 
						AND S.entidad="'.$entidad.'"
						AND R.entidad="'.$entidad.'"
						AND A.idMenu="'.$r['idMenu'].'"  
						AND A.c="S" 
						AND A.idSubmenu=S.idSubmenu 
						AND  S.status="Active" ORDER BY S.idSubmenu ASC');
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
				if (!is_null($menus)) {
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
