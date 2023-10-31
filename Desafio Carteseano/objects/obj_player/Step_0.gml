var right, left, jump;
var sumAttack, subAttack, multAttack, divAttack;
var chao = place_meeting(x, y+1, obj_solidTransparent);
var paredeEsquerda = place_meeting(x-1, y, obj_solidTransparentVertical)
var paredeDireita = place_meeting(x+1, y, obj_solidTransparentVertical)
var parede = paredeEsquerda || paredeDireita

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
jump = keyboard_check(vk_up);
sumAttack = keyboard_check(ord("Q"))
subAttack = keyboard_check(ord("W"))

if (!parede)
	velh = (right - left) * max_velh;
else {
	if (place_meeting(x+((right - left) * max_velh), y, obj_solidTransparentVertical)){
		velh = 0;
	} else 
		velh = (right - left) * max_velh
}


var effect_blur = layer_get_fx("zoomBlur")
fx_set_parameter(effect_blur, "g_ZoomBlurCenter", [x/4096, y/768])


//var _dwidth = display_get_width();
//var _dheight = display_get_height();
//var _xpos = (_dwidth / 2) - 480;
//var _ypos = (_dheight / 2) - 400;
//window_set_rectangle(_xpos, _ypos, 1024, 760);
view_camera[0] = camera_create_view(x - 150, 0, 1024, 720, 0, obj_player, 4, 1, 0, 100)



if (!chao){
	if (velv < max_velv * 2)
		velv += (GRAVIDADE * massa)
}  else {
	if (jump){
		velv = -max_velv;
		image_index = 0
	}
}


switch (estado){
	case "morto":
		
		
		break;
	case "parado":
		
		sprite_index = spr_playerIdle;
		image_index = 0
		
		if ((right || left) && !parede)
			estado = "movendo"
			// && (!place_meeting(x + velh, y, obj_solidTransparent) || !place_meeting(x - velh, y, obj_solidTransparent))
		else if (jump && chao){
			estado = "pulando"
			image_index = 0
			velv = -max_velv
		} else if (sumAttack){
			estado = "Ataque de soma"
			image_index = 0
			velh = 0
		} else if (subAttack){
			estado = "Ataque de subtracao"
			image_index = 0
			velh = 0
		}
		break;
	case "movendo":
		sprite_index = spr_playerRun
		
		if (abs(velh) < .1){
			estado = "parado"
			velh = 0
		} else if (jump && chao){
			estado = "pulando"
			image_index = 0
			velv = -max_velv
		} else if (sumAttack){
			estado = "Ataque de soma"
			image_index = 0
			velh = 0 
		} else if (subAttack){
			estado = "Ataque de subtracao"
			image_index = 0
			velh = 0 
		} else if (parede){
			estado = "parado"
			image_index = 0
			velh = 0
		}
		break;
		
	case "pulando":
		if !(velv > 0)
			sprite_index = spr_playerJump
		if (chao){
			estado = "parado"
			image_index = 0
			velh = 0;
		}
		break;
		
	case "Ataque de soma":
		velh = 0
		sprite_index = spr_playerSumAttack

#region SOUND
	delay_emitter = audio_emitter_create();
	delay_bus = audio_bus_create();

	audio_emitter_bus(delay_emitter, delay_bus);
	var _delay_effect = audio_effect_create(AudioEffectType.Delay);
	_delay_effect.feedback = 0.55;
	_delay_effect.time = 0.1;
	_delay_effect.mix = 0.7;
	delay_bus.effects[0] = _delay_effect;


	//show_message(image_index)
	if (image_index <= 0.25)
		audio_play_sound_on(delay_emitter, snd_punch, 0, 1);
		
		
#endregion 

		if (image_index >= image_number - 1)
			estado = "parado"
		break;
		
	case "Ataque de subtracao":
		velh = 0
		sprite_index = spr_playerSubAttack

#region SOUND
	delay_emitter = audio_emitter_create();
	delay_bus = audio_bus_create();

	audio_emitter_bus(delay_emitter, delay_bus);
	var _delay_effect = audio_effect_create(AudioEffectType.Delay);
	_delay_effect.feedback = 0.55;
	_delay_effect.time = 0.1;
	_delay_effect.mix = 0.7;
	delay_bus.effects[0] = _delay_effect;


	//show_message(image_index)
	if (image_index <= 0.25)
		audio_play_sound_on(delay_emitter, snd_punch, 0, 1);
		
		
#endregion 

		if (image_index >= image_number - 1)
			estado = "parado"
		break;
}