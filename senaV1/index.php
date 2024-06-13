<?php
/**
 * @About:      API Interface
 * @File:       index.php
 * @Date:       febrero-2022
 * @Version:    1.0
 * @Developer:  Hosmmer Eduardo
 **/

error_reporting(E_ALL);
ini_set('display_errors', 1);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");
header("Content-Type: text/html; charset=utf-8");

// Verificar si se han enviado encabezados
if (headers_sent()) {
    header('Location: http://localhost/sicesv.1/apis.sena/senaV1/');
    exit;
}

/**
 * Parse file path into components
 *
 * @param string $filepath
 * @return array
 */
function mb_pathinfo($filepath) {
    preg_match('%^(.*?)[\\\\/]*(([^/\\\\]*?)(\.([^\.\\\\/]+?)|))[\\\\/\.]*$%im', $filepath, $m);
    $ret = [];
    if (isset($m[1])) $ret['dirname'] = $m[1];
    if (isset($m[2])) $ret['basename'] = $m[2];
    if (isset($m[5])) $ret['extension'] = $m[5];
    if (isset($m[3])) $ret['filename'] = $m[3];
    return $ret;
}

/**
 * Make a cURL request with given variables and authentication
 *
 * @param array $variables
 * @param string $refer
 * @param int $timeout
 * @param array $header
 * @return mixed
 */
function makeCurlRequest($variables, $refer = "", $timeout = 10, $header = []) {
    $url = "http://localhost/sicesv.1/apis.sena/ecrire/?exec=apis&bonjour=oui";
    $data = [];

    if (isset($_SERVER['HTTP_AUTHORIZATION'])) {
        $ha = base64_decode(substr($_SERVER['HTTP_AUTHORIZATION'], 6));
        if (!empty($ha) && strpos($ha, ':') !== false) {
            list($php_auth_user, $php_auth_pw) = explode(':', $ha);
            $data = ['var_login' => $php_auth_user, 'password' => $php_auth_pw];
        } else {
            $data = ['var_login' => '', 'password' => ''];
            exit;
        }
    } else {
        $php_auth_user = $_SERVER['PHP_AUTH_USER'] ?? '';
        $php_auth_pw = $_SERVER['PHP_AUTH_PW'] ?? '';
        $data = ['var_login' => $php_auth_user, 'password' => $php_auth_pw];
    }

    $POSTFIELDS = array_merge($variables, $data);
    $ch = curl_init();

    $ssl = stripos($url, 'https://') === 0;
    $options = [
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => 1,
        CURLOPT_USERPWD => $data['var_login'] . ':' . $data['password'],
        CURLOPT_POSTFIELDS => $POSTFIELDS,
        CURLOPT_FOLLOWLOCATION => 1,
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_AUTOREFERER => 1,
        CURLOPT_USERAGENT => 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)',
        CURLOPT_TIMEOUT => $timeout,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_0,
        CURLOPT_HTTPHEADER => array_merge(['Expect:'], $header),
        CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
        CURLOPT_REFERER => $refer
    ];

    if ($ssl) {
        $options[CURLOPT_SSL_VERIFYHOST] = false;
        $options[CURLOPT_SSL_VERIFYPEER] = false;
    }

    curl_setopt_array($ch, $options);

    $returnData = curl_exec($ch);

    if (curl_errno($ch)) {
        $returnData = curl_error($ch);
    }

    curl_close($ch);
    return $returnData;
}

/**
 * Handle the API request based on the action
 */
function handleRequest() {
    $accion = isset($_GET['accion']) ? base64_decode($_GET['accion']) : '';

    switch ($accion) {
        case "auteur":
            if (isset($_SERVER['HTTP_URL'])) {
                $str = explode('&', $_SERVER['HTTP_URL']);
                if (count($str) > 3) {
                    $username = explode('=', $str[3]);
                    if (count($username) > 1) {
                        $user = explode('=', $username[1]);
                        if (count($user) > 0) {
                            $r['username'] = $user[0];
                            $variables = array_merge($r, $_GET);
                            echo makeCurlRequest($variables);
                            break;
                        }
                    }
                }
            }
            echo "Invalid URL structure for 'auteur' action";
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
            $input = json_decode(file_get_contents('php://input'), true);
            if (!is_null($input)) {
                $r['fileContent'] = $input;
                $variables = array_merge($r, $_GET);
            } else {
                $variables = $_GET;
            }
            echo makeCurlRequest($variables);
            break;

        default:
            echo "Acción no reconocida";
            break;
    }
}

// Ejecutar la solicitud
handleRequest();

?>