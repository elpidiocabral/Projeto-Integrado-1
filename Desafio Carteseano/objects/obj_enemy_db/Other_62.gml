var json = async_load[? "result"]


try {
	var map = json_parse(json)
} catch (e){
	room_restart()
	show_debug_message("Não foi possível carregar o JSON: " + requisicao)
}


array_resize(problemas, array_length(map))

var indexVetor = array_create(4)
indexVetor = [0,0,0,0]

for (i = 0; i < array_length(map); i++){
	show_debug_message(map[i])
	var nivel = struct_get(map[i],"nivel")-1
	var indexVetorLocal = indexVetor[nivel]++
	problemas[nivel][indexVetorLocal] = [	
											struct_get(map[i], "fator_1"),
											struct_get(map[i], "fator_2"), 
											struct_get(map[i], "pontuacao"), 
											struct_get(map[i], "id_assunto"), 
											struct_get(map[i], "resultado")
										]
}