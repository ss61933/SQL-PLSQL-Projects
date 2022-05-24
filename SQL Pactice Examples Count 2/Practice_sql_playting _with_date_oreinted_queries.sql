--1. Get current year, previous year and current month sales
with s_latest as 
(
select extract(year from max(orderdate) )max_orderdate,
max(orderdate) ors
from 
orders)
select 
sum(case when extract(year from (orderdate)) =(select max_orderdate from s_latest) then sales end ) CY_SALES,
sum(case when extract(year from (orderdate)) =(select max_orderdate-1 from s_latest) then sales end ) PY_SALES,
sum(case when trunc(orderdate,'mon') = (select trunc(ors,'month') from s_latest) then sales end ) CM_SALES,
sum(case when trunc(orderdate,'mon') = (select add_months(trunc(ors,'month'),-12) from s_latest) then sales end ) PY_CM_SALES
from orders ;


--2 Get quarter wise sales ,get running total, get diff from previous sales
select q_year, sales , 
        sum(sales) over(ORDER by q_year asc),
        sales-lead(sales) over(order by q_year desc)
from(
select extract(year from (orderdate))||'-'||to_Char(orderdate,'Q') q_year,sum(sales)sales
from orders
group by extract(year from (orderdate))||'-'||to_Char(orderdate,'Q')
order by  extract(year from (orderdate))||'-'||to_Char(orderdate,'Q')
)
order by q_year;   


--3 Give total sales,region wise sales,region,cateogry wise sales , overall sales for 2016

select distinct region,category
        ,sum(sales) over() overall_sales
        ,sum(sales) Over(partition by region)    regionwise_sales
        ,sum(sales) Over(partition by region,category)    categorywise_sales
        ,sum( case when to_Char(orderdate,'yyyy')='2016' then sales end ) over() overall_sales_current_year
        ,sum(case when region='Central' then sales end ) over() -- additional to display sales of region central across all 
from orders
order by 1,2;

