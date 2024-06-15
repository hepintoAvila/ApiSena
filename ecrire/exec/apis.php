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
use Spip\Chiffrer\SpipCles;

if (!defined('_ECRIRE_INC_VERSION')) {
	return;
}
		include_spip('base/connect_sql');
		include_spip('exec/model/claseapi');	
		include_spip('fpdf.php');	
		include_spip('inc/utils');
		header("Content-Type: application/json");
	

function exec_apis_dist(){
			$accion = isset($_GET['accion']) ? base64_decode($_GET['accion']) : base64_decode($_POST['accion']);
			
		switch($accion) {	
				case "auteur":
					include_spip('exec/model/apis/consultarusuario/consultarusuario');		    
				break;
				case "menu":
					include_spip('exec/model/apis/menu/menu');		    
				break;
				case "AdminUsuarios":
					include_spip('exec/model/apis/adminusuarios/adminusuarios');	
				break;
				case "AdminRoles":
					include_spip('exec/model/apis/adminroles/adminroles'); 	
				break;
				case "GestionMenu":
					include_spip('exec/model/apis/gestionmenu/gestionmenu');	
				break;
				case "permisos":
					include_spip('exec/model/apis/permisos/permisos');
			    case "ModuloNotificaciones":
					include_spip('exec/model/sena/ModuloNotificaciones/agendarCitas/agendarCitas');		        
				break;
			    case "ModuloHistorial":
					include_spip('exec/model/sena/ModuloHistorial/historial');		        
				break;	
				case "ModuloSolicitudComite":
				case "ModuloEnviarComite":
					include_spip('exec/model/sena/ModuloSolicitudComite/ModuloSolicitudComite');	
				break;
				case "ModuloAprendiz":
					include_spip('exec/model/sena/ModuloAprendiz/aprendiz');	
				break;
				case "ModuloActas":
					include_spip('exec/model/sena/ModuloActas/actas');	
				break;
		}
}
?>