mouse_hover = (
		mouse_x >= x 
	&&  mouse_y >= y
    &&	mouse_x <= x + sprite_get_width(spr_menuButton_hover) * image_xscale
	&&	mouse_y <= y + sprite_get_height(spr_menuButton_hover) * image_yscale)
	
if mouse_hover && image_index < image_number{ // Se o mouse tiver em cima e não chegamos a ultima imagem.
	image_speed = 1
} else if image_index > 0.2{ // se o mouse saiu de cima e não chegamos a primeira imagem.
	image_speed = -1
} else{ // O mouse não está em cima então estamos no marco inicial e com animação 0.
	image_index = 0
	image_speed = 0
}