var json = async_load[? "result"]

map = json_parse(json)
quant_tuplas = array_length(map)
array_resize(partidas, quant_tuplas)
var k = 0;
for (i = 0; i < quant_tuplas; i++){
	partidas[i][k++%4] = struct_get(map[i], "nickname")
	partidas[i][k++%4] = struct_get(map[i], "ano_escolar")
	partidas[i][k++%4] = struct_get(map[i], "turma")
	partidas[i][k++%4] = struct_get(map[i], "score")
	
	
	var delete_button = instance_create_layer(1060, y + 39 - (sprite_height)/2 + i * 23, "x_buttons", obj_menu_btn_apagar_historico)
	delete_button.image_xscale = 0.030
	delete_button.image_yscale = 0.030
	//delete_button
}

if (map == -1) exit; // caso não achou nada.