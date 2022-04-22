/*
 1?? PROBLEM STATEMENT     
Order_Tbl has four columns namely ORDER_DAY, ORDER_ID, PRODUCT_ID, QUANTITY and PRICE
(a) Write a SQL to get all the products that got sold on both the days and the number of times the product is sold.
(b) Write a SQL to get products that was ordered on 02-May-2015 but not on 01-May-2015
------------------------------ */

CREATE TABLE Order_Tb_5(
 ORDER_DAY date,
 ORDER_ID varchar(10) ,
 PRODUCT_ID varchar(10) ,
 QUANTITY int ,
 PRICE int 
);

INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-01','yyyy-mm-dd'),'ODR1', 'PROD1', 5, 5);
INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-01','yyyy-mm-dd'),'ODR2', 'PROD2', 2, 10);
INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-01','yyyy-mm-dd'),'ODR3', 'PROD3', 10, 25);
INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-01','yyyy-mm-dd'),'ODR4', 'PROD1', 20, 5);
INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-02','yyyy-mm-dd'),'ODR5', 'PROD3', 5, 25);
INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-02','yyyy-mm-dd'),'ODR6', 'PROD4', 6, 20);
INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-02','yyyy-mm-dd'),'ODR7', 'PROD1', 2, 5);
INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-02','yyyy-mm-dd'),'ODR8', 'PROD5', 1, 50);
INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-02','yyyy-mm-dd'),'ODR9', 'PROD6', 2, 50);
INSERT INTO Order_Tb_5 VALUES (to_date('2015-05-02','yyyy-mm-dd'),'ODR10','PROD2', 4, 10);
commit;


--Answer (a)
    --question 1 
select product_id,
count(order_id) as count_o,
count(distinct order_day) count_days,
listagg(QUANTITY,';') within group(order by order_id) quantity_list
from Order_Tb_5 
group by product_id
having count(order_id)>1;

--Answe (b)
select distinct product_id  
from Order_Tb_5 
group by product_id
having min(order_day) ='02-May-2015' ;--max(order_day);
