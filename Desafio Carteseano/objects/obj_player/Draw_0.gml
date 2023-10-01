event_inherited();

if (estado == "Ataque de soma"){
	draw_rectangle_color(x - 150, y - 100, x + 150, y - 50, 0, 0, 0, 0, 0)
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(x, y - sprite_height * 0.6, estado)
	draw_text_color(x, y - 75, "Golpe de positividade!!", c_white, c_white, c_purple, c_purple, 255)
}