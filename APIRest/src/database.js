async function connect(){
  if(global.connection)
    return global.connection.connect();

  const { Pool } = require('pg');

  const pool = new Pool({
    connectionString: process.env.CONNECTION_STRING
  });

  global.connection = pool;
  return pool.connect();
}

connect();

// ====================== CRUD JOGADOR ========================================
async function selectJogadores(){
  const client = await connect();
  const res = await client.query('SELECT * FROM Jogador;');
  return res.rows;
}

async function selectJogador(nickname){
  const client = await connect();
  const res = await client.query('SELECT * FROM Jogador WHERE nickname=$1', [nickname]);
  return res.rows;
}

async function insertJogador(jogador){
  const client = await connect();
  const sql = `
    INSERT INTO Jogador (nickname, login, senha, turma, ano_escolar, score)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *;
  `
  const values = [jogador.nickname, jogador.login, jogador.senha, jogador.turma, jogador.ano_escolar, jogador.score];
  await client.query(sql, values);
}

async function updateJogador(nickname, jogador){
  const client = await connect();
  const sql = `
    UPDATE Jogador SET nickname=$1, login=$2, senha=$3, turma=$4, ano_escolar=$5, score=$6
    WHERE nickname=$7;  
  `
  const values = [jogador.nickname, jogador.login, jogador.senha, jogador.turma, jogador.ano_escolar, jogador.score, nickname];
  await client.query(sql, values);
}

async function deleteJogador(nickname){
  const client = await connect();
  const sql = `DELETE FROM Jogador WHERE nickname=$1;`
  const values = [nickname];
  await client.query(sql, values);
}


// ============================ CRUD ASSUNTO ==============================
async function selectAssuntos(){
  const client = await connect();
  const res = await client.query('SELECT * FROM Assunto;');
  return res.rows;
}

async function selectAssunto(id){
  const client = await connect();
  const res = await client.query('SELECT * FROM Assunto WHERE id_assunto=$1', [id]);
  return res.rows;
}

async function insertAssunto(assunto){
  const client = await connect();
  const sql = `
    INSERT INTO Assunto (nome, operador)
    VALUES ($1, $2)
    RETURNING *;
  `
  const values = [assunto.nome, assunto.operador];
  await client.query(sql, values);
}

async function updateAssunto(id, assunto){
  const client = await connect();
  const sql = `
    UPDATE Assunto SET nome=$1, operador=$2
    WHERE id_assunto=$3;  
  `
  const values = [assunto.nome, assunto.operador, id];
  await client.query(sql, values);
}

async function deleteAssunto(id){
  const client = await connect();
  const sql = `DELETE FROM Assunto WHERE id_assunto=$1;`
  const values = [id];
  await client.query(sql, values);
}

// ======================= CRUD PROBLEMA ============================
async function selectProblemas(){
  const client = await connect();
  const res = await client.query('SELECT * FROM Problema;');
  return res.rows;
}

async function selectProblema(id){
  const client = await connect();
  const res = await client.query('SELECT * FROM Problema WHERE id_problema=$1', [id]);
  return res.rows;
}

async function insertProblema(problema){
  const client = await connect();
  const sql = `
    INSERT INTO Problema (fator_1, fator_2, resultado, pontuacao, nivel, id_assunto)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *;
  `
  const values = [problema.fator_1, problema.fator_2, problema.resultado, problema.pontuacao, problema.nivel, problema.id_assunto];
  await client.query(sql, values);
}

async function updateProblema(id, problema){
  const client = await connect();
  const sql = `
    UPDATE Problema SET fator_1=$1, fator_2=$2, resultado=$3, pontuacao=$4, nivel=$5, id_assunto=$6
    WHERE id_problema=$7;  
  `
  const values = [problema.fator_1, problema.fator_2, problema.resultado, problema.pontuacao, problema.nivel, problema.id_assunto, id];
  await client.query(sql, values);
}

async function deleteProblema(id){
  const client = await connect();
  const sql = `DELETE FROM Problema WHERE id_problema=$1;`
  const values = [id];
  await client.query(sql, values);
}

// ======================= CRUD DESAFIO ============================
async function selectDesafios(){
  const client = await connect();
  const res = await client.query('SELECT * FROM Desafio;');
  return res.rows;
}

async function selectDesafio(id){
  const client = await connect();
  const res = await client.query('SELECT * FROM Desafio WHERE id_desafio=$1', [id]);
  return res.rows;
}

async function insertDesafio(desafio){
  const client = await connect();
  const sql = `
    INSERT INTO Desafio (problema, solucao, pontuacao, nivel, id_assunto)
    VALUES ($1, $2, $3, $4, $5)
    RETURNING *;
  `
  const values = [desafio.problema, desafio.solucao, desafio.pontuacao, desafio.nivel, desafio.id_assunto];
  await client.query(sql, values);
}

async function updateDesafio(id, desafio){
  const client = await connect();
  const sql = `
    UPDATE desafio SET problema=$1, solucao=$2, pontuacao=$3, nivel=$4, id_assunto=$5
    WHERE id_desafio=$6;  
  `
  const values = [desafio.problema, desafio.solucao, desafio.pontuacao, desafio.nivel, desafio.id_assunto, id];
  await client.query(sql, values);
}

async function deleteDesafio(id){
  const client = await connect();
  const sql = `DELETE FROM Desafio WHERE id_desafio=$1;`
  const values = [id];
  await client.query(sql, values);
}

// ======================= CRUD PARTIDA ============================
async function selectPartidas(){
  const client = await connect();
  const res = await client.query('SELECT * FROM Partida;');
  return res.rows;
}

async function selectPartida(id){
  const client = await connect();
  const res = await client.query('SELECT * FROM Partida WHERE id_partida=$1', [id]);
  return res.rows;
}

async function insertPartida(partida){
  const client = await connect();
  const sql = `
    INSERT INTO Partida (tempo, pontuacao_final, nivel)
    VALUES ($1, $2, $3)
    RETURNING *;
  `
  const values = [partida.tempo, partida.pontuacao_final, partida.nivel];
  await client.query(sql, values);
}

async function updatePartida(id, partida){
  const client = await connect();
  const sql = `
    UPDATE Partida SET tempo=$1, pontuacao_final=$2, nivel=$3
    WHERE id_partida=$4;  
  `
  const values = [partida.tempo, partida.pontuacao_final, partida.nivel, id];
  await client.query(sql, values);
}

async function deletePartida(id){
  const client = await connect();
  const sql = `DELETE FROM Partida WHERE id_partida=$1;`
  const values = [id];
  await client.query(sql, values);
}

// ======================= CRUD ARMAS ============================
async function selectArmas(){
  const client = await connect();
  const res = await client.query('SELECT * FROM Armas;');
  return res.rows;
}

async function selectArma(id){
  const client = await connect();
  const res = await client.query('SELECT * FROM Armas WHERE id_arma=$1', [id]);
  return res.rows;
}

async function insertArma(arma){
  const client = await connect();
  const sql = `
    INSERT INTO Armas (nome, value)
    VALUES ($1, $2)
    RETURNING *;
  `
  const values = [arma.nome, arma.value];
  await client.query(sql, values);
}

async function updateArma(id, arma){
  const client = await connect();
  const sql = `
    UPDATE Armas SET nome=$1, value=$2
    WHERE id_arma=$3;  
  `
  const values = [arma.nome, arma.value, id];
  await client.query(sql, values);
}

async function deleteArma(id){
  const client = await connect();
  const sql = `DELETE FROM Armas WHERE id_arma=$1;`
  const values = [id];
  await client.query(sql, values);
}

// ======================= JOGADOR ARMAS ============================
async function selectJogadorArmas(nickname){
  const client = await connect();
  const res = await client.query('SELECT id_arma FROM Jogador_arma WHERE id_jogador=$1', [nickname]);
  return res.rows;
}

async function insertArmaJogador(nickname, arma){
  const client = await connect();
  const sql = `
    INSERT INTO Jogador_arma (id_jogador, id_arma)
    VALUES ($1, $2)
    RETURNING *;
  `
  const values = [nickname, arma.id_arma];
  await client.query(sql, values);
}

// ======================= CRUD SKIN =============================
async function selectSkins(){
  const client = await connect();
  const res = await client.query('SELECT * FROM Skins;');
  return res.rows;
}

async function selectSkin(id){
  const client = await connect();
  const res = await client.query('SELECT * FROM Skins WHERE id_skin=$1', [id]);
  return res.rows;
}

async function insertSkin(skin){
  const client = await connect();
  const sql = `
    INSERT INTO Skins (nome, value)
    VALUES ($1, $2)
    RETURNING *;
  `
  const values = [skin.nome, skin.value];
  await client.query(sql, values);
}

async function updateSkin(id, skin){
  const client = await connect();
  const sql = `
    UPDATE Skins SET nome=$1, value=$2
    WHERE id_skin=$3;  
  `
  const values = [skin.nome, skin.value, id];
  await client.query(sql, values);
}

async function deleteSkin(id){
  const client = await connect();
  const sql = `DELETE FROM Skins WHERE id_skin=$1;`
  const values = [id];
  await client.query(sql, values);
}

// ======================= JOGADOR SKINS ============================
async function selectJogadorSkins(nickname){
  const client = await connect();
  const res = await client.query('SELECT id_skin FROM Jogador_skin WHERE id_jogador=$1', [nickname]);
  return res.rows;
}

async function insertSkinJogador(nickname, skin){
  const client = await connect();
  const sql = `
    INSERT INTO Jogador_skin (id_jogador, id_skin)
    VALUES ($1, $2)
    RETURNING *;
  `
  const values = [nickname, skin.id_skin];
  await client.query(sql, values);
}

// ======================= CRUD HISTORICO =============================
async function selectHistoricos(){
  const client = await connect();
  const res = await client.query('SELECT * FROM Historico;');
  return res.rows;
}

async function selectHistorico(id){
  const client = await connect();
  const res = await client.query('SELECT * FROM Historico WHERE id_historico=$1', [id]);
  return res.rows;
}

async function insertHistorico(historico){
  const client = await connect();
  const sql = `
    INSERT INTO Historico (id_jogador, id_partida)
    VALUES ($1, $2)
    RETURNING *;
  `
  const values = [historico.id_jogador, historico.id_partida];
  await client.query(sql, values);
}

async function updateHistorico(id, historico){
  const client = await connect();
  const sql = `
    UPDATE Historico SET id_jogador=$1, id_partida=$2
    WHERE id_historico=$3;  
  `
  const values = [historico.id_jogador, historico.id_partida, id];
  await client.query(sql, values);
}

async function deleteHistorico(id){
  const client = await connect();
  const sql = `DELETE FROM Historico WHERE id_historico=$1;`
  const values = [id];
  await client.query(sql, values);
}

module.exports = {
  selectJogadores,
  selectJogador,
  insertJogador,
  updateJogador,
  deleteJogador,
  selectAssuntos,
  selectAssunto,
  insertAssunto,
  updateAssunto,
  deleteAssunto,
  selectProblemas,
  selectProblema,
  insertProblema,
  updateProblema,
  deleteProblema,
  selectDesafios,
  selectDesafio,
  insertDesafio,
  updateDesafio,
  deleteDesafio,
  selectPartidas,
  selectPartida,
  insertPartida,
  updatePartida,
  deletePartida,
  selectArmas,
  selectArma,
  insertArma,
  updateArma,
  deleteArma,
  selectJogadorArmas,
  insertArmaJogador,
  selectSkins,
  selectSkin,
  insertSkin,
  updateSkin,
  deleteSkin,
  selectJogadorSkins,
  insertSkinJogador,
  selectHistoricos,
  selectHistorico,
  insertHistorico,
  updateHistorico,
  deleteHistorico
}