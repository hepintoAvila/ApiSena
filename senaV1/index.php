<?php
// index.php
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
header("Content-Type: application/json; charset=utf-8");

// Manejar las solicitudes OPTIONS
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("HTTP/1.1 200 OK");
    exit;
}

// Autoload classes
spl_autoload_register(function ($class_name) {
    if (file_exists('controllers/' . $class_name . '.php')) {
        include 'controllers/' . $class_name . '.php';
    } elseif (file_exists($class_name . '.php')) {
        include $class_name . '.php';
    }
});

// Check if headers have been sent
if (headers_sent()) {
    header('Location: http://localhost/sicesv.1/apis.sena/senaV1/');
    exit;
}

// Include the router
require_once 'Router.php';

// Initialize the router
$router = new Router();

// Define routes
$router->addRoute('GET', 'auteur', ['AuthorController', 'handleRequest']);
$router->addRoute('GET', 'permisos', ['PermissionsController', 'handleRequest']);
$router->addRoute('GET', 'menu', ['MenuController', 'handleRequest']);
$router->addRoute('GET', 'AdminUsuarios', ['AdminUsuariosController', 'handleRequest']);
$router->addRoute('GET', 'AdminRoles', ['AdminRolesController', 'handleRequest']);
$router->addRoute('GET', 'GestionMenu', ['GestionMenuController', 'handleRequest']);
$router->addRoute('GET', 'ModuloNotificaciones', ['ModuloNotificacionesController', 'handleRequest']);
$router->addRoute('GET', 'ModuloHistorial', ['ModuloHistorialController', 'handleRequest']);
$router->addRoute('GET', 'ModuloSolicitudComite', ['ModuloSolicitudComiteController', 'handleRequest']);
$router->addRoute('GET', 'ModuloAprendiz', ['ModuloAprendizController', 'handleRequest']);
$router->addRoute('GET', 'ModuloActas', ['ModuloActasController', 'handleRequest']);

// Add debugging here
$accion = isset($_GET['accion']) ? base64_decode($_GET['accion']) : '';
error_log("Accion decodificada: $accion");

// Handle the request
$router->handleRequest();
function makeCurlRequest($variables,  $data, $refer = "", $timeout = 10, $header = []) {
    $url = "http://localhost/sicesv.1/apis.sena/ecrire/?exec=apis&bonjour=oui";
   

 $POSTFIELDS = array_merge($variables, $data);

    $ch = curl_init();

    $ssl = stripos($url, 'http://') === 0;
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
    // Crea un array con las variables que deseas verificar
    curl_setopt_array($ch, $options);

    $returnData = curl_exec($ch);

    if (curl_errno($ch)) {
        $returnData = curl_error($ch);
    }

    curl_close($ch);
    return $returnData;
}
?>
