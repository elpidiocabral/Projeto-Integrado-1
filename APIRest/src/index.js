require('dotenv').config();
const PORT = process.env.PORT;
const db = require("./database");

const express = require('express');
const app = express();
app.use(express.json());
app.listen(PORT, () => console.log(`Server runnig on port ${PORT}`));

// ============================= CRUD JOGADORES ================================
// ROTA SELECT JOGADORES
app.get('/jogador', async (req, res) => {
  try {
    const asw = await db.selectJogadores();
    return res.status(200).send(asw);
  } catch {err} {
    return res.status(400).send(err);
  }
})

// ROTA JOGADOR BY ID
app.get('/jogador/:nickname', async (req, res) => {
  try {
    const asw =  await db.selectJogador(req.params.nickname);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT JOGADOR
app.post('/jogador', async (req, res) => {
  try {
    await db.insertJogador(req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA UPDATE JOGADOR
app.patch("/jogador/:nickname", async (req, res) => {
  try {
    await db.updateJogador(req.params.nickname, req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA DELETE JOGADOR
app.delete("/jogador/:nickname", async (req, res) => {
  try {
    await db.deleteJogador(req.params.nickname);
    return res.sendStatus(204);
  } catch(err) {
    return res.status(400).send(err);
  }
})

//==================== CRUD ASSUNTO ==========================
// ROTA SELECIONA ASSUNTOS
app.get('/assunto', async (req, res) => {
  try {
    const asw = await db.selectAssuntos();
    return res.status(200).send(asw);
  } catch {err} {
    return res.status(400).send(err);
  }
})

// ROTA ASSUNTO BY ID
app.get('/assunto/:id', async (req, res) => {
  try {
    const asw =  await db.selectAssunto(req.params.id);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT ASSUNTO
app.post('/assunto', async (req, res) => {
  try {
    await db.insertAssunto(req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA UPDATE ASSUNTO
app.patch("/assunto/:id", async (req, res) => {
  try {
    await db.updateAssunto(req.params.id, req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA DELETE JOGADOR
app.delete("/assunto/:id", async (req, res) => {
  try {
    await db.deleteAssunto(req.params.id);
    return res.sendStatus(204);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ================== CRUD PROBLEMA ===================
// ROTA SELECIONA PROBLEMAS
app.get('/problema', async (req, res) => {
  try {
    const asw = await db.selectProblemas();
    return res.status(200).send(asw);
  } catch {err} {
    return res.status(400).send(err);
  }
})

// ROTA PROBLEMA BY ID
app.get('/problema/:id', async (req, res) => {
  try {
    const asw =  await db.selectProblema(req.params.id);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT PROBLEMA
app.post('/problema', async (req, res) => {
  try {
    await db.insertProblema(req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA UPDATE PROBLEMA
app.patch("/problema/:id", async (req, res) => {
  try {
    await db.updateProblema(req.params.id, req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA DELETE PROBLEMA
app.delete("/problema/:id", async (req, res) => {
  try {
    await db.deleteProblema(req.params.id);
    return res.sendStatus(204);
  } catch(err) {
    return res.status(400).send(err);
  }
})

