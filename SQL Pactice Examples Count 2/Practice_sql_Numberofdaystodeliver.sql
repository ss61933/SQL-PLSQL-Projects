--Get number of days needed for delivery

select orderid,productid,productname,orderdate,shipdate,
(next_day(shipdate,'MONDAY')-next_day(orderdate,'MONDAY'))/7 week_to_deliver,
shipdate-orderdate days_to_deliver
from orders 