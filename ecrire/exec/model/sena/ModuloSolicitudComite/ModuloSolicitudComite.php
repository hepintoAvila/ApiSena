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

 use Spip\Chiffrer\SpipCles;

if (!defined('_ECRIRE_INC_VERSION')) {
	return;
}
		include_spip('base/connect_sql');
		include_spip('inc/filtres_ecrire');
		include_spip('inc/filtres');
		include_spip('inc/utils');
		include_spip('inc/json');
		include_spip('exec/model/sena/claseapi');	
	
		 
		$opcion = isset($_GET['opcion']) ? base64_decode($_GET['opcion']) : base64_decode($_POST['opcion']);
		
		switch($opcion) {
				case "listaAprendices":
					include_spip('exec/model/sena/ModuloSolicitudComite/listaAprendices');
				break;
				case "add_solicitud":
				case "updateSolicitud":
				case "add_documentos":				
				include_spip('exec/model/sena/ModuloSolicitudComite/editorsolicitud');
				break;
				case "ConsultarSolicitud":
				include_spip('exec/model/sena/ModuloSolicitudComite/consultarsolicitud');
				break;
				case "ConsultarPdf":
				case "ActualicePdfSolicitud":
				include_spip('exec/model/sena/ModuloSolicitudComite/pdf/actualicepdfsolicitud');
				break;
				case "deleteSolicitud":
				include_spip('exec/model/sena/ModuloSolicitudComite/deleteSolicitud');
				break;
				case "querySolicitudByUser":
					include_spip('exec/model/sena/ModuloSolicitudComite/querySolicitudByUser');
				break;
		}
 
?>
  
 