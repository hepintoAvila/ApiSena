<?php

/*
 * Squelette : prive/formulaires/login.html
 * Date :      Thu, 16 May 2024 20:21:50 GMT
 * Compile :   Thu, 16 May 2024 22:19:16 GMT
 * Boucles :   _mensaje
 */ 

function BOUCLE_mensajehtml_99c87164caa0afb59aace9804c13d7cb(&$Cache, &$Pile, &$doublons, &$Numrows, $SP) {

	static $command = array();
	static $connect;
	$command['connect'] = $connect = '';
	if (!isset($command['table'])) {
		$command['table'] = 'articles';
		$command['id'] = '_mensaje';
		$command['from'] = array('articles' => 'spip_articles');
		$command['type'] = array();
		$command['groupby'] = array();
		$command['select'] = array("count(*)");
		$command['orderby'] = array();
		$command['where'] = 
			array(
quete_condition_statut('articles.statut','publie,prop,prepa/auteur','publie',''), 
quete_condition_postdates('articles.date',''), 
			array('=', 'articles.id_article', "1"));
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
		array('prive/formulaires/login.html','html_99c87164caa0afb59aace9804c13d7cb','_mensaje',32,$GLOBALS['spip_lang'])
	);
	if (!$iter->err()) {
	$Numrows['_mensaje']['command'] = $command;
	$Numrows['_mensaje']['total'] = @intval($iter->count());
	$SP++;
	// RESULTATS
	
	$t0 = str_repeat('
    <?php include_once("mensaje.php"); ?>
', $Numrows['_mensaje']['total']);
	$iter->free();
	}
	if (defined("_BOUCLE_PROFILER")
	AND 1000*($timer = (time()+(float)microtime())-$timer) > _BOUCLE_PROFILER)
		spip_log(intval(1000*$timer)."ms BOUCLE_mensaje @ prive/formulaires/login.html","profiler"._LOG_AVERTISSEMENT);
	return $t0;
}

//
// Fonction principale du squelette prive/formulaires/login.html
// Temps de compilation total: 0.477 ms
//

function html_99c87164caa0afb59aace9804c13d7cb($Cache, $Pile, $doublons = array(), $Numrows = array(), $SP = 0) {

	if (isset($Pile[0]["doublons"]) AND is_array($Pile[0]["doublons"]))
		$doublons = nettoyer_env_doublons($Pile[0]["doublons"]);

	$connect = '';
	$page = (
'<?php
// Obtener la hora actual del servidor
$hora_actual = date("H:i:s");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Api Sena</title>
    <style>
        .mensaje {
            padding: 20px;
            background-color: #c04e8b;
            border: 1px solid #ccc;
            margin: 20px auto;
            max-width: 500px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="mensaje">
        <h2>¡Api Sena SicesV.1, En Funcionamiento!</h1>
        <h2>Tiempo Real</h2>
        <div id="reloj"><?php echo $hora_actual; ?></div>
    </div>
</body>
</html>

' .
BOUCLE_mensajehtml_99c87164caa0afb59aace9804c13d7cb($Cache, $Pile, $doublons, $Numrows, $SP) .
'


<script>
    // Función para actualizar el reloj cada segundo
    function actualizarReloj() {
        var ahora = new Date();
        var horas = ahora.getHours();
        var minutos = ahora.getMinutes();
        var segundos = ahora.getSeconds();

        // Asegúrate de que los números siempre tengan dos dígitos
        horas = (\'0\' + horas).slice(-2);
        minutos = (\'0\' + minutos).slice(-2);
        segundos = (\'0\' + segundos).slice(-2);

        // Construye la cadena de tiempo
        var tiempo = horas + \':\' + minutos + \':\' + segundos;

        // Actualiza el contenido del elemento con id "reloj"
        document.getElementById(\'reloj\').innerHTML = tiempo;

        // Actualiza el reloj cada segundo
        setTimeout(actualizarReloj, 1000);
    }

    // Inicia el reloj al cargar la página
    window.onload = function() {
        actualizarReloj();
    };
</script>');

	return analyse_resultat_skel('html_99c87164caa0afb59aace9804c13d7cb', $Cache, $page, 'prive/formulaires/login.html');
}
?>