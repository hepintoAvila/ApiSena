<?php

/***************************************************************************\
 *  SPIP, Systeme de publication pour l'internet                           *
 *                                                                         *
 *  Copyright (c) 2001-2017                                                *
 *  Arnaud Martin, Antoine Pitrou, Philippe Riviere, Emmanuel Saint-James  *
 *                                                                         *
 *  Ce programme est un logiciel libre distribue sous licence GNU/GPL.     *
 *  Pour plus de details voir le fichier COPYING.txt ou l'aide en ligne.   *
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

$opcion = obtenerParametro('opcion');
$entidad = obtenerParametro('entidad');
$FechaInicial = obtenerParametro('FechaInicial');
$FechaFinal = obtenerParametro('FechaFinal');

switch ($opcion) {
    case 'reportesComite':
        procesarReporteComite($entidad, $FechaInicial, $FechaFinal);
        break;
}

function obtenerParametro($parametro) {
    return isset($_GET[$parametro]) ? base64_decode($_GET[$parametro]) : (isset($_POST[$parametro]) ? base64_decode($_POST[$parametro]) : null);
}

function procesarReporteComite($entidad, $FechaInicial, $FechaFinal) {
    $tbls = 'sena_solicitudcomite';
    $apps = new Apis($tbls);

    $variablesAVerificar = [
        'entidad' => $entidad,
        'FechaInicial' => $FechaInicial,
        'FechaFinal' => $FechaFinal,
    ];

    $mensajeError = $apps->verificarVariables($variablesAVerificar);
    if ($mensajeError !== null) {
        imprimirError($mensajeError);
        return;
    }

    $fechaSolicitudInicial = formatearFecha($FechaInicial);
    $fechaSolicitudFinal = formatearFecha($FechaFinal);

    $query1 = 'entidad="' . $entidad . '" 
               AND fechaSolicitud >= "' . $fechaSolicitudInicial . '" 
               AND fechaSolicitud <= "' . $fechaSolicitudFinal . '" 
               ORDER BY estado';
    $select1 = 'DISTINCT(estado) AS Categoria';
    $row1 = $apps->consultadatos($query1, $select1);

    $items = [];
    $Categoria1 = [];
    if (!is_null($row1)) {
        foreach ($row1 as $value) {
            $Total = sql_countsel('sena_solicitudcomite', 'entidad="' . $entidad . '" 
                                  AND fechaSolicitud >= "' . $fechaSolicitudInicial . '" 
                                  AND fechaSolicitud <= "' . $fechaSolicitudFinal . '" 
                                  AND estado="' . $value['Categoria'] . '" ORDER BY fechaSolicitud');
            if ($Total > 0) {
                $Categoria1[] = $value['Categoria'];
                $items[] = [
                    "Categoria" => $value['Categoria'],
                    "Periodo" => $fechaSolicitudInicial . '-' . $fechaSolicitudFinal,
                    "Total" => $Total
                ];
                $items[] = [
                    "Categoria" => strtoupper($value['Categoria']),
                    "Periodo" => 'TOTALES',
                    "Total" => array_sum(array_column($items, 'Total'))
                ];
            } else {
                $items[] = [
                    "Categoria" => 'SIN REGISTROS',
                    "Periodo" => $fechaSolicitudInicial . '-' . $fechaSolicitudFinal,
                    "Total" => 0
                ];
            }
        }
    } else {
        $items[] = [
            "Categoria" => 'SIN REGISTROS',
            "Periodo" => $fechaSolicitudInicial . '-' . $fechaSolicitudFinal,
            "Total" => 0
        ];
    }

    $lineChartData = [];
    foreach ($Categoria1 as $value2) {
        $lineChartData[] = [
            "labels" => $value2,
            "datasets" => [
                [
                    "label" => $value2,
                    "backgroundColor" => ['#0acf97', '#39afd1', '#fa5c7c', '#ffbc00', '#ebeff2'],
                    "borderColor" => '#ff679b',
                    "hoverBackgroundColor" => '#ff679b',
                    "hoverBorderColor" => '#ff679b',
                    "data" => sql_countsel('sena_solicitudcomite', 'entidad="' . $entidad . '" 
                                           AND fechaSolicitud >= "' . $fechaSolicitudInicial . '" 
                                           AND fechaSolicitud <= "' . $fechaSolicitudFinal . '" 
                                           AND estado="' . $value2 . '" ORDER BY fechaSolicitud'),
                    "barPercentage" => '0.7',
                    "categoryPercentage" => '0.5',
                ],
            ],
        ];
    }

    $graficas = ["lineChartData" => $lineChartData];

    if (!empty($items)) {
        $data = ["items" => $items];
        $var = var2js(array_merge($data, $graficas));
        echo $var;
    } else {
        $records['status'] = ['status' => '404'];
        $var = var2js($records);    
        echo $var;                                
    }
}

function formatearFecha($fecha) {
    $date = new DateTime($fecha);
    return $date->format('Y-m-d');
}

function imprimirError($mensajeError) {
    $arrayMensage[] = [
        'id' => 1,
        'message' => '::ERROR-001:: ' . $mensajeError,
        'status' => '404'
    ];
    echo json_encode($arrayMensage);
}
?>
