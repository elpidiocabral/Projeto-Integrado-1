question_timer -= delta_time/10000;
if (keyboard_check(ord("P"))){
	global.pause = !global.pause;
}

if (distance_to_object(obj_player) > 900){
	speed = -max_velh;
	sprite_index = spr_bossRun;
}
else{
	speed = 0;
	sprite_index = spr_bossIdle;
}
x+=speed;