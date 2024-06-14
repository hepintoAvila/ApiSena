<?php
/**
 * Make a cURL request with given variables and authentication
 *
 * @param array $variables
 * @param string $refer
 * @param int $timeout
 * @param array $header
 * @return mixed
 */
function decryptData($encryptedData, $secretKey) {
    $method = 'AES-256-CBC';
    $ivLength = openssl_cipher_iv_length($method);

    // Verifica si el delimitador '::' está presente en $encryptedData
    if (strpos($encryptedData, '::') === false) {
        throw new Exception('Invalid encrypted data format.');
    }

    // Divide el $encryptedData usando el delimitador '::'
    list($encryptedData, $iv) = explode('::', $encryptedData, 2);

    // Asegúrate de que tanto $encryptedData como $iv estén definidos
    if (!isset($encryptedData) || !isset($iv)) {
        throw new Exception('Invalid encrypted data format.');
    }

    // Decodifica el IV desde base64
    $iv = base64_decode($iv);

    // Verifica si el IV tiene la longitud correcta
    if (strlen($iv) !== $ivLength) {
        throw new Exception('Invalid IV length.');
    }

    // Desencripta los datos
    $decryptedData = openssl_decrypt($encryptedData, $method, $secretKey, 0, $iv);

    // Verifica si la desencriptación fue exitosa
    if ($decryptedData === false) {
        throw new Exception('Decryption failed.');
    }

    return $decryptedData;
}

function obtenerPass($encryptedData,$secretKey){
    try {
        $decryptedData = decryptData($encryptedData, $secretKey);
            return $decryptedData;
        } catch (Exception $e) {
            echo 'Error: ' . $e->getMessage();
        }
     
    }
    ?>