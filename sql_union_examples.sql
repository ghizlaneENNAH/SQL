-- Demonstrating SQL UNION and UNION ALL Operations

-- Combine first_name and last_name columns from employee_demographics and employee_salary tables
-- UNION: Removes duplicates by default
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;

-- UNION DISTINCT: Explicitly specifies duplicate removal (same as UNION)
SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

-- UNION ALL: Combines the results without removing duplicates
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

-- Using UNION to combine data with labels
-- Add a label 'Old' for employees over 40 (both Male and Female) from employee_demographics
-- Add a label 'Highly Paid Employee' for employees with a salary > 70,000 from employee_salary
SELECT first_name, last_name, 'Old' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000;
