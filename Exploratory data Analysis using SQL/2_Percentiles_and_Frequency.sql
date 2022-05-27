/********************** Percentiles ********************************************/
/*
https://www.statisticshowto.com/
https://www.youtube.com/watch?v=t4LOv9h-FJM

Percentiles : One hundreds equal groups; population divided across group
Percentiles help us understand the distribution of data by grouping values into equal sized buckets.

Discrete Percentile: returns value that exists in the column.
Discrete Percentile is very useful whey you want to know the value in the column, that falls into a percentile.

Continuous Percentile: interpolates the boundary value between the percentiles.
Continuous Percentile is very useful when you want to know what is the value at the boundary between two percentile buckets.

Differences between Discrete and Continuous Percentile : 
- http://mfzahirdba.blogspot.com/2012/09/difference-between-percentilecont-and.html 
- https://stackoverflow.com/questions/23585667/percentile-disc-vs-percentile-cont

*/

/* What are the top sales data ? */
SELECT * FROM store_sales
order by units_sold desc 
LIMIT 5;
/* 
Top sales are coming from Dec month , so what could be the reason ? Holidays ?*/

SELECT *
FROM store_sales
ORDER BY revenue DESC
LIMIT 10;
/* Again highest revenue is genereated in last month only */


/* Lets find the average --check if average is correct 
*/
SELECT AVG(revenue)
FROM store_sales;

/* average sales is 5806$ 
Now , check
- Are there many days with low sales?
- Are there many days with high sales? 
- or our sales evenly distributed across all days?
*/
/* percent_rank() function gives percentile rank between 0 to 1 to all rows . */
select * from (
select sale_date,revenue,month_of_year, percent_rank() over( order by sale_Date) rn
from store_sales) x where rn=0.5;

/* percent_rank(over partition by ) function gives percentile rank between 0 to 1 for each year . */

select sale_date,revenue,month_of_year, percent_rank() over( partition by month_of_year order by sale_Date) rn
from store_sales;
/* yet to do */
			
/* get 50 percentile of revenue, it seem like 50 percentile of revenue 5856$
is not too far off from the average sales 5806.16$*/

/* let's look at 50th, 60th , 90th , 95th percentiles */

/* oracle percentile syntax 
https://docs.oracle.com/cd/E93962_01/bigData.Doc/eql_onPrem/src/reql_expr_percentile.html
*/