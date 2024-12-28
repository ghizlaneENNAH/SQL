-- SQL String Functions Examples

-- LENGTH: Calculate the number of characters in a string
SELECT LENGTH('skyfull') AS string_length;

-- LENGTH: Determine the length of each first_name and order the results by length
SELECT first_name, LENGTH(first_name) AS length
FROM employee_demographics
ORDER BY length;

-- UPPER and LOWER: Convert strings to uppercase and lowercase
SELECT UPPER('sky') AS upper_case; -- Convert to uppercase
SELECT LOWER('SKY') AS lower_case; -- Convert to lowercase

-- UPPER: Convert the first_name column to uppercase
SELECT first_name, UPPER(first_name) AS upper_name
FROM employee_demographics;

-- TRIM: Remove leading and trailing spaces from a string
SELECT TRIM('       sky      ') AS trimmed_string;

-- LEFT and SUBSTRING: Extract specific portions of strings
-- Extract the first 4 characters of first_name
-- Extract a substring starting at position 3 with length 2
-- Extract the month from the birth_date column
SELECT first_name, 
       LEFT(first_name, 4) AS first_four_chars,
       SUBSTRING(first_name, 3, 2) AS mid_chars,
       SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;

-- REPLACE: Replace all occurrences of 'a' with 'z' in first_name
SELECT first_name, REPLACE(first_name, 'a', 'z') AS replaced_name
FROM employee_demographics;

-- LOCATE: Find the position of a substring within a string
-- Find the position of 'x' in the string 'alexander'
SELECT LOCATE('x', 'alexander') AS position;

-- LOCATE: Find the position of 'e' in each first_name
SELECT first_name, LOCATE('e', first_name) AS position_of_e
FROM employee_demographics;

-- CONCAT: Combine first_name and last_name into a full_name
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;
