/// @description Insert description here
// You can write your code in this editor

draw_self()

draw_sprite_stretched(spr_textbox, 0, x - 150, y - 60 * ((string_width(dialogo) / 200) + 1), 300, string_height(dialogo) * 5)
draw_set_font(fnt_monocraft)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_text_ext_color(x,y - 70 - (60 * ((string_width(dialogo) / 200) - 1)), dialogo, string_height(dialogo), 200, c_black, c_black, c_black, c_black, 255)



