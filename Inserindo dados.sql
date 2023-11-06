-- Inserindo Dados nas tabelas e Fazendo consultas: 



--Inserindo Usuários:
INSERT INTO Usuario (login, senha)
VALUES ('op1', 'op1');

INSERT INTO Usuario (login, senha)
VALUES ('op2', 'op2');

SELECT * FROM Usuario;



--Inserindo Produtos:
INSERT INTO	Produto (nome, quantidade, preco)
VALUES ('Banana' ,100 , 5.00);

INSERT INTO	Produto (nome, quantidade, preco)
VALUES ('Laranja' ,500 , 2.00);

INSERT INTO	Produto (nome, quantidade, preco)
VALUES ('Manga' ,800 , 4.00);

SELECT * FROM Produto;



--Inserindo Pessoa Física:
INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email)
VALUES ('João da Silva', 'Rua das Flores, 123', 'Fortaleza', 'CE', '85987654321', 'joao@gmail.com');
INSERT INTO PessoaFisica (cpf, pessoa_id) 
VALUES ('123.456.789-10', SCOPE_IDENTITY());
SELECT * FROM Pessoa JOIN PessoaFisica ON Pessoa.id = PessoaFisica.pessoa_id WHERE Pessoa.nome = 'João da Silva';



--Inserindo Pessoa Jurídica:
INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email)
VALUES ('Empresa ABC', 'Avenida Brasil, 456', 'Fortaleza', 'CE', '85912345678', 'empresa@abc.com');
INSERT INTO PessoaJuridica (cnpj, pessoa_id) 
VALUES ('12345.678/0001-90', SCOPE_IDENTITY());
SELECT * FROM Pessoa JOIN PessoaJuridica ON Pessoa.id = PessoaJuridica.pessoa_id WHERE Pessoa.nome = 'Empresa ABC';



-- Inserindo uma compra (Entrada):
INSERT INTO Compra (usuario_id, produto_id, pessoa_juridica_id, quantidade, preco_unitario) 
VALUES (1, 1, 2, 10, 5.00);
-- Selecionando a compra: 
SELECT * FROM Compra WHERE usuario_id = 1 AND produto_id = 1;



-- Inserindo uma venda (Saída): 
INSERT INTO Venda (usuario_id, produto_id, pessoa_fisica_id, quantidade, preco_unitario) 
VALUES (1, 1, 1, 5, 50.00);
-- Selecionando a venda: 
SELECT * FROM Venda WHERE usuario_id = 1 AND produto_id = 1;



-- Criando uma coluna tipo que mostre E ou S:
SELECT C.usuario_id, C.pessoa_juridica_id AS pessoa_id, C.produto_id, C.quantidade, 'E' AS tipo, C.preco_unitario
FROM Compra C
UNION ALL
SELECT V.usuario_id, V.pessoa_fisica_id AS pessoa_id, V.produto_id, V.quantidade, 'S' AS tipo, V.preco_unitario
FROM Venda V
ORDER BY usuario_id, pessoa_id, produto_id;