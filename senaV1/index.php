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


function getBaseUrl() {
    
$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
$host = $_SERVER['HTTP_HOST'];
$script = $_SERVER['SCRIPT_NAME'];
$path = dirname($script);
  return $protocol . $host . $path;
}
$baseUrl = getBaseUrl() . '/senaV1/';
// Check if headers have been sent
if (headers_sent()) {
    header('Location: ' . $baseUrl);
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
$router->addRoute('POST', 'ModuloSolicitudComite', ['ModuloEnviarComiteController', 'handleRequest']);
$router->addRoute('POST', 'Documentos', ['DocumentosController', 'handleRequest']);
$router->addRoute('GET', 'ModuloAuditoria', ['ModuloAuditoriaController', 'handleRequest']);
$router->addRoute('GET', 'ModuloReportes', ['ModuloReporteController', 'handleRequest']);

// Add debugging here
$accion = isset($_GET['accion']) ? base64_decode($_GET['accion']) : '';
error_log("Accion decodificada: $accion");

// Handle the request
$router->handleRequest();

?>
