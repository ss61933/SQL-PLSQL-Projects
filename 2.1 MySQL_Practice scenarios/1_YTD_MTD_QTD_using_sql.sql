with morder as (
select max(orderdate) mdate
from orders)
select sum(sales) sales,'YTD'as period  
from orders where year(orderdate)=(select year(mdate) from morder)
union
select sum(sales) sales,'MTD'as period  
from orders where year(orderdate)=(select year(mdate) from morder)
				and month(orderdate)=(select month(mdate) from morder)
union
select sum(sales) sales,'QTD'as period  
from orders where year(orderdate)=(select year(mdate) from morder)
				and quarter(orderdate)=(select quarter(mdate) from morder);