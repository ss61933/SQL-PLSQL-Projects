/* hacerrank Difficult question 
https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem?isFullScreen=true
Julia conducted a  days of learning SQL contest. 
The start date of the contest was March 01, 2016 and the end date was March 15, 2016.
Write a query to print 
total number of unique hackers who made at least  submission each day 
(starting on the first day of the contest), and
 find the hacker_id and name of the hacker who made maximum number of submissions each day. 
 If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. 
 The query should print this information for each day of the contest, sorted by the date.
*/

create table hackers (hacker_id integer,name varchar(200));
create table submission (submission_date date,submission_id int,hacker_id int,score int);

insert into hackers values(123,'u1');
insert into hackers values(124,'u2');
insert into hackers values(125,'u3');
insert into hackers values(126,'u4');
commit;

select * from hackers;

insert into submission values('2021-01-01',1,123,10);
insert into submission values('2021-01-02',2,123,0);
insert into submission values('2021-01-02',3,123,0);
insert into submission values('2021-01-03',4,123,30);
insert into submission values('2021-01-04',5,123,30);
insert into submission values('2021-01-01',6,124,40);
insert into submission values('2021-01-02',7,124,0);
insert into submission values('2021-01-03',6,124,40);
insert into submission values('2021-01-04',7,124,0);
insert into submission values('2021-01-01',8,125,40);
insert into submission values('2021-01-01',9,125,40);
insert into submission values('2021-01-01',10,125,40);
insert into submission values('2021-01-01',11,125,40);
insert into submission values('2021-01-02',12,125,0);
insert into submission values('2021-01-03',13,125,40);
insert into submission values('2021-01-04',14,125,0);
insert into submission values('2021-01-01',6,126,40);
commit;
truncate submission;
select * from submission;

with unique_days as (select count(distinct submission_date) cd from submission)
,
hackers_s as (select j.hacker_id,j.name , count(distinct submission_date) d
from hackers j , submission s 
where j.hacker_id=s.hacker_id
group by j.hacker_id,j.name)
,datewise_c as (select * from 
(
select submission_date,hacker_id,s_cnt, rank() over (partition by submission_date order by s_cnt desc,hacker_id asc) rnk
from (
select submission_date,hacker_id,count(*) s_cnt
from submission
group by submission_date,hacker_id
order by submission_date,s_cnt desc ,hacker_id) r)r1
where rnk=1
)
#select * from datewise_c
select s1.submission_date,s1.s_cnt,s.hacker_id,s.name
from hackers_s s,datewise_c s1 
where s.d=(select cd from unique_days )
and s.hacker_id=s1.hacker_id
order by submission_date;
select * from 
(
select submission_date,hacker_id,s_cnt, rank() over (partition by submission_date order by s_cnt desc,hacker_id asc) rnk
from (
select submission_date,hacker_id,count(*) s_cnt
from submission
group by submission_date,hacker_id
order by submission_date,s_cnt desc ,hacker_id) r)r1
where rnk=1;