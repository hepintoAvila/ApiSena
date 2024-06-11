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
        //$this->Rect(300, 10, 30, 30, 'D');
        $this->Image($logo, 320, 15, 20);

        // Títulos
        $titulo1 = utf8_decode('REGISTRO DE ASISTENCIA Y APROBACIÓN');
        $titulo1_1 = utf8_decode('ACTA No.'.$this->idActa.'');
        $titulo2 = utf8_decode('Proceso: Gestión de la Formación Profesional Integral');
        $titulo3 = utf8_decode('Procedimiento: Ejecución de la Formación Profesional Integral');
        $titulo4 = utf8_decode('COMITÉ DE EVALUACIÓN Y SEGUIMIENTO DE LA ETAPA LECTIVA Y PRODUCTIVA');

        // Centrar título
		$length = $this->GetStringWidth($titulo1);
	 	$this->Cell($length+60,10,$titulo1,0,0,'C');
		$this->Ln(6);
		$this->Cell(320,10,$titulo1_1,0,0,'C');
		$this->SetFont('Arial','',12);
		$this->Ln(8);
		$this->Cell(320,10,$titulo2,0,0,'C');
		$this->Ln(6);
		$this->Cell(320,10,$titulo3,0,0,'C');

		// Salto de línea
		$this->Cell(80);
		//$this->Rect(10,10,190,330,'D');
		$this->Image($logo_sena,15,15,20);
		//$this->Rect(300,10,30,30,'D');
		$this->Ln(10);
		//$this->Rect(10,40,190,10,'D');
		$this->MultiCell(320,10,$titulo4,0,'C');
		$this->Ln(2);				
    }
    // Tabla coloreada
    function FancyTable($header, $data)
    {
        // Colores, ancho de línea y fuente en negrita
        $this->SetFillColor(206,0,1);
        $this->SetTextColor(255);
        $this->SetDrawColor(206,0,1);
        $this->SetLineWidth(.3);
        $this->SetFont('','B');
        // Cabecera
        $w = array(8, 83, 10, 39, 75, 30, 25, 83);
        for($i=0;$i<count($header);$i++)
            $this->Cell($w[$i],7,$header[$i],1,0,'C',true);
        $this->Ln();
        // Restauración de colores y fuentes
        $this->SetFillColor(224,235,255);
        $this->SetTextColor(0);
        $this->SetFont('');
        // Datos
        $fill = false;
        $i=1;
        foreach($data as $row)
        {
            $this->Cell($w[0],6,number_format($i),'LR',0,'L',$fill);
            $this->Cell($w[1],6,$row['nombreAprendiz'],'LR',0,'L',$fill);
            $this->Cell($w[2],6,$row['tipoIdentificacion'],'LR',0,'L',$fill);
            $this->Cell($w[3],6,$row['identificacion'],'LR',0,'L',$fill);
            $this->Cell($w[4],6,$row['correo'],'LR',0,'L',$fill);
            $this->Cell($w[5],6,$row['telefono'],'LR',0,'L',$fill);
            $this->Cell($w[6],6,$row['ficha'],'LR',0,'L',$fill);
            $this->Cell($w[6],6,$row['programaFormacion'],'LR',0,'L',$fill);
           $this->Ln();
            $fill = !$fill;
            $i++;
        }
        // Línea de cierre
        $this->Cell(array_sum($w),0,'','T');
    }
     
    function BasicTable($header, $data)
    {
        // Cabecera
        foreach($header as $col)
            $this->Cell(40,7,$col,1);
        $this->Ln();
        // Datos
        foreach($data as $row)
        {
            foreach($row as $col)
                $this->Cell(40,6,$col,1);
            $this->Ln();
        }
    }
 
    function TableAprendices($data, $columnWidths)
    {
        // Colores, ancho de línea y fuente en negrita rgba (234, 238, 241, 1)
        $this->FancyTable($data, $columnWidths);
         
    }


}

?>
