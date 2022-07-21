#-----https://www.youtube.com/watch?v=7hZYh9qXxe4
WITH RECURSIVE datest (types,dates) AS
(
  SELECT 'cdate' types, current_date()  dates 
  UNION ALL
  SELECT 'rdate' types,dates+ INTERVAL 1 DAY FROM datest
  WHERE dates <= current_date()+5
)
SELECT * FROM datest;


# display 1 to 10 numbers

with recursive t_10 as 
( select 1  as n 
	union
 select n+1 from t_10
 where n<10) 
 select * from t_10;


CREATE TABLE employees (
  id         INT PRIMARY KEY NOT NULL,
  name       VARCHAR(100) NOT NULL,
  manager_id INT NULL,
  INDEX (manager_id),
FOREIGN KEY (manager_id) REFERENCES employees (id)
);
INSERT INTO employees VALUES
(333, "Yasmina", NULL),  # Yasmina is the CEO (manager_id is NULL)
(198, "John", 333),      # John has ID 198 and reports to 333 (Yasmina)
(692, "Tarek", 333),
(29, "Pedro", 198),
(4610, "Sarah", 29),
(72, "Pierre", 29),
(123, "Adil", 692);

commit;
with recursive emp_hir(id,name,path) as 
(
select id,name,cast(id as char(2000))  
from employees where manager_id is null
union all
select e.id,e.name,CONCAT(e1.path, ',', e.id)path 
from emp_hir e1 ,employees e
where e1.id = e.manager_id
)
select * from emp_hir order by path;
