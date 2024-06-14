<?php
class AdminRolesController {
    public static function handleRequest() {
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
                        return;
                    }
                }
            }
        }
        echo json_encode(["error" => "Invalid URL structure for 'Roles' action"]);
    }
}
?>
