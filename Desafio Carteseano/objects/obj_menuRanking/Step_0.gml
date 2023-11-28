if obj_jogador_ativo.nickname == "desconhecido" {
	requisicao = requisicao
} else if !loggedFlag{
	requisicao = string_concat(basepath, "/", obj_jogador_ativo.nickname, "/historico")
	http_get(requisicao)
	loggedFlag = true
}

