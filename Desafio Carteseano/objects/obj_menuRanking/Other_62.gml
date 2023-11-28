var json = async_load[? "result"]

var map = json_parse(json) // o vetor de map guarda o vetor do JSON.
quant_tuplas = array_length(map)

if (map == -1) exit; // caso não achou nada.

array_resize(historico, quant_tuplas) // o vetor de historico guarda os layers das partidas na tela.
array_resize(partidas, quant_tuplas) 
var k = 0;
for (i = 0; i < quant_tuplas; i++){
	partidas[i][k++%4] = struct_get(map[i], "nickname")
	partidas[i][k++%4] = struct_get(map[i], "ano_escolar")
	partidas[i][k++%4] = struct_get(map[i], "turma")
	partidas[i][k++%4] = struct_get(map[i], "score")
	
	
	historico[i] = instance_create_layer(x + 190, y + 39 - (sprite_height)/2 + i * 23, "x_buttons", obj_menu_btn_apagar_historico)
	historico[i].image_xscale = 0.030
	historico[i].image_yscale = 0.030
}

