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
			case 'consultar':
				$DatosAuteurs=array();
				$select='*';
				$set = array();	
				
				$app=new Apis('apis_menu');
				$menus=$app->consultadatos('entidad="'.$entidad.'" AND isTitle<>"1"',$select);				
				foreach($menus as $a => $value){
					$DatosMenus['Menus'][] = array(
                    'id'=>$value['idMenu'],
					'key'=>$value['key'],
                    'label'=>$value['label'],
                    'icon'=>$value['icon'],
                    'status'=>$value['status']
					);
					}		
					$data = array("data"=>$DatosMenus);
					$var = var2js($data);
					echo $var;						
			break;
			case 'add':
				    $login = isset($_GET['login']) ? base64_decode($_GET['login']) : base64_decode($_POST['login']);
				    $email = isset($_GET['email']) ? base64_decode($_GET['email']) : base64_decode($_POST['email']);
				    $rol = isset($_GET['rol']) ? base64_decode($_GET['rol']) : base64_decode($_POST['rol']);
 
					$desc=array();
					$id_ou_options=0;
					$login = trim(corriger_caracteres($entidad));
		 
					$res = sql_select("statut, id_auteur, login, email", "api_auteurs", "entidad='".$entidad."' AND email=" . sql_quote($mail));
					if (!$r = email_valide($mail)or!$res) {
						$msg[] = array('menssage'=>'ERROR. El email ya existe');
						$var = var2js($msg);	
						echo $var;
						//break;
					}else{
						$options['tipo']=$rol;
						$inscrire_auteur = charger_fonction('inscrire_auteur', 'action');
						$desc = $inscrire_auteur('', $mail, $login, $options);
						
						if (!is_null($desc)) {
							if($desc['pass']=='I'){$msg[] = array('menssage'=>'ERROR. El Usuario no se pudo guardar!');}else{$msg[] = array('id'=>1,'menssage'=>'Usuario guardado con exito! Su password es:'.$desc['pass'].', y el usuario: '.$desc['login'].'');};
						  }else{
							$msg[] = array('menssage'=>'¡ERROR!. El Usuario no se pudo guardar!','status' => '200');
						}	
							$var = var2js($msg);	
							echo $var;						
						
					}					
			break;
			case 'update':
				$id = isset($_GET['id']) ? base64_decode($_GET['id']) : base64_decode($_POST['id']);
	
					$chartic=array();
			
						$apps=new Apis('api_auteurs','Entidad="'.$entidad.'"');
    					$chartic['login']=$_POST['login'];
    					$chartic['tipo']=$_POST['rol'];
						$apps->actualizar($chartic,'id_auteur',$id);
						$msg[] = array('menssage'=>'OK. El Usuarios: '.$id.' fue actualizado correctamente!','status' => '200');
						$var = var2js($msg);	
						echo $var;				
			
			break;
			case 'delete':
					$id = isset($_GET['id']) ? base64_decode($_GET['id']) : base64_decode($_POST['id']);
					sql_delete("api_auteurs","id_auteur=" . intval($id));
					
					$res = sql_select("statut, id_auteur, login, email", "api_auteurs", "id_auteur=" . intval($_POST['id']));
					if ($res){
					$msg[] = array('menssage'=>'OK. El registro '.$id.' fue eliminado correctamente!','status' => '200');
					}	
					
					$var = var2js($msg);	
					echo $var;					
			break;
			
			
		}										
?>
