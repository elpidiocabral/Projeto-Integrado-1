#region Keys
	key_up = keyboard_check(ord("W")) //|| keyboard_check_pressed(ord("W"))
	key_down = keyboard_check(ord("S")) 
	key_left = keyboard_check(ord("A")) //|| keyboard_check_pressed(ord("A"))
	key_right = keyboard_check(ord("D")) //|| keyboard_check_pressed(ord("D"))
#endregion

#region Movimentation
	function playerStatus(){
		if key_up {//|| y > obj_solidTransparent.y + 1{
			return spr_playerJump
		} else if	key_left || key_right {
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
			x += sign(hspd)
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
	
	if place_meeting(x, y + 1, obj_solidTransparent) and key_up{
		sprite_index = playerStatus();
		vspd -= 8;
	}
	
	

	

	
#endregion