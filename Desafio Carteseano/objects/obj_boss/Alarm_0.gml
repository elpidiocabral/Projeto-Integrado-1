/// @description Insert description here
// You can write your code in this editor
if (dialogo == ""){
	dialogo = dialogo_1;
	alarm[0] = 150
}
else if (dialogo == dialogo_1){
	dialogo = dialogo_2
	alarm[0] = 150
}
else if (dialogo == dialogo_2){
	dialogo = equacaoProblema[0];
	alarm[0] = 150
}else if (dialogo == equacaoProblema[0]){
	resultado = get_string_async(equacaoProblema[0], "")
}

if (resultado != 0){
	obj_game.nivel++;
	obj_points.pontuacao += equacaoProblema[2]
	global.pause = false
	room_goto(rm_Jogo)	
}
