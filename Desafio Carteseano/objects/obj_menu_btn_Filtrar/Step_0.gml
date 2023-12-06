event_inherited()
data = bd.urlDatas[table]
if (mouse_hover && mouse_check_button_pressed(mb_left)){
	//show_debug_message(typeof(bd.urlDatas[7]))
	
	#region Preenchendo banco de dados do objeto
	insert = ds_map_create(); 
	var bdDatas = []
	for (var i = 0; i < array_length(bd.urlDatas); i++){
		if bd.urlDatas[i] == ""
			continue;
		bdDatas[i] = json_parse(bd.urlDatas[i])
	}
	

	if (data == "")
		exit
	var structKeys = []
	array_copy(structKeys, 0, bd.tableNames[2][table], 0,array_length(bd.tableNames[2][table]))
	var temporaryArray = json_parse(data)
	if !(array_length(temporaryArray) == 0) {
		var structKeys = struct_get_names(temporaryArray[0])
	}
	array_sort(structKeys, true)
	
	#endregion
	#region Pegando ID para alterar
		var myId = get_string("Qual o id que deseja alterar?", "")
	
		myData = []
		var idSearch = false
		for ( var i = 0; i< array_length(bdDatas[table]); i++) {
		    if myId == struct_get(bdDatas[table][i], string_concat("id_", string_lower(bd.tableNames[0][table]))){
				idSearch = true
				myData = bdDatas[table][i]
				break;
			}
		}
	
		if (!idSearch){
			show_message("Id não existente")
			exit
		}
		
		
	
	#endregion
	
	switch (table){ // vamos apagar casas qeu não vamos usar.
		case 0: //Tabela de histórico.
			array_delete(structKeys, 0, 1) // apagando o id_historico
			break;
		case 1: //Tabela de Skins.
			array_delete(structKeys, 0, 1) // apagando o id_skin;
			break;
		case 2: //Tabela de armas.
			array_delete(structKeys, 0, 1) // apagando o id_arma
			break;
		case 3: //Tabela de partidas.
			array_delete(structKeys, 0, 1) // apagando o id_partida
			break;
		case 4: //Tabela de desafio.
			array_delete(structKeys, 1, 1) // apagando o id_desafio
			break;
		case 5: //Tabela de problema.
			array_delete(structKeys, 3, 1) // apagando o id_problema
			break;
		case 6: //Tabela de assunto.
			array_delete(structKeys, 0, 1) // apagando o id_assunto
			break;
		case 7: //Tabela de jogador.
			break;
	}
	var values = []
	var i = 0
	

	
	for (; i < array_length(structKeys); i++){
		//show_message("Recarregando..")
		
		values[i] = get_string(string_concat("Digite um valor para: ", structKeys[i]), "")
		
		if (values[i] == ""){
			break
		}
		
		#region conferencia
			switch (table){
				case 0: //Tabela de histórico.
					if (i == 0) { // vamos verificar se aquele jogador existe.
						for (var k = 0; k < array_length(bdDatas[7]); k++){						
							if (!(values[i] == struct_get(bdDatas[7][k], "nickname")) && k == array_length(bdDatas[7]) - 1){
								show_message("Não existe jogador com esse nome")
								values[i] = ""
								i --
								exit
							} else if values[i] == struct_get(bdDatas[7][k], "nickname"){
								break;
							}
						}
					} else if  (i == 1) { //Vamos verificar se já tem algum id com aquele mesmo ID de partida.
						for (var k = 0; k < array_length(temporaryArray); k++){
							if (values[i] == int64(struct_get(temporaryArray[k], structKeys[i])) && struct_get(myData, "id_partida") != int64(values[i])){
								values[i] = ""
								i--
								show_message("Já existe partida atrelada a esse id_partida.")
								exit;
							} else if (!(values[i] == struct_get(bdDatas[3][k], "id_partida")) && k == array_length(temporaryArray) - 1) && struct_get(myData, "id_partida") != int64(values[i]){
								show_message("Não existe id_partida com esse numero")
								values[i] = ""
								i--
								exit;
							} else if values[i] == struct_get(bdDatas[3][k], "id_partida"){
								break;
							}
						}
					}
					if (i == array_length(structKeys) - 1) show_message("Cadastrado com sucesso")
					break;
				case 1: //Tabela de Skins.
					if (i == 0) { // vamos verificar se existe alguma skin com aquele nome existe.
						for (var k = 0; k < array_length(bdDatas[1]); k++){						
							if values[i] == struct_get(bdDatas[1][k], "nome"){
								show_message("Já existe skin com esse nome.")
								values[i] = ""
								i -= 1
								exit;
							}
						}
					}
					break;
				case 2: //Tabela de armas.
					if (i == 0) { // vamos verificar se existe arma com aquele nome.
						for (var k = 0; k < array_length(bdDatas[2]); k++){						
							if values[i] == struct_get(bdDatas[2][k], "nome"){
								show_message("Já existe arma com esse nome.")
								values[i] = ""
								i -= 1
								exit;
							}
						}
					}
					break;
				case 3: //Tabela de partidas.
					// Não precisa verificar nada aqui. Todos os dados são desnecessários de verificação.
					break;
				case 4: //Tabela de desafio.
					if (i == 0) { // vamos verificar se aquele id_assunto existe.
						for (var k = 0; k < array_length(bdDatas[6]); k++){						
							if (!(values[i] == struct_get(bdDatas[6][k], "id_assunto")) && k == array_length(bdDatas[6]) - 1){
								show_message("Não existe id_assunto com esse numero")
								values[i] = ""
								i -= 1
								exit;
							} else if values[i] == struct_get(bdDatas[6][k], "id_assunto"){
								break;
							}
						}
					}
					break;
				case 5: //Tabela de problema.
					if (i == 2) { // vamos verificar se aquele id_assunto existe.
						for (var k = 0; k < array_length(bdDatas[6]); k++){
							if (!(values[i] == struct_get(bdDatas[6][k], "id_assunto")) && k == array_length(bdDatas[6]) - 1){
								show_message("Não existe id_assunto com esse numero")
								values[i] = ""
								i -= 1
								exit;
							} else if values[i] == struct_get(bdDatas[6][k], "id_assunto"){
								break;
							}
						}
					}
					break;
				case 6: //Tabela de assunto.
					if (i == 0) { // vamos verificar se existe um assunto com aquele nome.
						for (var k = 0; k < array_length(bdDatas[6]); k++){						
							if values[i] == string_lower(struct_get(bdDatas[6][k], "nome")){
								show_message("Já existe assunto com esse nome.")
								values[i] = ""
								i -= 1
								exit;
							}
						}
					} else if (i == 1) { // vamos verificar se existe um assunto com aquele nome.
						for (var k = 0; k < array_length(bdDatas[6]); k++){						
							if values[i] == struct_get(bdDatas[6][k], "operador"){
								show_message("Já existe assunto com esse operador.")
								values[i] = ""
								i -= 1
								exit;
							}
						}
					}
					break;
				case 7: //Tabela de jogador.
					if (i == 1) { // vamos verificar se existe um jogador com aquele nickname.
						for (var k = 0; k < array_length(bdDatas[7]); k++){						
							if values[i] == struct_get(bdDatas[7][k], "login"){
								show_message("Já existe jogador com esse login.")
								values[i] = ""
								i -= 1
								exit;
							}
						}
					} else if (i == 2) { // vamos verificar se existe um jogador com aquele login.
						for (var k = 0; k < array_length(bdDatas[7]); k++){						
							if string_lower(values[i]) == string_lower(struct_get(bdDatas[7][k], "nickname")){
								show_message("Já existe jogador com esse nickname.")
								values[i] = ""
								i -= 1
								exit;
							}
						}
					}
					break;
			
			}
		#endregion
		
		
		ds_map_add(insert, structKeys[i], values[i]);
	}
	var jsonNote = json_encode(insert);
	if (jsonNote = "{}"){
		insert = ds_map_create()
		exit
	}
	
	var headerMap = ds_map_create();
	ds_map_add(headerMap, "Content-Type", "application/json");
	//show_debug_message(string_concat("https://cartesiano-api.vercel.app", string_lower(bd.tableNames[1][table]), "/", myId))
	//show_debug_message(jsonNote)
	http_request(string_concat("https://cartesiano-api.vercel.app/filter/", string_lower(bd.tableNames[1][table]), "/", myId), "PATCH", headerMap, jsonNote);
	
}