DROP DATABASE IF EXISTS academia;

CREATE DATABASE IF NOT EXISTS academia;

USE academia;

CREATE TABLE IF NOT EXISTS alunos(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  data_nascimento DATE DEFAULT NULL,
  data_matricula DATE DEFAULT NULL,
  cpf VARCHAR(14) NOT NULL,
  email VARCHAR(100) DEFAULT NULL,
  telefone VARCHAR(15) DEFAULT NULL,
  endereco VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`cpf`)
);

INSERT INTO alunos (id, nome, data_nascimento, data_matricula, cpf, email, telefone, endereco) VALUES
(1, 'João Silva', '1990-05-15', '2023-01-10', '123.456.789-00', 'joao.silva@email.com', '(11)99999-9999', 'Rua Exemplo, 123'),
(2, 'João da Silva', '1991-05-16', '2024-01-10', '123.456.689-10', 'joao.sil3a@email.com', '(11)99899-9999', 'Rua Exemplos, 123'),
(3, 'João Vitor Silva', '1992-05-17', '2025-01-10', '123.456.679-10', 'joao.sil3@email.com', '(11)99867-9999', 'Rua Exemplar, 123');

SELECT * FROM alunos WHERE id = 1;

UPDATE alunos
SET email = 'email123@gmail.com'
WHERE id = 2;

DELETE FROM alunos WHERE id = 3;

CREATE TABLE IF NOT EXISTS planos(
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(255) DEFAULT NULL,
  valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`nome`)
);

INSERT INTO planos (nome, descricao, valor) VALUES
('Mensal', 'Plano mensal com acesso ilimitado', 190.90),
('Trimestral', 'Plano trimestral com desconto', 269.90),
('Anual', 'Plano anual com maior desconto', 999.90);

SELECT * FROM planos WHERE nome = 'Mensal';

UPDATE planos
SET valor = 100.00
WHERE nome = 'Mensal';

DELETE FROM planos WHERE nome = 'Anual';

CREATE TABLE IF  NOT EXISTS matricula(
  id INT NOT NULL AUTO_INCREMENT,
  aluno_id INT NOT NULL,
  plano_nome VARCHAR(50) NOT NULL,
  data_inicio DATE DEFAULT NULL,
  data_fim DATE DEFAULT NULL,
  PRIMARY KEY (`id`));

INSERT INTO matricula (id, aluno_id, plano_nome, data_inicio, data_fim) VALUES
(1, 1, 'Mensal', '2023-01-10', '2023-02-10'),
(2, 2, 'Trimestral', '2023-02-10', '2023-03-10'),
(3, 3, 'Anual', '2023-03-10', '2023-04-10');

SELECT * FROM matricula where id = 3;

UPDATE matricula
SET data_fim = '2023-05-10'
WHERE id = 2;

UPDATE matricula
SET data_fim = '2024-03-10'
WHERE id = 3;

DELETE FROM matricula where id = 1;

CREATE TABLE IF  NOT EXISTS funcionarios(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) DEFAULT NULL,
  data_nascimento DATE DEFAULT NULL,
  data_admissao DATE DEFAULT NULL,
  cargo VARCHAR(50) DEFAULT NULL,
  email VARCHAR(100) DEFAULT NULL,
  telefone VARCHAR(15) DEFAULT NULL,
  endereco VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`cpf`)
);

INSERT INTO funcionarios (id, nome, cpf, data_nascimento, data_admissao, cargo, email, telefone, endereco) VALUES
(1, 'Maria Oliveira', '987.654.321-00', '1985-08-20', '2020-03-15', 'Instrutora de Yoga', 'maria.oliveira@email.com', '(11)98765-4321', 'Avenida Exemplo, 456'),
(2, 'Mario Oliveira', '988.654.321-10', '1990-09-25', '2022-04-25', 'Instrutor de Musculação', 'mario.oliveira@email.com', '(11)98675-4321', 'Avenida Exemplos, 456'),
(3, 'Marta Oliveira', '967.654.321-11', '1995-10-30', '2024-05-27', 'Instrutora Geral', 'marta.oliveira@email.com', '(11)67675-4321', 'Avenida Exemplar, 456');

SELECT * FROM funcionarios WHERE cargo = 'Instrutor de Musculação';

UPDATE funcionarios
SET cargo = 'Instrutora Geral'
WHERE id = 1;

DELETE FROM funcionarios WHERE id = 2;