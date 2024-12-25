-- Select all columns from the employee_demographics table
SELECT *
FROM employee_demographics;

-- Select the first name, age, and gender columns from the employee_demographics table
-- Rename the "first_name" column to "firstname" in the result
SELECT first_name AS firstname, age, gender
FROM employee_demographics;

-- Select the first name and age columns from the employee_demographics table
SELECT first_name,
       age
FROM employee_demographics;

-- Select the first name and age from the employee_demographics table
-- Add 10 to the age in the result
SELECT first_name,
       age + 10
FROM employee_demographics;

-- Select distinct (unique) values of first_name from the employee_demographics table
SELECT DISTINCT first_name
FROM employee_demographics;

-- Select distinct (unique) values of gender from the employee_demographics table
SELECT DISTINCT gender
FROM employee_demographics;
