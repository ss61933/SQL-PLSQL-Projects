/*---------------------SQL BASICS--------------------------------------*/


--1 list all columns and data types,null/notnull information  for table employees
desc employees;

--2 select all details from employee table
SELECT * FROM employees;
--advantage : Makes query dynamic as no need to change query even if new column is added or removed

select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID
FROM employees;
/* Note:
  B.P. -- All keywords in upper case
       -- all table/column names in lower case
       --every clasue on new line
*/       


--3 select Employee_id and salary from employees table
select employee_id,salary from employees;

--4 select  employee_id and complete name from employees , give alias as Complete_name
select EMPLOYEE_ID,FIRST_NAME || LAST_NAME
from employees;

select EMPLOYEE_ID,FIRST_NAME ||'  ' ||LAST_NAME as complete_name
from employees;
--for case sensitive alias name
select EMPLOYEE_ID,FIRST_NAME ||'  ' ||LAST_NAME as "complete_name"
from employees;

--alias to table 
select e.employee_id,e.first_name
from employees e;

--5 select employeeid,name and annual salary with 100 rs annual bonus
--user " " for alias if need space 
--use of any mathematical operators is possible in select clause 
select employee_id,first_name,(salary*12)+100 as "annual salary"
from employees;

-- 5.1 Print all Employee details with 10% increment in salary
select employee_id,first_name,salary as actual_salary ,salary+(salary/10) as Incremented_salary
from employees;


--6 Get all department numbers from employee table
select DEPARTMENT_ID
from employees;
--Query gives duplicate ID, returns from every row

--6.1 Get only distinct department numbers from employee table
select distinct department_id as Department_number
from employees;
--IT will list null columns too

/*
Note:

When only one expression is provided in the DISTINCT clause, the query will return the unique values for that expression.
When more than one expression is provided in the DISTINCT clause, the query will retrieve unique combinations for the expressions listed.
In Oracle, the DISTINCT clause doesn't ignore NULL values. So when using the DISTINCT clause in your SQL statement, your result set will include NULL as a distinct value.
*/
--6.2 select Departments and all job position offered in department
select distinct department_id,job_id from employees;

/* How distinct works
  It sorts data,compares and send to output.Ideally output should be in sorteed order but with 10G+ it uses hash alogrithm for distinct and group by 
 */
 