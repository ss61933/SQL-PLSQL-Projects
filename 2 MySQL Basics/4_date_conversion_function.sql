### Link for date functions https://www.w3resource.com/mysql/date-and-time-functions/mysql-extract-function.php
select /*current_date() C_Date,
#ADDDATE
	date_add(current_date(),interval 1 day) addoneday,
	date_add(current_date(),interval -1 day) minusoneday,
    date_add(current_date(),interval 1 month) addonemonth,
	date_add(current_date(),interval 1 year) addoneyear,
    current_time() c_time,
    date_add(current_time(), interval 1 hour ) addonehour,
    date_add(current_time(), interval 1 minute) addonemin,
    now() c_datetime,
    date_add(current_date(),interval 1 day) c_addoneday,*/
/*#STR_TO_DATE 
	str_to_date('2022-01-01','%Y-%m-%d') str_date,
    str_to_date('2022-01-01 05:30:00','%Y-%m-%d %h:%i:%s') str_date_time*/
/*#ADDTIME
    now() c_datetime,
    addtime(now(),'1:1:1') c_datetime */
/*#current_date_time_timestamp 
   current_Date(),
   current_time(),
   current_timestamp(),
   now()
  */
 /*#dareformat
	date_format(current_date(),'%a') dayofweek,
	date_format(current_date(),'%W') dayofweek,
    date_format(current_date(),'%w') dayofweek_number,
	date_format(current_date(),'%b')  dmonth,
    date_format(current_date(),'%M')  d_comepltemonth,
    date_format(current_date(),'%c')  dmonth_number,
    date_format(current_date(),'%D')  dayofmonth,
    date_format(current_date(),'%d')  dayofmonth,
    date_format(current_timestamp(),'%H')  Hour_24,
    date_format(current_timestamp(),'%h')  Hour_12,
    date_format(current_timestamp(),'%s')  seconds,
    date_format(current_timestamp(),'%Y')  Year
#ExtractDate from datetime 
   current_timestamp(),date(current_timestamp()) date
 */
/*#Datediff
	  datediff(current_date(),'2022-06-1') daydiff_noofdays,
	  timestampdiff(MONTH,'2022-06-22','2022-07-23') month_diff,
	  timestampdiff(year,'2022-06-22','2023-07-23') month_diff,
	  timestampdiff(day,'2022-06-22','2023-07-23') days_diff,
	  timestampdiff(hour,'2022-06-22 04:30:00','2022-06-22 05:30:00') hours_diff,
	  timestampdiff(minute,'2022-06-22 04:30:00','2022-06-22 05:33:00') mins_diff
*/ 
 #Extract date part 
	  dayname(now())  dayname,
      dayofmonth(now()) daynumber_of_month,
      dayofyear(now()) dayofyear,
      extract(year from now()) year ,
      extract(month from now()) month ,
      extract(day from now()) days
      ;	