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

function formulaires_configurer_urls_charger_dist() {
	if (isset($GLOBALS['type_urls'])) // priorité au fichier d'options
	{
		return "<p>" . _T('urls:erreur_config_url_forcee') . "</p>";
	}

	$valeurs = array(
		'type_urls' => $GLOBALS['meta']['type_urls'],
		'urls_activer_controle' => (isset($GLOBALS['meta']['urls_activer_controle']) ? $GLOBALS['meta']['urls_activer_controle'] : ''),
		'_urls_dispos' => type_urls_lister(),
	);

	return $valeurs;

}

function formulaires_configurer_urls_traiter_dist() {
	ecrire_meta('type_urls', _request('type_urls'));
	ecrire_meta('urls_activer_controle', _request('urls_activer_controle') ? 'oui' : 'non');

	return array('message_ok' => _T('config_info_enregistree'), 'editable' => true);
}

function type_urls_lister() {

	$dispo = array();
	foreach (find_all_in_path('urls/', '\w+\.php$', array()) as $f) {
		$r = basename($f, '.php');
		if ($r == 'index' or strncmp('generer_', $r, 8) == 0 or $r == "standard") {
			continue;
		}
		include_once $f;
		$exemple = 'URLS_' . strtoupper($r) . '_EXEMPLE';
		$exemple = defined($exemple) ? constant($exemple) : '?';
		$dispo[_T("urls:titre_type_$r")] = array($r, _T("urls:titre_type_$r"), $exemple);
	}

	ksort($dispo);

	return $dispo;
}
