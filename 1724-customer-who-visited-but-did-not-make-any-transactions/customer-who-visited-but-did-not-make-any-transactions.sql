# Write your MySQL query statement below
WITH AllVisits AS(
    SELECT Visits.customer_id, Visits.visit_id, COUNT(Transactions.transaction_id) AS paid_visits
    FROM Visits LEFT JOIN Transactions
    ON Visits.visit_id=Transactions.visit_id
    GROUP BY Visits.visit_id
)

SELECT customer_id,  COUNT(paid_visits) AS count_no_trans
FROM AllVisits
WHERE paid_visits=0
GROUP BY customer_id;