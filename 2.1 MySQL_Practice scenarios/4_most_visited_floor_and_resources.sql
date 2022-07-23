/* Track employee visits - op format 
Name | Total visits | most_visited_floor | resources_used
*/
create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');
commit;

select * from entries;

with flr_name as  (
select floor,name,count(1) n, row_number() over(partition by name) rn 
from entries
group by name,floor
order by name,n desc)
select e.name , count(e.name) total_visits, group_concat(distinct e.resources) resource_list,r.floor most_visited_floor
from entries e, (select * from flr_name where rn=1) r
where e.name=r.name
group by e.name; 

