-- Viewing the existing employee demographics and salary tables
select * from employee_demographics;
select * from employee_salary;

-- Creating a trigger that automatically inserts data into employee_demographics 
-- after a new record is inserted into employee_salary
delimiter $$  
create trigger employee_insert  
	after insert on employee_salary  
    for each row  
begin  
	insert into employee_demographics (employee_id, first_name, last_name)  
    values(new.employee_id, new.first_name, new.last_name);  
end $$  
delimiter ;
