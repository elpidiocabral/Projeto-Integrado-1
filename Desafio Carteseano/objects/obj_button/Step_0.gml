mouse_hover = (
		mouse_x >= x 
	&&  mouse_y >= y
    &&	mouse_x <= x + sprite_get_width(sprite_index) * image_xscale
	&&	mouse_y <= y + sprite_get_height(sprite_index) * image_yscale)
	
if mouse_hover && image_index < image_number{ // Se o mouse tiver em cima e não chegamos a ultima imagem.
	clicked = mouse_check_button(mb_left)
	if !isExitButton 
		sprite_index = spr_menuButton_hover
	image_speed = 1
} else if mouse_hover{
	image_speed = 0
	clicked = mouse_check_button(mb_left)
	if clicked{
		image_speed = 1
		image_index = 0
	} 
} else if image_index > 0.2{ // se o mouse saiu de cima e não chegamos a primeira imagem.
	image_speed = -1
	clicked = false
} else{ // O mouse não está em cima então estamos no marco inicial e com animação 0.
	image_index = 0
	image_speed = 0
	clicked = false
}