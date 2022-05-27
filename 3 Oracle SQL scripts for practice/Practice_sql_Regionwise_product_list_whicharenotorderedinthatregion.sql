--Regionwise give information on total products in inventory, total products in each region, total products not in that region 

select distinct region, count(distinct productid) over (partition by null) Region_products_G ,
count(distinct productid) over (partition by region) Region_products_Y,
count(distinct productid) over (partition by null)  - count(distinct productid) over (partition by region) Region_products_N
from orders ;


With Region_product as (
select distinct productid ,
count(case when region='South' then 1  end ) South,
count(case when region='West' then 1  end) West ,
count(case when region='Central' then 1  end) Central,
count(case when region='East' then 1  end) East
from orders 
group by productid)
select  'South' region ,productid, count(productid) over(partition by null) CNT 
from Region_product
where south=0
union
select  'East' region ,productid,count(productid) over(partition by null) CNT
from Region_product
where East=0
union
select  'Central' region ,productid,count(productid) over(partition by null) CNT
from Region_product
where Central=0
union
select  'West' region ,productid,count(productid) over(partition by null) CNT
from Region_product
where West=0