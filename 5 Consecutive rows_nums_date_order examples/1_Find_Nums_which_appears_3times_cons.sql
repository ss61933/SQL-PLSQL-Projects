-- Find the NUMS which appeared 3 times consecutively
create table logs ( id int , nums int);

insert into logs values(1,1);
insert into logs values(2,1);
insert into logs values(3,1);
insert into logs values(4,2);
insert into logs values(5,2);
insert into logs values(6,3);
insert into logs values(7,3);
insert into logs values(8,1);
insert into logs values(9,1);
insert into logs values(10,1);
insert into logs values(11,1);
insert into logs values(12,4);
insert into logs values(13,4);
insert into logs values(14,4);
commit;

select * from logs;
--Assuming that records are consecutive (ID)


select distinct a.nums
from logs a 
join logs b  on a.id=b.id+1 and a.nums=b.nums -- look for the next row 
join logs c  on a.id=c.id+2 and a.nums=c.nums;--look for the 2nd next row 