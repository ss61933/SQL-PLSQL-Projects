create table product_category(product varchar2(200),category varchar(200));

insert into product_category values('P1','C1');
insert into product_category values('P11','C1');


insert into product_category values('P2','C2');
insert into product_category values('P21','C2');
insert into product_category values('P22','C2');

insert into product_category values('P3','C3');
insert into product_category values('P21','C3');
insert into product_category values('P22','C3');
COMMIT;

SELECT * FROM (
        SELECT product,category
        FROM product_category p
)
pivot (count(category)
for category in('C1' ,'C2' ,'C3' )    
       )
       order by product;

SELECT RN,NVL(MAX(C1),'NULL'),MAX(C2),MAX(C3)
FROM(
SELECT
    case when category='C1' then PRODUCT end as C1,
    case when category='C2'  then PRODUCT end as C2,
    case when category='C3'  then PRODUCT  end as C3,
    ROW_NUMBER()OVER(PARTITION BY CATEGORY ORDER BY NULL) RN
FROM product_category)
GROUP BY RN;

