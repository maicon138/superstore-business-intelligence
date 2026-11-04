
-- Evolução mensal do faturamento e lucro

SELECT
    YEAR(Order_Date) AS ano,
    MONTH(Order_Date) AS mes,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    COUNT(DISTINCT Order_ID) AS pedidos
FROM Superstore
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    ano,
    mes;

