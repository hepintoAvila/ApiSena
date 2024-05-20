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
        $this->Rect(180, 10, 30, 38, 'D');
        $this->Image($logo, 185, 15, 20);

        // Títulos
        $titulo1 = utf8_decode('ACTA No.');
        $titulo1_1 = utf8_decode('NOMBRE DEL COMITÉ O DE LA REUNIÓN:');
        $titulo1_1_SUB = utf8_decode('ACTA DEL COMITÉ DE EVALUACIÓN Y SEGUIMIENTO');
        $Tex_Cuadro1 = utf8_decode('CIUDAD Y FECHA:');
        $Tex_Cuadro1_sub = utf8_decode('Bucaramanga, septiembre 13 de 2023');
        $Tex_Cuadro2 = utf8_decode('HORA INICIO:');
        $Tex_Cuadro2_sub = utf8_decode('8: 00 am');
        $Tex_Cuadro3 = utf8_decode('HORA FIN:');
        $Tex_Cuadro3_sub = utf8_decode('5: 00 am');
        $Tex_Cuadro4 = utf8_decode('LUGAR Y/O ENLACE:');
        $Tex_Cuadro4_sub = utf8_decode('Centro de Servicios Empresariales y Turísticos, Auditorio Polivalente');
        
        $Tex_Cuadro5 = utf8_decode('DIRECCIÓN GENERAL / REGIONAL / CENTRO:');
        $Tex_Cuadro5_sub = utf8_decode('Centro de Servicios Empresariales y Turísticos');
        
        // Centrar título

        $this->Cell(5);//mover la cerlda
		$this->Cell(40,10,$titulo1,0,0,'C');
		$this->Ln(8);
        $this->Cell(30);//mover la cerlda
		$this->Cell(140,10,$titulo1_1,1,0,'C');
		$this->SetFont('Arial','',12);
		$this->Ln(9);
       // MultiCell(float w, float h, string txt [, mixed border [, string align [, boolean fill]]])
      // Rect(float x, float y, float w, float h [, string style])
		//PRIMER CUADRO
        $this->MultiCell(100,10,$Tex_Cuadro1,0,'C');
        //$this->Ln(-5);
        $this->Cell(30);//mover la cerlda
        $this->MultiCell(70,5,$Tex_Cuadro1_sub,0,'L');
        //SEGUNDO CUADRO
        $this->Ln(-20);
        $this->Cell(95);//mover la cerlda
        $this->Cell(40,10,$Tex_Cuadro2,0,0,'C');
        $this->Ln(8);
        $this->Cell(95);//mover la cerlda
        $this->Cell(40,10,$Tex_Cuadro2_sub,0,0,'C');
        $this->Rect(105,28,35,20,'D');
        //SEGUNDO TRES
        $this->Ln(-8);
        $this->Cell(130);//mover la cerlda
        $this->Cell(40,10,$Tex_Cuadro3,0,0,'C');
        $this->Ln(8);
        $this->Cell(130);//mover la cerlda
        $this->Cell(40,10,$Tex_Cuadro3_sub,0,0,'C');
        //$this->Rect(220,28,100,20,'D');
         //LUGAR Y/O ENLACE
         $this->Ln(15);
         $this->Cell(5);//mover la cerlda
         $this->Cell(80,10,$Tex_Cuadro4,0,0,'L');
         $this->Ln(8);
         $this->Cell(5);//mover la cerlda      
         $this->MultiCell(98,5,$Tex_Cuadro4_sub,0,'L');
         $this->Rect(10,48,95,25,'D');
         $this->Ln(-18);
        //DIRECCIÓN GENERAL / REGIONAL / CENTRO
        $this->Cell(100);//mover la cerlda
        $this->Cell(98,10,$Tex_Cuadro5,0,0,'L');
        $this->Ln(5);
        $this->Cell(100);//mover la cerlda      
        $this->MultiCell(98,10,$Tex_Cuadro5_sub,0,'L');
        $this->Rect(105,48,105,25,'D');
		// Salto de línea
		$this->Cell(80);
        //cuadro general, de toda la hoja
		$this->Rect(10,10,200,330,'D');
        //logo izq
		$this->Image($logo_sena,15,15,20);
        //cuadro del logo
		$this->Rect(10,10,30,38,'D');      
		//$this->Cell(80,10,"AGENDA O PUNTOS PARA DESARROLLAR:",0,0,'L');	
        $this->Ln(15);	
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
    function Contenido(){
        $titulo1 = utf8_decode('AGENDA O PUNTOS PARA DESARROLLAR:');
        $titulo2 = utf8_decode('1. Presentación');
        $titulo3 = utf8_decode('2. Estudio casos de comité de los siguientes aprendices:');
        $titulo4 = utf8_decode('1. Presentación, saludo de bienvenida');
        $titulo5 = utf8_decode('Siendo las 08:00 am del día 13 de septiembre de 2023, se reúne el Comité de Evaluación y Seguimiento de Aprendices, con el fin de analizar el rendimiento y desempeño de la etapa lectiva y productiva del Centro de Servicios Empresariales y Turísticos. A este comité asisten quienes se encuentran relacionados con su información personal en la planilla de asistencia que contiene este documento, ejerciendo las funciones de secretario de la reunión la Coordinadora Académica Doris Vargas. ');
        $titulo6 = utf8_decode('2. Estudios casos de Comité');
        $titulo7 = utf8_decode('JUAN CARLOS BARRIOS AVILA');
        $titulo8 = utf8_decode('TECNOLOGO EN GESTION DE MERCADOS');
        $titulo9 = utf8_decode('Ficha: 2513170');
        $titulo10 = utf8_decode('Correo: Maira5@gmail.con');
        $titulo11 = utf8_decode('Teléfono: 312248525');
        $titulo12 = utf8_decode('Hechos:');
        $titulo13 = utf8_decode('El instructor informa inconvenientes presentados en el desarrollo de la etapa lectiva La aprendiz no presentó evidencia de producto de la guía');
        $titulo14 = utf8_decode('Contemplación del Caso:');
        $titulo15 = utf8_decode('La aprendiz XXX presenta al comité de evaluación y seguimiento según citación enviada. La Coordinadora académica Doris presenta el caso y a los miembros del comité, según información reportada por el Instructor xxxxxx quien indica que xxxx');
        $titulo16 = utf8_decode('Frente a los hechos:');
        $titulo17 = utf8_decode('La aprendiz XXX se presenta al comité de evaluación y seguimiento según citación enviada, la coordinadora académica Doris le pregunta al aprendiz si sabe porque fue citada al comité, Se le pregunta al aprendiz que, sí es clara la información entregada en el comité de evaluación y seguimiento, manifiesta que sí, igualmente se le informa que al correo registrado en el aplicativo le llega la recomendación del comité.');
        $titulo18 = utf8_decode('Recomendación del Caso:');
        $titulo19 = utf8_decode(strtoupper('CONDICIONAMIENTO DE REGISTRO DE MATRICULA POR INDOLE ACADEMICO Y DISCIPLINARIO, REPETIR COMPETENCIA DE EMPRENDIMIENTO EN CONTRA JORNADA CON LA INSTRUCTORA xxxxx'));
        $titulo20 = utf8_decode('COMPROMISOS');

        $r1  = 10;
        $r2  = $r1 + 120;
        $y1  = 75;
        $y2  = $y1;
        $this->SetXY($r1+10, $y1);
        $this->Cell($r1+10,4, $titulo1);
        $this->Ln();
        $this->Ln();
        $this->Ln();
        $this->Cell(10);
        $this->Cell($r1+10,4, $titulo2);
        $this->Ln();
        $this->Ln();
        $this->Cell(10);
        $this->Cell($r1+9,4, $titulo3);
        $this->Ln();
        for($i = 1; $i < count($this->dataApr); ++$i) {
            $this->SimpleTable($this->header1,$this->dataApr[$i],$this->w1);
            $this->ln(2.5);
            } 
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial','B', 12);  
        $this->Cell($r1+9,4, $titulo4);    
        $this->Ln();    
        $this->Ln(); 
        
        $this->Cell(10);
        $this->SetFont('Arial', '', 10);   
        $this->MultiCell(180,5,$titulo5,0,'J');
        $this->Ln();   
        $this->Ln();
        $this->Cell(10); 
        $this->SetFont('Arial','B', 12); 
        $this->Cell($r1+9,4, $titulo6);  
        $this->Ln();   
        $this->Ln();       
        $this->Cell(10);
        $this->SetFont('Arial', '', 10); 
        $this->Cell($r1+9,4, $titulo7);
        $this->Ln();
        $this->Cell(10); 
        $this->Cell($r1+9,4, $titulo8);
        $this->Ln(); 
        $this->Cell(10);
        $this->Cell($r1+9,4, $titulo9);
        $this->Ln();
        $this->Cell(10);
        $this->Cell($r1+9,4, $titulo10);
        $this->Ln(); 
        $this->Cell(10);
        $this->Cell($r1+9,4, $titulo11);
        $this->Ln(); 
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial','B', 12); 
        $this->Cell($r1+9,4, $titulo12);
        $this->Ln(); 
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial', '', 10);
        $this->MultiCell(180,5,$titulo13,0,'J');
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial','B', 12); 
        $this->Cell($r1+9,4, $titulo14);
        $this->Ln(); 
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial', '', 10);
        $this->MultiCell(180,5,$titulo15,0,'J');
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial','B', 12);
        $this->Cell($r1+9,4, $titulo16);
        $this->Ln(); 
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial', '', 10);
        $this->MultiCell(180,5,$titulo17,0,'J');
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial','B', 12);
        $this->Cell($r1+9,4, $titulo18);
        $this->Ln(); 
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial', 'B', 10);
        $this->MultiCell(180,5,$titulo19,0,'J');
        $this->Ln(); 
        $this->Cell(10);
        $this->SetFont('Arial','B', 12);
        $this->Cell($r1+9,4, $titulo20);
    }

    function Footer()
    {
        // Posición: a 1,5 cm del final
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial','I',8);
        // Número de página
        $this->Cell(0,10,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'C');
    }
}

?>
