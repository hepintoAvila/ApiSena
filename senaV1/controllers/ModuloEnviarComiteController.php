<?php
require_once 'Segurity.php';
require_once 'makeSendRequest.php';
require_once 'sendDocumento.php';
class ModuloEnviarComiteController {
    public static function handleRequest() {
        $data = [];
        if (isset($_SERVER['REQUEST_URI'])) {
            $str = explode('&', $_SERVER['REQUEST_URI']);
            $headers = getallheaders();
            $headersPosman = isset($headers['header']) ? $headers['header'] : null;
            if ($headersPosman) {
                $encryptedData = isset($headers['X-SICES-API-AppKey']) ? $headers['X-SICES-API-AppKey'] : '';
                $secretKey = isset($headers['X-SICES-API-AppToken']) ? $headers['X-SICES-API-AppToken'] : '';
                $var_login = isset($headers['PHP_AUTH_USER']) ? $headers['PHP_AUTH_USER'] : '';
                $encodedArray = [];
                foreach ($_GET as $key => $value) {
                   $encodedArray[''.$key.''] = base64_encode($value);
                }
                $varGet = $encodedArray;
            } else {
                $encryptedData = isset($headers['X-SICES-API-AppKey']) ? base64_decode($headers['X-SICES-API-AppKey']) : '';
                $secretKey = isset($headers['X-SICES-API-AppToken']) ? base64_decode($headers['X-SICES-API-AppToken']) : '';
                $var_login = isset($_SERVER['PHP_AUTH_USER']) ? $_SERVER['PHP_AUTH_USER'] : '';
                $varGet = $_GET;
            }
            
            if (!empty($encryptedData) && !empty($secretKey)) {
                $password = obtenerPass($encryptedData, $secretKey);
            } else {
                // Manejo de error en caso de que encryptedData o secretKey no estén presentes o sean inválidos
                echo json_encode(['error' => 'Missing or invalid headers']);
                exit;
            }
            
          if (count($str) > 3) {
                $opcion = explode('=', $str[0]);
                $data = ['var_login' => $var_login, 'password' => $password ];
                if (count($opcion) > 1) {
                    $menu = explode('=', $opcion[1]);
                    if (count($menu) > 0) {
                        $url = '../ecrire/exec/model/sena/ModuloIncidentes/pdf/';
                        $dateTime = new DateTime('now', new DateTimeZone('UTC'));
                        $formattedDateTime = $dateTime->format('Ymd\THis\Z');
                        $vars = sendDocumento($url, $varGet,$opcion, $formattedDateTime);
                        echo makeSendRequest($vars, $data);
                        return;
                    }
                }
            }
        }
        echo json_encode(["error" => "Invalid URL structure for ' Menu'"]);
    }
}
?>
