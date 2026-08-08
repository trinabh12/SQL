# Write your MySQL query statement below
WITH AllDeptEmp AS(
    SELECT Employee.name, Employee.salary, Department.name AS department
    FROM Employee INNER JOIN Department ON Employee.departmentId=Department.id
),
EmpDepRank AS(
    SELECT name, salary, department,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS salary_dept_rank
    FROM AllDeptEmp)

SELECT department AS Department, name AS Employee, salary AS Salary
FROM EmpDepRank
WHERE salary_dept_rank<=3
;