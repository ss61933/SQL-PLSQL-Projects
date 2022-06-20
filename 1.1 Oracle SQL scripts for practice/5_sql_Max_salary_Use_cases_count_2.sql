--Q0 - Compare max salary of IT and marketing department 

select M_SALARY-IT_SALARY 
from (
select  max(case when d.department_name='Marketing' then e.salary end )M_SALARY, 
        max(case when d.department_name='IT' then e.salary end ) IT_SALARY
        from employees e ,departments d
        where e.department_id=d.department_id);

--Q1 - Compare max salary for Executive department with max salary for every other department 
     --Executive department should be first in order and list other in alphabetic order 

--select department_name,m_salary
select  d.department_name,max(e.salary) m_salary , first_value(max(e.salary))over ()-max(e.salary) Diff
from employees e ,departments d
where e.department_id=d.department_id
group by d.department_name
order by (case when d.department_name='Executive' then 0 else 1 end),d.department_name;

