
-- Produtos com prejuízo, ordenados do maior
-- prejuízo para o menor

SELECT TOP 10
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro
FROM Superstore
GROUP BY
    Product_Name,
    Category,
    Sub_Category
HAVING SUM(Profit) < 0
ORDER BY
    SUM(Profit) ASC;

