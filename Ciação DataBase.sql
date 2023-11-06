-- Criar DATABASE
CREATE DATABASE Loja;

USE Loja;


-- Entidade Usuário
CREATE TABLE Usuario (
   id INT IDENTITY(1,1) PRIMARY KEY,
   login VARCHAR(250) NOT NULL,
   senha VARCHAR(250) NOT NULL
);

-- Entidade Pessoa
CREATE TABLE Pessoa (
   id INT IDENTITY(1,1) PRIMARY KEY,
   nome VARCHAR(250) NOT NULL,
   logradouro VARCHAR(250) NOT NULL,
   cidade VARCHAR(250) NOT NULL,
   estado VARCHAR(2) NOT NULL,
   telefone VARCHAR(11) NOT NULL,
   email VARCHAR(250) NOT NULL
);

-- Entidade PessoaFisica
CREATE TABLE PessoaFisica (
   id INT IDENTITY(1,1) PRIMARY KEY,
   cpf VARCHAR(14) NOT NULL,
   pessoa_id INT NOT NULL,
   FOREIGN KEY (pessoa_id) REFERENCES Pessoa(id)
);

-- Entidade PessoaJuridica
CREATE TABLE PessoaJuridica (
   id INT IDENTITY(1,1) PRIMARY KEY,
   cnpj VARCHAR(18) NOT NULL,
   pessoa_id INT NOT NULL,
   FOREIGN KEY (pessoa_id) REFERENCES Pessoa(id)
);

-- Entidade Produto
CREATE TABLE Produto (
   id INT IDENTITY(1,1) PRIMARY KEY,
   nome VARCHAR(250) NOT NULL,
   quantidade INT NOT NULL,
   preco DECIMAL(10,2) NOT NULL
);

-- Entidade Compra
CREATE TABLE Compra (
   id INT IDENTITY(1,1) PRIMARY KEY,
   usuario_id INT NOT NULL,
   produto_id INT NOT NULL,
   pessoa_juridica_id INT NOT NULL,
   quantidade INT NOT NULL,
   preco_unitario DECIMAL(10,2) NOT NULL,
   FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
   FOREIGN KEY (produto_id) REFERENCES Produto(id),
   FOREIGN KEY (pessoa_juridica_id) REFERENCES PessoaJuridica(id)
);

-- Entidade Venda
CREATE TABLE Venda (
   id INT IDENTITY(1,1) PRIMARY KEY,
   usuario_id INT NOT NULL,
   produto_id INT NOT NULL,
   pessoa_fisica_id INT NOT NULL,
   quantidade INT NOT NULL,
   preco_unitario DECIMAL(10,2) NOT NULL,
   FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
   FOREIGN KEY (produto_id) REFERENCES Produto(id),
   FOREIGN KEY (pessoa_fisica_id) REFERENCES PessoaFisica(id)
);
