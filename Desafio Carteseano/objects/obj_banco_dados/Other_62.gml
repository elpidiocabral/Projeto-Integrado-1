var r_str = async_load[? "result"]
var url = async_load[? "url"]
var toStorage = 0;


for (var i = 0; i < 8; i++){
	if (url == string_concat(basepath, tableNames[1][i])){
		toStorage = i;
		break;
	}
}

var toX = vetor_menus[toStorage][0].x
var toY = vetor_menus[toStorage][0].y

if (async_load[? "http_status"] == 200 && r_str != "Ok" && r_str != "OK"){
	urlDatas[toStorage] = r_str
	//			  Tabela,     Linha
	
	data = json_parse(urlDatas[toStorage])
	for (var i = 0; i < array_length(data) && i < 13; i++){
		// Naquela tabela, naquela linha, crie esse botão de delete.
		deleteButtons[toStorage][i]  = instance_create_layer(toX + 320, toY + (i+1) * 15.3 + 20, "x_buttons", obj_menu_btn_apagar_historico_Historico)
		deleteButtons[toStorage][i]  .image_xscale = 0.025
		deleteButtons[toStorage][i]  .image_yscale = 0.025
	}
} else {
	notLoadeds[ki++] = url
}
