<?php
// makeSendRequest.php
/**
 * @About:      API Interface
 * @File:       makeCurlRequest.php
 * @Date:       febrero-2022
 * @Version:    1.0
 * @Developer:  Hosmmer Eduardo
 **/

 function makeSendRequest($variables, $data) {
    // Filtrar la variable 'selectedFile' para asegurarse de que no se incluya en la URL
    unset($variables['selectedFile']);
    unset($variables['fileContent']);
    unset($variables['base64']);

    $queryString = '';
    foreach ($variables as $key => $value) {
        if (!empty($value)) {
            // Convertir el valor a cadena si es un array
            if (is_array($value)) {
                $value = json_encode($value); // Puedes ajustar según el formato requerido
            }
            $queryString .= urlencode($key) . '=' . urlencode($value) . '&';
        }
    }

    // Eliminar el último '&' del queryString si está presente
    $queryString = rtrim($queryString, '&');

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
}

?>

