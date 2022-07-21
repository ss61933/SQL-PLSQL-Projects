select category,subcategory,year(orderdate),sum(sales),
sum(sum(sales))over (),sum(sum(sales))over (partition by SUBCATEGORY),
sum(sum(sales))over (partition by category)

from orders
group by category,subcategory,year(orderdate)
order by 1,2;

select region , sum(sales) over()
from orders
;

select 20037+34132+26803+30026