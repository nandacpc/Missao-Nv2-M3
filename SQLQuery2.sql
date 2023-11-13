--Dados completos de pessoas fisicas
SELECT * FROM Pessoa INNER JOIN PessoaFisica
ON Pessoa.idPessoa = PessoaFisica.Pessoa_idPessoa

--Dados completos de pessoas juridicas
SELECT * FROM Pessoa INNER JOIN PessoaJuridica
ON Pessoa.idPessoa = PessoaJuridica.Pessoa_idPessoa

--Movimentacoes de entrada, com produto, fornecedor, quantidade, preco unitario e valor total
SELECT *,
       (CAST(REPLACE(valorUnitario, ',', '.') AS DECIMAL(10, 2)) * quantidade) AS Total
FROM Movimento
WHERE Tipo = 'S';

--Movimentacoes de saida, com produto, comprador, quantidade, preco unitario e valor total
SELECT *,
       (CAST(REPLACE(valorUnitario, ',', '.') AS DECIMAL(10, 2)) * quantidade) AS Total
FROM Movimento
WHERE Tipo = 'E';

--Valor total das entradas agrupadas por produto
SELECT Tipo, Produtos_idProduto,
       SUM(CAST(REPLACE(valorUnitario, ',', '.') AS DECIMAL(10, 2)) * quantidade) AS TotalEntradas
FROM Movimento
WHERE Tipo = 'E'
GROUP BY Tipo, Produtos_idProduto;

--Valor total das saidas agrupadas por produto
SELECT Tipo, Produtos_idProduto,
       SUM(CAST(REPLACE(valorUnitario, ',', '.') AS DECIMAL(10, 2)) * quantidade) AS TotalSaidas
FROM Movimento
WHERE Tipo = 'S'
GROUP BY Tipo, Produtos_idProduto;

--Operadores que nao efetuaram movimentacoes de entrada (compra)
SELECT DISTINCT m.Usuario_idUsuario
FROM Movimento m
LEFT JOIN (
    SELECT DISTINCT Usuario_idUsuario
    FROM Movimento
    WHERE Tipo = 'E'
) e ON m.Usuario_idUsuario = e.Usuario_idUsuario
WHERE e.Usuario_idUsuario IS NULL;

--Valor total de entrada, agrupado por operador
SELECT Tipo, Usuario_idUsuario,
       SUM(CAST(REPLACE(valorUnitario, ',', '.') AS DECIMAL(10, 2)) * quantidade) AS TotalEntradas
FROM Movimento
WHERE Tipo = 'E'
GROUP BY Tipo, Usuario_idUsuario;

--Valor total de saida, agrupado por operador
SELECT Tipo, Usuario_idUsuario,
       SUM(CAST(REPLACE(valorUnitario, ',', '.') AS DECIMAL(10, 2)) * quantidade) AS TotalEntradas
FROM Movimento
WHERE Tipo = 'S'
GROUP BY Tipo, Usuario_idUsuario;

--Valor medio de venda por produto, utilizando media ponderada
SELECT Produtos_idProduto,
       SUM(quantidade * CAST(REPLACE(valorUnitario, ',', '.') AS DECIMAL(10, 2))) / SUM(quantidade) AS ValorMedioVenda
FROM Movimento
GROUP BY Produtos_idProduto;
