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

include_spip('inc/autoriser');
include_spip('base/connect_sql');
include_spip('inc/filtres_ecrire');
include_spip('inc/filtres');
include_spip('inc/texte_mini');
include_spip('inc/utils');
include_spip('inc/json');
include_spip('exec/model/sena/claseapi');
//include_spip('fpdf.php');
include_spip('inc/charsets');
include_spip('inc/actions');
include_spip('inc/editer');
include_spip('inc/notifications');


function processElements($a, $b) {
        // Verificar si 'a' o 'b' están vacíos o contienen solo '0'
    if (empty($a) || empty($b) || $a == '0' || $b == '0') {
            return ['a' => $a, 'b' => $b];
    }
    // Convertir las cadenas en arrays
    $arrayA = explode(',', $a);
    $arrayB = explode(',', $b);

    // Eliminar elementos de B que están en A
    $arrayB = array_diff($arrayB, $arrayA);

    // Eliminar elementos de A que no están en B
    $arrayA = array_intersect($arrayA, $arrayB);

    // Convertir los arrays de vuelta a cadenas
    $resultA = implode(',', $arrayA);
    $resultB = implode(',', $arrayB);

    return ['a' => $resultA, 'b' => $resultB];
}
function generarPDFAsistencia($idActa) {
    $path = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/evidenciAsistencia_' . $idActa . '.pdf';
    if (@file_exists($path)) {
        spip_log("Supprimer ancien logo '$idActa'", 'evidenciAsistencia');
        spip_unlink($path);
    }

    require('../ecrire/exec/model/sena/ModuloActas/fpdf_listAsistencias.php');
    $pdf = new PDF();
    $pdf->AliasNbPages();
    $pdf->AddPage('P', 'Legal');

    // Títulos de las columnas
    $select = '*';
    $w1 = array(8, 83, 40, 20, 39);
    $w2 = array(190);
    $w3 = array(95, 95);
    $data = array();

    if (sql_countsel('sena_asistencias', 'idActa="' . $idActa . '" AND entidad="senaV1"') > 0) {
        $k = 1;
        $sqls = sql_select($select, 'sena_asistencias', 'idActa="' . $idActa . '" AND entidad="senaV1"');
        while ($rows = sql_fetch($sqls)) {
            $data[$k][] = array(
                '' . $k . '',
                '' . $rows['nombresApellidos'] . '',
                '' . $rows['documento'] . '' . $rows['planta'] . '',
                '' . $rows['contratista'] . ''
            );
            $data2[$k][] = array('' . $rows['contratistaOtros'] . '');
            $data3[$k][] = array('' . $rows['dependencia'] . '', '' . $rows['email'] . '');
            $data4[$k][] = array('' . $rows['autorizacion'] . '', '');
            $k++;
        }
    } else {
        $k = 1;
        $data[1][] = array('1', 'SIN REGISTROS', '00000', 'SIN REGISTROS');
        $data2[1][] = array('SIN REGISTROS');
        $data3[1][] = array('SIN REGISTROS', 'SIN REGISTROS');
        $data4[1][] = array('SIN REGISTROS', '');
    }

    $header1 = array('#', 'NOMBRES Y APELLIDOS', 'DOCUMENTO', 'PLANTA', 'CONTRATISTA');
    $header2 = array('OTRO ¿CUAL?');
    $header3 = array('DEPENDENCIA/ EMPRESA', 'CORREO ELECTRÓNICO');
    $header4 = array('AUTORIZA GRABACIÓN', 'FIRMA O PARTICIPACIÓN VIRTUAL');
    $header5 = array('');

    // Carga de datos
    $pdf->SetFont('Arial', '', 14);
    for ($i = 1; $i < $k; ++$i) {
        $pdf->SimpleTable($header1, $data[$i], $w1);
        $pdf->SimpleTable($header2, $data2[$i], $w2);
        $pdf->SimpleTable($header3, $data3[$i], $w3);
        $pdf->SimpleTable($header4, $data4[$i], $w3);
        $pdf->ln(6);
    }

    $pdf->Output('F', 'evidenciAsistencia_' . $idActa . '.pdf', true);
    $pdf = '../ecrire/evidenciAsistencia_' . $idActa . '.pdf';
    if (@file_exists($pdf)) {
        $newLocation = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/evidenciAsistencia_' . $idActa . '.pdf';
        $moved = rename($pdf, $newLocation);
        if ($moved) {
            spip_unlink($pdf);
        }
    }
}

function formatearFecha($fechaEntrada) {
    // Crear un objeto DateTime a partir de la fecha de entrada
    $fecha = new DateTime($fechaEntrada);

    // Definir los meses en español
    $meses = [
        1 => 'enero', 2 => 'febrero', 3 => 'marzo', 4 => 'abril',
        5 => 'mayo', 6 => 'junio', 7 => 'julio', 8 => 'agosto',
        9 => 'septiembre', 10 => 'octubre', 11 => 'noviembre', 12 => 'diciembre'
    ];

    // Obtener el día, mes y año de la fecha
    $dia = $fecha->format('d');
    $mes = $fecha->format('n'); // Mes en formato numérico sin ceros iniciales
    $anio = $fecha->format('Y');

    // Formatear la fecha en el formato requerido
    $fechaFormateada = $meses[$mes] . " " . $dia . " de " . $anio;

    return $fechaFormateada;
}

/**
 * Crear PDF de acta.
 *
 * @param int $idActa
 */
function crearPdfAprendices($idActa) {
    $path = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/evidenciaAprendices_'.$idActa.'.pdf';
    if (file_exists($path)) {
        spip_log("Supprimer ancien logo '.$idActa.'", 'evidenciaAprendices');
        spip_unlink($path);
    }
    $header=[];
    $datosAprendiz = [];
    $dataConceptos = [];
    $dataApr = [];

    require('../ecrire/exec/model/sena/ModuloActas/fpdf_listAprendices.php');
    $pdf = new PDF();
    $pdf->AliasNbPages();
    $pdf->AddPage('L', 'Legal');

    // Títulos de las columnas
    $select = '*';
    $columnWidths = array(8, 83, 10, 39, 25, 25, 39, 83);
    $data = array();
    if (sql_countsel('sena_actas', 'idActa="' . $idActa . '" AND entidad="senaV1"') > 0) {
        $sql1 = sql_select('casosComite', 'sena_actas', 'idActa="'.$idActa.'" AND entidad="senaV1"');
        while ($row1 = sql_fetch($sql1)) {
            if (!empty($row1['casosComite'])) {
                $casos = $row1['casosComite'];
            }
        }
        // Obtener Acta
        $sql4 = sql_select('*', 'sena_actas', 'idActa = "'.$idActa.'" AND entidad="senaV1"');
        while ($row4 = sql_fetch($sql4)) {
            if (!empty($row4['nombre'])) {
                $NombreActa = $row4['nombre'];
                $Fecha = $row4['fecha'];
                $horaInicial = $row4['horaInicial'];
                $horaFinal = $row4['horaFinal'];
                $presentacion = $row4['presentacion'];
            }
        }
        $DatosActa =array(
            'idActa'=>$idActa,
            'nombreActa'=>$NombreActa,
            'Fecha'=>formatearFecha($Fecha),
            'horaInicial'=>$horaInicial,
            'horaFinal'=>$horaFinal,
            'presentacion'=>$presentacion,
        );

        $itemsSolicitud = explode(',',$casos);

        foreach ($itemsSolicitud as $idSolicitud) {
            $sql2 = sql_select('*','sena_solicitudcomite', 'idSolicitud ="'.$idSolicitud.'" AND entidad="senaV1"');

            while ($row2 = sql_fetch($sql2)) {
                if (!empty($row2['idAprendiz'])) {
                    $sql3 = sql_select('*', 'sena_aprendiz', 'idAprendiz="'.$row2['idAprendiz'].'" AND entidad="senaV1"');

                    $h=1;
                    while ($row3 = sql_fetch($sql3)) {
                        if (!empty($row3['nombres'])) {
                            $dataApr[]= array(
                                'no'=>''.$h,
                                'nombreAprendiz'=> ''.$row3['nombres'].' '.$row3['apellidos'].'',
                                'tipoIdentificacion'=>!empty($row3['tipoIdentificacion']) ? $row3['tipoIdentificacion']:'CC',
                                'identificacion'=>!empty($row3['identificacion']) ? $row3['identificacion']:'1111111',
                                'correo'=>!empty($row3['correo']) ? $row3['correo']:'sienemail@gmail.com',
                                'telefono'=>!empty($row3['telefono']) ? $row3['telefono']:'5555555',
                                'programaFormacion'=>!empty($row3['programaFormacion']) ? $row3['programaFormacion']:'SIN PROGRAMA FORMACION',
                                'ficha'=>!empty($row3['ficha']) ? $row3['ficha']:'000001'
                            );
                            $h++;
                        }
                    }
                }
            }
        }
        if (!empty($dataApr)) {
            $datosAprendiz = $dataApr;
        } else {
            $h=1;
            $datosAprendiz[]= array(
                'nombreAprendiz'=>'SIN REGISTRO',
                'tipoIdentificacion'=>'cc',
                'identificacion'=>'000000',
                'correo'=>'sienemail@gmail.com',
                'telefono'=>'000000',
                'ficha'=>'000001',
                'programaFormacion'=>'SIN PROGRAMA FORMACION'
            );
        }

        // Colores, ancho de línea y fuente en negrita rgba (234, 238, 241, 1)
        $pdf->SetFillColor(162, 198, 151, 1);
        $pdf->SetTextColor(255);
        $pdf->SetDrawColor(94, 179, 25);
        $pdf->SetLineWidth(.3);
        $pdf->SetFont('', 'B');
        $pdf->Ln();
        // Restauración de colores y fuentes
        $pdf->SetFillColor(255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
        $header = array('#', 'NOMBRES Y APELLIDOS', 'TD', 'DOCUMENTO','CORREO', 'TELEFONO', 'FICHA', 'PROGRAMA');
        $pdf->idActa=$idActa;
        $pdf->SetFont('Arial', '', 14);
        $pdf->TableAprendices($header,$datosAprendiz);
        $pdf->Output('F', 'evidenciaAprendices_'.$idActa.'.pdf', true);
        $pdfPath = '../ecrire/evidenciaAprendices_'.$idActa.'.pdf';
        if (file_exists($pdfPath)) {
            $newLocation = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/evidenciaAprendices_'.$idActa.'.pdf';
            $moved = rename($pdfPath, $newLocation);
            if ($moved) {
                spip_unlink($pdfPath);
            }
        }
    } else {
        $DatosActa =array(
            'idActa'=>'1',
            'nombreActa'=>'1',
            'Fecha'=>'0000-00-00',
            'horaInicial'=>'0000-00-00',
            'horaFinal'=>'00',
            'presentacion'=>'00',
        );
        $dataApr= array(
            'no'=>'1',
            'nombreAprendiz'=> 'SIN REGISTRO',
            'tipoIdentificacion'=>'CC',
            'identificacion'=>'1111111',
            'correo'=>'sienemail@gmail.com',
            'telefono'=>'5555555',
            'programaFormacion'=>'SIN PROGRAMA FORMACION',
            'ficha'=>'000001'
        );
        $pdf->SetFillColor(162, 198, 151, 1);
        $pdf->SetTextColor(255);
        $pdf->SetDrawColor(94, 179, 25);
        $pdf->SetLineWidth(.3);
        $pdf->SetFont('', 'B');
        $pdf->Ln();
        // Restauración de colores y fuentes
        $pdf->SetFillColor(255);
        $pdf->SetTextColor(0);
        $pdf->SetFont('');
        $header = array('#', 'NOMBRES Y APELLIDOS', 'TD', 'DOCUMENTO','CORREO', 'TELEFONO', 'FICHA', 'PROGRAMA');
        $pdf->SetFont('Arial', '', 14);
        $pdf->TableAprendices($header,$datosAprendiz);
        $pdf->Output('F', 'evidenciaAprendices_'.$idActa.'.pdf', true);
        $pdfPath = '../ecrire/evidenciaAprendices_'.$idActa.'.pdf';
        if (file_exists($pdfPath)) {
            $newLocation = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/evidenciaAprendices_'.$idActa.'.pdf';
            $moved = rename($pdfPath, $newLocation);
            if ($moved) {
                spip_unlink($pdfPath);
            }
        }
    }
}

/**
 * Crear PDF de acta.
 *
 * @param int $idActa
 */
function crearPdfActa($idActa) {
    $path = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/evidenciActas_'.$idActa.'.pdf';
    if (file_exists($path)) {
        spip_log("Supprimer ancien logo '.$idActa.'", 'evidenciActas');
        spip_unlink($path);
    }
    require('../ecrire/exec/model/sena/ModuloActas/fpdf_actas.php');

    if (sql_countsel('sena_actas', 'idActa="' . $idActa . '" AND entidad="senaV1"') > 0) {
        $sql1 = sql_select('casosComite', 'sena_actas', 'idActa="'.$idActa.'" AND entidad="senaV1"');
        while ($row1 = sql_fetch($sql1)) {
            if (!empty($row1['casosComite'])) {
                $casos = $row1['casosComite'];
            }
        }
        $i=0;
        $datosAprendiz = [];
        $dataConceptos = [];
        $dataApr = [];
        // Obtener Acta
        $sql4 = sql_select('*', 'sena_actas', 'idActa = "'.$idActa.'" AND entidad="senaV1"');
        while ($row4 = sql_fetch($sql4)) {
            if (!empty($row4['nombre'])) {
                $idActa = $row4['idActa'];
                $NombreActa = $row4['nombre'];
                $Fecha = $row4['fecha'];
                $horaInicial = $row4['horaInicial'];
                $horaFinal = $row4['horaFinal'];
                $presentacion = $row4['presentacion'];
            }
        }
        $DatosActa =array(
            'idActa'=>$idActa,
            'nombreActa'=>$NombreActa,
            'Fecha'=>formatearFecha($Fecha),
            'horaInicial'=>$horaInicial,
            'horaFinal'=>$horaFinal,
            'presentacion'=>$presentacion,
        );
        $pdf = new PDF();
        $pdf->DatosActa=$DatosActa;
        $itemsSolicitud = explode(',',$casos);

        foreach ($itemsSolicitud as $idSolicitud) {
            $sql2 = sql_select('*','sena_solicitudcomite', 'idSolicitud ="'.$idSolicitud.'" AND entidad="senaV1"');
            while ($row2 = sql_fetch($sql2)) {
                if (!empty($row2['idAprendiz'])) {
                    $sql3 = sql_select('*', 'sena_aprendiz', 'idAprendiz="'.$row2['idAprendiz'].'" AND entidad="senaV1"');

                    $j=1;
                    while ($row3 = sql_fetch($sql3)) {
                        if (!empty($row3['nombres'])) {
                            $dataApr= array(
                                'no'=>''.$j,
                                'nombreAprendiz'=> ''.$row3['nombres'].' '.$row3['apellidos'].'',
                                'tipoIdentificacion'=>!empty($row3['tipoIdentificacion']) ? $row3['tipoIdentificacion']:'CC',
                                'identificacion'=>!empty($row3['identificacion']) ? $row3['identificacion']:'1111111',
                                'correo'=>!empty($row3['correo']) ? $row3['correo']:'sienemail@gmail.com',
                                'telefono'=>!empty($row3['telefono']) ? $row3['telefono']:'5555555',
                                'programaFormacion'=>!empty($row3['programaFormacion']) ? $row3['programaFormacion']:'SIN PROGRAMA FORMACION',
                                'ficha'=>!empty($row3['ficha']) ? $row3['ficha']:'000001'
                            );
                        }
                        $j++;
                    }
                }
            }
            $i=1;
            $sql5 = sql_select('*','sena_actas_conceptos', 'idActa ="'.$idActa.'" AND idSolicitud ="'.$idSolicitud.'" AND entidad="senaV1"');
            while ($row5 = sql_fetch($sql5)) {
                $dataConceptos= array(
                    'no'=>''.$i,
                    'hechos'=>!empty($row5['hechos']) ? $row5['hechos']:'sin hechos',
                    'contemplacion'=>!empty($row5['contemplacion']) ? $row5['contemplacion']:'sin contemplacion',
                    'frenteHechos'=>!empty($row5['frenteHechos']) ? $row5['frenteHechos']:'frenteHechos',
                    'recomendacion'=>!empty($row5['recomendacion']) ? $row5['recomendacion']:'recomendacion',
                    'compromisos'=>!empty($row5['compromisos']) ? $row5['compromisos']:'compromisos',
                );
                $i++;
            }

            if (!empty($dataConceptos)) {
                $dataConceptosActa = $dataConceptos;
            } else {
                $i=1;
                $dataConceptosActa= array(
                    'no'=>'1',
                    'hechos'=>'hechos',
                    'contemplacion'=>'contemplacion',
                    'frenteHechos'=>'frenteHechos',
                    'recomendacion'=>'recomendacion',
                    'compromisos'=>'compromisos'
                );
            }

            if (!empty($dataApr)) {
                $datosAprendiz = $dataApr;
            } else {
                $datosAprendiz= array(
                    'nombreAprendiz'=>'SiN REGISTRO',
                    'tipoIdentificacion'=>'cc',
                    'identificacion'=>'000000',
                    'correo'=>'sienemail@gmail.com',
                    'telefono'=>'000000',
                    'ficha'=>'000001',
                    'programaFormacion'=>'SIN PROGRAMA FORMACION'
                );
            }

            $i++;
            $pdf->datosAprendiz=$datosAprendiz;
            $pdf->dataConceptos=$dataConceptosActa;
            $pdf->AddPage('P', 'Legal');
            $pdf->Contenido();
            $pdf->AliasNbPages();
            unset($datosAprendiz);
            unset($dataConceptos);
            unset($dataApr);
        }

        $pdf->Output('F', 'evidenciActas_'.$idActa.'.pdf', true);
        $pdfPath = '../ecrire/evidenciActas_'.$idActa.'.pdf';
        if (file_exists($pdfPath)) {
            $newLocation = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/evidenciActas_'.$idActa.'.pdf';
            $moved = rename($pdfPath, $newLocation);
            if ($moved) {
                spip_unlink($pdfPath);
            }
        }
    } else {
        $DatosActa =array(
            'idActa'=>'1',
            'nombreActa'=>'1',
            'Fecha'=>'0000-00-00',
            'horaInicial'=>'0000-00-00',
            'horaFinal'=>'00',
            'presentacion'=>'00',
        );
        $dataApr= array(
            'no'=>'1',
            'nombreAprendiz'=> 'SIN REGISTRO',
            'tipoIdentificacion'=>'CC',
            'identificacion'=>'1111111',
            'correo'=>'sienemail@gmail.com',
            'telefono'=>'5555555',
            'programaFormacion'=>'SIN PROGRAMA FORMACION',
            'ficha'=>'000001'
        );
        $dataConceptosActa= array(
            'no'=>'1',
            'hechos'=>'hechos',
            'contemplacion'=>'contemplacion',
            'frenteHechos'=>'frenteHechos',
            'recomendacion'=>'recomendacion',
            'compromisos'=>'compromisos'
        );
        $pdf = new PDF();
        $pdf->DatosActa=$DatosActa;
        $pdf->datosAprendiz=$dataApr;
        $pdf->dataConceptos=$dataConceptosActa;
        $pdf->AddPage('P', 'Legal');
        $pdf->Contenido();
        $pdf->AliasNbPages();
        $pdf->Output('F', 'evidenciActas_'.$idActa.'.pdf', true);
        $pdfPath = '../ecrire/evidenciActas_'.$idActa.'.pdf';
        if (file_exists($pdfPath)) {
            $newLocation = '../ecrire/exec/model/sena/ModuloActas/pdf/sc/evidenciActas_'.$idActa.'.pdf';
            $moved = rename($pdfPath, $newLocation);
            if ($moved) {
                spip_unlink($pdfPath);
            }
        }
    }
}

function corregir_conceptos($str) {
    if (isset($str)) {
        $hechos = base64_decode($str);

        // Assuming input data is in UTF-8 before base64 encoding
        //$hechos_utf8 =urldecode($hechos);
        $hechos_html = decodeHtmlEnt($hechos);
        return $hechos_html;
    }
    return null;
}
$opcion = isset($_GET['opcion']) ? base64_decode($_GET['opcion']) : base64_decode($_POST['opcion']);
$idActa = null;

// Verificar y decodificar idActa
if (array_key_exists('entidad', $_GET) && !empty($_GET['entidad'])) {
    $entidad = base64_decode($_GET['entidad']);
} elseif (array_key_exists('entidad', $_POST) && !empty($_POST['entidad'])) {
    $entidad = base64_decode($_POST['entidad']);
}
switch ($opcion) {
    case 'generarConsolidado':
        $items = isset($_GET['items']) ? base64_decode($_GET['items']) : base64_decode($_POST['items']);
     
		$consolidado= array();
        $DatosAuteurs=array();
        $select='*';
        $conceptos = array(); 
		$app=new Apis('sena_actas');
	
		$itemsActas = explode(',',$items);
		// Verificar si todos los elementos son numéricos
				$todosActa = true;
				foreach ($itemsActas as $item) {
					if (!is_numeric($item)) {
						$todosActa  = false;
						break;
					}
				}
        if ($todosActa) {
			foreach ($itemsActas as $idActa) {	
            $sql1 = sql_select('*','sena_actas','idActa="'.$idActa.'" AND entidad="'.$entidad.'" AND statut="Activo"');
            while ($row1 = sql_fetch($sql1)) {

                $itemsSolicitud = explode(',',$row1['casosComite']);
			// Verificar si todos los elementos son numéricos
					$todosNumericos = true;
					foreach ($itemsSolicitud as $elemento) {
						if (!is_numeric($elemento)) {
							$todosNumericos  = false;
							break;
						}
					}
				
                if ($todosNumericos) {
                    foreach ($itemsSolicitud as $idSolicitud) {	
						//echo 'idActa="'.intval($idActa).'" AND idSolicitud="'.intval($idSolicitud).'"';
						if (sql_countsel('sena_actas_conceptos','idActa="'.intval($idActa).'" AND idSolicitud="'.intval($idSolicitud).'"') > 0) {
							$sql4 = sql_select('*', 'sena_actas_conceptos', 'idActa="'.intval($idActa).'" AND idSolicitud="'.intval($idSolicitud).'"');
							while ($row4 = sql_fetch($sql4)) {
							$conceptos= array(
									'hechos'=>$row4['hechos'],
									'contemplacion'=>$row4['contemplacion'],
									'frenteHechos'=>$row4['frenteHechos'],
									'recomendacion'=>$row4['recomendacion'],
									'compromisos'=>$row4['compromisos']);
							}
							
						}
						$sql2 = sql_select('*','sena_solicitudcomite', 'idSolicitud ="'.$idSolicitud.'" AND entidad="senaV1"');
                        while ($row2 = sql_fetch($sql2)) {
                            if (!empty($row2['idAprendiz'])) {
                                $h=1;
                                $sql3 = sql_select('*', 'sena_aprendiz', 'idAprendiz="'.$row2['idAprendiz'].'" AND entidad="senaV1"');
                                while ($row3 = sql_fetch($sql3)) {
                                    if (!empty($row3['nombres'])) {

                                        $consolidado[]= array(
                                            "FECHA COMITE"=>$row1['fecha'],
                                            "HORA"=>$row1['horaInicial'],
                                            "APRENDIZ"=>''.$row3['nombres'].' '.$row3['apellidos'].'',
                                            "TIPO DOCUMENTO"=>!empty($row3['tipoIdentificacion']) ? $row3['tipoIdentificacion']:'CC',
                                            "NUMERO DE DOCUMENTO IDENTIDAD"=>!empty($row3['identificacion']) ? $row3['identificacion']:'1111111',
                                            "ESPECIALIDAD"=>!empty($row3['programaFormacion']) ? $row3['programaFormacion']:'SIN PROGRAMA FORMACION',
                                            "FICHA"=>!empty($row3['ficha']) ? $row3['ficha']:'000011',
                                            "INICIO LECTIVA"=>!empty($row3['etapa']) ? $row3['etapa']:'',
                                            "FECHA FIN FORMACION"=>'0000-00-00',
                                            "INICIO PRODUCTIVA"=>'0000-00-00',
                                            "FIN 2 AÑOS"=>'',
                                            "CORREO"=>!empty($row3['correo']) ? $row3['correo']:'sienemail@gmail.com',
                                            "TELEFONO"=>!empty($row3['telefono']) ? $row3['telefono']:'0000',
                                            "SOLICITUD"=>'SOLICITUD',
                                            "HECHOS"=>!empty($conceptos['hechos']) ? $conceptos['hechos']:'',
                                            "FRENTE A LOS HECHOS"=>!empty($conceptos['frenteHechos']) ? $conceptos['frenteHechos']:'',
                                            "RECOMENDACIONES"=>!empty($conceptos['recomendacion']) ? $conceptos['recomendacion']:'',
                                            "COMPROMISO"=>!empty($conceptos['compromisos']) ? $conceptos['compromisos']:'',
                                            "CITACION"=>sql_countsel('sena_solicitudcomite','idAprendiz="'.intval($row2['idAprendiz']).'"'),
                                            "ETAPA"=>'PRODUCTIVA',
                                            "JORNADA"=>'MAÑANA',
                                            "REGLA"=>'',
                                            "TIPO DE FALTA"=>'ACADEMICA',
                                            "COORDINADOR"=>'DORIS JUDITH',
                                            "OBSERVACIONES"=>!empty($conceptos['contemplacion']) ? $conceptos['contemplacion']:'',
                                        );

                                    }
                                }
                            }
                        }
                    }
                } else {
                    $consolidado[]= array(
                        "FECHA COMITE"=>'',
                        "HORA"=>'',
                        "APRENDIZ"=>'',
                        "TIPO DOCUMENTO"=>'CC',
                        "NUMERO DE DOCUMENTO IDENTIDAD"=>'1111111',
                        "ESPECIALIDAD"=>'SIN PROGRAMA FORMACION',
                        "FICHA"=>'000011',
                        "INICIO LECTIVA"=>'',
                        "FECHA FIN FORMACION"=>'0000-00-00',
                        "INICIO PRODUCTIVA"=>'0000-00-00',
                        "FIN 2 AÑOS"=>'',
                        "CORREO"=>'sienemail@gmail.com',
                        "TELEFONO"=>'0000',
                        "SOLICITUD"=>'SOLICITUD',
                        "HECHOS"=>'',
                        "FRENTE A LOS HECHOS"=>'',
                        "RECOMENDACIONES"=>'',
                        "COMPROMISO"=>'',
                        "CITACION"=>'1',
                        "ETAPA"=>'PRODUCTIVA',
                        "JORNADA"=>'MAÑANA',
                        "REGLA"=>'',
                        "TIPO DE FALTA"=>'ACADEMICA',
                        "COORDINADOR"=>'DORIS JUDITH',
                        "OBSERVACIONES"=>'',
                    );
                }

            }
		}
        }else{
			$consolidado[]= array(
				"FECHA COMITE"=>'',
				"HORA"=>'',
				"APRENDIZ"=>'',
				"TIPO DOCUMENTO"=>'CC',
				"NUMERO DE DOCUMENTO IDENTIDAD"=>'1111111',
				"ESPECIALIDAD"=>'SIN PROGRAMA FORMACION',
				"FICHA"=>'000011',
				"INICIO LECTIVA"=>'',
				"FECHA FIN FORMACION"=>'0000-00-00',
				"INICIO PRODUCTIVA"=>'0000-00-00',
				"FIN 2 AÑOS"=>'',
				"CORREO"=>'sienemail@gmail.com',
				"TELEFONO"=>'0000',
				"SOLICITUD"=>'SOLICITUD',
				"HECHOS"=>'',
				"FRENTE A LOS HECHOS"=>'',
				"RECOMENDACIONES"=>'',
				"COMPROMISO"=>'',
				"CITACION"=>'1',
				"ETAPA"=>'PRODUCTIVA',
				"JORNADA"=>'MAÑANA',
				"REGLA"=>'',
				"TIPO DE FALTA"=>'ACADEMICA',
				"COORDINADOR"=>'DORIS JUDITH',
				"OBSERVACIONES"=>'',
			);
		}
		$data = array("data"=>$consolidado);
		if(empty($data)){
			$consolidado[]= array(
				"FECHA COMITE"=>'',
				"HORA"=>'',
				"APRENDIZ"=>'',
				"TIPO DOCUMENTO"=>'CC',
				"NUMERO DE DOCUMENTO IDENTIDAD"=>'1111111',
				"ESPECIALIDAD"=>'SIN PROGRAMA FORMACION',
				"FICHA"=>'000011',
				"INICIO LECTIVA"=>'',
				"FECHA FIN FORMACION"=>'0000-00-00',
				"INICIO PRODUCTIVA"=>'0000-00-00',
				"FIN 2 AÑOS"=>'',
				"CORREO"=>'sienemail@gmail.com',
				"TELEFONO"=>'0000',
				"SOLICITUD"=>'SOLICITUD',
				"HECHOS"=>'',
				"FRENTE A LOS HECHOS"=>'',
				"RECOMENDACIONES"=>'',
				"COMPROMISO"=>'',
				"CITACION"=>'1',
				"ETAPA"=>'PRODUCTIVA',
				"JORNADA"=>'MAÑANA',
				"REGLA"=>'',
				"TIPO DE FALTA"=>'ACADEMICA',
				"COORDINADOR"=>'DORIS JUDITH',
				"OBSERVACIONES"=>'',
			);
			$var = var2js($consolidado);
			echo $var;
		}else{
			$var = var2js($data);
			echo $var;
		}

        break;
    case 'listActas':
         
        $DatosAuteurs=array();
        $select='*';
        $set = array();
        if (sql_countsel('sena_actas','entidad="'.$entidad.'" AND statut="Activo"') >= 1) {
            $app=new Apis('sena_actas');
            $aprendizes=$app->consultadatos('entidad="'.$entidad.'"  AND statut="Activo"',$select);
            $data = array("data"=>$aprendizes);
            $var = var2js($data);
            echo $var;
        } else {
            $records[] = array('idActa'=>1,
                'nombre'=>'No existen registros',
                'fecha'=>'2024',
                'horaInicial'=>'08'
            );
            $data = array("data"=>$records);
            $var = var2js($data);
            echo $var;
        }
        break;
    case 'listActasInactivas':
    case 'updateInactivas':

        if($opcion=='updateInactivas'){
            $idActa = isset($_GET['idActa']) ? base64_decode($_GET['idActa']) : base64_decode($_POST['idActa']);
           
            $chartic['statut'] ='Activo';
            $chartic = pipeline('pre_insertion',
                array(
                    'args' => array(
                        'table' => 'sena_actas',
                    ),
                    'data' => $chartic
                )
            );
            sql_updateq('sena_actas',$chartic,"idActa=" . intval($idActa) . "");
            pipeline('post_insertion',
                array(
                    'args' => array(
                        'table' =>'sena_actas',
                        'id_objet' => $idActa
                    ),
                    'data' => $chartic
                )
            );
            if (!empty($idActa)) {
            crearPdfAprendices($idActa);
            }
        }

        
        $DatosAuteurs=array();
        $select='*';
        $set = array();
        if (sql_countsel('sena_actas','entidad="'.$entidad.'" AND statut="Inactiva"') >= 1) {
            $app=new Apis('sena_actas');
            $actas=$app->consultadatos('entidad="'.$entidad.'"  AND statut="Inactiva"',$select);
            $data = array("data"=>$actas);
            $var = var2js($data);
            echo $var;
        } else {
            $records[] = array('idActa'=>1,
                'nombre'=>'No existen registros',
                'fecha'=>'0000',
                'horaInicial'=>'00',
                'horaFinal'=>'00'
            );
            $data = array("data"=>$records);
            $var = var2js($data);
            echo $var;
        }
        break;
    case 'add':
        $app=new Apis('sena_actas');
        $variablesAVerificar=array();
        $desc=array();
        $id_ou_options=0;
       
        $nombre = isset($_GET['nombre']) ? base64_decode($_GET['nombre']) : base64_decode($_POST['nombre']);
        $fecha = isset($_GET['fecha']) ? base64_decode($_GET['fecha']) : base64_decode($_POST['fecha']);
        $horaInicial = isset($_GET['horaInicial']) ? base64_decode($_GET['horaInicial']) : base64_decode($_POST['horaInicial']);
        $horaFinal = isset($_GET['horaFinal']) ? base64_decode($_GET['horaFinal']) : base64_decode($_POST['horaFinal']);
        $secretario = isset($_GET['secretario']) ? base64_decode($_GET['secretario']) : base64_decode($_POST['secretario']);
        $idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);
        $presentacion = isset($_GET['presentacion']) ? base64_decode($_GET['presentacion']) : base64_decode($_POST['presentacion']);

        // Crea un array con las variables que deseas verificar
        $variablesAVerificar = [
            'nombre' => $nombre,
            'fecha' => $fecha,
            'horaInicial' => $horaInicial,
            'horaFinal' => $horaFinal,
            'entidad' => $entidad,
            'idUsuario' => $idUsuario,
            'presentacion' => $presentacion,
        ];
        //print_r($variablesAVerificar);
        $mensajeError = $app->verificarVariables($variablesAVerificar);
      if ($mensajeError !== null){
            $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
        } else {
            $table='sena_actas';
            $chartic['nombre'] ="".$nombre."";
            $chartic['fecha'] =$fecha;
            $chartic['horaInicial'] =$horaInicial;
            $chartic['horaFinal'] =$horaFinal;
            $chartic['ciudad'] ='Bucaramanga';
            $chartic['lugar'] ='Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente';
            $chartic['direccion'] ='Centro de Servicios Empresariales y Turísticos';
            $chartic['casosComite'] ='0';
            $chartic['secretario'] =$secretario;
            $chartic['asistencias'] ='';
            $chartic['presentacion'] =$presentacion;
            $chartic['entidad'] =$entidad;
            $chartic['statut'] ='Activo';
            $chartic = pipeline('pre_insertion',
                array(
                    'args' => array(
                        'table' => ''.$table.'',
                    ),
                    'data' => $chartic
                )
            );
            $idActa=@sql_insertq(''.$table.'',$chartic);
            pipeline('post_insertion',
                array(
                    'args' => array(
                        'table' =>''.$table.'',
                        'id_objet' => $idActa
                    ),
                    'data' => $chartic
                )
            );
            $msg[] = 'Acta guardado con exito';
            $arrayMensage[] = array('message'=>'¡OK!. El Acta fue GUARDADO! '.implode(',',$msg).'','status' => '202');
            //crearPdfActa($idActa);
        }
        $var = var2js($arrayMensage);
        echo $var;
        break;
    case 'update':
        $app=new Apis('sena_actas');
        $variablesAVerificar=array();
        $desc=array();
        $id_ou_options=0;
  
        $nombre = isset($_GET['nombre']) ? base64_decode($_GET['nombre']) : base64_decode($_POST['nombre']);
        $fecha = isset($_GET['fecha']) ? base64_decode($_GET['fecha']) : base64_decode($_POST['fecha']);
        $horaInicial = isset($_GET['horaInicial']) ? base64_decode($_GET['horaInicial']) : base64_decode($_POST['horaInicial']);
        $horaFinal = isset($_GET['horaFinal']) ? base64_decode($_GET['horaFinal']) : base64_decode($_POST['horaFinal']);
        $secretario = isset($_GET['secretario']) ? base64_decode($_GET['secretario']) : base64_decode($_POST['secretario']);
        $idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);
        $presentacion = isset($_GET['presentacion']) ? base64_decode($_GET['presentacion']) : base64_decode($_POST['presentacion']);
        $idActa = isset($_GET['idActa']) ? base64_decode($_GET['idActa']) : base64_decode($_POST['idActa']);


        // Crea un array con las variables que deseas verificar
        $variablesAVerificar = [
            'nombre' => $nombre,
            'fecha' => $fecha,
            'horaInicial' => $horaInicial,
            'horaFinal' => $horaFinal,
            'secretario' => $secretario,
            'entidad' => $entidad,
            'idUsuario' => $idUsuario,
            'idActa' =>$idActa
        ];
        //print_r($variablesAVerificar);
        $mensajeError = $app->verificarVariables($variablesAVerificar);
        if ($mensajeError !== null) {
        $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
        }else{
            //unicode2charset(utf_8_to_unicode
            $chartic['nombre'] ="".$nombre."";
            $chartic['fecha'] ="".$fecha."";
            $chartic['horaInicial'] ="".$horaInicial."";
            $chartic['horaFinal'] ="".$horaFinal."";
            $chartic['secretario'] ="".$secretario."";
            $chartic['presentacion'] =utf8_encode(base64_decode($_POST['presentacion']));
            $chartic = pipeline('pre_insertion',
                array(
                    'args' => array(
                        'table' => 'sena_actas',
                    ),
                    'data' => $chartic
                )
            );
            sql_updateq('sena_actas',$chartic,"idActa=" . intval($idActa) . "");

            pipeline('post_insertion',
                array(
                    'args' => array(
                        'table' =>'sena_actas',
                        'id_objet' => $idActa
                    ),
                    'data' => $chartic
                )
            );
            $arrayMensage[]=array(
                'id'=>1,
                'message'=>'::OK:: Acta Acualizado!',
                'status'=>'202');
            crearPdfActa($idActa);
            $var = var2js($arrayMensage);
            echo $var;
        }
        break;
    case 'delete':
        
        $idActa = isset($_GET['id']) ? base64_decode($_GET['id']) : base64_decode($_POST['id']);
        $chartic['statut'] ='Inactiva';
        $chartic = pipeline('pre_insertion',
            array(
                'args' => array(
                    'table' => 'sena_actas',
                ),
                'data' => $chartic
            )
        );
        sql_updateq('sena_actas',$chartic,"idActa=" . intval($idActa) . "");
        pipeline('post_insertion',
            array(
                'args' => array(
                    'table' =>'sena_actas',
                    'id_objet' => $idActa
                ),
                'data' => $chartic
            )
        );
        //sql_delete("sena_actas","idActa=" . intval($idActa));

        $res = sql_select("*", "sena_actas", "statut='Inactiva'");
        if ($res){
            $msg[] = array('menssage'=>'OK. El Registro Del Acta '.$idActa.' fue enviado a la papelera!','status' => '200');
        }
        $var = var2js($msg);
        echo $var;
        break;
    case 'listaSanciones':
        
        $idAprendiz = isset($_GET['idAprendiz']) ? base64_decode($_GET['idAprendiz']) : base64_decode($_POST['idAprendiz']);
        
        $DatosAuteurs=array();
        $select='*';
        $set = array();

        $app=new Apis('sena_sancionesanteriores');
        $aprendizes=$app->consultadatos('idAprendiz = "'.$idAprendiz.'" AND entidad="'.$entidad.'"',$select);
        $data = array("data"=>$aprendizes);
        $var = var2js($data);
        echo $var;

        break;
    case 'addIds':
        $app=new Apis('sena_actas');
        $variablesAVerificar=array();
        $chartic=array();
        $id_ou_options=0;

        $idActa = isset($_GET['idActa']) ? base64_decode($_GET['idActa']) : base64_decode($_POST['idActa']);
        $items = isset($_GET['items']) ? base64_decode($_GET['items']) : base64_decode($_POST['items']);
        $idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);
        $opcionBusqueda = isset($_GET['opcionBusqueda']) ? base64_decode($_GET['opcionBusqueda']) : base64_decode($_POST['opcionBusqueda']);
 
        // Crea un array con las variables que deseas verificar
        $variablesAVerificar = [
            'idActa' => $idActa,
            'entidad' => $entidad,
            'idUsuario' => $idUsuario,
            'opcionBusqueda' =>$opcionBusqueda,
            'items' => $items,
        ];
        
        $mensajeError = $app->verificarVariables($variablesAVerificar);
        if ($mensajeError !== null) {
        $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
        }else{
            switch ($opcionBusqueda) {
                case 'ASIGNAR':
                    $chartic['casosComite'] ="".$items."";
                break;
                case 'ASIGNADOS':
                    $sqlact = sql_select("casosComite",
						'sena_actas','idActa="'.$idActa.'"');
						while ($rowact = sql_fetch($sqlact)) {
						 $idSolicituds= $rowact['casosComite'];	
						}
                        $result = processElements($items, $idSolicituds);
                        $chartic['casosComite'] ="".$result['b']."";
                break;
            }
      
               
                $chartic = pipeline('pre_insertion',
                    array(
                        'args' => array(
                            'table' => 'sena_actas',
                        ),
                        'data' => $chartic
                    )
                );
                sql_updateq('sena_actas',$chartic,"idActa=" . intval($idActa) . "");
    
                pipeline('post_insertion',
                    array(
                        'args' => array(
                            'table' =>'sena_actas',
                            'id_objet' => $idActa
                        ),
                        'data' => $chartic
                    )
                );
                $arrayMensage[]=array(
                    'id'=>1,
                    'message'=>'::OK:: solicitud quitada de la lista!',
                    'status'=>'202');
           } 
           
            $var = var2js($arrayMensage);
            echo $var;

        
        //CREAMOS EL PDF DE LOS ESTUDIANTES ASIGNADOS AL ACTA
        if (!empty($idActa)) {
        crearPdfAprendices($idActa); 
        }
        break;
    case 'addAsistente':
        $app=new Apis('sena_asistencias');
        $variablesAVerificar=array();
        $chartic=array();
        $id_ou_options=0;

        $nombresApellidos = isset($_GET['nombresApellidos']) ? base64_decode($_GET['nombresApellidos']) : base64_decode($_POST['nombresApellidos']);
        $documento = isset($_GET['documento']) ? base64_decode($_GET['documento']) : base64_decode($_POST['documento']);
        $contratista = isset($_GET['contratista']) ? base64_decode($_GET['contratista']) : base64_decode($_POST['contratista']);
        $otroContratista = isset($_GET['otroContratista']) ? base64_decode($_GET['otroContratista']) : base64_decode($_POST['otroContratista']);
        $dependencia = isset($_GET['dependencia']) ? base64_decode($_GET['dependencia']) : base64_decode($_POST['dependencia']);
        $email = isset($_GET['email']) ? base64_decode($_GET['email']) : base64_decode($_POST['email']);
        $telefono = isset($_GET['telefono']) ? base64_decode($_GET['telefono']) : base64_decode($_POST['telefono']);
        $planta = isset($_GET['planta']) ? base64_decode($_GET['planta']) : base64_decode($_POST['planta']);
        $autorizacion = isset($_GET['autorizacion']) ? base64_decode($_GET['autorizacion']) : base64_decode($_POST['autorizacion']);
        $firmaDigital = isset($_GET['firmaDigital']) ? base64_decode($_GET['firmaDigital']) : base64_decode($_POST['firmaDigital']);
        $nombresDigital = isset($_GET['nombresDigital']) ? base64_decode($_GET['nombresDigital']) : base64_decode($_POST['nombresDigital']);
        $idActa = isset($_GET['idActa']) ? base64_decode($_GET['idActa']) : base64_decode($_POST['idActa']);
        $idUsuario = isset($_GET['idUsuario']) ? base64_decode($_GET['idUsuario']) : base64_decode($_POST['idUsuario']);
         
        
       // Crea un array con las variables que deseas verificar
        $variablesAVerificar = [
            'nombresApellidos' => $nombresApellidos,
            'documento' => $documento,
            'contratista' => $contratista,
            'idActa' => $idActa,
            'dependencia' => $dependencia,
            'email' => $email,
            'telefono' => $telefono,
            'planta' => $planta,
            'autorizacion' => $autorizacion,
            'firmaDigital' => $firmaDigital,
            'nombresDigital' => $nombresDigital,
            'idUsuario' => $idUsuario,
        ];
        $mensajeError = $app->verificarVariables($variablesAVerificar);
        if ($mensajeError !== null) {
        $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
        }else{
            $chartic['idActa'] ="".$idActa."";
            $chartic['nombresApellidos'] ="".$nombresApellidos."";
            $chartic['documento'] ="".$documento."";
            $chartic['dependencia'] ="".$dependencia."";
            $chartic['email'] ="".$email."";
            $chartic['telefono'] ="".$telefono."";
            $chartic['planta'] ="".$planta."";
            $chartic['contratista'] ="".$contratista."";
            $chartic['contratistaOtros'] ="".$otroContratista."";
            $chartic['autorizacion'] ="".$autorizacion."";
            $chartic['firmaDigital'] ="".$firmaDigital."";
            $chartic['entidad'] ="".$entidad."";
            $chartic = pipeline('pre_insertion',
                array(
                    'args' => array(
                        'table' => 'sena_asistencias',
                    ),
                    'data' => $chartic
                )
            );
            $idAsistencia=@sql_insertq('sena_asistencias',$chartic);

            pipeline('post_insertion',
                array(
                    'args' => array(
                        'table' =>'sena_asistencias',
                        'id_objet' => $idAsistencia
                    ),
                    'data' => $chartic
                )
            );
            $arrayMensage[]=array(
                'id'=>1,
                'message'=>'::OK:: Asistente registrado!',
                'status'=>'202');
        }

        generarPDFAsistencia($idActa);
        //FIN GENERA LA FICHA
        $var = var2js($arrayMensage);
        echo $var;
        break;
 
        $idActa = isset($_GET['idActa']) ? base64_decode($_GET['idActa']) : base64_decode($_POST['idActa']);
        $DatosAuteurs=array();
        $select='*';
        $set = array();
        generarPDFAsistencia($idActa);
        if (
            sql_countsel('sena_asistencias','idActa="'.$idActa.'" AND entidad="senaV1"') > 0
        ) {
            $app=new Apis('sena_asistencias');
            $Asistentes=$app->consultadatos('idActa="'.$idActa.'" AND entidad="'.$entidad.'"',$select);

            $data = array("data"=>$Asistentes);
            $var = var2js($data);
            echo $var;
        } else {
            $records[] = array('idActa'=>1,
                'nombresApellidos'=>'No existen registros',
                'documento'=>'',
                'dependencia'=>'');
            $data = array("data"=>$records);
            $var = var2js($data);
            echo $var;
        }
        break;
		case 'ConsultarAsistentes':	
			$entidad = base64_decode($_POST['entidad']);
			$DatosAuteurs=array();
			$select='*';
			$set = array();	
			$sql = sql_select("COUNT(*) AS total",'sena_asistencias','entidad="'.$entidad.'"');
				while ($row = sql_fetch($sql)) {	
					$total = $row['total'];
				}
				if($total >= 1){
					$app=new Apis('sena_asistencias');
					$Asistentes=$app->consultadatos('entidad="'.$entidad.'"',$select);				
					$data = array("data"=>$Asistentes);
					$var = var2js($data);
					echo $var;
				}else{
					$records[] = array('idActa'=>1,
					'nombresApellidos'=>'No existen registros',
					'documento'=>'',
					'dependencia'=>'');
					$data = array("data"=>$records);
					$var = var2js($data);	
					echo $var;							
				}						
		break;   
    case 'deleteAsistente':
 
        $id_asistencia = isset($_GET['id']) ? base64_decode($_GET['id']) : base64_decode($_POST['id']);
        sql_delete("sena_asistencias","id_asistencia =" . intval($id_asistencia));

        $res = sql_select("*", "sena_asistencias", "id_asistencia =" . intval($id_asistencia));
        if ($res){
            $msg[] = array('menssage'=>'OK. El Registro '.$id_asistencia.' fue eliminado correctamente!','status' => '200');
        }
        $var = var2js($msg);
        echo $var;
        break;
    case 'addConceptos':
        $app=new Apis('sena_actas_conceptos');
        $variablesAVerificar=array();
        $chartic=array();

        // Validate and decode all necessary variables
        $postKeys = ['entidad','idUsuario', 'idActa', 'idSolicitud', 'idConcepto', 0, 1, 2, 3, 4];
        $decodedPost = [];
        foreach ($postKeys as $key) {
            if (isset($_POST[$key])) {
                $decodedPost[$key] = isset($_GET[$key]) ? base64_decode($_GET[$key]) : base64_decode($_POST[$key]);
                if ($decodedPost[$key] === false) {
                    $decodedPost[$key] = "Error: Invalid base64 encoding for key $key.";
                }
            } else {
                // Handle missing keys
                $decodedPost[$key] = null;
            }
        }
        $variablesAVerificar = [
            'idConcepto' => $decodedPost['idConcepto'],
            'idActa' => $decodedPost['idActa'],
            'idSolicitud' => $decodedPost['idSolicitud'],
            'entidad' => $decodedPost['entidad'],
            'idUsuario' => $decodedPost['idUsuario'],
        ];

        $mensajeError = $app->verificarVariables($variablesAVerificar);
        if ($mensajeError !== null) {
        $arrayMensage[]=array('id'=>1,'message'=>'::ERROR-001:: '.$mensajeError.'','status'=>'404');
        }else{
            $sql = sql_select("COUNT(*) AS total",'sena_actas_conceptos','idActa="'.$decodedPost['idActa'].'" AND idSolicitud="'.$decodedPost['idSolicitud'].'"');
            while ($row = sql_fetch($sql)) {
                $total = $row['total'];
            }
            if($total >= 1){
                $sql2 = sql_select("idConcepto",'sena_actas_conceptos','idActa="'.$decodedPost['idActa'].'" AND idSolicitud="'.$decodedPost['idSolicitud'].'"');
                while ($row2 = sql_fetch($sql2)) {
                    $idConcepto = $row2['idConcepto'];
                }
                switch (base64_decode($_POST['idConcepto'])) {
                    case '1':
                        $chartic = [
                            'hechos' =>isset($_GET[0]) ? base64_decode($_GET[0]) : base64_decode($_POST[0]),
                        ];
                        break;
                    case '2':
                        $chartic = [
                            'contemplacion' =>isset($_GET[1]) ? base64_decode($_GET[1]) : base64_decode($_POST[1]),
                        ];
                        break;
                    case '3':
                        $chartic = [
                            'frenteHechos' =>isset($_GET[2]) ? base64_decode($_GET[2]) : base64_decode($_POST[2]),
                        ];
                        break;
                    case '4':
                        $chartic = [
                            'recomendacion' =>isset($_GET[3]) ? base64_decode($_GET[3]) : base64_decode($_POST[3]),
                        ];
                        break;
                    case '5':
                        $chartic = [
                            'compromisos' =>isset($_GET[4]) ? base64_decode($_GET[4]) : base64_decode($_POST[4]),
                        ];
                        break;
                }

                $chartic = pipeline('pre_insertion',
                    array(
                        'args' => array(
                            'table' => 'sena_actas_conceptos',
                        ),
                        'data' => $chartic
                    )
                );
                sql_updateq('sena_actas_conceptos',$chartic,"idConcepto=" . intval($idConcepto) . "");
                pipeline('post_insertion',
                    array(
                        'args' => array(
                            'table' =>'sena_actas_conceptos',
                            'id_objet' => $idConcepto
                        ),
                        'data' => $chartic
                    )
                );
                crearPdfActa($decodedPost['idActa']);
                $arrayMensage[]=array(
                    'id'=>1,
                    'message'=>'::OK:: Conceptos Actualizados!',
                    'status'=>'202');
                $var = var2js($arrayMensage);
                echo $var;
            } else {
                $chartic = [
                    'idActa' => $decodedPost['idActa'],
                    'idSolicitud' => $decodedPost['idSolicitud'],
                    'hechos' => isset($_GET[0]) ? base64_decode($_GET[0]) : base64_decode($_POST[0]),
                    'contemplacion' => isset($_GET[1]) ? base64_decode($_GET[1]) : base64_decode($_POST[1]),
                    'frenteHechos' => isset($_GET[2]) ? base64_decode($_GET[2]) : base64_decode($_POST[2]),
                    'recomendacion' =>isset($_GET[3]) ? base64_decode($_GET[3]) : base64_decode($_POST[3]),
                    'compromisos' => isset($_GET[4]) ? base64_decode($_GET[4]) : base64_decode($_POST[4]),
                    'entidad' =>  ($decodedPost['entidad']),
                ];
                $chartic = pipeline('pre_insertion',
                    array(
                        'args' => array(
                            'table' => 'sena_actas_conceptos',
                        ),
                        'data' => $chartic
                    )
                );
                $idConcepto =@sql_insertq('sena_actas_conceptos',$chartic);

                pipeline('post_insertion',
                    array(
                        'args' => array(
                            'table' =>'sena_actas_conceptos',
                            'id_objet' => $idConcepto
                        ),
                        'data' => $chartic
                    )
                );
                $arrayMensage[]=array(
                    'id'=>1,
                    'message'=>'::OK:: Conceptos registrado!',
                    'status'=>'202');
                crearPdfActa($decodedPost['idActa']);
                $var = var2js($arrayMensage);
                echo $var;
            }
        }
        break;
    case 'listarConceptos':
        $idActa = isset($_GET['idActa']) ? base64_decode($_GET['idActa']) : base64_decode($_POST['idActa']);
        $idSolicitud = isset($_GET['idSolicitud']) ? base64_decode($_GET['idSolicitud']) : base64_decode($_POST['idSolicitud']);

        $DatosAuteurs=array();
        $select='*';
        $set = array();
        if(!empty($idActa)){
            if (sql_countsel('sena_actas_conceptos','idActa="'.$idActa.'" AND idSolicitud="'.$idSolicitud.'" AND entidad="'.$entidad.'"')) {
                $app=new Apis('sena_actas_conceptos');
                $row2=$app->consultadatos('idActa="'.$idActa.'" AND idSolicitud="'.$idSolicitud.'" AND entidad="'.$entidad.'"',$select);
                foreach($row2 as $a => $val){
                    $chartic[] =array(
                        'hechos' => !empty($val['hechos']) ? $val['hechos']:'',
                        'contemplacion' => !empty($val['contemplacion']) ? $val['contemplacion'] :'',
                        'frenteHechos' => !empty($val['frenteHechos']) ? $val['frenteHechos']:'',
                        'recomendacion' => !empty($val['recomendacion']) ? $val['recomendacion']:'',
                        'compromisos' => !empty($val['compromisos']) ? $val['compromisos']:'',
                    );
                }
                $data = array("data"=>$chartic);
                $var = var2js($data);
                echo $var;
            } else {
                $records[] = array('idActa'=>1,
                    'hechos'=>'',
                    'contemplacion'=>'',
                    'frenteHechos'=>'',
                    'recomendacion'=>'',
                    'compromisos'=>'');
                $data = array("data"=>$records);
                $var = var2js($data);
                echo $var;
            }
        } else {
            $records[] = array('idActa'=>1,
                'hechos'=>'',
                'contemplacion'=>'',
                'frenteHechos'=>'',
                'recomendacion'=>'',
                'compromisos'=>'');
            $data = array("data"=>$records);
            $var = var2js($data);
            echo $var;
        }
        break;
}

?>
