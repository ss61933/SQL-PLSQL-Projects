create table ARCM
(
ARCM_TYPE varchar2(20),
ARCM_ID number,
AU_ID number,
ARCM_LIB_ID number ,
ARCM_DESCR varchar2(200),
FREQ number,
IMPACT number,
ACTIVE_IND CHAR(1),
STATUS varchar2(20),
CHAIN_ID number,
MT_RESULT varchar2(20),
CONSTRAINT pk_arcm_id primary key (arcm_id,arcm_type)
);

insert into arcm
select 
'activity',a.*,null
from activity a
union
select 
'risk',a.*,null
from risk  a
union
select 
'control',a.*,null
from control a
union
select 
'mt',a.*,'mt_result'
from mt a;
commit;

with arcm_record as 
(select * from arcm where chain_id=1 and active_ind='A')
,activity_record as ( select * from arcm where arcm_type='activity')
,risk_record as ( select * from arcm where arcm_type='risk')
,control_record as ( select * from arcm where arcm_type='control')
,mt_record as ( select * from arcm where arcm_type='mt')
select distinct a.* 
from parcm_chain p 
left outer join activity_record a
on p.chain_id=a.chain_id and p.activity_id=a.arcm_id
where p.active_ind='A';
--left outer join risk_record r,control_record c,mt_record m

select * from parcm_chain;
select * from arcm;
select p.chain_id,p.activity_id,p.risk_id,r.arcm_DESCR,p.control_id,p.mt_id
from parcm_chain p 
left outer join arcm a
on (p.chain_id=a.chain_id and p.activity_id=a.arcm_id and a.arcm_type='activity' and a.active_ind='A')
left outer join arcm r
on (p.chain_id=r.chain_id and p.risk_id=r.arcm_id and r.arcm_type='risk' and r.active_ind='A')
left outer join arcm c
on (p.chain_id=c.chain_id and p.control_id=c.arcm_id and c.arcm_type='control' and c.active_ind='A')
left outer join arcm m
on (p.chain_id=m.chain_id and p.mt_id=m.arcm_id and m.arcm_type='mt' and m.active_ind='A')
where p.chain_id=1 and p.active_ind='A' 
and r.ARCM_ID=1;

select * from risk;
