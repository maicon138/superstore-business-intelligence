
CREATE VIEW vw_kpis_superstore AS

WITH vendas AS (
    SELECT
        Region,
        Category,
        Segment,
        Sales,
        Profit,
        Order_ID
    FROM Superstore
),
kpis AS (
    SELECT
        Region,
        Category,
        Segment,
        COUNT(DISTINCT Order_ID) AS total_pedidos,
        ROUND(SUM(Sales), 2) AS faturamento,
        ROUND(SUM(Profit), 2) AS lucro,
        ROUND(
            SUM(Sales) / NULLIF(COUNT(DISTINCT Order_ID), 0),
            2
        ) AS ticket_medio,
        SUM(Profit) / NULLIF(SUM(Sales), 0) AS margem_prct
    FROM vendas
    GROUP BY
        Region,
        Category,
        Segment
)
SELECT *
FROM kpis;
