/* rolling 3 months moving average*/
select orderdate,sum(sales) ,avg(sum(sales) ) over( order by orderdate rows between 2 preceding and current row)
from orders
where orderdate>='2019-12-20'
group by orderdate 
order by ORDERDATE;