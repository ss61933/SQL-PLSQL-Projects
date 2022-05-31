--Find out consecutive days for which their was no sale for more than 3 days 

select * from (
select distinct orderid,trunc(orderdate),lead(orderdate) over(order by trunc(orderdate)) next_orderdate,
lead(orderdate) over(order by trunc(orderdate))-trunc(orderdate) gap_in_next_order
from orders
order by trunc(orderdate))
where gap_in_next_order>3;


with d2017_cal as (
select to_date('01-01-2017')+(level-1) d
from dual
connect by level<=365),
dates_null as (select a.d 
from d2017_cal a 
left outer join orders o
on a.d=o.orderdate(+)
group by a.d
having count(o.orderid)=0)
select d
from dates_null;