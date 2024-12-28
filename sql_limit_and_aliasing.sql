-- Demonstrating LIMIT Clause and Aliasing in SQL

-- LIMIT Clause: Restrict the number of rows returned
-- Select all columns from employee_demographics, order by age in descending order
-- Return only the top 3 oldest employees
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

-- Aliasing: Rename columns or expressions for clarity

-- Group by gender and calculate the average age
-- Alias the average age as 'avg_age' for better readability
-- Filter groups where the average age is greater than 40
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

-- Same as the previous query but with an alternative aliasing syntax
SELECT gender, AVG(age) avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;
