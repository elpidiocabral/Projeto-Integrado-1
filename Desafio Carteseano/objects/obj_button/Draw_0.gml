//draw_self()
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(fnt_monocraft)

if mouse_hover{
	draw_text_color(x + sprite_width / 2, y + sprite_height / 2, btn_string, c_green, c_green ,c_green,c_green,255)
} else {
	draw_text_color(x + sprite_width / 2, y + sprite_height / 2, btn_string, c_black, c_black ,c_black,c_black,255)
}