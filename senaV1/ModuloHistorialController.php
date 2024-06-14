<?php
class ModuloHistorialController {
    public static function handleRequest() {
        if (isset($_SERVER['REQUEST_URI'])) {
            $str = explode('&', $_SERVER['REQUEST_URI']);
            if (count($str) > 3) {
                $opcion = explode('=', $str[0]);
                
                if (count($opcion) > 1) {
                    $menu = explode('=', $opcion[1]);
                    if (count($menu) > 0) {
                        $r['opcion'] = base64_decode($opcion[0]);
                        $variables = array_merge($r, $_GET);
                        echo makeCurlRequest($variables);
                        return;
                    }
                }
            }
        }
        echo json_encode(["error" => "Invalid URL structure for 'Historial' action"]);
    }
}
?>
