<?php
class PermissionsController {
    public static function handleRequest() {
        $input = json_decode(file_get_contents('php://input'), true);
        if (!is_null($input)) {
            $r['fileContent'] = $input;
            $variables = array_merge($r, $_GET);
        } else {
            $variables = $_GET;
        }
        echo makeCurlRequest($variables);
    }
}
?>
