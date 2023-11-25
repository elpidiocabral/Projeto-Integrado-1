CREATE TABLE Jogador (
	nickname VARCHAR(30) PRIMARY KEY,
	login VARCHAR(50) UNIQUE, 
	senha VARCHAR(50),
	turma VARCHAR(10), 
	ano_escolar INT,
    score INT
);

CREATE TABLE Assunto (
    nome VARCHAR(30) UNIQUE,
    operador CHAR UNIQUE,
    id_assunto SERIAL PRIMARY KEY
);

CREATE TABLE Problema (
	fator_1 INT,
    fator_2 INT,
	resultado INT,
	pontuacao INT,
	nivel INT,
	id_problema SERIAL PRIMARY KEY,
    id_assunto SERIAL, 
	
	FOREIGN KEY(id_assunto) 
	REFERENCES Assunto(id_assunto)
    ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE Desafio (
    problema VARCHAR(50) UNIQUE,
    solucao INT,
    pontuacao INT,
	nivel INT,
    id_desafio SERIAL PRIMARY KEY,
    id_assunto, 
	FOREIGN KEY(id_assunto) 
	REFERENCES Assunto(id_assunto)
    ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE Partida (
	tempo TIME,
	pontuacao_final INT,
	nivel INT,
	id_partida SERIAL PRIMARY KEY
);

CREATE TABLE Armas(
    id_arma SERIAL PRIMARY KEY,
    nome VARCHAR(30) UNIQUE,
    value INT
);

CREATE TABLE Jogador_arma(
    id_jogador VARCHAR(30),
    id_arma INT,
    FOREIGN KEY (id_arma) REFERENCES Armas(id_arma) ON DELETE CASCADE,
    FOREIGN KEY (id_jogador) REFERENCES Jogador(nickname) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(id_jogador, id_arma)
);

CREATE TABLE Skins(
    id_skin SERIAL PRIMARY KEY,
    nome VARCHAR(30) UNIQUE,
    value INT
);

CREATE TABLE Jogador_skin(
    id_jogador VARCHAR(30),
    id_skin INT,
    FOREIGN KEY (id_skin) REFERENCES Skins(id_skin) ON DELETE CASCADE,
    FOREIGN KEY (id_jogador) REFERENCES Jogador(nickname) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(id_jogador,id_skin)
);

CREATE TABLE Historico (
	id_historico SERIAL PRIMARY KEY,
	id_jogador VARCHAR(30),
	FOREIGN KEY (id_jogador) 
	REFERENCES Jogador(nickname)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
    id_partida SERIAL, 
	FOREIGN KEY (id_partida) 
	REFERENCES Partida(id_partida)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

-- inserindo 10 tuplas
INSERT INTO Jogador (nickname, login, senha, turma, ano_escolar, score)
VALUES
    ('MathWhiz', '535810', 'senha123', 'A', 9, 150),
    ('NumberNinja', '535811', 'senha456', 'B', 9, 205),
    ('GeometricGenius', '535812', 'senha789', 'A', 9, 180),
    ('CalculusKing', '535813', 'senhaabc', 'C', 9, 200),
    ('AlgebraAce', '535814', 'senhaxyz', 'B', 8, 300),
    ('StatisticSavvy', '535815', 'senha321', 'A', 8, 150),
    ('PiLover', '535816', 'senha654', 'C', 8, 150),
    ('MathMagician', '535817', 'senha987', 'B', 8, 320),
    ('TheoremTamer', '535818', 'senhadef', 'A', 8, 150),
    ('EquationExplorer', '535819', 'senhaghi', 'C', 8, 80);

-- inserindo tuplas (são menos de 10 pois vamos abranger menos que 10 assuntos, 
-- tal entidade foi criada com o fito de manter integridade na composição dos problemas)
INSERT INTO Assunto (nome, operador)
VALUES
    ('Adição', '+'),
    ('Subtração', '-'),
    ('Multiplicação', 'x'),
    ('Divisão', '/'),
    ('Álgebra', null);

-- inserindo 10 tuplas, cada partida teria em média de 5 ~ 6 problemas nessa fase inicial do jogo, e depois consecutivamente cresceria até o limite de 10
INSERT INTO Problema (fator_1, fator_2, resultado, pontuacao, nivel, id_assunto)
VALUES
    (5, 7, 12, 10, 1, 1),
    (3,  9, 12, 10, 1, 1),
    (12, 18, 30, 15, 1, 1),
	(15, 8, 7, 10, 1, 2),
    (10, 7, 3, 10, 1, 2),
    (27, 33, 60, 15, 2, 1),
	(15, 26, 41, 15, 2, 1),
	(45, 85, 130, 20, 2, 1),
    (25, 16, 9, 15, 2, 2),
    (16, 25, 9, 15, 2, 2),
    (50, 28,  22, 15, 3, 2),
	(65, 63, 128, 20, 3, 1),
	(45, 16, 29, 15, 3, 2),
    (12, 12, 144, 25, 3, 3),
    (7, 7, 49, 20, 3, 3),
    (8, 6, 48, 20, 3, 3),
	(10, 1000, 10000, 25, 4, 3),
	(15, 3, 5, 30, 4, 4),
    (25, 25, 625, 30, 4, 3),
	(152, 97, 249, 30, 4, 2),
    (16, 16, 256, 30, 4, 3);


-- inserindo 10 tuplas: apesar de todas serem do tipo albégrico, preferimos generalizar pensando em implementações futuras de tipos de desafio
INSERT INTO Desafio (problema, solucao, pontuacao, nivel, id_assunto)
VALUES
    ('2x + 4 = 12', 4, 30, 1, 5),
    ('3x - 5 = 16', 7, 30, 2, 5),
    ('4x + 2 = 22', 5, 30, 3, 5),
    ('3x + 5 = 11', 2, 30, 4, 5),
    ('5x - 3 = 2x + 7', 2, 40, 5, 5),
    ('x + 2 = 4x - 6', 2, 40, 6, 5),
    ('x + 4 = 3x - 8', 6, 40, 7, 5),
    ('3x + 5 = 7x - 9', 7, 40, 8, 5),
    ('x - 1 = 2x - 5', 4, 40, 9, 5),
    ('2(x - 3) = 8', 7, 50, 10, 5),
    ('2(x + 4) = 18', 5, 50, 11, 5),
    ('5(3x - 2) = 35', 3, 50, 12, 5),
    ('6(4x + 1) = 48', 7, 50, 13, 5),
    ('5(x - 4) = 30', 10, 50, 14, 5);

INSERT INTO Partida (tempo, nivel, pontuacao_final) 
VALUES
    ('15:30:00', 1, 85), -- level 1 = 55 score problemas + 30 score desafio
    ('16:45:00', 1, 85),
    ('17:15:00', 1, 85),
    ('19:05:00', 1, 60),
    ('21:25:00', 1, 45),
    ('23:15:00', 1, 80),
	('15:30:00', 2, 110), -- level 2 =  80 score problemas + 30 score desafio
    ('16:45:00', 2, 90),
    ('17:15:00', 2, 90),
    ('19:05:00', 2, 40), -- *abaixo dos 50%
    ('21:25:00', 2, 30), -- *abaixo dos 50% 
    ('23:15:00', 2, 90),
    ('15:30:00', 3, 110), -- level 3 = 115 score problemas + 30 score desafio
    ('16:45:00', 3, 100),
    ('17:15:00', 3, 90),
	('23:15:00', 3, 95),
	('15:30:00', 4, 130), -- level 4 = 145 score problemas + 30 score desafio
	('16:45:00', 4, 140),
	('17:15:00', 4, 60), -- *abaixo dos 50%
	('23:15:00', 4, 50);  -- *abaixo dos 50%

-- inserindo tuplas (não haverá dez pois se limita por regra de negócio às operações básicas)
INSERT INTO Armas (nome, value)
VALUES
    ('Arma de Soma', 0),
	('Sabre de Subtração', 150),
    ('Ataque de Multiplicação', 250),
	('Ataque de Divisão', 300);

-- inserindo tuplas 
INSERT INTO Jogador_arma (id_jogador, id_arma)
VALUES
	('EquationExplorer', 1),
    ('PiLover', 1),
    ('MathWhiz', 1),
    ('AlgebraAce', 1),
    ('CalculusKing', 1),
    ('NumberNinja', 1),
	('EquationExplorer', 2),
    ('PiLover', 2),
    ('MathWhiz', 2),
    ('AlgebraAce', 2),
    ('CalculusKing', 2),
    ('NumberNinja', 2),
	('EquationExplorer', 3),
    ('PiLover', 3),
    ('MathWhiz', 3),
    ('NumberNinja', 3),
	('EquationExplorer', 4),
    ('PiLover', 4),
    ('MathWhiz', 4),
    ('NumberNinja', 4);

-- inserindo  tuplas
INSERT INTO Skins (nome, value)
VALUES
	('Arquimedes', 0),
    ('Einstein', 500),
    ('Tesla', 500),
    ('Oppenheimer', 150),
    ('MarioBros', 100),
    ('Pitágoras', 250),
    ('Professor de matemática', 1000),
    ('Professor Jirafales', 200),
    ('Paralelepípedo Pomposo', 150),
    ('Paralelepípedo Poderoso', 800);

INSERT INTO Jogador_skin (id_jogador, id_skin)
VALUES
    ('EquationExplorer', 6),
    ('PiLover', 2),
    ('MathWhiz', 1),
    ('AlgebraAce', 7),
    ('NumberNinja', 1),
    ('CalculusKing', 3),
    ('GeometricGenius', 7),
    ('StatisticSavvy', 5),
	('MathMagician', 8),
    ('TheoremTamer', 10);

-- inserindo 10 tuplas
INSERT INTO Historico (id_jogador, id_partida) 
VALUES
	('EquationExplorer', 1),
    ('PiLover', 2),
    ('MathWhiz', 3),
    ('AlgebraAce', 4),
    ('CalculusKing', 5),
    ('NumberNinja', 6),
	('EquationExplorer', 7),
    ('PiLover', 8),
    ('MathWhiz', 9),
    ('AlgebraAce', 10),
    ('CalculusKing', 11),
    ('NumberNinja', 12),
	('EquationExplorer', 13),
    ('PiLover', 14),
    ('MathWhiz', 15),
    ('NumberNinja', 16),
	('EquationExplorer', 17),
    ('PiLover', 18),
    ('MathWhiz', 19),
    ('NumberNinja', 20);
	
	
-- 1) Qual foi a maior pontuações de cada nível?	
SELECT p.nivel AS Nível, p.pontuacao_final AS Score, jog.nickname AS Jogador
FROM Partida p
JOIN Historico b ON p.id_partida = b.id_partida
JOIN Jogador jog ON b.id_jogador = jog.nickname
WHERE (p.nivel, p.pontuacao_final) IN ( 
	SELECT a.nivel AS Nivel, MAX(a.pontuacao_final) AS Score
	FROM Partida a
	JOIN Historico b ON a.id_partida = b.id_partida
	GROUP BY a.nivel
	)
ORDER BY Nível, Jogador ASC;


-- 2) Qual foi a menor pontuações de cada nível?	
SELECT p.nivel AS Nível, p.pontuacao_final AS Score, jog.nickname AS Jogador
FROM Partida p
JOIN Historico b ON p.id_partida = b.id_partida
JOIN Jogador jog ON b.id_jogador = jog.nickname
WHERE (p.nivel, p.pontuacao_final) IN ( 
	SELECT a.nivel AS Nivel, MIN(a.pontuacao_final) AS Score
	FROM Partida a
	JOIN Historico b ON a.id_partida = b.id_partida
	GROUP BY a.nivel
	)
ORDER BY Nível, Jogador ASC;
 
-- 3) Qual score MÁXIMO que um jogador é capaz de obter de cada nível?
WITH max_score_problemas as (
SELECT p.nivel, SUM(p.pontuacao) as max_score_problemas
FROM Problema p
GROUP BY p.nivel
),
max_scores_desafio as(
SELECT d.nivel, SUM(d.pontuacao) as max_scores_desafio
FROM Desafio d
GROUP BY d.nivel
)
SELECT dms.nivel, dms.max_scores_desafio + pms.max_score_problemas as max_score
from max_scores_desafio dms
JOIN max_score_problemas pms ON dms.nivel = pms.nivel
ORDER BY dms.nivel ASC;

-- tentativa anterior que funciona mas duplica (por isso o uso do distinct até descobrirmos o WITH):
--SELECT DISTINCT a.nivel, (SUM(b.pontuacao) + c.pontuacao) AS max_score
--FROM Partida 
--JOIN problema b ON b.nivel =  a.nivel
--JOIN Desafio c ON c.nivel = a.nivel
--GROUP BY a.id_partida, c.pontuacao
--ORDER BY a.nivel;

-- 4) Qual score MÍNIMO que um jogador deve obter em cada nível, para poder passá-lo? (regra de negócio: caso eles tenham um score maior de 50% do total do nível)
WITH max_score_problemas as (
SELECT p.nivel, SUM(p.pontuacao) as max_score_problemas
FROM Problema p
GROUP BY p.nivel
),
max_scores_desafio as(
SELECT d.nivel, SUM(d.pontuacao) as max_scores_desafio
FROM Desafio d
GROUP BY d.nivel
)
SELECT dms.nivel, ROUND((dms.max_scores_desafio + pms.max_score_problemas) * 0.5, 0) as max_score
from max_scores_desafio dms
JOIN max_score_problemas pms ON dms.nivel = pms.nivel
ORDER BY dms.nivel ASC;


-- 5) Quais alunos reprovaram em cada nível (regra de negócio: caso eles tenham um score maior de 50% do total do nível)
SELECT 'try again:  ' || j.nickname AS status, p.nivel, p.pontuacao_final
FROM Partida p
JOIN Historico h ON p.id_partida = h.id_partida
JOIN Jogador j ON h.id_jogador = j.nickname
WHERE p.pontuacao_final < (
    SELECT (SUM(b.pontuacao) + MAX(c.pontuacao)) * 0.5
    FROM problema b
    JOIN Desafio c ON c.nivel = b.nivel
    WHERE b.nivel = p.nivel
)
ORDER BY p.nivel, j.nickname, p.pontuacao_final DESC;

-- 6) Ranking de aprovados em cada nível (regra de negócio: caso eles tenham um score maior de 50% do total do nível)
SELECT 'winer:  ' || j.nickname AS status, p.nivel, p.pontuacao_final
FROM Partida p
JOIN Historico h ON p.id_partida = h.id_partida
JOIN Jogador j ON h.id_jogador = j.nickname
WHERE p.pontuacao_final > (
    SELECT (SUM(b.pontuacao) + MAX(c.pontuacao)) * 0.5
    FROM problema b
    JOIN Desafio c ON c.nivel = b.nivel
    WHERE b.nivel = p.nivel
)
ORDER BY p.nivel ASC, p.pontuacao_final DESC, p.tempo ASC; -- valorizando o que foi mais rápido

-- 7) Quais problemas matemáticos já foram cadastrados e seus níveis?
SELECT p.fator_1, a.operador, p.fator_2, p.resultado, a.nome, p.nivel
FROM Problema p
JOIN Assunto a ON p.id_assunto = a.id_assunto 
ORDER BY a.nome, p.nivel;

-- 8) Quais desafios já foram cadastrados?
SELECT d.problema, d.solucao, a.nome, d.nivel
FROM Desafio d
JOIN Assunto a ON d.id_assunto = a.id_assunto 
ORDER BY d.nivel;

-- 9) Quantos alunos já jogaram cada nível?
SELECT a.nivel AS nivel, COUNT(a.nivel)
FROM Partida a
JOIN Historico b ON b.id_partida = a.id_partida 
GROUP BY a.nivel
ORDER BY a.nivel ASC;

-- 10) Qual o catálogo de SKINS do jogo e quantos jogadores tem cada uma delas? 
SELECT b.nome AS skin, COUNT(a.id_skin)
FROM Jogador_skin a
FULL JOIN Skins b ON b.id_skin = a.id_skin 
GROUP BY b.nome
ORDER BY b.nome ASC;

-- 11) Qual o catálogo de ARMAS do jogo e quantos jogadores tem cada uma delas? 
SELECT b.nome AS Arma, COUNT(a.id_arma) AS num_jog_com_ela
FROM Jogador_arma a
FULL JOIN Armas b ON b.id_arma = a.id_arma 
GROUP BY b.id_arma
ORDER BY b.id_arma ASC;