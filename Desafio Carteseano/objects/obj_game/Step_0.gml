/// @description Insert description here
// You can write your code in this editor


if (keyboard_check_pressed(ord("P")))
	{
		global.pause = !global.pause;
		if(global.pause){
			layer_hspeed(terrain_layer,0);
			layer_hspeed(sky_layer,0);
		}
		else{
			layer_hspeed(sky_layer,sky_speed);
			layer_hspeed(terrain_layer,terrain_speed);
		}
	}

