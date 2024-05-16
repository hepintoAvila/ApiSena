<?php
/**
 *
 * @About:      API Interface
 * @File:       index.php
 * @Date:       $Date:$ febrero-2022
 * @Version:    $Rev:$ 1.0
 * @Developer:  hosmmer Eduardo
 **/
error_reporting(E_ALL);
ini_set('display_errors', 1);
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");
header("Content-Type: text/html; charset=utf-8");
// Si no se han enviado encabezados, enviar uno
 
if (headers_sent()) {
    header('Location: http://localhost/sicesv.1/apis.sena/senaV1/');
    exit;
}
function mb_pathinfo($filepath) {
    preg_match('%^(.*?)[\\\\/]*(([^/\\\\]*?)(\.([^\.\\\\/]+?)|))[\\\\/\.]*$%im',$filepath,$m);
    if($m[1]) $ret['dirname']=$m[1];
    if($m[2]) $ret['basename']=$m[2];
    if($m[5]) $ret['extension']=$m[5];
    if($m[3]) $ret['filename']=$m[3];
    return $ret;
}
function getRequestUser($varibles,$refer = "", $timeout = 10, $header = [])
{
  	
	//print_r($_SERVER);
	$urls = "http://localhost/sicesv.1/apis.sena/ecrire/?exec=apis&bonjour=oui"; 
    $url = "http://localhost/sicesv.1/apis.sena/ecrire/?exec=apis"; 
    //ENVIAR LAS CREDENCIALES DE LA API
 
	if (array_key_exists('HTTP_AUTHORIZATION', $_SERVER)) {
		$ha = base64_decode( substr($_SERVER['HTTP_AUTHORIZATION'],6) );
		list($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW']) = explode(':', $ha);
		 $data = array('var_login' =>$_SERVER['PHP_AUTH_USER'],'password' =>$_SERVER['PHP_AUTH_PW']);
	} else {

		$data = array('var_login' =>$_SERVER['PHP_AUTH_USER'],'password' =>$_SERVER['PHP_AUTH_PW']);
	}
				
   
	$POSTFIELDS = array_merge($varibles, $data); 
    $ch = curl_init();
	
    $ssl = stripos($urls,'http://') === 0 ? true : false;
    $options = [
        CURLOPT_URL => $urls,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => 1,
		CURLOPT_USERPWD=>$data['var_login'].':'.$data['password'],
        CURLOPT_POSTFIELDS => $POSTFIELDS,
        CURLOPT_FOLLOWLOCATION => 1,
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_AUTOREFERER => 1,
        CURLOPT_USERAGENT => 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)',
        CURLOPT_TIMEOUT => 3000,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_0,
        CURLOPT_HTTPHEADER => ['Expect:'],
        CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
        CURLOPT_REFERER => $refer
    ];
     
    if (!empty($header)) {
        $options[CURLOPT_HTTPHEADER] = $header;
    }
    if ($refer) {
        $options[CURLOPT_REFERER] = $refer;
    }
    if ($ssl) {
        //support https
        $options[CURLOPT_SSL_VERIFYHOST] = false;
        $options[CURLOPT_SSL_VERIFYPEER] = false;
    }
    curl_setopt_array($ch,$options);

 //$httpcode = curl_getinfo($ch, 'CURLINFO_HTTP_CODE');
    $returnData = curl_exec($ch);

    if (curl_errno($ch)) {
        //error message
        $returnData = curl_error($ch);
         
    }
    curl_close($ch);
    return $returnData;
    
    
}
function getRequestDatos($varibles,$refer = "", $timeout = 10, $header = [])
{
  	
	//print_r($_SERVER);
	$urls = "http://localhost/sicesv.1/apis.sena/ecrire/?exec=apis&bonjour=oui"; 
    $url = "http://localhost/sicesv.1/apis.sena/ecrire/?exec=apis"; 
    //ENVIAR LAS CREDENCIALES DE LA API
   
	if (array_key_exists('HTTP_AUTHORIZATION', $_SERVER)) {
		//SERVIDOR WEB
		$ha = base64_decode( substr($_SERVER['HTTP_AUTHORIZATION'],6) );
		list($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW']) = explode(':', $ha);
		 $data = array('var_login' =>$_SERVER['PHP_AUTH_USER'],'password' =>$_SERVER['PHP_AUTH_PW']);
        
	} else {
		//SERVIDOR LOCAL
		$data = array('var_login' =>$_SERVER['PHP_AUTH_USER'],'password' =>$_SERVER['PHP_AUTH_PW']);

	}
		
	
	$POSTFIELDS = array_merge($varibles, $data); 
    $ch = curl_init();

    $ssl = stripos($urls,'http://') === 0 ? true : false;
    $options = [
        CURLOPT_URL => $urls,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => 1,
		CURLOPT_USERPWD=>$data['var_login'].':'.$data['password'],
        CURLOPT_POSTFIELDS => $POSTFIELDS,
        CURLOPT_FOLLOWLOCATION => 1,
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_AUTOREFERER => 1,
        CURLOPT_USERAGENT => 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)',
        CURLOPT_TIMEOUT => 3000,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_0,
        CURLOPT_HTTPHEADER => ['Expect:'],
        CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
        CURLOPT_REFERER => $refer
    ];
     
    if (!empty($header)) {
        $options[CURLOPT_HTTPHEADER] = $header;
    }
    if ($refer) {
        $options[CURLOPT_REFERER] = $refer;
    }
    if ($ssl) {
        //support https
        $options[CURLOPT_SSL_VERIFYHOST] = false;
        $options[CURLOPT_SSL_VERIFYPEER] = false;
    }
    curl_setopt_array($ch,$options);

 //$httpcode = curl_getinfo($ch, 'CURLINFO_HTTP_CODE');
    $returnData = curl_exec($ch);

    if (curl_errno($ch)) {
        //error message
        $returnData = curl_error($ch);
         
    }
    curl_close($ch);
    return $returnData;
    
    
}
	$accion = base64_decode($_GET['accion']);
//print_r($_GET);
	switch($accion) {
		
		case "auteur":
	
			$str=explode('&',$_SERVER['HTTP_URL']);
			$username=explode('=',$str[3]);
			$user=explode('=',$username[1]);
			$r['username']=$user[0];
			$varibles = array_merge($r,$_GET);
			$getRes = getRequestUser($varibles );
			echo $getRes;
			break;
			
			case "permisos":
			case "menu":
			case "AdminUsuarios":
			case "AdminRoles":
			case "GestionMenu":
			case "ModuloNotificaciones":
			case "ModuloHistorial":
			case "ModuloSolicitudComite":
            case "ModuloAprendiz":
            case "ModuloActas":
				if (!is_null(json_decode(file_get_contents('php://input'), true))) {
					//pasamos el contenido del archivo a POST
					$r['fileContent']=json_decode(file_get_contents('php://input'), true);
					$varibles = array_merge($r,$_GET);
					$getRes = getRequestDatos($varibles);
					echo $getRes;
				}else{
					
					$getRes = getRequestDatos($_GET);
					echo $getRes;	
					
				}


			break;
	}

?>