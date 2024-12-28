-- Demonstrating SQL Joins: Inner, Outer, Self Joins, and Joining Multiple Tables  

-- View all records from the employee_demographics table
SELECT * 
FROM employee_demographics;

-- View all records from the employee_salary table
SELECT * 
FROM employee_salary;

-- Inner Join: Combine rows from both tables where there is a match in employee_id
SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id;

-- Inner Join with specific columns
-- Select employee_id, age from employee_demographics, and occupation from employee_salary
SELECT dem.employee_id, dem.age, sal.occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id;

-- Outer Joins: Include unmatched rows from one of the tables

-- Left Join: Include all records from employee_demographics and matching records from employee_salary
SELECT * 
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id;

-- Right Join: Include all records from employee_salary and matching records from employee_demographics
SELECT * 
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id;

-- Self Join: Join a table with itself
-- This example joins employee_salary to itself based on employee_id
SELECT * 
FROM employee_salary emp1
JOIN employee_salary emp2
ON emp1.employee_id = emp2.employee_id;

-- Joining Multiple Tables Together
-- Combine employee_demographics, employee_salary, and parks_departments tables
SELECT * 
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
ON pd.department_id = sal.dept_id;

-- View all records from the parks_departments table
SELECT * 
FROM parks_departments;
