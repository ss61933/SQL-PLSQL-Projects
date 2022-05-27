select a.chain_id,a.au_id,a.activity_id,a.activity_descr,a.activity_lib_id,aq.activity_loss,aq.activity_gain,
       r.risk_id,r.risk_descr,
       c.control_id,c.control_descr,
       m.mt_id,m.mt_descr
from 
--parcm_chain p left outer join 
--activity a on(p.chain_id=a.chain_id)
activity a 
left outer join risk r 
on(a.chain_id=r.chain_id and r.active_ind='A' )
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
where a.active_ind='A' 
and a.chain_id=1 and r.risk_id=1
--and chain_id=1;
