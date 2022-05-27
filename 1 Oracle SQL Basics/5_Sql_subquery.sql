/******------SUB QUERIES-------******/


--1 select employeeid,first_name,salary,job_id whose salary is Greater than Alana Walsh
select Employee_id,first_name,salary,job_id 
from employees
where salary>(select salary
              from employees 
              where first_name='Alana' and last_name='Walsh');
              
--Q 1.1 Select Department details located at Seattle

select *
from departments 
where location_id=(select location_id 
                  from locations
                  where city='Seattle');
--same result using Joins
select d.*
from departments d,locations l 
where d.location_id=l.location_id 
and l.city='Seattle';

--2 Find all employee details who have same job as of employees from department 90
select * from employees
where job_id=(select Job_id
                from employees 
                where department_id=90);
--Error  as inner query is returning more than one row

--Corrected
select * from employees
where job_id in(select Job_id
                from employees 
                where department_id=90);

--3  Display employeeid,name salary of all employees whose
--    Job_id is same as Employee_id 100
-- or salary is same as of salary of Employee Lex De Haan
select * from employees 
where job_id=(select job_id from employees where employee_id=100)
or salary=(select salary from employees where first_name='Lex' and last_name='De Haan');


--4 Display department no ,minimum salary for all department where minimum salary in department is greater than minimum salary of department 110
select department_id,min(salary)
from employees
group by DEPARTMENT_ID
having min(salary)>(select min(salary) from employees where department_id=110)
;

--5 Select emplyoee details whose salary is greater than salary for employees whose name start with S
select * 
from employees
where salary>(select salary from employees where first_name like 'W%');
--Error 
--When we use comaprison operator > or < and inner query is returning more than one row then use any of the following operator
select * 
from employees
where salary>Any(select salary from employees where first_name like 'W%');

-->All  : > than max()
-->ANY  : < than min()
--<All  : < tahn min()
-->ANy  : > than min()


