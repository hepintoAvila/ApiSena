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
		include_spip('inc/auth');
 

			// Funciones de cifrado y descifrado
			function encryptData($data, $secretKey) {
				$method = 'AES-256-CBC';
				$ivLength = openssl_cipher_iv_length($method);
				$iv = openssl_random_pseudo_bytes($ivLength);
				$encryptedData = openssl_encrypt($data, $method, $secretKey, 0, $iv);
				return $encryptedData . '::' . base64_encode($iv);
			}
			function generateSecretKey() {
				// Genera 32 bytes de datos aleatorios
				$key = random_bytes(32);
				// Convierte los bytes en una cadena hexadecimal
				return bin2hex($key);
			}
 
	
			 
		$opcion = isset($_GET['opcion']) ? base64_decode($_GET['opcion']) : base64_decode($_POST['opcion']);
		switch ($opcion) {
			case 'consultarusuario':
				//validamos usuarios y contrase�a var_login
				$session_login =_request('var_login');
				$session_password = _request('password');
				$row = auth_identifier_login($session_login, $session_password);
				if($row['statut']=='0minirezo'){
					$statut='Administrador';
				}else{
					$statut=$row['statut'];
				}
			    $secretKey = generateSecretKey();
				$encryptedData = encryptData($session_password, $secretKey);
				$Auth['Auth']= array(
				'status' => '202',
				'Nom' => $row['nom'].'',
				'Idsuario' => $row['id_auteur'],
				'Usuario' => $row['login'],
				'Email' => $row['email'],
				'Rol' => $row['tipo'],
				'Apikey' =>$encryptedData,
				'ApiToken' =>$secretKey,
				'alea_actuel' =>$row['alea_actuel'],
				'entidad' =>$row['entidad'],
				'status'=>'202'
				);
							$res = sql_select("*", "apis_roles", "entidad ='".$row['entidad']."' AND tipo=" . sql_quote($row['tipo']));
							while ($r = sql_fetch($res)) {
								$idTipo=$r['idRol'];
								$entidad=$r['entidad'];
							}	
							$app=new Apis('apis_menu AS M,apis_submenus AS S, apis_autorizaciones AS A,apis_roles as R');
							$select='A.id as idAutorizacion,
							M.key AS menu,S.url AS submenu,
							R.tipo AS rol,
							A.c as c,
							A.a as a,
							A.u as u,
							A.d as d';
							$query='
							R.idRol="'.$idTipo.'"
                			AND R.idRol= A.idRol
							AND M.idMenu= A.idMenu 
							AND S.idSubmenu = A.idSubmenu  
							AND A.idSubmenu=S.idSubmenu 
							AND  S.status="Active" 
							AND M.entidad="'.$entidad.'"
							AND S.entidad="'.$entidad.'"
							AND A.entidad="'.$entidad.'"
							 AND R.entidad="'.$entidad.'"
							ORDER BY S.idSubmenu ASC';
							
							$roles=$app->consultadatos($query,$select,'apis_menu AS M,apis_submenus AS S, apis_autorizaciones AS A,apis_roles as R');
							foreach($roles as $a => $row){
								$pos = strrpos($row['submenu'], '/');
								$submenu = substr($row['submenu'], $pos + 1);
								$menus['Permisos'][]= array('query'=>$row['c'],'add'=>$row['a'],'update'=>$row['u'],'delete'=>$row['d'],'menu'=>$row['menu'],'submenu'=>$submenu);	
							}
							if (!is_null($menus)) {
								$data = array('data'=>array_merge($Auth,$menus));
								$var = var2js($data);
								echo $var;
							}else{
								$records['data'] = array('status'=>'404');
								$var = var2js($records);	
								echo $var;	                            
							}						 					
			break;
		}
											
?>
