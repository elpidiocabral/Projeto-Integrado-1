if (obj_player.estado == "Ataque de soma" && TipoEquacao == "soma"){
	obj_points.pontuacao += equacaoData[2];
	sprite_index = spr_enemy_hit
	instance_destroy(id);
	
} else if (obj_player.estado == "Ataque de subtracao" && TipoEquacao == "subtracao"){
	obj_points.pontuacao += equacaoData[2];
	instance_destroy(id);

} else {
	instance_destroy();
	obj_player.vida_atual--;
	obj_HealthBar.vidasAtuais--;
	if obj_HealthBar.vidasAtuais == 0{
		if obj_jogador_ativo.nickname = "desconhecido"
			room_goto(rm_tela_inicial)
		else { // guardar a pontuação no banco de dados
			var partida = ds_map_create()
			ds_map_add(partida, "", obj_points.pontuacao)
			game_end()
			//instance_destroy(obj_player)
			
		}
	}
}