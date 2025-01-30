-- Selecting the database to work with
use parks_and_recreation;

-- Creating a temporary table to store employee details with their favorite movie
create temporary table temp_table(
    first_name varchar(50),
    last_name varchar(50),
    favorite_movie varchar(100)
);

-- Retrieving data from the temporary table (initially empty)
select * 
from temp_table;

-- Inserting a record into the temporary table
insert into temp_table values('Ennah', 'Ghizlane', 'Harry Potter');

-- Displaying all records from the temporary table after insertion
select * 
from temp_table;

-- Viewing the employee salary table
select * 
from employee_salary;

-- Creating a temporary table to store employees with salaries above 50,000
create temporary table salary_over_50K
select * from employee_salary
where salary >= 50000;

-- Retrieving records from the newly created temporary table
select * 
from salary_over_50K;
