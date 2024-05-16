<?php

/*
 * Squelette : squelettes-dist/inclure/recents.html
 * Date :      Thu, 08 Jul 2021 23:10:16 GMT
 * Compile :   Fri, 10 May 2024 15:19:53 GMT
 * Boucles :   _articles
 */ 

function BOUCLE_articleshtml_dec53f2b6dc836e4f9175bbcfbe1c461(&$Cache, &$Pile, &$doublons, &$Numrows, $SP) {

	static $command = array();
	static $connect;
	$command['connect'] = $connect = '';
	$command['pagination'] = array((isset($Pile[0]['debut_articles']) ? $Pile[0]['debut_articles'] : null), 10);
	if (!isset($command['table'])) {
		$command['table'] = 'articles';
		$command['id'] = '_articles';
		$command['from'] = array('articles' => 'spip_articles');
		$command['type'] = array();
		$command['groupby'] = array();
		$command['select'] = array("articles.date",
		"articles.id_article",
		"articles.lang",
		"articles.id_rubrique",
		"articles.titre",
		"articles.descriptif",
		"articles.texte",
		"articles.chapo");
		$command['orderby'] = array('articles.date DESC');
		$command['where'] = 
			array(
quete_condition_statut('articles.statut','publie,prop,prepa/auteur','publie',''), 
quete_condition_postdates('articles.date',''));
		$command['join'] = array();
		$command['limit'] = '';
		$command['having'] = 
			array();
	}
	if (defined("_BOUCLE_PROFILER")) $timer = time()+(float)microtime();
	$t0 = "";
	// REQUETE
	$iter = IterFactory::create(
		"SQL",
		$command,
		array('squelettes-dist/inclure/recents.html','html_dec53f2b6dc836e4f9175bbcfbe1c461','_articles',6,$GLOBALS['spip_lang'])
	);
	if (!$iter->err()) {
	
	// COMPTEUR
	$Numrows['_articles']['compteur_boucle'] = 0;
	$Numrows['_articles']['command'] = $command;
	$Numrows['_articles']['total'] = @intval($iter->count());
	$debut_boucle = isset($Pile[0]['debut_articles']) ? $Pile[0]['debut_articles'] : _request('debut_articles');
	if(substr($debut_boucle,0,1)=='@'){
		$debut_boucle = $Pile[0]['debut_articles'] = quete_debut_pagination('id_article',$Pile[0]['@id_article'] = substr($debut_boucle,1),10,$iter);
		$iter->seek(0);
	}
	$debut_boucle = intval($debut_boucle);
	$debut_boucle = (($tout=($debut_boucle == -1))?0:($debut_boucle));
	$debut_boucle = max(0,min($debut_boucle,floor(($Numrows['_articles']['total']-1)/(10))*(10)));
	$debut_boucle = intval($debut_boucle);
	$fin_boucle = min(($tout ? $Numrows['_articles']['total'] : $debut_boucle + 9), $Numrows['_articles']['total'] - 1);
	$Numrows['_articles']['grand_total'] = $Numrows['_articles']['total'];
	$Numrows['_articles']["total"] = max(0,$fin_boucle - $debut_boucle + 1);
	if ($debut_boucle>0 AND $debut_boucle < $Numrows['_articles']['grand_total'] AND $iter->seek($debut_boucle,'continue'))
		$Numrows['_articles']['compteur_boucle'] = $debut_boucle;
	
	lang_select($GLOBALS['spip_lang']);
	$SP++;
	// RESULTATS
	while ($Pile[$SP]=$iter->fetch()) {

		$Numrows['_articles']['compteur_boucle']++;
		if ($Numrows['_articles']['compteur_boucle'] <= $debut_boucle) continue;
		if ($Numrows['_articles']['compteur_boucle']-1 > $fin_boucle) break;
		lang_select_public($Pile[$SP]['lang'], '', $Pile[$SP]['titre']);
		$t0 .= (
'
		<li dir="' .
lang_dir($Pile[$SP]['lang'], 'ltr','rtl') .
'" class="hentry clearfix text-' .
lang_dir($Pile[$SP]['lang'], 'left','right') .
'">
			' .
filtrer('image_graver',filtrer('image_reduire',quete_html_logo(quete_logo('id_article', 'ON', $Pile[$SP]['id_article'],$Pile[$SP]['id_rubrique'], 0), '', vider_url(urlencode_1738(generer_url_entite($Pile[$SP]['id_article'], 'article', '', '', true)))),'150','*')) .
'
			<h3 class="h2 entry-title"><a href="' .
vider_url(urlencode_1738(generer_url_entite($Pile[$SP]['id_article'], 'article', '', '', true))) .
'" rel="bookmark">' .
interdire_scripts(supprimer_numero(typo($Pile[$SP]['titre'], "TYPO", $connect, $Pile[0]))) .
'</a></h3>
			<small><abbr class="published"' .
(($t1 = strval(interdire_scripts(date_iso(normaliser_date($Pile[$SP]['date'])))))!=='' ?
		(' title="' . $t1 . '"') :
		'') .
'>' .
interdire_scripts(affdate_jourcourt(normaliser_date($Pile[$SP]['date']))) .
'</abbr>' .
(($t1 = strval(supprimer_tags(recuperer_fond('modeles/lesauteurs', array('objet'=>'article','id_objet' => $Pile[$SP]['id_article'],'id_article' => $Pile[$SP]['id_article']), array('trim'=>true, 'compil'=>array('squelettes-dist/inclure/recents.html','html_dec53f2b6dc836e4f9175bbcfbe1c461','_articles',7,$GLOBALS['spip_lang'])), ''))))!=='' ?
		((	', ' .
	_T('public|spip|ecrire:par_auteur') .
	' ') . $t1) :
		'') .
'</small>
			' .
(($t1 = strval(interdire_scripts(generer_introduction_entite($Pile[$SP]['id_article'], 'articles', array('descriptif' => $Pile[$SP]['descriptif'],'texte' => $Pile[$SP]['texte'],'chapo' => $Pile[$SP]['chapo'],), '500', null, null, $connect))))!=='' ?
		((	'<div class="introduction entry-content">') . $t1 . '</div>') :
		'') .
'
		</li>
		');
		lang_select();
	}
	lang_select();
	$iter->free();
	}
	if (defined("_BOUCLE_PROFILER")
	AND 1000*($timer = (time()+(float)microtime())-$timer) > _BOUCLE_PROFILER)
		spip_log(intval(1000*$timer)."ms BOUCLE_articles @ squelettes-dist/inclure/recents.html","profiler"._LOG_AVERTISSEMENT);
	return $t0;
}

//
// Fonction principale du squelette squelettes-dist/inclure/recents.html
// Temps de compilation total: 2.809 ms
//

function html_dec53f2b6dc836e4f9175bbcfbe1c461($Cache, $Pile, $doublons = array(), $Numrows = array(), $SP = 0) {

	if (isset($Pile[0]["doublons"]) AND is_array($Pile[0]["doublons"]))
		$doublons = nettoyer_env_doublons($Pile[0]["doublons"]);

	$connect = '';
	$page = (($t1 = BOUCLE_articleshtml_dec53f2b6dc836e4f9175bbcfbe1c461($Cache, $Pile, $doublons, $Numrows, $SP))!=='' ?
		((	'
<div class="menu menu_articles" id="articles_recents">
	<h2 class="offscreen">' .
		_T('public|spip|ecrire:articles_recents') .
		'</h2>
	' .
		filtre_pagination_dist($Numrows["_articles"]["grand_total"],
 		'_articles',
		isset($Pile[0]['debut_articles'])?$Pile[0]['debut_articles']:intval(_request('debut_articles')),
		10, false, '', '', array()) .
		'
	<ul>
		') . $t1 . (	'
	</ul>
	' .
		(($t3 = strval(filtre_pagination_dist($Numrows["_articles"]["grand_total"],
 		'_articles',
		isset($Pile[0]['debut_articles'])?$Pile[0]['debut_articles']:intval(_request('debut_articles')),
		10, true, 'precedent_suivant', '', array())))!=='' ?
				('<nav role="navigation" class="p pagination">' . $t3 . '</nav>') :
				'') .
		'
</div><!--#articles_recents-->
')) :
		'');

	return analyse_resultat_skel('html_dec53f2b6dc836e4f9175bbcfbe1c461', $Cache, $page, 'squelettes-dist/inclure/recents.html');
}
?>