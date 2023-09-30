#region Keys
	key_up = keyboard_check(ord("W"))
	key_down = keyboard_check(ord("S"))
	key_left = keyboard_check(ord("A"))
	key_right = keyboard_check(ord("D"))
#endregion

#region Movimentation
	function playerStatus(){
		if	keyboard_check_pressed(ord("D")) || keyboard_check_pressed(ord("A")) ||
			keyboard_check(ord("D"))		|| keyboard_check(ord("A"))
		{
			return spr_playerRun
		} else {
			return spr_playerIdle
		}
	}
	
	
	efeito = layer_get_fx("zoomBlur")
	fx_set_parameter(efeito, "g_ZoomBlurCenter", [x / 1366, y /768]);

	var move = key_right - key_left
	
	
	hspd = move * spd

	vspd += grv
	
	if (hspd != 0) image_xscale = sign(hspd) * orig_xscale
	
	if place_meeting(x+hspd, y, obj_solidTransparent){
		while(!place_meeting(x + sign(hspd), y, obj_solidTransparent)){
			x = x + sign(hspd)
		}
		sprite_index = playerStatus();
		hspd = 0;	
	}
	x += hspd

	if place_meeting(x, y + vspd, obj_solidTransparent){
		while(!place_meeting(x, y + sign(vspd) , obj_solidTransparent)){
			y += sign(vspd)
		}
		sprite_index = playerStatus();
		vspd = 0;
	}
	y += vspd

	//if place_meeting(x, y+1, obj_solidTransparent) and key_up{
	//	sprite_index = spr_player_jump
	//	vspd -= 8
	//}
	
#endregion