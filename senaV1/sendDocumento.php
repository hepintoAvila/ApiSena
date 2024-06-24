<?php
// makeSendRequest.php
/**
 * @About:      API Interface
 * @File:       makeCurlRequest.php
 * @Date:       febrero-2022
 * @Version:    1.0
 * @Developer:  Hosmmer Eduardo
 **/

function sendDocumento($url,$varGet,$opcion,$fechaHora) {
  
                        $input = json_decode(file_get_contents('php://input'), true);
                        $newLocation = '';
                        if (!is_null($input)) {
                            $r['fileContent'] = $input;
                            $variables = array_merge($r, $_GET);
                        } else {
                            $variables = $_GET;
                        }
                    if (isset($variables['fileContent']['selectedFile'])) {
                        $selectedFile = $variables['fileContent']['selectedFile'];
                        // Decodificar la información del archivo
                        $fileName =base64_decode($_GET['name']);
                        $fileBase64 = $selectedFile['base64'];
                        $idAprendiz = base64_decode($_GET['idAprendiz']);
                        $codigoFicha = base64_decode($_GET['codigoFicha']);
                        $idUsuario = base64_decode($_GET['idUsuario']);
                        $maxId = base64_decode($_GET['maxId']);
                        $fileContent = base64_decode($fileBase64);
                        // Guardar el archivo en el servidor
                       $filePath = ''.$url.''.$fileName.'';
                        file_put_contents($filePath, $fileContent);
                        if (@file_exists($filePath)){
                             
                             $newLocation = ''.$url.''.$codigoFicha.'.pdf';
                             rename($filePath, $newLocation);
                             @unlink($filePath);
                             $moved =1;
                        }
                        $r['opcion'] = base64_decode($opcion[0]);
                        $r['moved'] = $moved;
                        $r['filePath'] = $newLocation;
                        $r = $_GET;
                        } 
                        $vars= array_merge($r, $varGet);
                        return  $vars;     
        }       
?>