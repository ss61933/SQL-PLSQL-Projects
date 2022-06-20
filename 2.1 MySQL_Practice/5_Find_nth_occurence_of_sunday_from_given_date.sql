/*---Give nth occurence of sunday from given date  */

set @inputdate ='2022-06-19';
set @inte=  8-dayofweek(@inputdate);
select @inte;
set @occ_number =2;
set @add_inter=7*(@occ_number-1);
with first_sunday as (
select date_add(@inputdate ,interval  @inte day) as next_sunday)
select date_add(next_sunday,interval  @add_inter day) from 
first_sunday;
