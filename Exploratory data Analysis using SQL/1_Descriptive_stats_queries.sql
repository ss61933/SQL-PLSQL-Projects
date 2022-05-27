/* Concepts covered 
Basic stats - count , min, max ,avergae, distinct count ,standard deviation, variance,mean
*/
use statistics_learning;

/* check first 2 rows */
SELECT * FROM store_sales
LIMIT 2;

/* check last 2 rows */
SELECT * FROM store_sales
order by sale_date desc
LIMIT 2;


/* check how many rows and count of distinct number of employee in any shifts */
SELECT COUNT(*), count(distinct employee_shifts)
FROM store_sales;
/* so data is present for 365 days for 5 shifts */

/* how many records present for each year */
SELECT month_of_year, COUNT(*) AS total
FROM store_sales
GROUP BY (month_of_year)
ORDER BY month_of_year ASC;

/* maximum number of employees during any shift of the year */
SELECT MAX(employee_shifts)
FROM store_sales;

/* what is the smallest number of employees during any shift of the year 
 and return those dates a*/
SELECT MIN(employee_shifts)
FROM store_sales;
/* it shows no employees prsent*/

SELECT *
FROM store_sales 
WHERE employee_shifts=(SELECT MIN(employee_shifts)
FROM store_sales);
/* It shows no sell was done on this date*/


/* min, max employees in during per shift of the year*/
SELECT month_of_year, MAX(employee_shifts), MIN(employee_shifts)
FROM store_sales
GROUP BY month_of_year
ORDER BY month_of_year ASC;

/* achieve above result by querying date column */

SELECT month(sale_date),MAX(employee_shifts), MIN(employee_shifts)
FROM store_sales
GROUP BY month_of_year
ORDER BY month_of_year ASC;


/******************************************************************/

/* What is the total unit sold in each quarter? */
SELECT quarter(sale_date),sum(units_sold)
FROM store_sales
group by quarter(sale_date);

/* What is the total unit sold , avg unit sold per month? */
SELECT month_of_year, SUM(units_sold) AS total_unit_sold, ROUND(AVG(units_sold), 2) AS average_unit_sold
FROM store_sales
GROUP BY month_of_year
ORDER BY month_of_year ASC;

/* get the mean of shift_employees --below logic is not accurate as @mean is not working with limit - just to explina the formula */ 

SET @mean:= (SELECT CEIL(COUNT(*)/2) FROM store_sales);
SELECT max(employee_shifts) 
FROM (SELECT row_number() over() rn , employee_shifts FROM store_sales ORDER BY sale_date  ) x 
where rn<=@mean;

/********************** Standard Deviation & Variance ********************************************/

/* How spread out the unit sold in each month? */
/* As we can see from the result, variance values quite high. Because variance measures in squared. 
So better way to get a sense of spread out is standard deviation 
 Put simply, standard deviation measures how far apart numbers are in a data set. This metric is calculated as the square root of the variance.
Concept of standard eviation -https://www.mysqltutorial.org/mysql-standard-deviation/
*/
SELECT 
	month_of_year, 
	SUM(units_sold) AS total_unit_sold, 
	ROUND(AVG(units_sold), 2) AS average_unit_sold,
	VAR_POP(units_sold) AS variance_units_sold,
	STDDEV_POP(units_sold) AS std_units_sold
FROM store_sales
GROUP BY month_of_year
ORDER BY month_of_year ASC;

/* Interprete the output :
For 12th month std is highest , and also by looking at the data for 12th month - 
, lowest sales is 0 and largest sale is 879 which leads to large value of stddev.*/ 

/* to check the variance ,std at ground level try to identify min and max value for each month */
SELECT 
	month_of_year, 
	MIN(units_sold),
	MAX(units_sold),
    count(*) 
FROM store_sales
GROUP BY month_of_year
ORDER BY month_of_year ASC;

