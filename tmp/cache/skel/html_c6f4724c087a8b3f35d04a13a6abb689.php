<?php

/*
 * Squelette : ../prive/formulaires/inc-logo_auteur.html
 * Date :      Thu, 08 Jul 2021 23:10:08 GMT
 * Compile :   Fri, 10 May 2024 16:28:55 GMT
 * Boucles :   
 */ 
//
// Fonction principale du squelette ../prive/formulaires/inc-logo_auteur.html
// Temps de compilation total: 62.450 ms
//

function html_c6f4724c087a8b3f35d04a13a6abb689($Cache, $Pile, $doublons = array(), $Numrows = array(), $SP = 0) {

	if (isset($Pile[0]["doublons"]) AND is_array($Pile[0]["doublons"]))
		$doublons = nettoyer_env_doublons($Pile[0]["doublons"]);

	$connect = '';
	$page = (
'<'.'?php header(' . _q((	'Content-type:text/html;charset=' .
	interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'charset', null),true)))) . '); ?'.'>' .
filtrer('image_graver',filtrer('image_recadre_avec_fallback',quete_html_logo(quete_logo('id_auteur', 'ON', @$Pile[0]['id_auteur'],'', 0), '', ''),'200','200')) .
'
');

	return analyse_resultat_skel('html_c6f4724c087a8b3f35d04a13a6abb689', $Cache, $page, '../prive/formulaires/inc-logo_auteur.html');
}
?>