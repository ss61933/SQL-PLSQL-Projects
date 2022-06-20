select count(case when csales<5000 then customerid end) as bin_5k,
count(case when csales>=5000 and csales<10000 then customerid end) as bin_10k,
count(case when csales>=10000 and csales<15000 then customerid end) as bin_15k,
count(case when csales>=15000 and csales<20000 then customerid end) as bin_20k,
count(case when csales>=20000 and csales<25000 then customerid end) as bin_25k,
count(case when csales>=25000 and csales<30000 then customerid end) as bin_30k
from(
select customerid,round(sum(sales) ) csales
from orders
group by customerid);

