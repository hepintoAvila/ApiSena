<?php

/***************************************************************************\
 *  SPIP, Systeme de publication pour l'internet                           *
 *                                                                         *
 *  Copyright (c) 2001-2017                                                *
 *  Arnaud Martin, Antoine Pitrou, Philippe Riviere, Emmanuel Saint-James  *
 *                                                                         *
 *  Ce programme est un logiciel libre distribue sous licence GNU/GPL.     *
 *  Para más detalles ver el fichero COPYING.txt o la ayuda en línea.     *
\***************************************************************************/

if (!defined('_ECRIRE_INC_VERSION')) {
    return;
}

include_spip('base/connect_sql');
include_spip('inc/filtres_ecrire');
include_spip('inc/filtres');
include_spip('inc/utils');
include_spip('inc/json');
include_spip('inc/autoriser');
include_spip('exec/model/sena/claseapi');

// Obtener parámetros y validar que no estén vacíos
$obj = !empty($_GET['obj']) ? $_GET['obj'] : (!empty($_POST['obj']) ? $_POST['obj'] : null);
$entidad = !empty($_GET['entidad']) ? base64_decode($_GET['entidad']) : (!empty($_POST['entidad']) ? base64_decode($_POST['entidad']) : null);
$idUsuario = !empty($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : (!empty($_POST['idUsuario']) ? base64_decode($_POST['idUsuario']) : null);

if (is_null($obj) || is_null($entidad) || is_null($idUsuario)) {
    echo json_encode(['error' => 'Parámetros faltantes o inválidos']);
    exit;
}

switch ($obj) {
    case 'querySolicitudByUser':
        $row = array();
        $tbls = 'api_auteurs';
        $apps = new Apis($tbls);

        $select = 'tipo';
        $roles = $apps->consultadatos('id_auteur="' . $idUsuario . '"', $select);
        $tipo = isset($roles[0]['tipo']) ? $roles[0]['tipo'] : null;

        $tblsol = 'sena_solicitudcomite';
        $appsol = new Apis($tblsol);

        if ($tipo == 'Aprendiz') {
            $row = $appsol->consultadatos('entidad="' . $entidad . '" AND idAprendiz="' . $idUsuario . '" ORDER BY idSolicitud ASC', '*');

            $tbla = 'sena_aprendiz';
            $appa = new Apis($tbla);
            $datosPer = $appa->consultadatos('id_auteur="' . $idUsuario . '"', '*');
            $nombres = isset($datosPer[0]['nombres']) ? $datosPer[0]['nombres'] . ' ' . $datosPer[0]['apellidos'] : '';
            $correo = isset($datosPer[0]['correo']) ? $datosPer[0]['correo'] : '';

        } else {
            $row = $appsol->consultadatos('entidad="' . $entidad . '" AND idInstructor="' . $idUsuario . '" ORDER BY idSolicitud ASC', '*');

            $aa = new Apis('api_auteurs');
            $datosPerInst = $aa->consultadatos('id_auteur="' . $idUsuario . '"', $select);
            $nombres = isset($datosPerInst[0]['nom']) ? $datosPerInst[0]['nom'] : '';
            $correo = isset($datosPerInst[0]['email']) ? $datosPerInst[0]['email'] : '';
        }

        $Emails = [];
        if (is_array($row) && !empty($row)) {
            foreach ($row as $value) {
                if ($tipo == 'Aprendiz') {
                    $rdatosInstructor = $apps->consultadatos('id_auteur="' . $value['idInstructor'] . '"', 'nom, email');
                    $from_name = isset($rdatosInstructor[0]['nom']) ? $rdatosInstructor[0]['nom'] : '';
                    $from_email = isset($rdatosInstructor[0]['email']) ? $rdatosInstructor[0]['email'] : '';
                } else {
                    $appa = new Apis('sena_aprendiz');
                    $datosPer = $appa->consultadatos('idAprendiz="' . $value['idAprendiz'] . '"', 'nombres, apellidos, correo');
                    $from_name = isset($datosPer[0]['nombres']) ? $datosPer[0]['nombres'] . ' ' . $datosPer[0]['apellidos'] : '';
                    $from_email = isset($datosPer[0]['correo']) ? $datosPer[0]['correo'] : '';
                }
                $Emails[] = [
                    'id' => $value['idSolicitud'],
                    'from_name' => $from_name,
                    'from_email' => $from_email,
                    'subject' => $value['hechos'],
                    'number_of_reply' => 2, // Asegúrate de ajustar esto según tu lógica
                    'is_important' => false, // Ajusta esto según tu lógica
                    'is_read' => true, // Ajusta esto según tu lógica
                    'time' => '8:18 PM', // Ajusta esto según tu lógica
                    'date' => $value['fechaIncidente'],
                ];
            }
        } else {
            $Emails[] = [
                'id' => 1,
                'from_name' => 'Cointon Capeloff',
                'from_email' => 'ccapeloff0@yandex.ru',
                'subject' => 'Laceration of musc/fasc/tend abdomen, lower back and pelvis - @LucasKriebel - Very cool :) Nicklas, You have a new direct message.',
                'number_of_reply' => 2,
                'is_important' => false,
                'is_read' => true,
                'time' => '8:18 PM',
                'date' => '07/21/2019',
            ];
        }

        $data = $Emails;
        echo json_encode($data);
        break;

    default:
        echo json_encode(['error' => 'Operación no válida']);
        break;
}
?>
