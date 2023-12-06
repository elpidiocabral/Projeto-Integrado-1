basepath = "https://cartesiano-api.vercel.app"
ki = 0
urlDatas = ["","","","","","","",""]
notLoadeds = []
deleteButtons = []
createButtons = []
alterButtons = []
filterButtons = []
tableNames = [
	[// Titulos
		"Historico",
		"Skins",
		"Armas",
		"Partida",
		"Desafio",
		"Problema",
		"Assunto",
		"Jogadores"
	],
	[ // Paths ok.
		"/historico",
		"/skins",
		"/armas",
		"/partida",
		"/desafio",
		"/problema",
		"/assunto",
		"/jogador"
	],
	[ // Chaves de exibicao
		["id_historico","id_jogador","id_partida"],
		["id_skin",	"nome",	"value"],
		["id_arma",	"nome",	"value"],
		["id_partida", "pontuacao_final", "nivel"],
		["id_desafio", "problema", "solucao"],
		["id_problema", "pontuacao", "nivel"],
		["id_assunto", "operador", "nome"],
		["nickname", "login", "senha"]
	],
	[ // IDs Guardados.
		[],
		[],
		[],
		[],
		[],
		[],
		[],
		[]
	]
]

function requestHTTP(){
	for (var i = 0; i < 8; i ++){
		get = http_request(string_concat(basepath, tableNames[1][i]), "GET", 0, 0)
	}
}

vetor_menus = array_create(8)
for (var i = 0; i < 8; i ++){
	#region background.
		instance_create_layer(i * 520 + 79, 32, "Data_modals", obj_menuModal) // capa
		vetor_menus[i][0] = instance_create_layer(i * 520 + 90, 90, "Instances_2", obj_bd_list)
		vetor_menus[i][0].image_xscale = 0.60
		vetor_menus[i][0].image_yscale = 0.40
		get = http_request(string_concat(basepath, tableNames[1][i]), "GET", 0, 0)
	#endregion
	
	#region botões
		// criar
		createButtons[i] = instance_create_layer(i * 520 + 450, 100, "buttons", obj_menu_btn_DBCreate)
		createButtons[i].table = i
		
		// alterar
		alterButtons[i] = instance_create_layer(i * 520 + 450, 140, "buttons", obj_menu_btn_DBAlter)
		alterButtons[i].table = i
		
		//filtrar
		filterButtons[i] = instance_create_layer(i * 520 + 450, 180, "buttons", obj_menu_btn_Filtrar)
		filterButtons[i].table = i
	#endregion
}