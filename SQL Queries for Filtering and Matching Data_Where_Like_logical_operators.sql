-- WHERE Clause: Filter rows based on specific conditions

-- Select all columns for employees with the first name 'Leslie'
SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie';

-- Select all columns for employees with a salary greater than 50,000
SELECT * 
FROM employee_salary
WHERE salary > 50000;

-- Select all columns for female employees
SELECT *
FROM employee_demographics
WHERE gender = 'Female';

-- Select all columns for employees who are not female
SELECT *
FROM employee_demographics
WHERE gender != 'Female';

-- Select all columns for employees born after January 1, 1985
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

-- Logical Operators: Combine multiple conditions using AND, OR, NOT

-- Select all columns for male employees born after January 1, 1985
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male';

-- Select all columns for employees born after January 1, 1985 or who are male
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male';

-- Select employees named 'Leslie' who are 44 years old, or employees older than 55
SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) 
   OR age > 55;

-- LIKE Statement: Match patterns in text using % (any number of characters) and _ (single character)

-- Select employees whose first name starts with 'Jer'
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%';

-- Select employees whose first name contains 'er'
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';

-- Select employees whose first name ends with 'er'
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er';

-- Select employees whose first name starts with 'a'
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

-- Select employees whose first name starts with 'a' and has at least three characters
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__%';
