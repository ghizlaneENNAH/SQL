-- Creating a stored procedure to retrieve employees with high salaries
create procedure large_salaries()
select *
from employee_salary
where salary >= 50000;

-- Calling the stored procedure to display results
call large_salaries();



-- Defining a stored procedure with multiple queries using a delimiter
delimiter $$  
create procedure large_salaries3()  
begin  
    -- First query: Select employees with salaries greater than or equal to 50,000  
    select *  
    from employee_salary  
    where salary >= 50000;  
    
    -- Second query: Select employees with salaries greater than or equal to 10,000  
    select *  
    from employee_salary  
    where salary >= 10000;  
end $$  
delimiter ;  

-- Calling the stored procedure to execute both queries  
call large_salaries3();  
