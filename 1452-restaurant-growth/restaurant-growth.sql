WITH DailyTotals AS(
    SELECT visited_on, SUM(amount) AS amount,
    ROW_NUMBER() OVER (ORDER BY visited_on) AS day_number
    FROM Customer
    GROUP BY visited_on),

MovingTotals AS(
    SELECT visited_on, amount, day_number,
    SUM(amount) OVER(
    ORDER BY visited_on
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS seven_day_total
    FROM DailyTotals)

SELECT visited_on, seven_day_total AS amount, ROUND(seven_day_total/7 , 2) AS average_amount
FROM MovingTotals
WHERE day_number>=7
ORDER BY visited_on ASC;