<?php
// makeSendRequest.php
/**
 * @About:      API Interface
 * @File:       makeCurlRequest.php
 * @Date:       febrero-2022
 * @Version:    1.0
 * @Developer:  Hosmmer Eduardo
 **/

function makeSendRequest($variables ,$data) {
    $queryString = '';
    foreach ($variables as $key => $value) {
        if (!empty($value)) {
            $queryString .= urlencode($key) . '=' . $value . '&';
        }
    }
    $url = 'http://localhost/sicesv.1/apis.sena/ecrire/?exec=apis&bonjour=oui&'.$queryString;
    $options = [
        'http' => [
            'method' => 'POST', // Método de solicitud POST
            'header' => [
                'Content-Type: application/json',
                'Authorization: Basic ' . base64_encode($data['var_login'] . ':' . $data['password']) // Ejemplo de autenticación básica con apiToken y apikey
            ],
            'content' => json_encode($variables) // Datos a enviar en formato JSON
        ]
    ];
    $context = stream_context_create($options);
    $result = file_get_contents($url, false, $context);
    if ($result === false) {
        echo json_encode(['error' => 'Error al realizar la solicitud']);
    } else {
        echo $result;
    }
    return;
}
