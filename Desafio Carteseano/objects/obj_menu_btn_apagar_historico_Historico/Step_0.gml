
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

if mouse_hover && mouse_check_button(mb_left){
	var path = obj_banco_dados.tableNames[1][myTable];
	var pkey = data[myLine]
	toDeletePath = string_concat(obj_banco_dados.basepath, path,"/", pkey)
	show_message(toDeletePath)
}
	//var deletepath =  string_concat("https://cartesiano-api.vercel.app/",path, "/", pkey)
	//show_message(deletepath)
	//http_request(deletepath, "DELETE", 0, 0)
	//room_restart()
	//instance_destroy(id)
	//(((myY - 110) + 15.3) / 15.3) - 2.00)
	//(((myY - 110) + 15.3) / 15.3) - 2.00)
