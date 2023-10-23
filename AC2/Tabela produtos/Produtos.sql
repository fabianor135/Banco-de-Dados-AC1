CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preço DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    perecível BOOLEAN NOT NULL,
    marca VARCHAR(100),
    nacionalidade VARCHAR(100)
);


INSERT INTO Produtos (id_produto, nome, preço, estoque, perecível, marca, nacionalidade)
VALUES
    (1, 'Arroz', 19.99, 100, 0, 'Coner', 'Brasil'),
    (2, 'Feijao', 29.99, 50, 1, 'Joao', 'EUA'),
    (3, 'Leite', 14.99, 75, 0, 'Drink', 'México'),
    (4, 'Café', 39.99, 30, 1, 'Pele', 'Brasil'),
    (5, 'Açúcar', 9.99, 200, 0, 'Docici', 'China');

SELECT * FROM Produtos;

/*Relatório informando quantos produtos estão cadastrados:*/

SELECT COUNT(*) AS TotalDeProdutosCadastrados FROM Produtos;


/*Relatório informando o preço médio dos produtos:*/

SELECT AVG(preço) AS PreçoMédioDosProdutos FROM Produtos;


/*Média dos preços dos produtos em 2 grupos: perecíveis e não perecíveis:*/

SELECT perecível, AVG(preço) AS PreçoMédio
FROM Produtos
GROUP BY perecível;

/*Média dos preços dos produtos agrupados pelo nome do produto:*/

SELECT nome, AVG(preço) AS PreçoMédio
FROM Produtos
GROUP BY nome;


/*Media dos preços e total em estoque dos produtos:*/

SELECT AVG(preço) AS PreçoMédio, SUM(estoque) AS TotalEmEstoque
FROM Produtos;

/*Selcionado o nome, marca e quantidade em estoque do produto mais caro:*/

SELECT nome, marca, estoque
FROM Produtos
WHERE preço = (SELECT MAX(preço) FROM Produtos);


/*Selecionado os produtos com preço acima da média:*/

SELECT *
FROM Produtos
WHERE preço > (SELECT AVG(preço) FROM Produtos);


/*Seleciona a quantidade de produtos de cada nacionalidade:*/

SELECT nacionalidade, COUNT(*) AS QuantidadeDeProdutos
FROM Produtos
GROUP BY nacionalidade;