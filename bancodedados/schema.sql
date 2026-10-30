-- OrdemTech: estrutura do banco de dados (MySQL)
-- Os dados abaixo são FICTÍCIOS, apenas para testar o sistema.

CREATE DATABASE IF NOT EXISTS projetotech;
USE projetotech;

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `CPF` varchar(15) NOT NULL,
  `senha` text,
  `endereco` varchar(200) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tecnicos`;
CREATE TABLE `tecnicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `especialidade` varchar(150) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `senha` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE `funcionarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `CPF` varchar(15) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `senha` varchar(15) DEFAULT NULL,
  `login` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `ordem_de_servico`;
CREATE TABLE `ordem_de_servico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_os` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_servico` varchar(40) NOT NULL,
  `situacao` varchar(40) NOT NULL,
  `aparelho` varchar(40) DEFAULT NULL,
  `defeito` varchar(30) DEFAULT NULL,
  `nome_tecnico` varchar(40) NOT NULL,
  `data_de_entrega` date DEFAULT NULL,
  `valortotal` varchar(30) NOT NULL,
  `id_cliente` int NOT NULL,
  `id_tecnico` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_tecnico` (`id_tecnico`),
  CONSTRAINT `ordem_de_servico_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ordem_de_servico_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dados fictícios de exemplo
INSERT INTO `clientes` (nome, CPF, senha, endereco, telefone) VALUES
  ('Cliente Exemplo', '00000000001', 'senha123', 'Rua Exemplo, 100', '11900000001');

INSERT INTO `tecnicos` (nome, cpf, especialidade, telefone, senha) VALUES
  ('Tecnico Exemplo', '00000000002', 'Áudio e Vídeo', '11900000002', 'senha123');

INSERT INTO `funcionarios` (nome, CPF, telefone, senha, login) VALUES
  ('Funcionario Exemplo', '00000000003', '11900000003', 'senha123', 'admin');

INSERT INTO `ordem_de_servico`
  (status_servico, situacao, aparelho, defeito, nome_tecnico, data_de_entrega, valortotal, id_cliente, id_tecnico) VALUES
  ('Ordem de Serviço', 'Aguardando pagamento!', 'Celular', 'Tela quebrada', 'Tecnico Exemplo', '2026-12-31', '150,00', 1, 1);
