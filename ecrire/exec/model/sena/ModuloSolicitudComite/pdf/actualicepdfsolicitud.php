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
		include_spip('inc/charsets');
		$codigoFicha = isset($_GET['codigoFicha']) ? base64_decode($_GET['codigoFicha']) : base64_decode($_POST['codigoFicha']);
		$tipo = isset($_GET['tipo']) ? base64_decode($_GET['tipo']) : base64_decode($_POST['tipo']);
		$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : base64_decode($_POST['entidad']);
		
		switch($tipo) {
				case "EnviarSolicitud":
						 $sql = sql_select("idSolicitud,
						 idAprendiz,
						 idInstructor,
						 tipoSolicitud,
						 hechos,
						 tipoAtencion,
						 fechaSolicitud,
						 maj,
						 nombrePrograma",'sena_solicitudcomite','entidad="'.$entidad.'" AND codigoFicha="'.$codigoFicha.'"');
								while ($row = sql_fetch($sql)) {			
									$idSolicitud= $row['idSolicitud'];			
									$idAprendiz= $row['idAprendiz'];			
									$idInstructor= $row['idInstructor'];			
									$nombrePrograma= $row['nombrePrograma'];			
									$tipoComite= $row['tipoSolicitud'];			
									$fechaSolicitud= $row['fechaSolicitud'];			
									$tipoAtencion= $row['tipoAtencion'];			
									$descripcion= !empty($row['hechos']) ? $row['hechos']:'';			
								  }	
 		
						 //DATOS DEL APRENDIZ
						 $sql2 = sql_select("nombres,apellidos,identificacion,telefono,correo,direccion",'sena_aprendiz','idAprendiz="'.$idAprendiz.'"');
								while ($row2 = sql_fetch($sql2)) {	
									$nombresApellidosAprendis = $row2['nombres'].' '.$row2['apellidos'];		
									$identificacion2= $row2['identificacion'];		
									$direccion2= $row2['direccion'];		
									$telefono2= $row2['telefono'];		
									$correo2= $row2['correo'];		
								  }	
 						 //DATOS DEL sena_instructor
						 $sql1 = sql_select("nombres,apellidos,identificacion,telefono,correo",'sena_instructor','idInstructor="'.$idInstructor.'"');
								while ($row1 = sql_fetch($sql1)) {	
									$nombresApellidosInstructor = $row1['nombres'].' '.$row1['apellidos'];		
									$identificacion1= $row1['identificacion'];			
									$telefono1= $row1['telefono'];		
									$correo1= $row1['correo'];		
								  }	
 						 //DATOS DEL sena_instructor
					$sql3 = sql_select("*",
					'sena_sancionesanteriores','idAprendiz="'.$idAprendiz.'"');
								while ($row3 = sql_fetch($sql3)) {	
									$academica= $row3['academica'] ? $row3['academica']:0;		
									$disciplinaria= !empty($row3['disciplinaria']) ? $row3['disciplinaria']:0;			
									$inasistencias= !empty($row3['inasistencias'])? $row3['inasistencias']:0;		
									$verbal= !empty($row3['verbal'])? $row3['verbal']:0;			
									$escrito= !empty($row3['escrito'])? $row3['escrito']:0;			
								  }	
								   
									$Aprendices= array(
										'disciplinaria'=>!empty($disciplinaria) ? $disciplinaria :'0',
										'academica'=>!empty($academica) ? $academica :'0',
										'inasistencias'=>!empty($inasistencias) ? $inasistencias :'0',
										'verbal'=>!empty($verbal) ? $verbal :'0',
										'escrito'=>!empty($escrito) ? $escrito :'0',
										); 
						//CREAMOS LA SOLICITUD EN PDF
									$path = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$codigoFicha.'.pdf';
									if (@file_exists($path)){
										spip_log("Supprimer ancien logo $codigoFicha", 'codigoFicha');
										spip_unlink($path);
									}
							 		
							require('../ecrire/exec/model/sena/ModuloSolicitudComite/fpdf.php');	
							// Creación del objeto de la clase heredada
							$tipoComiteAcademico = ($tipoComite==='ACADEMICO' || $tipoComite==='ACADEMICO Y DISCIPLINARIO') ? 'X':'';
							$tipoComiteDisciplinario = ($tipoComite==='DISCIPLINARIO' || $tipoComite==='ACADEMICO Y DISCIPLINARIO') ? 'X':'';
							$pdf = new PDF();
							$pdf->AliasNbPages();
							$pdf->AddPage('P','Legal');
							$pdf->sanciones=$Aprendices;
							$pdf->calificacion=$tipoAtencion;
							$pdf->descripcion="".$descripcion."";
							$pdf->tipoComiteAcademico=$tipoComiteAcademico;
							$pdf->tipoComiteDisciplinario=$tipoComiteDisciplinario;
							$pdf->fechaIncidente="".$fechaSolicitud."";
							$pdf->nombrePrograma="".$nombrePrograma."";
							$pdf->Aprendiz=array('idAprendiz'=>$idAprendiz,'nombres'=>$nombresApellidosAprendis,'identificacion'=>$identificacion2,'telefono'=>$telefono2,'correo'=>$correo2,'direccion'=>$direccion2,'jornada'=>'TARDE','ficha'=>'2619701');
							$pdf->Instructor=array('nombresInst'=>$nombresApellidosInstructor,'identificacionInst'=>$identificacion1,'telefonoInst'=>$telefono1,'correoInst'=>$correo1);
							$pdf->Contenido();
							$pdf->Output('F',''.$codigoFicha.'.pdf',true);
							$pdf='../ecrire/'.$codigoFicha.'.pdf';
							if (@file_exists($pdf)){
								$newLocation = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$codigoFicha.'.pdf';
								$moved = rename($pdf, $newLocation);
								if($moved)
								  {
									spip_unlink($pdf);
								  }						
							}
						   //FIN GENERA LA FICHA
							   
						$arrayMensage[]=array(
							'id'=>1,
							'message'=>'::OK:: Registro guardado correctamente'.$idSolicitud.'!',
							'status'=>'202');
						 
			echo var2js($arrayMensage);							
			break;
				
		};

						   
 
?>