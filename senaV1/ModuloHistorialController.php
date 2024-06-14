<?php
require_once 'Segurity.php';
class ModuloHistorialController {
    public static function handleRequest() {
        $data = [];
        if (isset($_SERVER['REQUEST_URI'])) {
            $str = explode('&', $_SERVER['REQUEST_URI']);
            $secretKey = base64_decode($_GET['apiToken']);
            $encryptedData = base64_decode($_GET['apikey']);
            $password = obtenerPass($encryptedData,$secretKey);;
          if (count($str) > 3) {
                $opcion = explode('=', $str[0]);
                $data = ['var_login' => $_SERVER['PHP_AUTH_USER'], 'password' => $password ];
                if (count($opcion) > 1) {
                    $menu = explode('=', $opcion[1]);
                    if (count($menu) > 0) {
                        $r['opcion'] = base64_decode($opcion[0]);
                        $variables = array_merge($r, $_GET);
                        echo makeCurlRequest($variables,$data);
                        return;
                    }
                }
            }
        }
        echo json_encode(["error" => "Invalid URL structure for ' Menu'"]);
    }
}
?>
