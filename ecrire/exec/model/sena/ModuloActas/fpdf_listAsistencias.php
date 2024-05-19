<?php
require('../ecrire/exec/model/sena/ModuloActas/fpdf.php');

class PDF extends FPDF
{
    // Cabecera de página
    function Header()
    {
        $logo = '../ecrire/exec/model/sena/ModuloActas/pdf/logo.png';
        $logo_sena = '../ecrire/exec/model/sena/ModuloActas/pdf/logo_sena.png';

        // Arial bold 15
        $this->SetFont('Arial', 'B', 15);

        // Movernos a la derecha
        $this->Cell(80);

        // Logo
        $this->Rect(10, 10, 30, 30, 'D');
        $this->Image($logo, 15, 15, 20);

        // Títulos
        $titulo1 = utf8_decode('REGISTRO DE ASISTENCIA Y APROBACIÓN');
        $titulo1_1 = utf8_decode('ACTA No.');
        $titulo2 = utf8_decode('Proceso: Gestión de la Formación Profesional Integral');
        $titulo3 = utf8_decode('Procedimiento: Ejecución de la Formación Profesional Integral');
        $titulo4 = utf8_decode('COMITÉ DE EVALUACIÓN Y SEGUIMIENTO DE LA ETAPA LECTIVA Y PRODUCTIVA');

        // Centrar título
		$length = $this->GetStringWidth($titulo1);
		$this->Cell($length-80,10,$titulo1,0,0,'C');
		$this->Ln(6);
		$this->Cell($length+70,10,$titulo1_1,0,0,'C');
		$this->SetFont('Arial','',12);
		$this->Ln(8);
		$this->Cell(200,10,$titulo2,0,0,'C');
		$this->Ln(6);
		$this->Cell(200,10,$titulo3,0,0,'C');

		// Salto de línea
		$this->Cell(80);
		$this->Rect(10,10,190,330,'D');
		$this->Image($logo_sena,175,15,20);
		$this->Rect(170,10,30,30,'D');
		$this->Ln(10);
		//$this->Rect(10,40,190,10,'D');
		$this->MultiCell(190,10,$titulo4,1,'C');
		$this->Ln(2);				
    }

    // Tabla coloreada
    function FancyTable($header, $data, $columnWidths)
    {
        // Validación de la estructura de los datos
        if (!is_array($header) || !is_array($data) || !is_array($columnWidths)) {
            throw new InvalidArgumentException("Se esperaban arrays para los parámetros header, data y columnWidths.");
        }

        // Colores, ancho de línea y fuente en negrita rgba (234, 238, 241, 1)
        $this->SetFillColor(162, 198, 151, 1);
        $this->SetTextColor(255);
        $this->SetDrawColor(94, 179, 25);
        $this->SetLineWidth(.3);
        $this->SetFont('', 'B');

        // Cabecera
        foreach ($header as $i => $col) {
            $this->Cell($columnWidths[$i], 7, $col, 1, 0, 'C', true);
        }
        $this->Ln();

        // Restauración de colores y fuentes
        $this->SetFillColor(255);
        $this->SetTextColor(0);
        $this->SetFont('');

        // Datos
        $fill = false;
        foreach ($data as $row) {
            if (!is_array($row)) {
                continue; // Saltar si no es un array
            }

            foreach ($row as $i => $col) {
                if (!isset($columnWidths[$i])) {
                    continue; // Saltar si no hay ancho de columna definido
                }
                $this->Cell($columnWidths[$i], 6, utf8_decode($col), 'LR', 0, 'L', $fill);
            }
            $this->Ln();
            $fill = !$fill;
        }

        // Línea de cierre
        $this->Cell(array_sum($columnWidths), 0, '', 'T');
        $this->Ln();
    }

    function SimpleTable($header, $data, $columnWidths)
    {
        $this->FancyTable($header, $data, $columnWidths);
    }

    function SingleColumnTable($header)
    {
        $this->FancyTable($header, [], [190]);
    }
}

?>
