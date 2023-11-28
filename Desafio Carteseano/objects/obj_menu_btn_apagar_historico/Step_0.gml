mouse_hover = (
		mouse_x >= x 
	&&  mouse_y >= y
    &&	mouse_x <= x + sprite_get_width(sprite_index) * image_xscale
	&&	mouse_y <= y + sprite_get_height(sprite_index) * image_yscale)


if mouse_hover && mouse_check_button(mb_left) {
	show_message(partida_botao[4])
	instance_destroy(id)
}

if index >= obj_menuRanking.quant_tuplas 
	instance_destroy(id)