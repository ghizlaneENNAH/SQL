-- Display all data from the employee demographics table
select * 
from employee_demographics;

-- Categorize employees into age brackets using CASE
-- "young" for age <= 30, "old" for age between 31 and 50
select first_name, last_name, age,
case
    when age <= 30 then 'young'
    when age between 31 and 50 then 'old'
end as age_bracket
from employee_demographics;

-- Pay Increase and Bonus Calculations
-- Rules:
-- Salaries < 50000 get a 5% increase
-- Salaries > 50000 get a 7% increase
-- Employees in the finance department (dept_id = 6) get a 10% bonus

-- Display all data from the employee salary table
select * 
from employee_salary;

-- Calculate new salary and bonus based on conditions
select first_name, last_name, salary,
case
    when salary < 50000 then salary * 1.05 -- 5% increase for salary < 50000
    when salary > 50000 then salary * 1.07 -- 7% increase for salary > 50000
end as new_salary,
case
    when dept_id = 6 then salary * 0.10 -- 10% bonus for finance department
end as bonus
from employee_salary;
