-- Group By and Order By Examples in SQL
-- Database: parks_and_recreation

-- Switch to the parks_and_recreation database
USE parks_and_recreation;

-- View all columns from the employee_demographics table
SELECT *
FROM employee_demographics;

-- View all columns from the employee_salary table
SELECT *
FROM employee_salary;

-- Group by: Aggregate data based on gender
-- Retrieve unique genders from the employee_demographics table
SELECT gender
FROM employee_demographics
GROUP BY gender;

-- Group by: Aggregate data based on gender (duplicate query, included for clarity)
SELECT gender
FROM employee_demographics
GROUP BY gender;

-- Group by gender and calculate the average age for each gender
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

-- Group by occupation and salary
-- This will group records by both occupation and salary columns
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;

-- Group by gender and perform multiple aggregations
-- Calculate the average, maximum, minimum, and count of age for each gender
SELECT gender, 
       AVG(age) AS average_age, 
       MAX(age) AS max_age, 
       MIN(age) AS min_age, 
       COUNT(age) AS count_of_ages
FROM employee_demographics
GROUP BY gender;

-- Select distinct occupations from the employee_salary table
SELECT DISTINCT occupation
FROM employee_salary;

-- Order By: Sort the result set

-- Order employee_demographics table by first_name in ascending order
SELECT *
FROM employee_demographics
ORDER BY first_name;

-- Order employee_demographics table by first_name in descending order
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

-- Order employee_demographics table by gender and age in descending order
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;

-- Order employee_demographics table by the 5th column and then the 4th column
-- Useful when column names are unknown or dynamic
SELECT *
FROM employee_demographics
ORDER BY 5, 4;
