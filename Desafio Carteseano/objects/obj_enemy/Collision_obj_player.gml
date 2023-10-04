if (obj_player.estado == "Ataque de soma" && TipoEquacao == "soma"){
	obj_points.pontuacao ++;
	instance_destroy(id);
} else {
	instance_destroy();
	obj_player.vida_atual--;
	obj_HealthBar.vidasAtuais--;
	if obj_HealthBar.vidasAtuais == 0{
		game_end()
		//instance_destroy(obj_player)
		
	}
}