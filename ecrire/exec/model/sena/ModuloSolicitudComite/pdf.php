<?php
/***************************************************************************\
 *  SPIP, Système de publication pour l'internet                           *
 *                                                                         *
 *  Copyright © avec tendresse depuis 2001                                 *
 *  Arnaud Martin, Antoine Pitrou, Philippe Rivière, Emmanuel Saint-James  *
 *                                                                         *
 *  Ce programme est un logiciel libre distribué sous licence GNU/GPL.     *
 *  Pour plus de détails voir le fichier COPYING.txt ou l'aide en ligne.   *
\***************************************************************************/

/**
 * Gestion de la recherche ajax du mini navigateur de rubriques
 *
 * Cette possibilité de recherche apparaît s'il y a beaucoup de rubriques dans le site.
 *
 * @package SPIP\Core\Rechercher
 **/
if (!defined('_ECRIRE_INC_VERSION')) {
	return;
}
		$codigoSc=$_POST['codigoFicha'] ? $_POST['codigoFicha'] : $codigoFicha;
		include_spip('base/connect_sql');
		include_spip('exec/model/claseapi');	
		require('fpdf.php');	


					// Creación del objeto de la clase heredada
					$pdf = new PDF();
					$pdf->AliasNbPages();
					$pdf->AddPage('P','Legal');
					$pdf->Contenido();
					$pdf->Output('F',''.$codigoSc.'.pdf');
					 
					$pdf='../ecrire/'.$codigoSc.'.pdf';
					if (@file_exists($pdf)){
						$newLocation = '../ecrire/exec/model/sena/ModuloSolicitudComite/pdf/sc/'.$codigoSc.'.pdf';
						$moved = rename($pdf, $newLocation);
						if($moved)
						  {
							spip_unlink($pdf);
							$arrayMensage[]=array('id'=>1,'message'=>'::OK::FUE MOVIDO','status'=>'202');
						  }						
					}else{
						$arrayMensage[]=array('id'=>1,'message'=>'::ERROR:','status'=>'404');	
					}
				echo var2js($arrayMensage);
?>