
-- Desempenho comercial por região

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS faturamento,
    ROUND(SUM(Profit), 2) AS lucro,
    COUNT(DISTINCT Order_ID) AS pedidos,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0),
        2
    ) AS margem_pct
FROM Superstore
GROUP BY Region
ORDER BY SUM(Sales) DESC;

