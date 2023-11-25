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
  deleteAssunto
}