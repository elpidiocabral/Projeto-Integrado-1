require('dotenv').config();
const PORT = process.env.PORT;
const db = require("./database");

const express = require('express');
const app = express();
app.use(express.json());
app.listen(PORT, () => console.log(`Server runnig on port ${PORT}`));

// ROTA SELECT JOGADORES
app.get('/jogadores', async (req, res) => {
  try {
    const asw = await db.selectJogadores();
    return res.status(200).send(asw)
  } catch {err} {
    return res.status(400).send(err)
  }
})

// ROTA JOGADOR BY ID
app.get('/jogadores/:nickname', async (req, res) => {
  try {
    const asw =  await db.selectJogador(req.params.nickname);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err)
  }
})

// ROTA INSERT JOGADOR
app.post('/session', async (req, res) => {
  try {
    await db.insertJogador(req.body)
    return res.sendStatus(201);
  } catch(err) {
    return res.status(400).send(err);
  }
})