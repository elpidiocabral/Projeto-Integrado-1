path = "jogador"
requisicao = string("https://cartesiano-api.vercel.app/{0}",path)
http_get(requisicao)

atual = 0;

historico = array_create(0)
quant_tuplas = 0;
partidas = array_create(0)