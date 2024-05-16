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

if (!defined('_ECRIRE_INC_VERSION')) {
	return;
}


function urls_is_url_editable($objet, $id_objet, $serveur='') {
	include_spip('base/objets');

	// si l'objet est publie, l'url est editable
	if (objet_test_si_publie($objet, $id_objet)) {
		return true;
	}

	// si l'objet est propose, l'url est editable
	// TODO : il faudrait tester que l'objet et previsualisable en fait
	$statut = generer_info_entite($id_objet, $objet, 'statut');

	if ($statut === 'prop') {
		return true;
	}

	// si il y a des urls existantes, l'url est editable
	if (sql_countsel('spip_urls', 'type='.sql_quote($objet).' AND id_objet='.intval($id_objet))) {
		return true;
	}

	return false;
}
