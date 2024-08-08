CREATE DATABASE loja;

USE loja;

CREATE TABLE produtos (
	ProdutosID INT IDENTITY PRIMARY KEY,
	Produto VARCHAR(100) NOT NULL,
	Preco DECIMAL(10, 2) NOT NULL,
	Estoque INT NOT NULL DEFAULT(0)
);

CREATE TABLE vendas (
	vendasID INT IDENTITY PRIMARY KEY,
	Produto_ID INT,
	Quantidade INT NOT NULL DEFAULT(1),
	FOREIGN KEY (Produto_ID) REFERENCES produtos(ProdutosID)
);

INSERT INTO produtos(Produto, Preco, Estoque) VALUES 
('Produto 1', 10.00, 100),
('Produto 2', 20.00, 90),
('Produto 3', 30.00, 80),
('Produto 4', 40.00, 70),
('Produto 5', 50.00, 60),
('Produto 6', 60.00, 50),
('Produto 7', 70.00, 40),
('Produto 8', 80.00, 30),
('Produto 9', 90.00, 20),
('Produto 10', 100.00, 10),
('Produto 11', 110.00, 110),
('Produto 12', 120.00, 120),
('Produto 13', 130.00, 130),
('Produto 14', 140.00, 140),
('Produto 15', 150.00, 150),
('Produto 16', 160.00, 160),
('Produto 17', 170.00, 170),
('Produto 18', 180.00, 180),
('Produto 19', 190.00, 190),
('Produto 20', 200.00, 200),
('Produto 21', 210.00, 210),
('Produto 22', 220.00, 220),
('Produto 23', 230.00, 230),
('Produto 24', 240.00, 240),
('Produto 25', 250.00, 250),
('Produto 26', 260.00, 260),
('Produto 27', 270.00, 270),
('Produto 28', 280.00, 280),
('Produto 29', 290.00, 290),
('Produto 30', 300.00, 300),
('Produto 31', 310.00, 310),
('Produto 32', 320.00, 320),
('Produto 33', 330.00, 330),
('Produto 34', 340.00, 340),
('Produto 35', 350.00, 350),
('Produto 36', 360.00, 360),
('Produto 37', 370.00, 370),
('Produto 38', 380.00, 380),
('Produto 39', 390.00, 390),
('Produto 40', 400.00, 400),
('Produto 41', 410.00, 410),
('Produto 42', 420.00, 420),
('Produto 43', 430.00, 430),
('Produto 44', 440.00, 440),
('Produto 45', 450.00, 450),
('Produto 46', 460.00, 460),
('Produto 47', 470.00, 470),
('Produto 48', 480.00, 480),
('Produto 49', 490.00, 490),
('Produto 50', 500.00, 500);


INSERT INTO vendas(Produto_ID, Quantidade) VALUES
(1, 5),
(2, 10),
(3, 15),
(4, 20),
(5, 25),
(6, 30),
(7, 35),
(8, 40),
(9, 45),
(10, 50),
(11, 55),
(12, 60),
(13, 65),
(14, 70),
(15, 75),
(16, 80),
(17, 85),
(18, 90),
(19, 95),
(20, 100),
(21, 105),
(22, 110),
(23, 115),
(24, 120),
(25, 125);

SELECT * FROM produtos;
SELECT * FROM vendas;

/* A - Escreva uma query que mostre o nome dos produtos e o total de quantidade vendida para cada um.*/
SELECT p.Produto, v.Quantidade
FROM produtos p
RIGHT JOIN vendas v
ON p.ProdutosID = v.Produto_ID;

/* B - Escreva uma query que liste os produtos que tiveram um total de vendas superior a 100 unidades.*/
SELECT p.Produto, v.Quantidade
FROM produtos p
INNER JOIN vendas v
ON v.Quantidade > 100;

/* C - Escreva uma query que calcule a média de preço dos produtos vendidos.*/
SELECT AVG(p.Preco)
FROM produtos p
RIGHT JOIN vendas v
ON v.Produto_ID = p.ProdutosID;

/* D - Escreva uma query que encontre o produto que gerou a maior receita total (quantidade * preço).*/
SELECT TOP 1
    p.ProdutosID,
    p.Produto,
    p.Preco,
    SUM(v.Quantidade) AS Total_Quantidade,
    (p.Preco * SUM(v.Quantidade)) AS Receita_Total
FROM 
    Produtos p
JOIN 
    Vendas v ON p.ProdutosID = v.Produto_ID
GROUP BY 
    p.ProdutosID, p.Produto, p.Preco
ORDER BY 
    Receita_Total DESC;