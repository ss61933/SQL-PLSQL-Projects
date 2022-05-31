-- Find out active customer . Acitve customer is the one which has done 2nd purchase within 7 days of previous purchase 

select  distinct customerid
from(
select customerid,orderdate-lag(orderdate)over(partition by customerid order by orderdate)datediff
from(
select distinct customerid,orderid,orderdate
from orders
order by customerid ,orderdate
))
where datediff<7;

select distinct o.customerid
from orders o, orders o1
where o.customerid=o1.customerid
and o.orderid<>o1.orderid
and o.orderdate<=o1.orderdate
and  o1.orderdate-o.orderdate<7