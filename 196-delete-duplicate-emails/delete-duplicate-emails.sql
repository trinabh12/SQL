# Write your MySQL query statement below
DELETE one.*
FROM Person one JOIN Person another ON one.email=another.email
WHERE one.id>another.id; 