function drawValues(){
	for (var i = 0; i < 8; i ++){
		draw_set_font(fnt_monocraft_8)
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		var toX = vetor_menus[i][0].x
		var toY = vetor_menus[i][0].y
	
		draw_text_ext_color(toX + 200, toY - 5, tableNames[0][i], string_height(tableNames[0][i]), 100, c_black, c_black, c_black, c_black, 255)
	
		if (!(string_char_at(urlDatas[i], 1) == "["))
			break;
		else {
			data = json_parse(urlDatas[i]) // Transformando em um array de struct.
			keys = tableNames[2][i] // aqui temos um array com as keys para o get que procuramos.
			if typeof(data) == "array"{ // data é a lista de todas as tuplas.
				for (var k = 0; k < 14 && k <= array_length(data);k++){	// 14 linhas
					if !(k == array_length(data)) 
						tableNames[3][i][k] = struct_get(data[k],keys[0])
					for (var j = 0; j < 3; j++){						// 3 colunas.
						if (k == 0) {
							draw_text_color(toX + j * 100 + 90, k * 15.3 + toY + 27.5, keys[j], c_black, c_black, c_black, c_black, 255)
						} else 
							draw_text_color(toX + j * 100 + 90, k * 15.3 + toY + 27.5, struct_get(data[k-1],keys[j]), c_black, c_black, c_black, c_black, 255)
					}
				}
			}
		}
	}
}

drawValues()