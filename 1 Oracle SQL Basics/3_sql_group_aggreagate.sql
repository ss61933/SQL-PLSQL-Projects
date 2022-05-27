/*-------------------Aggregate Function -------------------------------*/
--Function that operates on set of rows and returns single value in output

--1 Get maximum salary paid to any employee across all departments
select max(salary)
from employees;

--1.1 Similarly min ,avg ,sum count

select max(salary),min(salary),avg(salary),sum(salary),count(*)
from employees;

--1.2 Find out the day when first and last employee was hired in organization
select min(hire_date),max(hire_date)
from employees;


--Count function example
select count(*),count(employee_id),count(department_id)
from employees;
--observe here , count on departmnet id is 106, indicates aggregate functions do not consider NULL values

--1.3 select count of total departments 
select count(*),count(department_id)
from departments;

select * from departments;
--1.4 Can we find it from Employees table,count of departments which are functional
select count(DISTINCT(department_id))
from employees;
--Nesting of functions is possible

/*--------------------Aggregate functions and groupomg-------------------*/
--2. Find out count of employees in each functional department
select department_id,count(*) from 
employees
group by department_id
order by 1;

--Column appears in group by clause may or may not appear in select clause
--Column appreares in select caouse before aggregate function should appear in group by clause

--3. Find out total salary being paid for each job within each department. Also print number of employees departmentwise and within department ,jobwise
select department_id,job_id,sum(salary),count(*)
from employees
group by department_id,job_id
order by department_id,job_id;


/*-------Having clause---------------*/
--4. Find out total salary per department , having total salary greater than 10000
select department_id,sum(salary) as total_salary
from employees
group by DEPARTMENT_ID
having sum(salary)>10000
order by department_id;

--4.1 Find out total salary per department , having total salary greater than 10000, except department 20
select department_id,sum(salary) as total_salary
from employees
where department_id<>20
group by DEPARTMENT_ID
having sum(salary)>10000
order by department_id;

--4.2 FInd out departments which have more than 10 employees working in it and also display count
select department_id,count(*)
from employees 
group by DEPARTMENT_ID
having count(*)>10;


--4.3 Find job wise total and average salaries excluding those whrere total salary is less than 20000.
-- Also do not consider employees of department 
--Output the data in descnding order of total order
select job_id,avg(salary),sum(salary)
from employees
where DEPARTMENT_ID<>80
group by job_id
having sum(salary)<20000
order by sum(salary) desc;

--Handling Nulls
--5 select employee details where no department is assigned
select * from employees where department_id=NULL;
--No result
select * from employees where department_id is NULL;
--With Null
--5.1 Select employees who receives commission
select * from employees where commission_pct is NOT NULL;
