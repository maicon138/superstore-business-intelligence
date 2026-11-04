
-- Top 10 produtos por faturamento

SELECT TOP 10
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS faturamento
FROM Superstore
GROUP BY
    Product_Name,
    Category,
    Sub_Category
ORDER BY
    SUM(Sales) DESC;

