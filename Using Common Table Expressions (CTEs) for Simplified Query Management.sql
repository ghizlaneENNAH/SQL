-- Switch to the parks_and_recreation database
use parks_and_recreation;

-- Calculate aggregate salary metrics grouped by gender
select gender, avg(salary), min(salary), sum(salary), max(salary), count(salary)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender;

-- Define a Common Table Expression (CTE) for aggregate salary metrics
with cte_example as (
    select gender, avg(salary) as avg_sal, min(salary) as min_sal, sum(salary) as sum_sal, max(salary) as max_sal, count(salary) as count_sal
    from employee_demographics dem
    join employee_salary sal
    on dem.employee_id = sal.employee_id
    group by gender
)
-- Query the CTE
select *
from cte_example;

-- Retrieve only the average salary from the CTE
select avg_sal
from cte_example;

-- Define two CTEs for filtering data by specific conditions
with cte_example1 as (
    select *
    from employee_demographics
    where birth_date > '1985-01-01'
),
cte_example2 as (
    select *
    from employee_salary
    where salary > 50000
)
-- Join the two CTEs on employee_id
select *
from cte_example1
join cte_example2
on cte_example1.employee_id = cte_example2.employee_id;

-- Define a CTE with specified column aliases for aggregate metrics
with cte_example(Gender, avg_sal, min_sal, sum_sal, max_sal, count_sal) as (
    select gender, avg(salary) as avg_sal, min(salary) as min_sal, sum(salary) as sum_sal, max(salary) as max_sal, count(salary) as count_sal
    from employee_demographics dem
    join employee_salary sal
    on dem.employee_id = sal.employee_id
    group by gender
)
-- Query the CTE
select *
from cte_example;

-- Retrieve only the average salary from the CTE
select avg_sal
from cte_example;
