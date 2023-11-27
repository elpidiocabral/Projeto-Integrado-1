minhastring = "jogador"
requisicao = string("https://cartesiano-api.vercel.app/{0}",minhastring)
http_get(requisicao)
quant_tuplas = 0;
partidas = array_create(0)