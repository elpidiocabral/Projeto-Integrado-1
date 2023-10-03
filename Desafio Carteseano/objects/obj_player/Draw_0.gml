event_inherited();

if (estado == "Ataque de soma"){
	var text = "Golpe de positividade!"
	draw_sprite_stretched(spr_textbox, 0, x - string_width(text)/2, y - 100, string_width(text), string_height(text)*3)
	draw_set_font(fnt_monocraft)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text_ext_color(x,y - 70, text, string_height(text), string_width(text) - 0.2*string_width(text), c_black, c_black, c_black, c_black, 255)
}