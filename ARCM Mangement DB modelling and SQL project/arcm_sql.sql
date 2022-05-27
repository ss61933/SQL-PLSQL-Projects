with fltr_blk as (--create or replace type t_filter_object as object (type varchar2(200), value varchar2(200));
select * from (SELECT decode(xt.Type,'AU','AU_ID',type)filter_key,xt.value filter_value
FROM 
XMLTABLE('/Filters/Filter'
passing XMLTYPE('<?xml version="1.0"?>
<Filters>
     <Filter Type="AU" id="500"/>
     <Filter Type="ACTIVITY_ID" id="1"/>
     <Filter Type="ACTIVITY_LIB_ID" id="1"/>
     <Filter Type="ACTIVITY_LIB_DESC" id="parent1"/>
     <Filter Type="CHAIN_ID" id="1"/>
  </Filters>
') 
columns
    type varchar2(20) path'@Type',
   value varchar2(20) path'@id'
   )xt)) --select * from fltr_blk;
select a.chain_id,a.au_id,a.activity_id,a.activity_descr,a.activity_lib_id,aq.activity_loss,aq.activity_gain,
       r.risk_id,r.risk_descr,
       c.control_id,c.control_descr,
       m.mt_id,m.mt_descr,
       fltr_blk.*
from 
--parcm_chain p left outer join 
--activity a on(p.chain_id=a.chain_id)
activity a 
left outer join risk r 
on(a.chain_id=r.chain_id and r.active_ind='A' and a.active_ind='A')
left outer join control c 
on(a.chain_id=c.chain_id and c.active_ind='A' )
left outer join mt m 
on(a.chain_id=m.chain_id and m.active_ind='A')
left outer join (
                    select * from (
                    select aq.arcm_id,ql.answer_descr,ql.question_category
                    from arcm_questions aq, question_answer_lib ql
                    WHERE aq.active_ind='A' and ql.active_ind='A' and aq.arcm_type='activity'
                    and aq.answer__lib_id=ql.answer_lib_id)
                        pivot(max(answer_descr)for question_category in ('activity_loss' as activity_loss,'activity_gain' as activity_gain))
                )aq
on(a.activity_id=aq.arcm_id )
join fltr_blk
on (( fltr_blk.filter_key='AU_ID' AND fltr_blk.filter_value is not null and a.au_id=fltr_blk.filter_value)
    )
join fltr_blk chain_filtr
on (( chain_filtr.filter_key='CHAIN_ID' AND chain_filtr.filter_value is not null and a.chain_id=chain_filtr.filter_value)
    )   
where 1=1 
;

