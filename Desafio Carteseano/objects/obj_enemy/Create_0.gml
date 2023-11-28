speed = 1.5
hspeed = speed
vspeed = 0
real_image_speed = image_speed;
obj_enemy.image_yscale = 3
obj_enemy.image_xscale = 3

orig_xscale = image_xscale


problemas =  obj_enemy_db.problemas[obj_game.nivel - 1]; //pegando as questões daquele nível.

equacao = ""
TipoEquacao = ""

show_debug_message(problemas)

equacaoData = problemas[random_range(0,array_length(problemas) - 1)] //escolha um problema do vetor.
TipoEquacao = equacaoData[3] == 1 ? "soma" : "subtracao"
equacao = string_concat(equacaoData[0], " ? ", equacaoData[1], " = ", equacaoData[4])

