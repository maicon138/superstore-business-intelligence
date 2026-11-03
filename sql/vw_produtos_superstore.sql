CREATE VIEW vw_produtos_superstore AS
SELECT
    Product_Name,
    Category,
    Sub_Category,
    COUNT(DISTINCT Order_ID) AS pedidos,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(AVG(Sales), 2) AS ticket_medio
FROM Superstore
GROUP BY
    Product_Name,
    Category,
    Sub_Category;
