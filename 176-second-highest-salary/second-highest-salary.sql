# Write your MySQL query statement below
WITH SalaryRanks AS(
    SELECT id, salary, 
    DENSE_RANK() OVER( ORDER BY salary DESC) AS salary_rank
    FROM Employee
)
SELECT MAX(salary) AS SecondHighestSalary
FROM SalaryRanks
WHERE salary_rank=2;