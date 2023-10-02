var _velv = sign (velv)
var _velh = sign (velh)

repeat(abs(velh)){
	if (place_meeting(x + _velh, y, obj_solidTransparent)){
		velh = 0
		break;
	}
	x += _velh

}

repeat(abs(velv)){
	if (place_meeting(x, y + _velv, obj_solidTransparent)){
		velv = 0
		break;
	}
	y += _velv
}