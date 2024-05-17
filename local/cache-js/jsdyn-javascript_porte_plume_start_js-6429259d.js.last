/* #PRODUIRE{fond=javascript/porte_plume_start.js,hash=98a24b63360c2810aab52d0cbf8a4e4a,inserer_auto_name_texte=1,lang=es}
   md5:5b5b37f3c40adf7e6cf929bb4b213204 */



barre_outils_edition = {
    "nameSpace": "edition",
    "previewAutoRefresh": false,
    "onEnter": {
        "keepDefault": false,
        "selectionType": "return",
        "replaceWith": "\n"
    },
    "onShiftEnter": {
        "keepDefault": false,
        "replaceWith": "\n_ "
    },
    "onCtrlEnter": {
        "keepDefault": false,
        "replaceWith": "\n\n"
    },
    "markupSet": [
        {
            "name": "Convertir en {{{intert\u00edtulo}}}",
            "key": "H",
            "className": "outil_header1",
            "openWith": "\n{{{",
            "closeWith": "}}}\n",
            "selectionType": "line"
        },
        {
            "name": "{{Negrita}}",
            "key": "B",
            "className": "outil_bold",
            "replaceWith": function(h){ return espace_si_accolade(h, '{{', '}}');},
            "selectionType": "word"
        },
        {
            "name": "{cursiva}",
            "key": "I",
            "className": "outil_italic",
            "replaceWith": function(h){ return espace_si_accolade(h, '{', '}');},
            "selectionType": "word"
        },
        {
            "name": "Convertir en lista",
            "className": "outil_liste_ul separateur_avant",
            "replaceWith": function(h){ return outil_liste(h, '*');},
            "selectionType": "line",
            "forceMultiline": true,
            "dropMenu": [
                {
                    "id": "liste_ol",
                    "name": "Convertir en lista ordenada",
                    "className": "outil_liste_ol",
                    "replaceWith": function(h){ return outil_liste(h, '#');},
                    "display": true,
                    "selectionType": "line",
                    "forceMultiline": true
                },
                {
                    "id": "desindenter",
                    "name": "Deshacer sublista",
                    "className": "outil_desindenter",
                    "replaceWith": function(h){return outil_desindenter(h);},
                    "display": true,
                    "selectionType": "line",
                    "forceMultiline": true
                },
                {
                    "id": "indenter",
                    "name": "Convertir en sublista",
                    "className": "outil_indenter",
                    "replaceWith": function(h){return outil_indenter(h);},
                    "display": true,
                    "selectionType": "line",
                    "forceMultiline": true
                }
            ]
        },
        {
            "name": "Convertir en [hipev\u00ednculo->http:\/\/...]",
            "key": "L",
            "className": "outil_link separateur separateur_apres sepLink",
            "openWith": "[",
            "closeWith": "->[![Por favor ingresa el destino de tu hiperv\u00ednculo (puede ser una URL de la forma http:\/\/www.misitio.com o simplmente el n\u00famero de un art\u00edculo de este sitio).]!]]"
        },
        {
            "name": "Convertir en [[Nota al pie]]",
            "className": "outil_notes separateur_avant",
            "openWith": "[[",
            "closeWith": "]]",
            "selectionType": "word"
        },
        {
            "name": "<quote>Citar<\/quote>",
            "key": "Q",
            "className": "outil_quote separateur separateur_apres sepGuillemets",
            "openWith": "\n<quote>",
            "closeWith": "<\/quote>\n",
            "selectionType": "word",
            "dropMenu": [
                {
                    "id": "barre_poesie",
                    "name": "Mostrar como <poesie>Poes\u00eda<\/poesie>",
                    "className": "outil_poesie",
                    "openWith": "\n<poesie>",
                    "closeWith": "<\/poesie>\n",
                    "display": true,
                    "selectionType": "line"
                }
            ]
        },
        {
            "name": "Encerrar entre \u00abcomillas dobles\u00ab",
            "className": "outil_guillemets",
            "openWith": "«",
            "closeWith": "»",
            "lang": [
                "fr",
                "eo",
                "cpf",
                "ar",
                "es"
            ],
            "selectionType": "word",
            "dropMenu": [
                {
                    "id": "guillemets_simples",
                    "name": "Place between \u201csingle quotes\u201c",
                    "className": "outil_guillemets_simples",
                    "openWith": "“",
                    "closeWith": "”",
                    "display": true,
                    "lang": [
                        "fr",
                        "eo",
                        "cpf",
                        "ar",
                        "es"
                    ],
                    "selectionType": "word"
                }
            ]
        },
        {
            "name": "Encerrar entre \u00abcomillas dobles\u00ab",
            "className": "outil_guillemets_de",
            "openWith": "„",
            "closeWith": "“",
            "lang": [
                "bg",
                "de",
                "pl",
                "hr",
                "src"
            ],
            "selectionType": "word",
            "dropMenu": [
                {
                    "id": "guillemets_de_simples",
                    "name": "Place between \u201csingle quotes\u201c",
                    "className": "outil_guillemets_de_simples",
                    "openWith": "&sbquo;",
                    "closeWith": "‘",
                    "display": true,
                    "lang": [
                        "bg",
                        "de",
                        "pl",
                        "hr",
                        "src"
                    ],
                    "selectionType": "word"
                }
            ]
        },
        {
            "name": "Encerrar entre \u00abcomillas dobles\u00ab",
            "className": "outil_guillemets_simples separateur_avant",
            "openWith": "“",
            "closeWith": "”",
            "lang_not": [
                "fr",
                "eo",
                "cpf",
                "ar",
                "es",
                "bg",
                "de",
                "pl",
                "hr",
                "src"
            ],
            "selectionType": "word",
            "dropMenu": [
                {
                    "id": "guillemets_autres_simples",
                    "name": "Place between \u201csingle quotes\u201c",
                    "className": "outil_guillemets_uniques",
                    "openWith": "‘",
                    "closeWith": "’",
                    "display": true,
                    "lang_not": [
                        "fr",
                        "eo",
                        "cpf",
                        "ar",
                        "es",
                        "bg",
                        "de",
                        "pl",
                        "hr",
                        "src"
                    ],
                    "selectionType": "word"
                }
            ]
        },
        {
            "name": "Insertar caracteres especiales",
            "className": "outil_caracteres separateur separateur_apres sepCaracteres separateur_avant",
            "dropMenu": [
                {
                    "id": "A_grave",
                    "name": "Insertar una \u00c0",
                    "className": "outil_a_maj_grave",
                    "replaceWith": "À",
                    "display": true,
                    "lang": [
                        "fr",
                        "eo",
                        "cpf"
                    ]
                },
                {
                    "id": "E_aigu",
                    "name": "Insertar una \u00c9",
                    "className": "outil_e_maj_aigu",
                    "replaceWith": "É",
                    "display": true,
                    "lang": [
                        "fr",
                        "eo",
                        "cpf"
                    ]
                },
                {
                    "id": "E_grave",
                    "name": "Intertar una \u00c8",
                    "className": "outil_e_maj_grave",
                    "replaceWith": "È",
                    "display": true,
                    "lang": [
                        "fr",
                        "eo",
                        "cpf"
                    ]
                },
                {
                    "id": "aelig",
                    "name": "Insertar una \u00e6",
                    "className": "outil_aelig",
                    "replaceWith": "æ",
                    "display": true,
                    "lang": [
                        "fr",
                        "eo",
                        "cpf"
                    ]
                },
                {
                    "id": "AElig",
                    "name": "Insertar una \u00c6",
                    "className": "outil_aelig_maj",
                    "replaceWith": "Æ",
                    "display": true,
                    "lang": [
                        "fr",
                        "eo",
                        "cpf"
                    ]
                },
                {
                    "id": "oe",
                    "name": "Insertar una \u0153",
                    "className": "outil_oe",
                    "replaceWith": "œ",
                    "display": true,
                    "lang": [
                        "fr"
                    ]
                },
                {
                    "id": "OE",
                    "name": "Insertar  una \u0152",
                    "className": "outil_oe_maj",
                    "replaceWith": "Œ",
                    "display": true,
                    "lang": [
                        "fr"
                    ]
                },
                {
                    "id": "Ccedil",
                    "name": "Insertar una \u00c7",
                    "className": "outil_ccedil_maj",
                    "replaceWith": "Ç",
                    "display": true,
                    "lang": [
                        "fr",
                        "eo",
                        "cpf"
                    ]
                },
                {
                    "id": "uppercase",
                    "name": "Pasar a may\u00fasculas",
                    "className": "outil_uppercase",
                    "replaceWith": function(markitup) { return markitup.selection.toUpperCase() },
                    "display": true,
                    "lang": [
                        "fr",
                        "en"
                    ]
                },
                {
                    "id": "lowercase",
                    "name": "Pasar a min\u00fasculas",
                    "className": "outil_lowercase",
                    "replaceWith": function(markitup) { return markitup.selection.toLowerCase() },
                    "display": true,
                    "lang": [
                        "fr",
                        "en"
                    ]
                }
            ]
        },
        {
            "name": "Insertar un c\u00f3digo inform\u00e1tico (c\u00f3digo)",
            "className": "outil_code separateur separateur_apres sepCode",
            "openWith": "<code>",
            "closeWith": "<\/code>",
            "dropMenu": [
                {
                    "id": "cadre",
                    "name": "Inseretar un c\u00f3digo preformatado (marco)",
                    "className": "outil_cadre",
                    "openWith": "<cadre>\n",
                    "closeWith": "\n<\/cadre>",
                    "display": true
                }
            ]
        }
    ]
}

 
				// remplace ou cree -* ou -** ou -# ou -##
				function outil_liste(h, c) {
					if ((s = h.selection) && (r = s.match(/^-([*#]+) (.*)$/)))	 {
						r[1] = r[1].replace(/[#*]/g, c);
						s = '-'+r[1]+' '+r[2];
					} else {
						s = '-' + c + ' '+s;
					}
					return s;
				}

				// indente des -* ou -#
				function outil_indenter(h) {
					if (s = h.selection) {
						if (s.substr(0,2)=='-*') {
							s = '-**' + s.substr(2);
						} else if (s.substr(0,2)=='-#') {
							s = '-##' + s.substr(2);
						} else {
							s = '-* ' + s;
						}
					}
					return s;
				}

				// desindente des -* ou -** ou -# ou -##
				function outil_desindenter(h){
					if (s = h.selection) {
						if (s.substr(0,3)=='-**') {
							s = '-*' + s.substr(3);
						} else if (s.substr(0,3)=='-* ') {
							s = s.substr(3);
						} else if (s.substr(0,3)=='-##') {
							s = '-#' + s.substr(3);
						} else if (s.substr(0,3)=='-# ') {
							s = s.substr(3);
						}
					}
					return s;
				}

				// ajouter un espace avant, apres un {qqc} pour ne pas que
				// gras {{}} suivi de italique {} donnent {{{}}}, mais { {{}} }
				function espace_si_accolade(h, openWith, closeWith){
					if (s = h.selection) {
						// accolade dans la selection
						if (s.charAt(0)=='{') {
							return openWith + ' ' + s + ' ' + closeWith;
						}
						// accolade avant la selection
						else if (c = h.textarea.selectionStart) {
							if (h.textarea.value.charAt(c-1) == '{') {
								return ' ' + openWith + s + closeWith + ' ';
							}
						}
					}
					return openWith + s + closeWith;
				}
				

barre_outils_forum = {
    "nameSpace": "forum",
    "previewAutoRefresh": false,
    "onEnter": {
        "keepDefault": false,
        "selectionType": "return",
        "replaceWith": "\n"
    },
    "onShiftEnter": {
        "keepDefault": false,
        "replaceWith": "\n_ "
    },
    "onCtrlEnter": {
        "keepDefault": false,
        "replaceWith": "\n\n"
    },
    "markupSet": [
        {
            "name": "{{Negrita}}",
            "key": "B",
            "className": "outil_bold",
            "replaceWith": function(h){ return espace_si_accolade(h, '{{', '}}');},
            "selectionType": "word"
        },
        {
            "name": "{cursiva}",
            "key": "I",
            "className": "outil_italic separateur_avant",
            "replaceWith": function(h){ return espace_si_accolade(h, '{', '}');},
            "selectionType": "word"
        },
        {
            "name": "Convertir en [hipev\u00ednculo->http:\/\/...]",
            "key": "L",
            "className": "outil_link separateur separateur_apres sepLink separateur_avant",
            "openWith": "[",
            "closeWith": "->[![Por favor ingresa el destino de tu hiperv\u00ednculo (puede ser una URL de la forma http:\/\/www.misitio.com o simplmente el n\u00famero de un art\u00edculo de este sitio).]!]]"
        },
        {
            "name": "<quote>Citar<\/quote>",
            "key": "Q",
            "className": "outil_quote separateur separateur_apres sepGuillemets",
            "openWith": "\n<quote>",
            "closeWith": "<\/quote>\n",
            "selectionType": "word"
        },
        {
            "name": "Encerrar entre \u00abcomillas dobles\u00ab",
            "className": "outil_guillemets",
            "openWith": "«",
            "closeWith": "»",
            "lang": [
                "fr",
                "eo",
                "cpf",
                "ar",
                "es"
            ],
            "selectionType": "word",
            "dropMenu": [
                {
                    "id": "guillemets_simples",
                    "name": "Place between \u201csingle quotes\u201c",
                    "className": "outil_guillemets_simples",
                    "openWith": "“",
                    "closeWith": "”",
                    "display": true,
                    "lang": [
                        "fr",
                        "eo",
                        "cpf",
                        "ar",
                        "es"
                    ],
                    "selectionType": "word"
                }
            ]
        },
        {
            "name": "Encerrar entre \u00abcomillas dobles\u00ab",
            "className": "outil_guillemets_de",
            "openWith": "„",
            "closeWith": "“",
            "lang": [
                "bg",
                "de",
                "pl",
                "hr",
                "src"
            ],
            "selectionType": "word",
            "dropMenu": [
                {
                    "id": "guillemets_de_simples",
                    "name": "Place between \u201csingle quotes\u201c",
                    "className": "outil_guillemets_de_simples",
                    "openWith": "&sbquo;",
                    "closeWith": "‘",
                    "display": true,
                    "lang": [
                        "bg",
                        "de",
                        "pl",
                        "hr",
                        "src"
                    ],
                    "selectionType": "word"
                }
            ]
        },
        {
            "name": "Encerrar entre \u00abcomillas dobles\u00ab",
            "className": "outil_guillemets_simples separateur_avant",
            "openWith": "“",
            "closeWith": "”",
            "lang_not": [
                "fr",
                "eo",
                "cpf",
                "ar",
                "es",
                "bg",
                "de",
                "pl",
                "hr",
                "src"
            ],
            "selectionType": "word",
            "dropMenu": [
                {
                    "id": "guillemets_autres_simples",
                    "name": "Place between \u201csingle quotes\u201c",
                    "className": "outil_guillemets_uniques",
                    "openWith": "‘",
                    "closeWith": "’",
                    "display": true,
                    "lang_not": [
                        "fr",
                        "eo",
                        "cpf",
                        "ar",
                        "es",
                        "bg",
                        "de",
                        "pl",
                        "hr",
                        "src"
                    ],
                    "selectionType": "word"
                }
            ]
        }
    ]
}

 
				// remplace ou cree -* ou -** ou -# ou -##
				function outil_liste(h, c) {
					if ((s = h.selection) && (r = s.match(/^-([*#]+) (.*)$/)))	 {
						r[1] = r[1].replace(/[#*]/g, c);
						s = '-'+r[1]+' '+r[2];
					} else {
						s = '-' + c + ' '+s;
					}
					return s;
				}

				// indente des -* ou -#
				function outil_indenter(h) {
					if (s = h.selection) {
						if (s.substr(0,2)=='-*') {
							s = '-**' + s.substr(2);
						} else if (s.substr(0,2)=='-#') {
							s = '-##' + s.substr(2);
						} else {
							s = '-* ' + s;
						}
					}
					return s;
				}

				// desindente des -* ou -** ou -# ou -##
				function outil_desindenter(h){
					if (s = h.selection) {
						if (s.substr(0,3)=='-**') {
							s = '-*' + s.substr(3);
						} else if (s.substr(0,3)=='-* ') {
							s = s.substr(3);
						} else if (s.substr(0,3)=='-##') {
							s = '-#' + s.substr(3);
						} else if (s.substr(0,3)=='-# ') {
							s = s.substr(3);
						}
					}
					return s;
				}

				// ajouter un espace avant, apres un {qqc} pour ne pas que
				// gras {{}} suivi de italique {} donnent {{{}}}, mais { {{}} }
				function espace_si_accolade(h, openWith, closeWith){
					if (s = h.selection) {
						// accolade dans la selection
						if (s.charAt(0)=='{') {
							return openWith + ' ' + s + ' ' + closeWith;
						}
						// accolade avant la selection
						else if (c = h.textarea.selectionStart) {
							if (h.textarea.value.charAt(c-1) == '{') {
								return ' ' + openWith + s + closeWith + ' ';
							}
						}
					}
					return openWith + s + closeWith;
				}
				

barre_outils_vide = {
    "nameSpace": "vide",
    "previewAutoRefresh": false,
    "markupSet": []
}

 


;(function($){

// 2 fonctions pour appeler le porte plume reutilisables pour d'autres plugins
// on envoie dedans la selection jquery qui doit etre effectuee
// ce qui evite des appels direct a markitup, aucazou on change de lib un jour
$.fn.barre_outils = function(nom, settings) {
	options = {
		lang:'es'
	};
	$.extend(options, settings);

	return $(this)
		.not('.markItUpEditor, .no_barre')
		.markItUp(eval('barre_outils_' + nom), {lang:options.lang})
		.parent().find('.markItUpButton a').attr('tabindex', -1) // ne pas tabuler les boutons
		.end(); 
};

$.fn.barre_previsualisation = function(settings) {
	options = {
		previewParserPath:"index.php?action=porte_plume_previsu", // ici une url relative pour prive/public
		textEditer:"Modificar",
		textVoir:"Ver"
	};
	$.extend(options, settings);

	return $(this)
		.not('.pp_previsualisation, .no_previsualisation')
		.previsu_spip(options)
		.parent().find('.markItUpTabs a').attr('tabindex', -1) // ne pas tabuler les onglets
		.end();
};

$(window).on('load', function(){
	// ajoute les barres d'outils markitup
	function barrebouilles(){
		// fonction generique appliquee aux classes CSS :
		// inserer_barre_forum, inserer_barre_edition, inserer_previsualisation
		$('.formulaire_spip textarea.inserer_barre_forum').barre_outils('forum');
		$('.formulaire_spip textarea.inserer_barre_edition').barre_outils('edition');
		$('.formulaire_spip textarea.inserer_previsualisation').barre_previsualisation();

		 
		// fonction specifique aux formulaires de SPIP :
		// barre de forum
		$('textarea.textarea_forum').barre_outils('forum');
		 
		$('.formulaire_forum textarea[name=texte]').barre_outils('forum');
		// barre d'edition et onglets de previsualisation
		$('.formulaire_spip textarea[name=texte]')
			.barre_outils('edition').end()
			.barre_previsualisation();
		
	}
	barrebouilles();
	onAjaxLoad(barrebouilles);

});
})(jQuery);
