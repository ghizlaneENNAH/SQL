-- Demonstrating the Differences Between HAVING and WHERE Clauses
-- Database: parks_and_recreation

-- Switch to the parks_and_recreation database
USE parks_and_recreation;

-- HAVING Clause: Filter aggregated results
-- Group by gender and calculate the average age
-- Retrieve only groups where the average age is greater than 40
SELECT gender, AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

-- View all columns from the employee_salary table
SELECT * 
FROM employee_salary;

-- Combining WHERE and HAVING Clauses
-- Filter rows where the occupation contains 'Manager' (applied before aggregation)
-- Group by occupation and calculate the average salary
-- Retrieve only groups where the average salary is greater than 75,000
SELECT occupation, AVG(salary) AS average_salary
FROM employee_salary
WHERE occupation LIKE '%Manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000;
