-- Switch to the parks_and_recreation database
use parks_and_recreation;

-- Calculate the average salary by gender using GROUP BY
select gender, avg(salary) 
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender;

-- Calculate the overall average salary using a window function
select gender, avg(salary) over()
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

-- Calculate the average salary by gender using a window function with PARTITION BY
select gender, avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

-- Include employee details along with the average salary by gender
select dem.first_name, dem.last_name, gender, 
avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

-- Assign row numbers to employees without any partitioning
select dem.first_name, dem.last_name, gender,
row_number() over()
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

-- Assign row numbers to employees partitioned by gender
select dem.first_name, dem.last_name, gender,
row_number() over(partition by gender)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

-- Assign row numbers to employees partitioned by gender, ordered by salary descending
select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

-- Assign row numbers, ranks, and dense ranks for employees partitioned by gender, ordered by salary descending
select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as row_rank,
dense_rank() over(partition by gender order by salary desc) as row_denserank
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;
