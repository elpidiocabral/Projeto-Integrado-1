/// @description Insert description here
// You can write your code in this editor
#region //Dialogos
dialogo = "";
dialogo_1 = "Se prepare para sofrer com minha matematica!";
dialogo_2 = "Te destruirei com meu problema hahahaha";
alarm[0] = 100
#endregion
x = 1500;
equacao = obj_boss_db.problemas[random_range(0, array_length(obj_boss_db.problemas) - 1)]
equacaoProblema = equacao[0]

vida_max = 3;
vida_atual = vida_max;

massa = 2;

view_enabled = true
view_visible[0] = true;

max_velh = 3;
max_velv = 12;
speed = 0;


real_image_speed = image_speed;

question_timer = 30; // Tempo pra responder a questão

global.pause = true;