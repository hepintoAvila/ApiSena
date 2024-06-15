<?php

/***************************************************************************\
 *  SPIP, Systeme de publication pour l'internet                           *
 *                                                                         *
 *  Copyright (c) 2001-2017                                                *
 *  Arnaud Martin, Antoine Pitrou, Philippe Riviere, Emmanuel Saint-James  *
 *                                                                         *
 *  Ce programme est un logiciel libre distribue sous licence GNU/GPL.     *
 *  Pour plus de details voir le fichier COPYING.txt ou l'aide en ligne.   *
\***************************************************************************/

if (!defined('_ECRIRE_INC_VERSION')) {
	return;
}
		include_spip('base/connect_sql');
		include_spip('inc/filtres_ecrire');
		include_spip('inc/filtres');
		include_spip('inc/utils');
		include_spip('inc/json');
		include_spip('inc/autoriser');
		include_spip('exec/model/sena/claseapi');

		$obj = isset($_GET['obj']) ? $_GET['obj'] : $_POST['obj'];
		$entidad = isset($_GET['entidad']) ? base64_decode($_GET['entidad']) : base64_decode($_POST['entidad']);

		switch ($obj) {
			case 'aprendices':
			
				$campos = $GLOBALS['tables_principales']['sena_aprendiz']['field'];
				//$select = implode(',',array_keys($campos));

				 
				$Aprendices=array();
				$app=new Apis('sena_aprendiz');
				$row=$app->consultadatos('entidad="'.$entidad.'"','*');				
				if(!empty($row)){
				foreach($row as $a => $value){
					$sql2 = sql_select("academica,disciplinaria,inasistencias,verbal,escrito",
					'sena_sancionesanteriores','idAprendiz="'.$value['idAprendiz'].'"');
						while ($row2 = sql_fetch($sql2)) {	
									$academica= $row2['academica'] ? $row2['academica']:0;		
									$disciplinaria= !empty($row2['disciplinaria']) ? $row2['disciplinaria']:0;			
									$inasistencias= !empty($row2['inasistencias'])? $row2['inasistencias']:0;		
									$verbal= !empty($row2['verbal'])? $row2['verbal']:0;			
									$escrito= !empty($row2['escrito'])? $row2['escrito']:0;					
								  }
							$programaFormacion= !empty($value['programaFormacion'])? $value['programaFormacion']:0;			
							$proyectoFormativo= !empty($value['proyectoFormativo'])? $value['proyectoFormativo']:0;									  
							
							$Aprendices[] = array(
							'label'=>$value['nombres'].' '.$value['apellidos'],
							'value'=>'users',
							'type'=>'users',
							'userDetails'=>array(
							'id'=>$value['idAprendiz'],
							'firstname'=>ucwords(strtolower($value['nombres'])),
							'identificacion'=>$value['identificacion'],
							'telefono'=>'+57123344556',
							'correo'=>$value['correo'],
							'lastname'=>ucwords(strtolower($value['apellidos'])),
							'position'=>'Aprendiz',
							'municipio'=>'Bucaramanga',
							'direccion'=>'Calle 23 No. 23-65',
							'jornada'=>'Tarde',
							'rol'=>'Aprendiz',
							'etapa'=>'Electiva',
							'programaFormacion'=>''.$programaFormacion.'',
							'proyectoFormativo'=>''.$proyectoFormativo.'',					
							'fichanum'=>'2619701',
							'avatar'=>$value['avatar'],
							'disciplinaria'=>$disciplinaria,
							'academica'=>$academica,
							'inasistencias'=>$inasistencias,
							'verbal'=>$verbal,
							'escrito'=>$escrito,
							'avatar'=>$value['avatar'],
							)); 
					}
				}else{
					$AprendicesEmpy[] = array(
                    'label'=>'ESTUDIANTE PRUEBA',
					'value'=>'users',
					'type'=>'users',
                    'userDetails'=>array(
					'id'=>1,
					'firstname'=>'ESTUDIANTE PRUEBA',
					'identificacion'=>'000001',
					'telefono'=>'111111111',
					'correo'=>'',
					'lastname'=>'PRUEBA',
					'position'=>'Aprendiz',
					'municipio'=>'BUCARAMANGA',
					'direccion'=>'BUCARAMANGA',
					'jornada'=>'TARDE',
					'rol'=>'Aprendiz',
					'etapa'=>'PRODUCTIVA',
					'programaFormacion'=>'ADSO',
					'proyectoFormativo'=>'ADSO',				
					'fichanum'=>'000001',
					'avatar'=>'',
					'disciplinaria'=>'0',
					'academica'=>'0',
					'inasistencias'=>'0',
					'verbal'=>'0',
					'escrito'=>'0',
					'avatar'=>'',
					)); 				
				}
				

				
					$datosResp= !empty($Aprendices)? $Aprendices:$AprendicesEmpy;	
					$data = array("data"=>array('Aprendices'=>$datosResp));
					$var = var2js($data);
					echo $var;						
			break;
			
		}										
?>
