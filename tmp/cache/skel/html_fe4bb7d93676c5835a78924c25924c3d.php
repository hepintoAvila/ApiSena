<?php

/*
 * Squelette : squelettes-dist/formulaires/recherche.html
 * Date :      Thu, 08 Jul 2021 23:10:16 GMT
 * Compile :   Fri, 10 May 2024 15:19:54 GMT
 * Boucles :   
 */ 
//
// Fonction principale du squelette squelettes-dist/formulaires/recherche.html
// Temps de compilation total: 0.236 ms
//

function html_fe4bb7d93676c5835a78924c25924c3d($Cache, $Pile, $doublons = array(), $Numrows = array(), $SP = 0) {

	if (isset($Pile[0]["doublons"]) AND is_array($Pile[0]["doublons"]))
		$doublons = nettoyer_env_doublons($Pile[0]["doublons"]);

	$connect = '';
	$page = (
'<div class="formulaire_spip formulaire_recherche' .
(($t1 = strval(interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'class', null),true))))!=='' ?
		(' ' . $t1) :
		'') .
'" id="formulaire_recherche">
<form action="' .
interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'action', null),true)) .
'" method="get"><div class="editer-groupe">
	' .
interdire_scripts(form_hidden(entites_html(table_valeur(@$Pile[0], (string)'action', null),true))) .
'
	' .
(($t1 = strval(interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'lang', null),true))))!=='' ?
		('<input type="hidden" name="lang" value="' . $t1 . '" />') :
		'') .
'
	<label for="' .
interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'_id_champ', null),true)) .
'">' .
_T('public|spip|ecrire:info_rechercher_02') .
'</label>
	<input type="' .
(' ' ? 'search':'text') .
'" class="search text" size="10" name="recherche" id="' .
interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'_id_champ', null),true)) .
'"' .
(($t1 = strval(interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'recherche', null),true))))!=='' ?
		(' value="' . $t1 . '"') :
		'') .
' accesskey="4" autocapitalize="off" autocorrect="off"
	/><input type="submit" class="btn submit" value="&gt;&gt;" title="' .
_T('public|spip|ecrire:info_rechercher') .
'" />
</div></form>
</div>
');

	return analyse_resultat_skel('html_fe4bb7d93676c5835a78924c25924c3d', $Cache, $page, 'squelettes-dist/formulaires/recherche.html');
}
?>