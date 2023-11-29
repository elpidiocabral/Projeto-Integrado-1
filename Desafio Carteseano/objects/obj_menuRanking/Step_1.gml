if obj_jogador_ativo.nickname == "desconhecido" && !flagPlayerNickname{
	requisicao = string_concat(basepath, "/jogador")
	flagPlayerNickname = true
	http_get(requisicao)
} else if !flagPlayerNickname {
	requisicao = string_concat(basepath, "/", obj_jogador_ativo.nickname, "/historico")
	flagPlayerNickname = true
	http_get(requisicao)
}
