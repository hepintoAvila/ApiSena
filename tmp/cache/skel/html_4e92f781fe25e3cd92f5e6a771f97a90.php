<?php

/*
 * Squelette : plugins-dist/porte_plume/javascript/porte_plume_start.js.html
 * Date :      Thu, 16 May 2024 20:21:49 GMT
 * Compile :   Thu, 16 May 2024 22:19:15 GMT
 * Boucles :   
 */ 
//
// Fonction principale du squelette plugins-dist/porte_plume/javascript/porte_plume_start.js.html
// Temps de compilation total: 0.335 ms
//

function html_4e92f781fe25e3cd92f5e6a771f97a90($Cache, $Pile, $doublons = array(), $Numrows = array(), $SP = 0) {

	if (isset($Pile[0]["doublons"]) AND is_array($Pile[0]["doublons"]))
		$doublons = nettoyer_env_doublons($Pile[0]["doublons"]);

	$connect = '';
	$page = (
'<'.'?php header("X-Spip-Cache: 604800"); ?'.'>'.'<'.'?php header("Cache-Control: max-age=604800"); ?'.'>'.'<'.'?php header("X-Spip-Statique: oui"); ?'.'>' .
'<'.'?php header(' . _q((	'Content-Type: text/javascript; charset=' .
	interdire_scripts($GLOBALS['meta']['charset']))) . '); ?'.'>
' .
porte_plume_creer_json_markitup('') .
'


;(function($){

// 2 fonctions pour appeler le porte plume reutilisables pour d\'autres plugins
// on envoie dedans la selection jquery qui doit etre effectuee
// ce qui evite des appels direct a markitup, aucazou on change de lib un jour
$.fn.barre_outils = function(nom, settings) {
	options = {
		lang:\'' .
interdire_scripts(entites_html(table_valeur(@$Pile[0], (string)'lang', null),true)) .
'\'
	};
	$.extend(options, settings);

	return $(this)
		.not(\'.markItUpEditor, .no_barre\')
		.markItUp(eval(\'barre_outils_\' + nom), {lang:options.lang})
		.parent().find(\'.markItUpButton a\').attr(\'tabindex\', -1) // ne pas tabuler les boutons
		.end(); 
};

$.fn.barre_previsualisation = function(settings) {
	options = {
		previewParserPath:"index.php?action=porte_plume_previsu", // ici une url relative pour prive/public
		textEditer:"' .
texte_script(_T('public|spip|ecrire:bouton_modifier')) .
'",
		textVoir:"' .
texte_script(_T('barreoutils:voir')) .
'"
	};
	$.extend(options, settings);

	return $(this)
		.not(\'.pp_previsualisation, .no_previsualisation\')
		.previsu_spip(options)
		.parent().find(\'.markItUpTabs a\').attr(\'tabindex\', -1) // ne pas tabuler les onglets
		.end();
};

$(window).on(\'load\', function(){
	// ajoute les barres d\'outils markitup
	function barrebouilles(){
		// fonction generique appliquee aux classes CSS :
		// inserer_barre_forum, inserer_barre_edition, inserer_previsualisation
		$(\'.formulaire_spip textarea.inserer_barre_forum\').barre_outils(\'forum\');
		$(\'.formulaire_spip textarea.inserer_barre_edition\').barre_outils(\'edition\');
		$(\'.formulaire_spip textarea.inserer_previsualisation\').barre_previsualisation();

		' .
(($t1 = strval(interdire_scripts(((entites_html(sinon(table_valeur(@$Pile[0], (string)'inserer_auto_name_texte', null), '0'),true)) ?' ' :''))))!=='' ?
		($t1 . (	'
		// fonction specifique aux formulaires de SPIP :
		// barre de forum
		$(\'textarea.textarea_forum\').barre_outils(\'forum\');
		' .
	(($t2 = strval(interdire_scripts(((((include_spip('inc/config')?lire_config('forums_afficher_barre',null,false):'') == 'non')) ?'' :' '))))!=='' ?
			($t2 . '
		$(\'.formulaire_forum textarea[name=texte]\').barre_outils(\'forum\');') :
			'') .
	'
		// barre d\'edition et onglets de previsualisation
		$(\'.formulaire_spip' .
	interdire_scripts((((include_spip('inc/config')?lire_config('forums_afficher_barre',null,false):'') == 'non') ? ':not(#formulaire_forum)':'')) .
	' textarea[name=texte]\')
			.barre_outils(\'edition\').end()
			.barre_previsualisation();
		')) :
		'') .
'
	}
	barrebouilles();
	onAjaxLoad(barrebouilles);

});
})(jQuery);
');

	return analyse_resultat_skel('html_4e92f781fe25e3cd92f5e6a771f97a90', $Cache, $page, 'plugins-dist/porte_plume/javascript/porte_plume_start.js.html');
}
?>