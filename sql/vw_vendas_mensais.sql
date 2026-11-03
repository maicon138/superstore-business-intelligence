CREATE VIEW vw_vendas_mensais AS
SELECT
    YEAR(Order_Date) AS ano,
    MONTH(Order_Date) AS mes,
    COUNT(DISTINCT Order_ID) AS pedidos,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    ROUND(
        SUM(Sales) / NULLIF(COUNT(DISTINCT Order_ID), 0),
        2
    ) AS ticket_medio
FROM Superstore
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date);
