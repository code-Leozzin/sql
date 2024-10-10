WITH Accumulated_Profits AS (
    SELECT 
        c.id AS client_id,
        c.name,
        c.investment,
        o.month,
        SUM(o.profit) OVER (PARTITION BY c.id ORDER BY o.month) AS cumulative_profit
    FROM 
        clients c
    LEFT JOIN 
        operations o ON c.id = o.client_id
),
Payback AS (
    SELECT 
        client_id,
        name,
        investment,
        month,
        cumulative_profit,
        cumulative_profit - investment AS return
    FROM 
        Accumulated_Profits
    WHERE 
        cumulative_profit >= investment
)

SELECT 
    name,
    investment,
    MIN(month) AS month_of_payback,
    return
FROM 
    Payback
GROUP BY 
    client_id, name, investment, return
ORDER BY 
    return DESC;
