var json = async_load[? "result"]

show_message(json)
var map = json_parse(json) // o vetor de map guarda o vetor do JSON.
quant_tuplas = array_length(map)

if (map == -1) exit; // caso não achou nada.

array_resize(historico, quant_tuplas) // o vetor de historico guarda os layers das partidas na tela.
array_resize(partidas, quant_tuplas) 

var k = 0;
for (i = 0; i < quant_tuplas; i++){
	if (struct_exists(map[i], "nickname")){
		partidas[i][k++%4] = struct_get(map[i], "nickname")
		partidas[i][k++%4] = struct_get(map[i], "ano_escolar")
		partidas[i][k++%4] = struct_get(map[i], "turma")
		partidas[i][k++%4] = struct_get(map[i], "score")

	} else {
		partidas[i][k++%5] = struct_get(map[i], "id_jogador")
		partidas[i][k++%5] = struct_get(map[i], "nivel")
		partidas[i][k++%5] = struct_get(map[i], "tempo")
		partidas[i][k++%5] = struct_get(map[i], "pontuacao_final")
		partidas[i][k++%5] = struct_get(map[i], "id_partida")
	}

	historico[i] = instance_create_layer(x + 190, y + 39 - (sprite_height)/2 + i * 23, "x_buttons", obj_menu_btn_apagar_historico)
	historico[i].image_xscale = 0.030
	historico[i].image_yscale = 0.030
	
}

atual = 0