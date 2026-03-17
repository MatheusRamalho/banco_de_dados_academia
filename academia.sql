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
(1, 'João Silva', '1990-05-15', '2023-01-10', '123.456.789-00', 'joao.silva@email.com', '(11)99999-9999', 'Rua Exemplo, 123');

CREATE TABLE IF NOT EXISTS planos(
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(255) DEFAULT NULL,
  valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`nome`)
);

INSERT INTO planos (nome, descricao, valor) VALUES
('Mensal', 'Plano mensal com acesso ilimitado', 99.90),
('Trimestral', 'Plano trimestral com desconto', 269.90),
('Anual', 'Plano anual com maior desconto', 999.90);

CREATE TABLE IF  NOT EXISTS matricula(
  id INT NOT NULL AUTO_INCREMENT,
  aluno_id INT NOT NULL,
  plano_nome VARCHAR(50) NOT NULL,
  data_inicio DATE DEFAULT NULL,
  data_fim DATE DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (aluno_id) REFERENCES alunos(id),
  FOREIGN KEY (plano_nome) REFERENCES planos(nome)
);

INSERT INTO matricula (id, aluno_id, plano_nome, data_inicio, data_fim) VALUES
(1, 1, 'Mensal', '2023-01-10', '2023-02-10');

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
(1, 'Maria Oliveira', '987.654.321-00', '1985-08-20', '2020-03-15', 'Instrutora de Yoga', 'maria.oliveira@email.com', '(11)98765-4321', 'Avenida Exemplo, 456');
