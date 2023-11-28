draw_self()
draw_set_valign(fa_middle)
draw_set_font(fnt_monocraft_8)


for (i = 0; i < quant_tuplas; i++){
	for (k = 0; k < 4; k++){
		draw_text_color(x - 80 + k * 70 , y + 50 - (sprite_height)/2 + i * 23, partidas[i][k], c_black, c_black, c_black, c_black, 255)
	}
}
