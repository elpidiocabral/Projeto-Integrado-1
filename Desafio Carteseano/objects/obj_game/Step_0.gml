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


if (global.pause == false) exec_time += delta_time;
if (obj_points.pontuacao * 10 + exec_time/1000000 > 300) // inimigos * 10 + delta_time / 1000000 (delta_time vem em microsegundos então isso aqui converte).
{ 
	spawn_boss = true;	// Se ja puder, spawna o boss
}

if (spawn_boss || keyboard_check_pressed(ord("N"))){
	show_debug_message("Spawna o Boss");
	room_goto(rm_boss_room);
}



