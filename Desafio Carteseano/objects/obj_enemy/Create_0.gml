
speed = 2
hspeed = speed
vspeed = 0


arrayTipoProblemas = ["soma", "subtracao"]
equacao = ""
TipoEquacao = ""

switch(arrayTipoProblemas[random(10)%2]){
	case "soma":
		arrayPossiveisCalculos = [
			"5?3 = 8",
			"3?2 = 5",
			"6?2 = 8",
			"5?4 = 9",
			"4?2 = 6"
		]
		equacao = arrayPossiveisCalculos[random(4)];
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
		equacao = arrayPossiveisCalculos[random(4)];
		TipoEquacao = "subtracao"
		break;
}