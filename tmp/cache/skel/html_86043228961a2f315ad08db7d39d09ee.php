<?php

/*
 * Squelette : plugins-dist/porte_plume/css/barre_outils_icones.css.html
 * Date :      Thu, 16 May 2024 20:21:49 GMT
 * Compile :   Thu, 16 May 2024 22:19:15 GMT
 * Boucles :   
 */ 
//
// Fonction principale du squelette plugins-dist/porte_plume/css/barre_outils_icones.css.html
// Temps de compilation total: 0.085 ms
//

function html_86043228961a2f315ad08db7d39d09ee($Cache, $Pile, $doublons = array(), $Numrows = array(), $SP = 0) {

	if (isset($Pile[0]["doublons"]) AND is_array($Pile[0]["doublons"]))
		$doublons = nettoyer_env_doublons($Pile[0]["doublons"]);

	$connect = '';
	$page = (
barre_outils_css_icones('') .
'

/* roue ajax */
.ajaxLoad{
		position:relative;
}
.ajaxLoad:after {
		content:"";
		display:block;
		width:5em;
		height:5em;
		border:1px solid #eee;
		background:#fff url(\'' .
protocole_implicite(url_absolue(find_in_path('images/loader.svg'))) .
'\') center no-repeat;
		background-size:50%;
		opacity:0.5;
		position:absolute;
		left:50%;
		top:50%;
		margin-left:-2.5em;
		margin-top:-2.5em;
}
.fullscreen .ajaxLoad:after {
		position:fixed;
		left:75%;
}
');

	return analyse_resultat_skel('html_86043228961a2f315ad08db7d39d09ee', $Cache, $page, 'plugins-dist/porte_plume/css/barre_outils_icones.css.html');
}
?>