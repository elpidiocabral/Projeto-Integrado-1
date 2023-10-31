speed = 1.5
hspeed = speed
vspeed = 0
real_image_speed = image_speed;
orig_xscale = image_xscale

arrayTipoProblemas = ["soma", "subtracao"]
equacao = ""
TipoEquacao = ""

switch(arrayTipoProblemas[choose(0, 1)]){
	case "soma":
		arrayPossiveisCalculos = [
			"5?3 = 8",
			"3?2 = 5",
			"6?2 = 8",
			"5?4 = 9",
			"4?2 = 6"
		]
		equacao = arrayPossiveisCalculos[choose(0,4)];
		TipoEquacao = "soma"
		break;
	case "subtracao":
		arrayPossiveisCalculos = [
			"5?3 = 2",
			"3?2 = 1",
			"6?2 = 4",
			"5?4 = 1",
			"4?2 = 2"
		]
		equacao = arrayPossiveisCalculos[choose(0,4)];
		TipoEquacao = "subtracao"
		break;
}