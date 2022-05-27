WITH Parent_risk as 
(select risk_id from parcm_chain where control_Id=2)
--select * from parent_risk;
select a.chain_id,a.au_id,a.activity_id,
       r.risk_id,c.control_id,m.mt_id      
from 
parcm_chain p left outer join 
activity a on(p.chain_id=a.chain_id and p.activity_id=a.activity_id )
left outer join risk r 
on(a.chain_id=r.chain_id and r.active_ind='A' and a.active_ind='A'
    and p.risk_id=r.risk_id)
left outer join control c 
on(a.chain_id=c.chain_id and c.active_ind='A' and p.control_id=c.control_id)
left outer join mt m 
on(a.chain_id=m.chain_id and m.active_ind='A' and p.mt_id=m.mt_id)
where p.risk_id in (select pp.risk_id from parent_risk pp )
and p.active_ind='A'