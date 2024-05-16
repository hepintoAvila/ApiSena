<?php

/*
 * Squelette : prive/login.html
 * Date :      Thu, 08 Jul 2021 23:10:08 GMT
 * Compile :   Fri, 10 May 2024 15:20:29 GMT
 * Boucles :   
 */ 
//
// Fonction principale du squelette prive/login.html
// Temps de compilation total: 35.552 ms
//

function html_8bf575b44ede8bfc88f234bd8e600097($Cache, $Pile, $doublons = array(), $Numrows = array(), $SP = 0) {

	if (isset($Pile[0]["doublons"]) AND is_array($Pile[0]["doublons"]))
		$doublons = nettoyer_env_doublons($Pile[0]["doublons"]);

	$connect = '';
	$page = (
'<' . '?php header("X-Spip-Filtre: '.'compacte_head' . '"); ?'.'>
' .
'<'.'?php header(' . _q((	'Content-Type: text/html; charset=' .
	interdire_scripts($GLOBALS['meta']['charset']))) . '); ?'.'><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="' .
spip_htmlentities(@$Pile[0]['lang'] ? @$Pile[0]['lang'] : $GLOBALS['spip_lang']) .
'" lang="' .
spip_htmlentities(@$Pile[0]['lang'] ? @$Pile[0]['lang'] : $GLOBALS['spip_lang']) .
'" dir="' .
lang_dir(@$Pile[0]['lang'], 'ltr','rtl') .
'">
<head>
<title>' .
interdire_scripts(textebrut(typo($GLOBALS['meta']['nom_site'], "TYPO", $connect, $Pile[0]))) .
'</title>
<meta http-equiv="Content-Type" content="text/html; charset=' .
interdire_scripts($GLOBALS['meta']['charset']) .
'" />
<meta name="robots" content="none" />
<meta name="viewport" content="width=device-width" />
' .
pipeline('insert_head_css','<!-- insert_head_css -->') .
'
<link rel="stylesheet" href="' .
direction_css(find_in_theme('reset.css')) .
'" type="text/css" />
<link rel="stylesheet" href="' .
direction_css(find_in_theme('clear.css')) .
'" type="text/css" />
<link rel="stylesheet" href="' .
direction_css(find_in_theme('minipres.css')) .
'" type="text/css" />
<link rel="stylesheet" href="' .
direction_css(find_in_theme('login_prive.css')) .
'" type="text/css" />
' .
'<'.'?php header("X-Spip-Filtre: insert_head_css_conditionnel"); ?'.'>'. pipeline('insert_head','<!-- insert_head -->') .
'
<script type=\'text/javascript\'>
jQuery(function(){jQuery(\'a#spip_pass\').click(function(){window.open(this.href, \'spip_pass\', \'scrollbars=yes, resizable=yes, width=480, height=380\'); return false;});});
</script>
<meta name="generator" content="SPIP' .
(($t1 = strval(spip_version()))!=='' ?
		(' ' . $t1) :
		'') .
'" />
' .
vide($Pile['vars'][$_zzz=(string)'logo'] = chemin_image(concat((defined('_DIR_IMG')?constant('_DIR_IMG'):''),'spip_fond_login.jpg'))) .
(($t1 = strval(interdire_scripts((((include_spip('inc/config')?lire_config('couleur_login',null,false):'')) ?' ' :''))))!=='' ?
		($t1 . (	'
	' .
	vide($Pile['vars'][$_zzz=(string)'hs'] = interdire_scripts(filtrer('couleur_hex_to_hsl',(include_spip('inc/config')?lire_config('couleur_login',null,false):''),'h, s'))) .
	vide($Pile['vars'][$_zzz=(string)'l'] = interdire_scripts(filtrer('couleur_hex_to_hsl',(include_spip('inc/config')?lire_config('couleur_login',null,false):''),'l'))))) :
		'') .
'
<style type="text/css">
.page_login {
	' .
(($t1 = strval(timestamp(table_valeur($Pile["vars"], (string)'logo', null))))!=='' ?
		('background-image:url(' . $t1 . ');') :
		'') .
'
}
' .
(($t1 = strval(interdire_scripts((((include_spip('inc/config')?lire_config('couleur_login',null,false):'')) ?' ' :''))))!=='' ?
		($t1 . (	'
:root {
		--spip-login-color-theme--hs: ' .
	table_valeur($Pile["vars"], (string)'hs', null) .
	';
		--spip-login-color-theme--l: ' .
	table_valeur($Pile["vars"], (string)'l', null) .
	';
}
')) :
		'') .
'
</style>
</head>
<body class="page_login' .
(!(table_valeur($Pile["vars"], (string)'logo', null))  ?
		(' ' . ' sans_fond') :
		'') .
'">

	<h1>' .
interdire_scripts(typo($GLOBALS['meta']['nom_site'], "TYPO", $connect, $Pile[0])) .
'</h1>
	' .
(($t1 = strval((((((table_valeur(@$Pile[0], (string)'url', null)) ?'' :' ')) OR (filtre_match_dist(table_valeur(@$Pile[0], (string)'url', null),(	'^/?(.*/)?' .
		(defined('_DIR_RESTREINT_ABS')?constant('_DIR_RESTREINT_ABS'):''))))) ?' ' :'')))!=='' ?
		('
	' . $t1 . (	'
	<h3 class="spip">' .
	_T('public|spip|ecrire:login_acces_prive') .
	'</h3>
	' .
	executer_balise_dynamique('MENU_LANG_ECRIRE',
	array(spip_htmlentities(@$Pile[0]['lang'] ? @$Pile[0]['lang'] : $GLOBALS['spip_lang'])),
	array('prive/login.html','html_8bf575b44ede8bfc88f234bd8e600097','',37,$GLOBALS['spip_lang'])) .
	'
	')) :
		'') .
'

	' .
executer_balise_dynamique('FORMULAIRE_LOGIN',
	array(interdire_scripts(((($a = entites_html(table_valeur(@$Pile[0], (string)'url', null),true)) OR (is_string($a) AND strlen($a))) ? $a : generer_url_ecrire('accueil')))),
	array('prive/login.html','html_8bf575b44ede8bfc88f234bd8e600097','',20,$GLOBALS['spip_lang'])) .
'
	<p class="retour">
		' .
(($t1 = strval(tester_config(spip_htmlspecialchars(sinon($GLOBALS['meta']['adresse_site'],'.')),'1comite')))!=='' ?
		((	'<a href="' .
	interdire_scripts(generer_url_public('identifiants', 'focus=nom_inscription')) .
	'&amp;mode=') . $t1 . (	'">' .
	_T('public|spip|ecrire:login_sinscrire') .
	'</a> | ')) :
		'') .
'
		<a href="' .
spip_htmlspecialchars(sinon($GLOBALS['meta']['adresse_site'],'.')) .
'/">' .
_T('public|spip|ecrire:login_retoursitepublic') .
'</a>
	</p>
	' .
(($t1 = strval(filtre_balise_svg_dist(find_in_path('spip.svg'))))!=='' ?
		((	'<p class="generator">
		<a href="https://www.spip.net/" title="' .
	_T('public|spip|ecrire:site_realise_avec_spip') .
	'">') . $t1 . '</a>
	</p>') :
		'') .
'
	

</body>
</html>');

	return analyse_resultat_skel('html_8bf575b44ede8bfc88f234bd8e600097', $Cache, $page, 'prive/login.html');
}
?>