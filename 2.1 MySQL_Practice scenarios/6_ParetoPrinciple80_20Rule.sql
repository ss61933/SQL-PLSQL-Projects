/* List those 20% of products which give 80% of total sales */

/*Total sales is
2291141	 and 80% sales is 1832912.8
 */
select sum(sales),sum(sales)*.8 from orders;

/* productwise sales in desc order*/

with 80_p_sales as (
select sum(sales),sum(sales)*.8  sales from orders),
pr_sales as (select PRODUCTID,sum(sales) p_sales,count(productid) over() t_products
from orders
group by productid 
order by sum(sales) desc)
select a.*,count(productid) over() t1_prodcuts from (
select productid,p_sales,sum(p_sales) over(order by p_sales desc) running_total, row_number( )over (partition by null)
,t_products
from pr_sales
order by p_sales desc)a
where running_total<=(select sales from 80_p_sales );

/* so 413(22% ) of  prodcuts out of 1862 products does the 80 % of sale , 