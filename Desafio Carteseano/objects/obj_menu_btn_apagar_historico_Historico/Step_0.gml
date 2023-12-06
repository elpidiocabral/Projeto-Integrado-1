if !Readed{
	for (var i = 0; i < 8; i++){ // para cada tabela.
		myX = (obj_banco_dados.vetor_menus[i][0].x + 320)
		if (x == myX){
			myTable = i
			break;
		}
	}
	for (var k = 0; k < 14; k++){ // para cada linha.
		myY = round(110 + (k + 1) * 15.3)
		if (round(y) == myY){
			myLine = k
			break;
		}
	}
	Readed = true
	data = obj_banco_dados.tableNames[3][i] // Detenho todas os ids da tabela i
} // ler aonde é minha tabela e minha linha. (Eu objeto)

mouse_hover = (
		mouse_x >= x 
	&&  mouse_y >= y
    &&	mouse_x <= x + sprite_get_width(sprite_index) * image_xscale
	&&	mouse_y <= y + sprite_get_height(sprite_index) * image_yscale)

if mouse_hover && mouse_check_button_pressed(mb_left){
	var objBD = obj_banco_dados
	var bd = objBD.urlDatas[myTable]
	var path = objBD.tableNames[1][myTable];
	var pkey = data[myLine]
	toDeletePath = string_concat(objBD.basepath, path,"/", pkey)
	var temporaryArray = json_parse(bd)
	instance_destroy(objBD.deleteButtons[myTable][myLine])
	array_delete(objBD.deleteButtons[myTable],myLine,1) // apaga o botão do vetor.
	
		
#region recriando botões
	var toX = objBD.vetor_menus[myTable][0].x
	var toY = objBD.vetor_menus[myTable][0].y
	for (var i = 0; i < array_length(objBD.deleteButtons[myTable]) || (i < array_length(temporaryArray) - 2 && i < 13); i++){
		if (i < array_length(objBD.deleteButtons[myTable]))
			instance_destroy(objBD.deleteButtons[myTable][i]) 
		obj_banco_dados.deleteButtons[myTable][i]  = instance_create_layer(toX + 320, toY + (i+1) * 15.3 + 20, "x_buttons", obj_menu_btn_apagar_historico_Historico)
		obj_banco_dados.deleteButtons[myTable][i]  .image_xscale = 0.025
		obj_banco_dados.deleteButtons[myTable][i]  .image_yscale = 0.025
	}
	
#endregion 
	//http_request(toDeletePath, "DELETE", 0, 0)
	//array_delete(obj_banco_dados.urlDatas[], i, 1)
	array_delete(temporaryArray, myLine, 1) // apaga a linha escrita
	obj_banco_dados.urlDatas[myTable] = json_stringify(temporaryArray)
}
