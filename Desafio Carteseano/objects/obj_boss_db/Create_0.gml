path = "desafio"
basepath = "https://cartesiano-api.vercel.app"
requisicao = string("https://cartesiano-api.vercel.app/{0}",path)

problemas = array_create(0)

http_get(requisicao)