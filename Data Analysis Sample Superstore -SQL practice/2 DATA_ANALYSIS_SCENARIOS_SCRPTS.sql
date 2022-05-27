/*
Practice SQL for data analysis with real examples .
Do it with SQL and with tableau. Refer to link below for tableau implementation of below quries 
https://public.tableau.com/app/profile/swapnil7870/viz/Tutorial_sql_Tableau_functions/Dashboard1#1

*/

--1  Nested sort : Region desc, Category asc, subcategory desc
select distinct region,category,subcategory
from orders
order by Region desc ,Category asc,subcategory desc;




--2 Sort by Measure
select region, category,subcategory,round(sum(sales)) as "TOTAL_SALES"
from orders
group by region,category,subcategory
order by (sum(sales)) desc;


--3 Region,Category,Subgateory wise sales (Region pivoted)


select * from 
(
select region, category,subcategory,round(sum(sales)) sales
from orders
group by region,category,subcategory
)
pivot (
        sum(sales) for region in ('Central' Central,'East' East,'South' South,'West' West)
              )
order by 1,2;


--4 Show Grand total and Sub total Regin,Category,Sub category wise


select  case when region is null then 'Grand Total' else region end reggion ,
case when category is null and region is not null then 'Total' else  category end category,
case when subcategory is null and category is not null then 'Total' else subcategory end subcategory  ,
round(sum(sales)) sales,
GROUPING_id(region) region_grouping,
GROUPING_id(region,category) region_cat_grouping,
GROUPING_id(category,subcategory) region_cat_grouping
from orders
group by grouping sets ((),(region),(region,category),(region,category,subcategory))
order by region,category,subcategory;


--5 Show only row grand total 


select region ,
 category,
subcategory  ,
round(sum(sales)) sales
from orders
group by grouping sets ((),(region,category,subcategory))
order by 1,2;
 
--6,7,8
-- Rank based on sum(sales) in desc order --SHEET 8
-- Rank based on sum(sales)  in desc order WITHIN region --SHEET 7  
-- Rank based on sum(sales)  in desc order WITHIN region category  --SHEET 6 
select region ,
 category,
 subcategory  ,
round(sum(sales)) sales,
rank() OVER (ORDER BY sum(sales) DESC) rank_sales,--SHEET 8 
rank() OVER (partition by region ORDER BY sum(sales) DESC) rank_regionwise_sales,--SHEET 7 
rank() OVER (partition by region,category ORDER BY sum(sales) DESC) rank_region_cat_sales--SHEET 6 
from orders
group by region,category,subcategory 
order by  rank_sales;-- Rank by sum(sales)--SHEET 8 
--order by region,rank_regionwise_sales; --rank by sum sales within region --SHEET 7 
--order by region,category ,rank_region_cat_sales;--SHEET 6 





