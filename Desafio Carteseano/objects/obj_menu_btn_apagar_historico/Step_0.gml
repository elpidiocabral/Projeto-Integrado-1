mouse_hover = (
		mouse_x >= x 
	&&  mouse_y >= y
    &&	mouse_x <= x + sprite_get_width(sprite_index) * image_xscale
	&&	mouse_y <= y + sprite_get_height(sprite_index) * image_yscale)


if mouse_hover && mouse_check_button(mb_left) {
	show_message(partida_botao[0])
	
	//show_message(struct_get(id_botao, "nickname"))
	
	
	
	instance_destroy(id)
}