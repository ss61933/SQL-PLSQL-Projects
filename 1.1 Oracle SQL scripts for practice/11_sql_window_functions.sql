select region,regionsale,min(regionsale) over (partition by null order by null rows between 1 preceding  and 1 following ),
max(regionsale) OVER(PARTITION by null )
from(
select region, round(sum(sales)) regionsale
from orders
group by region );