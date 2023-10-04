/// @description Insert description here
// You can write your code in this editor


hspeed = -speed

if place_meeting(x+hspeed, y, obj_solidTransparent){
		while(!place_meeting(x + sign(hspeed), y, obj_solidTransparent)){
			x += sign(hspeed)	
		}

		hspeed = 0;	
	}

	x = x+hspeed