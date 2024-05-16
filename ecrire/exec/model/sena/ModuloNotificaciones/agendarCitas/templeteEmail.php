<?php
header('Content-Type: text/html; charset=utf-8');
/***************************************************************************\
 *  SPIP, Systeme de publication pour l'internet                           *
 *                                                                         *
 *  Copyright (c) 2001-2017                                                *
 *  Arnaud Martin, Antoine Pitrou, Philippe Riviere, Emmanuel Saint-James  *
 *                                                                         *
 *  Ce programme est un logiciel libre distribue sous licence GNU/GPL.     *
 *  Pour plus de details voir le fichier COPYING.txt ou l'aide en ligne.   *
\***************************************************************************/
function templete ($nombreApellido,$fechaCitacion){

echo '<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="initial-scale=1.0">
    <!-- So that mobile webkit will display zoomed in -->
    <meta name="format-detection" content="telephone=no">
    <!-- disable auto telephone linking in iOS -->
    <title>CITACION</title>
    <style type="text/css">
        /* Resets: see reset.css for details */
        .ReadMsgBody {
            width: 100%;
            background-color: #ebebeb;
        }

        .ExternalClass {
            width: 100%;
            background-color: #ebebeb;
        }

        .ExternalClass,
        .ExternalClass p,
        .ExternalClass span,
        .ExternalClass font,
        .ExternalClass td,
        .ExternalClass div {
            line-height: 100%;
        }

        body {
            -webkit-text-size-adjust: none;
            -ms-text-size-adjust: none;
        }

        body {
            padding: 0;
        }

        td a {
            text-decoration: none !important;
        }

        table td {
            border-collapse: collapse;
        }

        .yshortcuts a {
            border-bottom: none !important;
        }

        @media only screen and (max-width: 1200px) {
            table[class="container"] {
                width: 100% !important;
            }

            body {
                font-size: 25px !important;
            }
        }
    </style>
</head>
<body marginwidth="0" marginheight="0" bgcolor="#fff" style="padding:0px 0px;color:#333;" leftmargin="0" topmargin="0">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#fff"
        style="max-width: 800px; margin: auto; font-family: Arial, Helvetica, sans-serif;">
        <tbody>
            <tr>
                    <td align="center" class="container-padding"">
                        <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center"
                            style="padding: 0px;border:none;border-left:0px;border-right:0px;">
                            <tbody>
                <tr>
                    <td align="center" class="container-padding" >
                        <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center"
                            style="padding: 0px 5px 0 10px;border:none;border-left:0px;border-right:0px;">
                            <tbody>
                                <tr>
                                    <td align="center">
                                        <a href="https://gipnces.compucel.co/">
                                            <img border="0"
                                                style="padding: 0px 20px;border:none;border-left:0px;border-right:0px;"
                                                src="https://gipnces.compucel.co/static/media/logo_comite.d629b23d.png" width="800px">
                                        </a>
                                    </td>
    
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center"
                        style="padding: 40px 10px;border:none;border-left:0px;border-right:0px;">
                        <tbody>
                            <tr>
                                <td align="center" style="padding: 15px 20px 10px;">
                                    <div style="color: #4D4D4D;">                                      
                                        <br/>
                                        <p style="color: black; font-size: 14px; margin-top: 10px; text-align: left;">
                                              Cordial saludo, respetado() aprendiz:
                                        </p>
										 <p style="color: black; font-size: 14px; margin-top: 10px; text-align: left;">
                                              "'.$nombreApellido.'"
                                        </p>
										<p style="color: black; font-size: 14px; margin-top: 10px; text-align: left;">
                                            El Comité de Evaluación y Seguimiento del Centro de Servicios Empresariales y Turísticos, se permite citarlo el
                                        </p>
                                        <p style="color: black; font-size: 14px; margin-top: 10px; text-align: left; font-weight:bold">
                                            "'.$fechaCitacion.'" (Revisar su citación) </p>
										<p style="color: black; font-size: 14px; margin-top: 10px; text-align: left;">a participar del Comité correspondiente,
                                        el cual se realizara de forma presencial en las instalaciones del Centro de Servicios Empresariales y Turísticos (CSET)
										Cra.27 No.15-07, <strong>AUDITORIO MENOR</strong></p>
										</p>
										<br>
										<p style="color: black; font-size: 14px; margin-top: 10px; text-align: left;">
										Agradecemos su asistencia y puntualidad,
										</p>
										<br>
										<p style="color: black; font-size: 14px; margin-top: 10px; text-align: left;">
										Cordialmente,
										</p>										
                                        <br>
                                        <p style="color: black; font-size: 11px; margin-top: 10px; text-align: center;">
                                            Por favor no respondas este correo, este es un correo automático, por tanto no recibirás respuesta.<br/><br/>
                                        </p>
                                        

                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" class="container-padding" style="background-color: #1D4E8F;">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center"
                        style="padding: 5px 10px;border:none;border-left:0px;border-right:0px;">
                        <tbody>
                            <tr>
                                <td align="left">
                                    <p style="color: white; font-size: 14px; margin: 0 5px 0 10px;">
                                    </p>
                                </td>
                                <td align="right">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" class="container-padding" style="background-color: #57C0E8;">
                    <table width="100%" cellspacing="0" cellpadding="0" border="0" align="center"
                        style="padding: 5px 10px;border:none;border-left:0px;border-right:0px;">
                        <tr><td></td></tr>
                    </table>
                </td>
            </tr>

        </tbody>
    </table>
</body>
</html>';
?>