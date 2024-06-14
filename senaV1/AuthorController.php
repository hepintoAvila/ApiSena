<?php
require_once 'Segurity.php';
class AuthorController {
    public static function handleRequest() {
        if (isset($_SERVER['HTTP_URL'])) {
            $data = [];
            if (isset($_SERVER['HTTP_AUTHORIZATION'])) {
                $ha = base64_decode(substr($_SERVER['HTTP_AUTHORIZATION'], 6));
                if (!empty($ha) && strpos($ha, ':') !== false) {
                    list($php_auth_user, $php_auth_pw) = explode(':', $ha);
                    $data = ['var_login' => $php_auth_user, 'password' => $php_auth_pw];
                } else {
                    $data = ['var_login' => $_SERVER['PHP_AUTH_USER'], 'password' => $_SERVER['PHP_AUTH_PW']];
                    //exit;
                }
            } else {
                $php_auth_user = $_SERVER['PHP_AUTH_USER'] ?? '';
                $php_auth_pw = $_SERVER['PHP_AUTH_PW'] ?? '';
                $data = ['var_login' => $php_auth_user, 'password' => $php_auth_pw];
            }
            $str = explode('&', $_SERVER['HTTP_URL']);
            if (count($str) > 3) {
                $username = explode('=', $str[3]);
                if (count($username) > 1) {
                    $user = explode('=', $username[1]);
                    if (count($user) > 0) {
                        $r['username'] = $user[0];
                        $variables = array_merge($r, $_GET);
                        echo makeCurlRequest($variables, $data);
                        return;
                    }
                }
            }
        }
        echo json_encode(["error" => "Invalid URL structure for 'auteur' action"]);
    }
}
?>
