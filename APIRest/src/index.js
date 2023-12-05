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

// ======================= CRUD DESAFIO =================================
// ROTA SELECIONA DESAFIOS
app.get('/desafio', async (req, res) => {
  try {
    const asw = await db.selectDesafios();
    return res.status(200).send(asw);
  } catch {err} {
    return res.status(400).send(err);
  }
})

// ROTA DESAFIO BY ID
app.get('/desafio/:id', async (req, res) => {
  try {
    const asw =  await db.selectDesafio(req.params.id);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT DESAFIO
app.post('/desafio', async (req, res) => {
  try {
    await db.insertDesafio(req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA UPDATE DESAFIO
app.patch("/desafio/:id", async (req, res) => {
  try {
    await db.updateDesafio(req.params.id, req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA DELETE DESAFIO
app.delete("/desafio/:id", async (req, res) => {
  try {
    await db.deleteDesafio(req.params.id);
    return res.sendStatus(204);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ======================= CRUD PARTIDA =================================

// ROTA SELECIONA PARTIDAS
app.get('/partida', async (req, res) => {
  try {
    const asw = await db.selectPartidas();
    return res.status(200).send(asw);
  } catch {err} {
    return res.status(400).send(err);
  }
})

// ROTA PARTIDA BY ID
app.get('/partida/:id', async (req, res) => {
  try {
    const asw =  await db.selectPartida(req.params.id);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT PARTIDA
app.post('/partida', async (req, res) => {
  try {
    await db.insertPartida(req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA UPDATE PARTIDA
app.patch("/partida/:id", async (req, res) => {
  try {
    await db.updatePartida(req.params.id, req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA DELETE PARTIDA
app.delete("/partida/:id", async (req, res) => {
  try {
    await db.deletePartida(req.params.id);
    return res.sendStatus(204);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ======================= CRUD ARMAS =================================

// ROTA SELECIONA ARMAS
app.get('/armas', async (req, res) => {
  try {
    const asw = await db.selectArmas();
    return res.status(200).send(asw);
  } catch {err} {
    return res.status(400).send(err);
  }
})

// ROTA ARMA BY ID
app.get('/armas/:id', async (req, res) => {
  try {
    const asw =  await db.selectArma(req.params.id);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT ARMA
app.post('/armas', async (req, res) => {
  try {
    await db.insertArma(req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA UPDATE ARMA
app.patch("/armas/:id", async (req, res) => {
  try {
    await db.updateArma(req.params.id, req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA DELETE ARMA
app.delete("/armas/:id", async (req, res) => {
  try {
    await db.deleteArma(req.params.id);
    return res.sendStatus(204);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ======================= JOGADOR ARMAS =================================
// ROTA ARMAS BY JOGADOR
app.get('/:nickname/armas', async (req, res) => {
  try {
    const asw =  await db.selectJogadorArmas(req.params.nickname);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT ARMA TO JOGADOR
app.post('/:nickname/armas', async (req, res) => {
  try {
    const asw =  await db.insertArmaJogador(req.params.nickname, req.body);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ======================= CRUD SKINS =================================
// ROTA SELECIONA SKINS
app.get('/skins', async (req, res) => {
  try {
    const asw = await db.selectSkins();
    return res.status(200).send(asw);
  } catch {err} {
    return res.status(400).send(err);
  }
})

// ROTA SKIN BY ID
app.get('/skins/:id', async (req, res) => {
  try {
    const asw =  await db.selectSkin(req.params.id);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT SKIN
app.post('/skins', async (req, res) => {
  try {
    await db.insertSkin(req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA UPDATE SKIN
app.patch("/skins/:id", async (req, res) => {
  try {
    await db.updateSkin(req.params.id, req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA DELETE SKIN
app.delete("/skins/:id", async (req, res) => {
  try {
    await db.deleteSkin(req.params.id);
    return res.sendStatus(204);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ======================= JOGADOR SKINS =================================
// ROTA SKINS BY JOGADOR
app.get('/:nickname/skins', async (req, res) => {
  try {
    const asw =  await db.selectJogadorSkins(req.params.nickname);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT SKINS TO JOGADOR
app.post('/:nickname/skins', async (req, res) => {
  try {
    const asw =  await db.insertSkinJogador(req.params.nickname, req.body);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ======================= CRUD HISTORICO =================================
// ROTA SELECIONA HISTORICOS
app.get('/historico', async (req, res) => {
  try {
    const asw = await db.selectHistoricos();
    return res.status(200).send(asw);
  } catch {err} {
    return res.status(400).send(err);
  }
})

// ROTA HISTORICO BY ID
app.get('/historico/:id', async (req, res) => {
  try {
    const asw =  await db.selectHistorico(req.params.id);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA INSERT HISTORICO
app.post('/historico', async (req, res) => {
  try {
    await db.insertHistorico(req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA UPDATE HISTORICO
app.patch("/historico/:id", async (req, res) => {
  try {
    await db.updateHistorico(req.params.id, req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ROTA DELETE HISTORICO
app.delete("/historico/:id", async (req, res) => {
  try {
    await db.deleteHistorico(req.params.id);
    return res.sendStatus(204);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ======================= HISTORICO JOGADOR =================================
// ROTA HISTORICO BY JOGADOR
app.get("/:nickname/historico", async (req, res) => {
  try{
    const asw = await db.selectHistoricoJogador(req.params.nickname);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// ======================= CREATE HISTORICO && PARTIDA =======================
app.post('/historic-partida', async (req, res) => {
  try {
    await db.insertHistoricPartida(req.body);
    return res.sendStatus(200);
  } catch(err) {
    return res.status(400).send(err);
  }
})

// =========================== PESQUISAS =======================================
app.get('/filter/jogador/:name', async (req, res) => {
  try {
    const asw = await db.filterJogador(req.params.name);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
});

app.get('/filter/assunto/:name', async (req, res) => {
  try {
    const asw = await db.filterAssunto(req.params.name);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
});

app.get('/filter/problema/:nivel', async (req, res) => {
  try {
    const asw = await db.filterProblema(req.params.nivel);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
});

app.get('/filter/desafio/:nivel', async (req, res) => {
  try {
    const asw = await db.filterDesafio(req.params.nivel);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
});

app.get('/filter/partida/:nivel', async (req, res) => {
  try {
    const asw = await db.filterPartida(req.params.nivel);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
});

app.get('/filter/armas/:nome', async (req, res) => {
  try {
    const asw = await db.filterArmas(req.params.nome);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
});

app.get('/filter/skins/:nome', async (req, res) => {
  try {
    const asw = await db.filterSkins(req.params.nome);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
});

app.get('/filter/historico/:nome', async (req, res) => {
  try {
    const asw = await db.filterHistorico(req.params.nome);
    return res.status(200).send(asw);
  } catch(err) {
    return res.status(400).send(err);
  }
});