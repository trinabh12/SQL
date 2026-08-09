# Write your MySQL query statement below
WITH ProdOrders AS (
    SELECT product_id, SUM(unit) AS units,  EXTRACT(MONTH FROM order_date) AS mon, EXTRACT(YEAR FROM order_date) AS yr
    FROM Orders
    GROUP BY product_id, EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
)

SELECT Products.product_name, ProdOrders.units AS unit
FROM Products INNER JOIN ProdOrders ON Products.product_id=ProdOrders.product_id
WHERE units>=100 AND mon=2 AND yr=2020;