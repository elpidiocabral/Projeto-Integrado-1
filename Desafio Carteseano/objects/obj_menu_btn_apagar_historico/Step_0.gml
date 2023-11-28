mouse_hover = (
		mouse_x >= x 
	&&  mouse_y >= y
    &&	mouse_x <= x + sprite_get_width(sprite_index) * image_xscale
	&&	mouse_y <= y + sprite_get_height(sprite_index) * image_yscale)


if mouse_hover && mouse_check_button(mb_left) && obj_jogador_ativo.nickname != "desconhecido" {
	var pkey = partida_botao[4]
	var deletepath =  string_concat("https://cartesiano-api.vercel.app/partida/", pkey)
	http_request(deletepath, "DELETE", 0, 0)
	
	instance_destroy(id)
}

if index >= obj_menuRanking.quant_tuplas //apagar tuplas que haviam antes da alteração da sql
	instance_destroy(id)