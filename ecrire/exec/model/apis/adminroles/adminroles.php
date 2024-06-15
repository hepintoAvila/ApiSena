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
		include_spip('exec/model/apis/claseapi');
	 
		//$login = $GLOBALS['visiteur_session']['login'];
		//$session_password = $GLOBALS['visiteur_session']['pass'];
		include_spip('inc/auth');
		//$row = auth_informer_login($login);
	 	$opcion = isset($_GET['opcion']) ? base64_decode($_GET['opcion']) : base64_decode($_POST['opcion']);
	 	$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : base64_decode($_POST['entidad']);
	 	
		switch ($opcion) {
			case 'consultar':
				$table='apis_menu AS M,apis_submenus AS S, apis_autorizaciones AS A,apis_roles as R';
				$app=new Apis($table);
				$select='A.id as idAutorizacion,
				M.label AS menu,S.label AS submenu,
				R.tipo AS rol,
				A.c as c,
				A.a as a,
				A.u as u,
				A.d as d,
				S.idSubmenu,
				M.idMenu,
				R.idRol';
				$query='A.idRol= R.idRol 
				AND M.idMenu= A.idMenu 
				AND M.entidad="'.$entidad.'" 
				AND A.entidad="'.$entidad.'" 
				AND S.entidad="'.$entidad.'"  
				AND R.entidad="'.$entidad.'" 
				AND A.idSubmenu=S.idSubmenu 
				AND  S.status="Active" ORDER BY S.idSubmenu ASC';
				
				$roles=$app->consultadatos($query,$select,$table);
				foreach($roles as $a => $val){
					$DatosRol['roles'][] = array(
							'id'=>$val['idAutorizacion'],
							'menu'=>''.$val['menu'].'',
							'submenu'=>$val['submenu'],
							'rol'=>$val['rol'],
							'c'=>$val['c'],
							'a'=>$val['a'],
							'u'=>$val['u'],
							'd'=>$val['d'],
							'items'=>array('idAutorizacion'=>$val['idAutorizacion'],'idSubmenu'=>$val['idSubmenu'],'idMenu'=>$val['idMenu'],'menu'=>$val['menu'],'submenu'=>$val['submenu']),
							);
				}
				
					if (!is_null($DatosRol)) {
						$data = array("dataRoles"=>array_merge($DatosRol));
						$var = var2js($data);
					echo $var;	
					}else{
						$records['status'] = array('status'=>'404');
						$var = var2js($records);	
					echo $var;	 						
					}
										
			break;
			case 'update':
				$id = isset($_GET['id']) ? base64_decode($_GET['id']) : base64_decode($_POST['id']);
 
				$chartic=array();
				$apps=new Apis('sena_childrens_roles_autorizaciones');		
 			
				
				$chartic['c']=base64_decode($_POST['c']);
				$chartic['a']=base64_decode($_POST['a']);
				$chartic['u']=base64_decode($_POST['u']);
				$chartic['d']=base64_decode($_POST['d']);
				$apps->actualizar($chartic,'id',$id);
						
						$msg[] = array('menssage'=>'OK. El Permiso: '._request('id').' fue actualizado correctamente!');
						$var = var2js($msg); 	
						echo $var;				
			break;
		}

													
?>
