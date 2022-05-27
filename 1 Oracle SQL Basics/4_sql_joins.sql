/******* Joins in oracle********
Types of joins
1. Carteshian/Cross join
2.Natureal/Simple/Inner/Equi Join
3.Left Outer Join
4.Right Outer Join
5.Full Outer Join
6.Self Join
*/


--1 Cartersian Join
select e.employee_id,d.department_name
from employees e ,departments d;

--Inner Join
--2. Retrieve Employee id,firstname,salary and departmentid ,departmentname details for employees
--Driver/master table --Department
select e.employee_id,e.first_name,e.department_id,e.salary,d.department_name
from departments d,employees e
where d.DEPARTMENT_ID=e.DEPARTMENT_ID;

--sql 1999 syntax
select e.employee_id,e.first_name,e.department_id,e.salary,d.department_name
from employees e join departments d
on e.DEPARTMENT_ID=d.DEPARTMENT_ID;


select employee_id,first_name,department_id,salary,department_name
from employees  natural join departments 
;

select employee_id,first_name,department_id,salary,department_name
from employees  inner join departments 
using(DEPARTMENT_ID);

--Q.2.1 Retrieve Employee id,firstname,salary and departmentid ,departmentname details for employees having salary greater than 10000
        --Output should be sorted by salary
select e.employee_id,e.first_name,e.department_id,e.salary,d.department_name
from employees e,departments d
where e.DEPARTMENT_ID=d.DEPARTMENT_ID
and e.salary>10000
order by e.salary;

--Q.2.2 Retrieve Employee id,firstname,salary and departmentid ,departmentname details for employees from department Purchasing .
--      Employee salary should be greater than 10000
select e.employee_id,e.first_name,e.department_id,e.salary,d.department_name
from employees e,departments d
where e.DEPARTMENT_ID=d.DEPARTMENT_ID
and e.salary>10000
and d.department_name='Purchasing';

--Mulitple tables in join
--2.3 Retrieve Employee id,firstname,salary and departmentid ,departmentname details for employees
--    Also dispaly city name where department is present
select e.employee_id,e.first_name,e.department_id,e.salary,d.department_name,l.city
from employees e,departments d,locations l
where e.DEPARTMENT_ID=d.DEPARTMENT_ID
and d.location_id=l.location_id;

--sql 1999 syntax
select e.employee_id,e.first_name,e.department_id,e.salary,d.department_name
from employees e join departments d
on e.DEPARTMENT_ID=d.DEPARTMENT_ID;

--Left Outer Join
--Employee 178 is not assigned to any department
--select * from employees where EMPLOYEE_ID=178;
--3. Select Employeeid,name, department_id,department_name for all employees including those who are on bench. 

select e.employee_id,e.first_name,e.salary,e.department_id,d.department_name
from employees e,departments d
where e.DEPARTMENT_ID=d.DEPARTMENT_ID(+);

select e.employee_id,e.first_name,e.salary,e.department_id,d.department_name
from employees e left outer join departments d
on (d.department_id=e.department_id);


--Right Outer Join
--4. Select Employeeid,name, department_id,department_name for all employees
-- Also list departments which do not have any employees alloted

select e.employee_id,e.first_name,e.salary,e.department_id,d.department_name
from employees e,departments d
where e.DEPARTMENT_ID(+)=d.DEPARTMENT_ID;

select e.employee_id,e.first_name,e.salary,e.department_id,d.department_name
from employees e right outer join departments d
on (d.department_id=e.department_id);

--Full Outer Join
--5. Select Employeeid,name, department_id,department_name for all employees
--  Also list departments which do not have any employees alloted
--  Also list departments which do not have any employees alloted


select e.employee_id,e.first_name,e.salary,e.department_id,d.department_name
from employees e,departments d
where e.DEPARTMENT_ID=d.DEPARTMENT_ID(+)
UNION
select e.employee_id,e.first_name,e.salary,e.department_id,d.department_name
from employees e,departments d
where e.DEPARTMENT_ID(+)=d.DEPARTMENT_ID;

select e.employee_id,e.first_name,e.salary,e.department_id,d.department_name
from employees e full outer join departments d
on (d.department_id=e.department_id);

--Self Join
--6. Print employeeid,firstname ,managerid,managername for all employees
select e.employee_id,e.first_name,m.employee_id,m.first_name
from employees e ,employees m
where e.manager_id=m.employee_id
order by e.employee_id;

--Interview Question
--In each type of joins how many number of rows are returned