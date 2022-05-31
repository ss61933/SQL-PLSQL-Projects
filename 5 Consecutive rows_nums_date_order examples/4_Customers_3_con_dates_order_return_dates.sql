--Find out  customers placing  orders on 3 consecutive days and return the dates as well 
select customerid,  firstorderdate , secondorderdate,thirdorderdate
from(
select customerid,orderdate firstorderdate ,
lead(orderdate) over(partition by customerid order by trunc(orderdate)) secondorderdate,
lead(orderdate,2) over(partition by customerid order by trunc(orderdate)) thirdorderdate, lead(orderdate) over(partition by customerid order by trunc(orderdate)) -orderdate next_orderdate ,
          lead(orderdate,2) over(partition by customerid order by trunc(orderdate)) -orderdate next_orderdate1
from 
orders_2 )
where next_orderdate=1 and next_orderdate1=2
