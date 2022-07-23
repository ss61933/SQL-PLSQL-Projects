/* Find out team wise matches played , win/loss count */
create table match_result
(
team1 varchar(20),
team2 varchar(20),
winner varchar(20)
);

insert into match_result values('India','SL','India');
insert into match_result values('SL','Aus','Aus');
insert into match_result values('Eng','SA','Eng');
insert into match_result values('Eng','NZ','NZ');
insert into match_result values('India','Aus','India');
commit;

select * from match_result;

/* op format 
Team name | Matches played | No_of_wins | No_of_loss
*/

With Teams_n as 
(select team1,team2,winner from match_result 
union 
select team2,team1,winner from match_result)
select  team1 as team, count(*) total_matches ,count(case when team1=winner then 1 end ) Wins ,  
 count(*)-count(case when team1=winner then 1 end ) Losses
from teams_n
group by team1;