mouse_hover = (mouse_x >= x 
	&&  mouse_y >= y
    &&	mouse_x <= x + sprite_get_width(spr_menuButton_pressed) * image_xscale
	&&	mouse_y <= y + sprite_get_height(spr_menuButton_pressed) * image_yscale)