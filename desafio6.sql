CREATE VIEW faturamento_atual AS
SELECT MIN(price) AS 'faturamento_minimo',
        MAX(price) AS 'faturamento_maximo',
        ROUND(AVG(price), 2) AS 'faturamento_medio',
        SUM(price) AS 'faturamento_total'
FROM SpotifyClone.plans p
INNER JOIN SpotifyClone.users u ON p.plan_id = u.selected_plan;