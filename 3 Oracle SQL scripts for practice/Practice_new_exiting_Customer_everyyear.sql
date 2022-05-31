select oyear,count(distinct customerid) Totalcustomer , count(distinct case when oyear=c_min_orderyear then customerid end  ) Newcustomer,
count(distinct customerid)  -count(distinct case when oyear=c_min_orderyear then customerid end  ) Existingcustomer
from(
select extract(YEAR FROM orderDate) oyear,customerid, EXTRACT(year from min (orderdate)over(partition by customerid)) c_min_orderyear
from  orders)
group by oyear;

select oyear,count(distinct customerid) Totalcustomer , count(distinct case when oyear=c_min_orderyear then customerid end  ) Newcustomer,
count(distinct customerid)  -count(distinct case when oyear=c_min_orderyear then customerid end  ) Existingcustomer
from(
select extract(YEAR FROM orderDate) oyear,customerid, EXTRACT(year from min (orderdate)over(partition by customerid)) c_min_orderyear
from  orders)
group by oyear;