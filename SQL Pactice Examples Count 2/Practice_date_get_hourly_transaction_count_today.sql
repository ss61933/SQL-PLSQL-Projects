-- Get a hourly transaction for todays date 
create table dummy( id int, ddate date);
insert into dummy values (1,to_date('23-05-2022 00:52:00','dd-mm-yyyy hh24:mi:ss'));
insert into dummy values (1,to_date('23-05-2022 01:52:00','dd-mm-yyyy hh24:mi:ss'));
insert into dummy values (1,to_date('23-05-2022 23:52:00','dd-mm-yyyy hh24:mi:ss'));

insert into dummy values (1,to_date('23-05-2022 00:00:00','dd-mm-yyyy hh24:mi:ss'));
insert into dummy values (1,to_date('23-05-2022 23:59:59','dd-mm-yyyy hh24:mi:ss'));
commit;
truncate table dummy;

with daily_hours as (
select to_char(trunc(sysdate)+(level-1)/24 ,'YYYY-MM-DD HH24:MI:SS') dayhour
from dual
connect by level<=24)
--select * from daily_hours;
select d.dayhour,count(d1.id) from 
daily_hours d
left outer join dummy d1
on (d.dayhour= to_char(trunc(ddate,'hh24'),'YYYY-MM-DD HH24:MI:SS'))
group by dayhour
order by dayhour ;


--simlarly for timestamp column 
select to_char(trunc(systimestamp)+(level-1)/24 ,'YYYY-MM-DD HH24:MI:SS') dayhour
from dual
connect by level<=24