/*
/*find user with most consecutive login (daywise) . User might have logged in multiple times in a day. 
/* We have to find out daywise login 
create table user_login(userid  int,logindate date );

insert into user_login values
(1,current_date()),
(1,current_date()),
(1,current_date()),
(2,current_date()),
(1,current_date()+1),
(1,current_date()+1),
(3,current_date()+1),
(3,current_date()+2),
(1,current_date()+2),
(2,current_date()+2),
(3,current_date()+3),
(4,current_date()+4),
(1,current_date()+4);


insert into user_login values (3,current_date()+4);
commit;
truncate table user_login;
select count(*) from user_login;
*/

select userid , count(*)
from(
select userid,ifnull(ldate- lag(ldate) over (partition by userid order by ldate) ,1)rn
from(
select distinct userid,date(logindate) ldate
/*this is to only select date part ,so if user logged in multiple times in a single day , this will return only one row */
 from user_login) a) b
 where  rn=1
 group by userid order by count(*) desc;
 
 