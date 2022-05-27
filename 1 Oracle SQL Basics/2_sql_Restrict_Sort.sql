/*-------------------------Sql Restriction-----------------------*/

--1 Retreive all employee Ids and job details that belongs to department 20
select employee_id,job_id from employees where department_id=20;
--From clause does the selection
--Where clause does the projection i.e. what to select


--2 Retrieve Employee details for STEVEN
select * from employees where first_name='STEVEN';
-- zero rows as data is case sensitive
select * from employees where first_name='Steven';
--We have two employees with name Steven

--2.1 Retrieve Employee details for Steven King
select * from employees where first_name='Steven' and Last_name='King';

/*Note:
Note:

The SQL AND condition allows you to test 2 or more conditions.
The SQL AND condition requires that all of the conditions (ie: condition1, condition2, condition_n) be must be met for the record to be included in the result set.
*/

--3 Select emmployee details where salary is more than 2500
select * from employees where salary>2500;

--3.1 Select emmployee details where salary is more than 2500 for department 30
select * from employees where salary>2500 and department_id=30;

--3.2 Select emmployee details where salary is greater than  or equals 2500 for department 30
select * from employees where salary>=2500 and department_id=30;
--So understand the requirment 

--4 Select all employees where salary greate than 2500 and less than 11000 for department 30
select * from employees where (salary>2500 and salary<11000) 
and department_id=30;

--4.1 Select all employees where salary greate than equals to 2500 and less than equals to 11000 for department 30
select * from employees where (salary>=2500 and salary<=11000) 
and department_id=30;

--Using between clasue as it is inclusive of boundaries 
select * from employees where salary between 2500 and 11000
and department_id=30;


--4.2 select employees not hired between perid 7thDec 2002 till 17thDec 2004
SELECT *
FROM employees
WHERE hire_date not BETWEEN TO_DATE ('07/12/2002', 'dd/mm/yyyy')
and  TO_DATE ('17/02/2004', 'dd/mm/yyyy');


--5 select Employee details who reports to manager with ID 114 or 110
select * from employees where manager_id =100 or manager_id=114;

--Using in clause (In clause have limitation on length)
select * from employees where manager_id in (100,114);


--5.1 select Employee details who reports to manager with ID 114 or 110 for department 30
select * from employees where manager_id =100 or manager_id=114 and DEPARTMENT_ID=30; 
--It will give wrong results
--Always follows operator precedence . AND is always precedence to OR 
select * from employees where( manager_id =100 or manager_id=114) and DEPARTMENT_ID=30; 

--6 select Employee details who do not report to manager with ID 100 
select * from employees where manager_id !=100;
select * from employees where manager_id <>100;
select * from employees where not manager_id=100;
--6.1 select Employee details who do not report to manager with ID 100 or 114
--what will you use OR or AND 
select * from employees where manager_id !=100 and  manager_id !=114;

select * from employees where manager_id not in (100,114);

--6.2 select Employees who are neither programmer nor accountant
--char data type always in quotes
select * from employees where job_id not in ('IT_PROG','FI_ACCOUNT');

--Use of wild card characters

--7 Select all employees whose first name ends with h
select * from employees where first_name like '%h';

--7.1 Select all employees whose first name start with S
select * from employees where first_name like 'S%';

--7.2 Select all employees whose first name conains with ll
select * from employees where first_name like '%ll%';

--7.3 Print all employees where first name starte with Sh and ends with i
select * from employees where first_name like 'Sh%i';

--7.3 Print all employees where last name starte with F and ends with y  
select * from employees where last_name like 'F%y';

--7.4 Print all employees where last name starte with F and ends with y and have 6 characters 
select * from employees where last_name like 'F____y';

--Order by clause 
--8 List employee details in order of their department_id
select * from employees order by department_id;
--Default order is ascending 
select * from employees order by department_id asc;

--8 List employee id,fname,salary in order of their department_id in descnding order 
select employee_id,first_name,salary from employees order by department_id desc;
--Note sorted column may not be presnt in select

select employee_id,first_name,salary,department_id from employees order by 4 desc;
--We can give position for column to sort data
--Note that null is listed at last while asecnding and first in descnding 

select employee_id,first_name,salary,department_id from employees order by department_id desc nulls last;

--8.1 List employee id,fname,salary in order of their department_id in descnding order of department_id and within department in ascending order of employee_id
select employee_id,first_name,salary,department_id 
from employees 
order by department_id desc nulls last,
          employee_id asc;
