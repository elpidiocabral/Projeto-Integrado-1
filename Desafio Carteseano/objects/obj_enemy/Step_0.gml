if (global.pause)
	{
	speed = 0;
	image_speed = 0;
	exit;
	}
else { speed = 1.5;
	image_speed = real_image_speed;
	}

	
hspeed = -speed

y = obj_solidTransparent.y - obj_solidTransparent.sprite_height

if (hspeed != 0) image_xscale = sign(hspeed) * orig_xscale
if place_meeting(x+hspeed, y, obj_solidTransparent){
	while(!place_meeting(x + sign(hspeed), y, obj_solidTransparent)){
		x += sign(hspeed)	
	}
	hspeed = 0;	
}
x = x+hspeed