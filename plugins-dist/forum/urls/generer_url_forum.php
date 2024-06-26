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

if (!defined("_ECRIRE_INC_VERSION")) {
	return;
}

function urls_generer_url_forum_dist($id_forum, $args = '', $ancre = '') {
	if ($id_forum = intval($id_forum)) {
		include_spip('inc/forum');
		list($type, $id, ) = racine_forum($id_forum);
		if ($type) {
			if (!$ancre) {
				$ancre = "forum$id_forum";
			}

			return generer_url_entite($id, $type, $args, $ancre, true);
		}
	}

	return '';
}
