select year_order,count(CUSTOMERID) total_customers,
			count(case when year_order=min_year_order then customerid end)  new_customers,
            count(CUSTOMERID)-count(case when year_order=min_year_order then customerid end)  existing_customers
            from(
select customerid,year(orderdate) year_order, min(year(orderdate)) over(partition by customerid) min_year_order
from orders) a
group by year_order;


/*For individual dates */
select d,count(customerid) c_count,count(case when d=md then customerid end) nc_count
from(
select CUSTOMERID,orderdate d,min(orderdate) over(partition by customerid) md from 
orders 
where orderdate>='2019-12-01' ) cd
group by d
order by d ;
