--How many times johli has schored 30+ runs 
--Also give max occurence of 30+ runs by Kohli

select matchid atual_matchI,rn serial_match_id,runs,count(*) over (partition by is_30_plus_rn_group) countof_matches,is_30_plus_rn_group
from(
select matchid,runs,rn,is_30_plus,is_30_plus_rn,rn-is_30_plus_rn is_30_plus_rn_group
from(
select matchid,runs,rn,is_30_plus, row_number() over(partition by is_30_plus order by rn) is_30_plus_rn
from (
select matchid,runs,rn ,(case when runs>30 and prev_match_runs>30 then 1 
                        when   runs>30 and next_match_runs>30  then 1 end ) is_30_plus
from(
select  matchid,runs,lead(runs) over ( order by matchid) next_match_runs,lag(runs) over ( order by matchid) prev_match_runs
,row_number() over (order by matchid) rn--dissmisal
from kohli_runs_2018
order by matchid))
where is_30_plus=1
order by rn))
;


---alernate 
select  distinct rn1, occurence_30_plus, count(*) over (partition by rn1),min(matchid) over (partition by rn1), max(matchid) over(partition by rn1)
from(
select a.*, count(*) over (partition by rn1) occurence_30_plus
from(
select 
runs
,matchid
,rn
,thirty_plus_score
,rn-row_number() OVER (order by rn) rn1
from (
select 
runs
--,dissmisal
,matchid 
,ROW_NUMBER() OVER (ORDER BY to_number(matchid))  rn--assuming matchid in actual dataset is not sequential , also add PARTITION BY name 
,case when runs>=30 then 1 else 0 end thirty_plus_score
from Kohli_runs_2018
order by rn)
where thirty_plus_score=1
order by rn)a
order by rn)
order by occurence_30_plus;


--Script for data population 
Create table Kohli_runs_2018
(Runs int, dissmisal varchar2(100),matchid char(3));

select *from kohli_runs_2018;


REM INSERTING into KOHLI_RUNS_2018
SET DEFINE OFF;
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (5,'caught ','1  ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (28,'lbw','15 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (153,'caught ','22 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (5,'lbw','25 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (54,'caught ','26 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (41,'bowled ','28 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (149,'caught ','30 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (51,'lbw','31 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (23,'caught ','32 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (17,'caught ','50 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (97,'caught ','55 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (103,'lbw','59 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (46,'caught ','67 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (58,'caught ','76 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (49,'caught ','79 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (0,'caught ','83 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (139,'caught ','86 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (45,'lbw','89 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (0,'-','91 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (3,'caught ','92 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (34,'caught ','93 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (123,'caught ','94 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (17,'caught ','95 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (82,'caught ','96 ');
Insert into KOHLI_RUNS_2018 (RUNS,DISSMISAL,MATCHID) values (0,'caught ','97 ');



