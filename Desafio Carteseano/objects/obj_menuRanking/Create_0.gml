//criar a conexão de dados aqui em cima..

// Definir o tamanho da matriz
quant_tuplas = 5;

// Inicializar o array bidimensional para armazenar o histórico de partidas
historico_partidas = array_create(quant_tuplas, 4);

// Preencher os dados para as partidas
for (var i = 0; i < quant_tuplas; i++) {
    historico_partidas[i, 0] = "15:30:00";    // Tempo
    historico_partidas[i, 1] = 85 + i * 10;   // Pontuação
    historico_partidas[i, 2] = i + 1;         // Nível
    historico_partidas[i, 3] = i + 1;         // ID da partida
}