drop table parcm_chain;
drop table activity;
drop table risk;
drop table control;
drop table monitor;


-------------------db design 
select * from parcm_chain;
create table parcm_chain
(parcm_chain_id number primary key,
au_id number,
activity_id number,
risk_id number,
control_id number,
monitor_ID NUMBER,
ACTIVE_IND CHAR,
STATUS VARCHAR2(20)
);

create sequence parcm_chain_id_seq;

--drop table activity;

create table activity
(activity_id number primary key,
au_id number,
parcm_chain_id number ,
activity_lib_id number,
activity_descr varchar2(200),
freq number,
impact number,
ACTIVE_IND CHAR,
STATUS VARCHAR2(20)
);
select * from activity;
create sequence activity_id_seq;

--drop table risk;
create table risk
(risk_id number primary key,
au_id number,
parcm_chain_id number ,
risk_lib_id number,
risk_descr varchar2(200),
freq number,
impact number,
ACTIVE_IND CHAR,
STATUS VARCHAR2(20)
);

create sequence risk_id_seq;

create table control
(control_id number primary key,
au_id number,
parcm_chain_id number ,
control_lib_id number,
control_descr varchar2(200),
freq number,
impact number,
ACTIVE_IND CHAR,
STATUS VARCHAR2(20)
);
select * from control;
create sequence control_id_seq;
create table monitor
(monitor_id number primary key,
au_id number,
parcm_chain_id number ,
monitor_lib_id number,
monitor_descr varchar2(200),
freq number,
impact number,
ACTIVE_IND CHAR,
STATUS VARCHAR2(20)
);

create sequence monitor_id_seq;

create table activity_lib
(
activity_lib_id number,
activity_lib_def varchar2(20),
parent_lib_id number,
level1_id number,
level1_def varchar2(20),
level2_id number,
level2_def varchar2(20),
level3_id number,
level3_def varchar2(20),
level4_id number,
level4_def varchar2(20)
)
;
create sequence activity_lib_sid_seq;


create table risk_lib
(
risk_lib_id number,
risk_lib_def varchar2(20),
parent_lib_id number,
level1_id number,
level1_def varchar2(20),
level2_id number,
level2_def varchar2(20),
level3_id number,
level3_def varchar2(20),
level4_id number,
level4_def varchar2(20)
)
;

create sequence risk_lib_sid_seq;


create table control_lib
(
control_lib_id number,
control_lib_def varchar2(20),
parent_lib_id number,
level1_id number,
level1_def varchar2(20),
level2_id number,
level2_def varchar2(20),
level3_id number,
level3_def varchar2(20),
level4_id number,
level4_def varchar2(20)
)
;

create sequence control_lib_sid_seq;

create table monitor_lib
(
monitor_lib_id number,
monitor_lib_def varchar2(20),
parent_lib_id number,
level1_id number,
level1_def varchar2(20),
level2_id number,
level2_def varchar2(20),
level3_id number,
level3_def varchar2(20),
level4_id number,
level4_def varchar2(20)
)
;

create sequence monitor_lib_sid_seq;



insert into activity_lib values(activity_lib_sid_seq.nextval,'parent1',null,1,'parent1',null,null,null,null,null,null);
insert into activity_lib values(activity_lib_sid_seq.nextval,'parent1child1',1,1,'parent1',2,'parent1child1',null,null,null,null);
insert into activity_lib values(activity_lib_sid_seq.nextval,'parent1child2',2,1,'parent1',2,'parent1child1',3,'parent1child2',null,null);
insert into activity_lib values(activity_lib_sid_seq.nextval,'parent1child3',3,1,'parent1',2,'parent1child1',3,'parent1child2',4,'parent1child3');
commit;

select * from activity_lib;


insert into risk_lib values(risk_lib_sid_seq.nextval,'parent1',null,1,'parent1',null,null,null,null,null,null);
insert into risk_lib values(risk_lib_sid_seq.nextval,'parent1child1',1,1,'parent1',2,'parent1child1',null,null,null,null);
commit;

select * from risk_lib;

create table question_answer_lib
(answer_lib_id number primary key,
answer_descr varchar2(200) ,
question_category varchar2(200),
active_ind char
);

insert into question_answer_lib values(1,'high','activity_loss','A');
insert into question_answer_lib values(2,'medium','activity_loss','A');
insert into question_answer_lib values(3,'low','activity_loss','A');

insert into question_answer_lib values(7,'high','activity_gain','A');
insert into question_answer_lib values(8,'medium','activity_gain','A');
insert into question_answer_lib values(9,'low','activity_gain','A');


insert into question_answer_lib values(4,'high','risk_impact','A');
insert into question_answer_lib values(5,'medium','risk_impact','A');
insert into question_answer_lib values(6,'low','risk_impact','A');

commit;
select * from question_answer_lib;


create table select * from question_answer_lib;

create table arcm_questions
(arcm_questions_id number primary key,
arcm_type varchar2(20),
arcm_id number,
question_lib_id number,
answer__lib_id number,
active_ind char
);

create sequence arcm_questions_id_seq;



insert into arcm_questions values(arcm_questions_id_seq.nextval,'activity',1,1,3,'A');
insert into arcm_questions values(arcm_questions_id_seq.nextval,'activity',1,1,2,'I');
insert into arcm_questions values(arcm_questions_id_seq.nextval,'activity',1,2,8,'A');
commit;

select * from arcm_questions;

insert into control_lib values(control_lib_sid_seq.nextval,'parent1',null,1,'parent1',null,null,null,null,null,null);
insert into control_lib values(control_lib_sid_seq.nextval,'parent1child1',1,1,'parent1',2,'parent1child1',null,null,null,null);
commit;


insert into monitor_lib values(monitor_lib_sid_seq.nextval,'parent1',null,1,'parent1',null,null,null,null,null,null);
insert into monitor_lib values(monitor_lib_sid_seq.nextval,'parent1child1',1,1,'parent1',2,'parent1child1',null,null,null,null);
commit;


create table monitor_results 
(monitor_result_id number, 
monitor_id number,
result_start_date date,
result_end_date date,
result_value number,
active_ind char
);

select * from monitor;


alter table parcm_chain add FOREIGN key(activity_id) REFERENCES ACTIVITY(activity_id);
alter table parcm_chain add FOREIGN key(risk_id) REFERENCES risk(risk_id);
alter table parcm_chain add FOREIGN key(control_id) REFERENCES control(control_id);
alter table parcm_chain add FOREIGN key(monitor_id) REFERENCES monitor(monitor_id);

alter table activity_lib add PRIMARY key (activity_lib_id);
alter table risk_lib add PRIMARY key (risk_lib_id);
alter table control_lib add PRIMARY key (control_lib_id);
alter table monitor_lib add PRIMARY key (monitor_lib_id);

alter table activity add FOREIGN key(activity_lib_id) REFERENCES activity_lib(activity_lib_id );
alter table risk add FOREIGN key(risk_lib_id ) REFERENCES risk_lib(risk_lib_id );
alter table control add FOREIGN key(control_lib_id ) REFERENCES control_lib(control_lib_id);
alter table monitor add FOREIGN key(monitor_lib_id ) REFERENCES monitor_lib(monitor_lib_id);

alter table activity add FOREIGN key(parcm_chain_id) REFERENCES parcm_chain(parcm_chain_id );
alter table risk add FOREIGN key(parcm_chain_id ) REFERENCES parcm_chain(parcm_chain_id );
alter table control add FOREIGN key(parcm_chain_id ) REFERENCES parcm_chain(parcm_chain_id);
alter table monitor add FOREIGN key(parcm_chain_id ) REFERENCES parcm_chain(parcm_chain_id);

alter table monitor_results  add FOREIGN key(monitor_id ) REFERENCES monitor(monitor_id);

