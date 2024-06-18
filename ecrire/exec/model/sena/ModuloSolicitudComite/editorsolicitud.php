<?php

/***************************************************************************\
 *  SPIP, Sistema de publicación para internet                             *
 *                                                                         *
 *  Copyright (c) 2001-2017                                                *
 *  Arnaud Martin, Antoine Pitrou, Philippe Riviere, Emmanuel Saint-James  *
 *                                                                         *
 *  Este programa es software libre distribuido bajo licencia GNU/GPL.     *
 *  Para más detalles ver el archivo COPYING.txt o la ayuda en línea.      *
\***************************************************************************/

header('Content-Type: text/html; charset=utf-8');

if (!defined('_ECRIRE_INC_VERSION')) {
    return;
}

// Inclusiones de archivos
include_spip('inc/autoriser');
include_spip('base/connect_sql');
include_spip('inc/filtres_ecrire');
include_spip('inc/filtres');
include_spip('inc/texte_mini');
include_spip('inc/utils');
include_spip('inc/json');
include_spip('exec/model/sena/claseapi');
include_spip('exec/model/sena/email');
include_spip('inc/charsets');
include_spip('inc/actions');
include_spip('inc/editer');
include_spip('inc/notifications');

// Decodificación de variables
$tipo = isset($_GET['tipo']) ? base64_decode($_GET['tipo']) : (isset($_POST['tipo']) ? base64_decode($_POST['tipo']) : null);
$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : (isset($_POST['entidad']) ? base64_decode($_POST['entidad']) : null);

// Verificación de las variables requeridas
if (is_null($tipo) || is_null($entidad)) {
    echo json_encode(['error' => 'Faltan parámetros requeridos']);
    exit;
}

// Funciones auxiliares
function obtenerVariable($nombre) {
    return isset($_GET[$nombre]) ? base64_decode($_GET[$nombre]) : (isset($_POST[$nombre]) ? base64_decode($_POST[$nombre]) : null);
}

function guardarPDF($codigoFicha) {
    $filePathArc = '../ecrire/exec/model/sena/ModuloIncidentes/pdf/0000.pdf';
    $filePath = '../ecrire/exec/model/sena/ModuloIncidentes/pdf/';
    if (@file_exists($filePathArc)){
        $newLocation = ''.$filePath.''.$codigoFicha.'.pdf';
        rename($filePathArc, $newLocation);
        @unlink($filePathArc);
    }   
    
}

// Switch principal
switch ($tipo) {
    case "EnviarSolicitud":
        $idAprendiz = obtenerVariable('idAprendiz');
        $tipoComite = obtenerVariable('tipoComite');
        $tipoAtencion = obtenerVariable('tipoAtencion');
        $nombrePrograma = obtenerVariable('nombrePrograma');
        $hechos = obtenerVariable('descripcion');
        $idUsuario = obtenerVariable('idUsuario');
        $fechaIncidente = obtenerVariable('fechaIncidente');
        $apps = new Apis('sena_solicitudcomite');
        $fechaIncidente = date_ical($fechaIncidente);

        // Variables a verificar
        $variablesAVerificar = [
            'idAprendiz' => $idAprendiz,
            'tipoComite' => $tipoComite,
            'tipoAtencion' => $tipoAtencion,
            'fechaIncidente' => $fechaIncidente,
            'descripcion' => $hechos,
            'nombrePrograma' => $nombrePrograma,
            'idUsuario' => $idUsuario,
            'entidad' => $entidad,
            'hechos' => $hechos,
        ];

        $mensajeError = $apps->verificarVariables($variablesAVerificar);

        if ($mensajeError !== null) {
            $mensajeErrors = $mensajeError == '' ? 'Error del Token' : $mensajeError;
            $arrayMensage[] = ['id' => 1, 'message' => '::ERROR-001:: ' . $mensajeErrors, 'status' => '404'];
        } else {
            // Guardar solicitud
            $chartic = [
                'idInstructor' => $idUsuario,
                'idAprendiz' => $idAprendiz,
                'tipoSolicitud' => $tipoComite,
                'tipoAtencion' => $tipoAtencion,
                'codigoFicha' => '',
                'fechaIncidente' => $fechaIncidente,
                'hechos' => $hechos,
                'nombrePrograma' => $nombrePrograma,
                'estado' => 'SIN AGENDAR',
                'entidad' => $entidad,
                'statut' => '1'
            ];

            $chartic = pipeline('pre_insertion', ['args' => ['table' => 'sena_solicitudcomite'], 'data' => $chartic]);
            $idSolicitud = @sql_insertq("sena_solicitudcomite", $chartic);
            pipeline('post_insertion', ['args' => ['table' => 'sena_solicitudcomite', 'id_objet' => $idSolicitud], 'data' => $chartic]);

            // Crear el código
            $codigoFicha = ($idSolicitud < 10) ? 'SC00-' . $fechaIncidente . '-' . $idUsuario . '-' . $idSolicitud : 'SC-' . $fechaIncidente . '-' . $idUsuario . '-' . $idSolicitud;

            // Actualizar el código
            if ($idSolicitud) {
                sql_updateq('sena_solicitudcomite', ['codigoFicha' => $codigoFicha], "idSolicitud=" . intval($idSolicitud));
            }
            
            
            guardarPDF($codigoFicha);  
            // Enviar correo
            $descripcion = obtenerVariable('descripcion');
            $corps = $apps->headersEmail($idAprendiz, $idUsuario, $descripcion, $tipoComite);
            $corps['pieces_jointes'] = ['holmespinto.avila@gmail.com', 'hosmmer.eduardo@gmail.com'];
            $destinatario = $corps['destinatario'];
            $asunto = $corps['asunto'];
            $headers = $corps['headers'];
            $from = $corps['from'];
            spip_log("mail $destinatario\n$asunto\n$headers", 'mails');

            // Obtener datos para la respuesta
            $sql = sql_select("idSolicitud, idAprendiz, idInstructor, tipoSolicitud, hechos, fechaIncidente, tipoAtencion, maj, nombrePrograma", 'sena_solicitudcomite', 'entidad="' . $entidad . '" AND codigoFicha="' . $codigoFicha . '"');
            $row = sql_fetch($sql);
            $idSolicitud = $row['idSolicitud'];
            $idAprendiz = $row['idAprendiz'];
            $idInstructor = $row['idInstructor'];
            $nombrePrograma = $row['nombrePrograma'];
            $tipoComite = $row['tipoSolicitud'];
            $fechaIncidente = $row['maj'];
            $tipoAtencion = $row['tipoAtencion'];
            $descripcion = !empty($row['hechos']) ? $row['hechos'] : '';

            // Obtener datos del aprendiz
            $sql2 = sql_select("nombres, apellidos, identificacion, telefono, correo, direccion", 'sena_aprendiz', 'idAprendiz="' . $idAprendiz . '"');
            $row2 = sql_fetch($sql2);
            $nombresApellidosAprendis = $row2['nombres'] . ' ' . $row2['apellidos'];
            $identificacion2 = $row2['identificacion'];
            $direccion2 = $row2['direccion'];
            $telefono2 = $row2['telefono'];
            $correo2 = $row2['correo'];

            // Obtener datos del instructor
            $sql1 = sql_select("nombres, apellidos, identificacion, telefono, correo", 'sena_instructor', 'idInstructor="' . $idInstructor . '"');
            $row1 = sql_fetch($sql1);
            $nombresApellidosInstructor = $row1['nombres'] . ' ' . $row1['apellidos'];
            $identificacion1 = $row1['identificacion'];
            $telefono1 = $row1['telefono'];
            $correo1 = $row1['correo'];

            // Obtener sanciones anteriores
            $sql3 = sql_select("*", 'sena_sancionesanteriores', 'idAprendiz="' . $idAprendiz . '"');
            $row3 = sql_fetch($sql3);
            $Aprendices = [
                'disciplinaria' => !empty($row3['disciplinaria']) ? $row3['disciplinaria'] : '0',
                'academica' => !empty($row3['academica']) ? $row3['academica'] : '0',
                'inasistencias' => !empty($row3['inasistencias']) ? $row3['inasistencias'] : '0',
                'verbal' => !empty($row3['verbal']) ? $row3['verbal'] : '0',
                'escrito' => !empty($row3['escrito']) ? $row3['escrito'] : '0',
            ];

            // Crear la solicitud en PDF
            
            require('../ecrire/exec/model/sena/ModuloSolicitudComite/fpdf.php');
            $pdf = new PDF();
            $pdf->AliasNbPages();
            $pdf->AddPage('P', 'Legal');
            $pdf->sanciones = $Aprendices;
            $pdf->calificacion = $tipoAtencion;
            $pdf->descripcion = $descripcion;
            $pdf->tipoComiteAcademico = ($tipoComite === 'ACADEMICO' || $tipoComite === 'ACADEMICO Y DISCIPLINARIO') ? 'X' : '';
            $pdf->tipoComiteDisciplinario = ($tipoComite === 'DISCIPLINARIO' || $tipoComite === 'ACADEMICO Y DISCIPLINARIO') ? 'X' : '';
            $pdf->fechaIncidente = $fechaIncidente;
            $pdf->nombrePrograma = $nombrePrograma;
            $pdf->Aprendiz = [
                'idAprendiz' => $idAprendiz,
                'nombres' => $nombresApellidosAprendis,
                'identificacion' => $identificacion2,
                'telefono' => $telefono2,
                'correo' => $correo2,
                'direccion' => $direccion2,
                'jornada' => 'TARDE',
                'ficha' => '2619701'
            ];
            $pdf->Instructor = [
                'nombresInst' => $nombresApellidosInstructor,
                'identificacionInst' => $identificacion1,
                'telefonoInst' => $telefono1,
                'correoInst' => $correo1
            ];
            $pdf->Contenido();
            $pdf->Output('F', $codigoFicha . '.pdf', true);

            $pdfPath = '../ecrire/' . $codigoFicha . '.pdf';
            if (@file_exists($pdfPath)) {
                $newLocation = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/' . $codigoFicha . '.pdf';
                $moved = rename($pdfPath, $newLocation);
                if ($moved) {
                    spip_unlink($pdfPath);
                }
            }

            $arrayMensage[] = ['id' => 1, 'message' => '::OK:: Registro guardado correctamente!', 'status' => '202'];
        }
        echo var2js($arrayMensage);
        break;

    case "updateSolicitud":
		$idSolicitud = obtenerVariable('idSolicitud');
		$opcionUpdate = obtenerVariable('opcionUpdate');
		$e = obtenerVariable('e');
        $apps = new Apis('sena_solicitudcomite');
        $variablesAVerificar = [
            'idSolicitud' => $idSolicitud,
            'opcionUpdate' => $opcionUpdate,
            'e' => $e,
            'entidad' => $entidad
        ];
        $mensajeError = $apps->verificarVariables($variablesAVerificar);

		
        if ($mensajeError !== null) {
            $mensajeErrors = $mensajeError == '' ? 'Error del Token' : $mensajeError;
            $arrayMensage[] = ['id' => 1, 'message' => '::ERROR-001:: ' . $mensajeErrors, 'status' => '404'];
        } else {
			switch ($opcionUpdate) {
				case "tipoSolicitud":	
					$chartic['e'] ="".$e."";
					break;
				case "tipoAtencion":	
					$chartic['tipoAtencion'] ="".$e."";
					break;
				case "fechaIncidente":	
						$chartic['fechaIncidente'] ="".date_ical($e)."";
					break;				
				
				}		
		$chartic = pipeline('pre_insertion',
			array(
				'args' => array(
				'table' => 'sena_solicitudcomite',
			),
			'data' => $chartic
			)
		);							
		//sql_updateq('sena_solicitudcomite',$chartic,"idSolicitud=" . intval($idSolicitud) . "");
		pipeline('post_insertion',
		array(
			'args' => array(
			'table' =>'sena_solicitudcomite',
			'id_objet' => $idSolicitud
			),
			'data' => $chartic
			)
		);
		}
        echo var2js($arrayMensage);
        break;

    case "add_documentos":
        $apps = new Apis('sena_solicitudcomite');
        $codigoFicha = obtenerVariable('codigoFicha');
        $options = obtenerVariable('options');
        $idSolicitud = obtenerVariable('idSolicitud');
        $moved = obtenerVariable('moved');
        $variablesAVerificar = [
            'codigoFicha' => $codigoFicha,
            'idSolicitud' => $idSolicitud,
            'entidad' => $entidad,
        ];
         
        $mensajeError = $apps->verificarVariables($variablesAVerificar);
        if ($mensajeError !== null) {
            $arrayMensage[] = ['id' => 1, 'message' => '::ERROR-001:: ' . $mensajeError, 'status' => '404'];
        } else {
            if($moved==1){
                $arrayMensage[] = ['id' => 1, 'message' => '::ERROR:: Documento no se actualizó!', 'status' => '202'];
            }else{
                //guardarPDF();
                $arrayMensage[] = ['id' => 1, 'message' => '::OK:: Documento actualizado correctamente!', 'status' => '202'];
            }
      }
       echo var2js($arrayMensage);
        break;

    default:
        echo json_encode(['error' => 'Acción no reconocida']);
        break;
}
?>
