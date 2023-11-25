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

module.exports = {
  selectJogadores,
  selectJogador,
  insertJogador
}