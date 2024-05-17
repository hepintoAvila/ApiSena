<?php

/*
 * Squelette : prive/formulaires/menu_lang.html
 * Date :      Thu, 16 May 2024 20:21:50 GMT
 * Compile :   Thu, 16 May 2024 22:19:15 GMT
 * Boucles :   
 */ 
//
// Fonction principale du squelette prive/formulaires/menu_lang.html
// Temps de compilation total: 0.248 ms
//

function html_551510a8bbb5547d8e8d9a1c380c69c8($Cache, $Pile, $doublons = array(), $Numrows = array(), $SP = 0) {

	if (isset($Pile[0]["doublons"]) AND is_array($Pile[0]["doublons"]))
		$doublons = nettoyer_env_doublons($Pile[0]["doublons"]);

	$connect = '';
	$page = (($t1 = strval(recuperer_fond( 'formulaires/inc-options-langues' , array('name' => interdire_scripts(table_valeur(@$Pile[0], (string)'name', null)) ,
	'default' => interdire_scripts(sinon(table_valeur(@$Pile[0], (string)'default', null), '')) ), array('compil'=>array('prive/formulaires/menu_lang.html','html_551510a8bbb5547d8e8d9a1c380c69c8','',0,$GLOBALS['spip_lang'])), _request('connect'))))!=='' ?
		((	'<div class="formulaire_spip formulaire_menu_lang" id="formulaire_menu_lang">
<form method="post" action="' .
	interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'url', null),true)) .
	'"><div>
	' .
	interdire_scripts(form_hidden(entites_html(table_valeur(@$Pile[0], (string)'url', null),true))) .
	'
	<label for="' .
	interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'nom', null),true)) .
	'">' .
	_T('public|spip|ecrire:info_langues') .
	'</label>
	<select name="' .
	interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'nom', null),true)) .
	'" id="' .
	interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'nom', null),true)) .
	'" onchange="this.parentNode.parentNode.submit()">
		') . $t1 . '
	</select>
	<noscript><p class="boutons"><input type="submit" class="btn submit" value="&gt;&gt;" /></p></noscript>
</div></form>
</div>') :
		'');

	return analyse_resultat_skel('html_551510a8bbb5547d8e8d9a1c380c69c8', $Cache, $page, 'prive/formulaires/menu_lang.html');
}
?>