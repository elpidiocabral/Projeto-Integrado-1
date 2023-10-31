
draw_self()
draw_sprite_stretched(spr_textbox, 0, x - string_width(equacao)/2 - 20, y - 100, string_width(equacao) + 40, string_height(equacao)*3)
draw_set_font(fnt_monocraft)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_text_ext_color(x,y - 70, equacao, string_height(equacao), string_width(equacao), c_black, c_black, c_black, c_black, 255)