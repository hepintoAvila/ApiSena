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

// https://code.spip.net/@action_instituer_syndic_article_dist
function action_instituer_syndic_article_dist() {

	$securiser_action = charger_fonction('securiser_action', 'inc');
	$arg = $securiser_action();

	list($id_syndic_article, $statut) = preg_split('/\W/', $arg);

	if ($id_syndic_article = intval($id_syndic_article)
		and $id_syndic = sql_getfetsel('id_syndic', 'spip_syndic_articles',
			"id_syndic_article=" . intval($id_syndic_article))
		and autoriser('moderer', 'site', $id_syndic)
	) {
		sql_updateq("spip_syndic_articles", array("statut" => $statut), "id_syndic_article=" . intval($id_syndic_article));
	}

}
