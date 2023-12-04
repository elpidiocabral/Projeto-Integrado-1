basepath = "https://cartesiano-api.vercel.app"
ki = 0
urlDatas = ["","","","","","","",""]
notLoadeds = []
deleteButtons = []
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

vetor_menus = array_create(8)
for (var i = 0; i < 8; i ++){
	instance_create_layer(i * 520 + 79, 32, "Data_modals", obj_menuModal) // capa
	vetor_menus[i][0] = instance_create_layer(i * 520 + 90, 90, "Instances_2", obj_bd_list)
	vetor_menus[i][0].image_xscale = 0.60
	vetor_menus[i][0].image_yscale = 0.40
	get = http_request(string_concat(basepath, tableNames[1][i]), "GET", 0, 0)
}