select  distinct level,p.sp_ins,p.sp_au,p.sc_au,p.sc_ins,
connect_by_isleaf 
,rtrim(ltrim(SYS_CONNECT_BY_PATH(sp_ins,'-'),'-'),' ')
from parcm_handoff p
connect by   prior sc_ins=  sp_ins
;
select *from parcm_handoff;
create table parcm_handoff
(pk number,sp_au char(20),sc_au char(20),sp_ins char(20),sc_ins char(20));
insert into 
parcm_handoff values(1,'au1','au2','is1','is11');
insert into 
parcm_handoff values(2,'au1','au2','is2','is22');
insert into 
parcm_handoff values(3,'au2','au3','is11','is111');
commit;

;
delete from parcm_handoff where sp_au is null;

create table parcm_level (pk number,au char(20),ins char(20) );

insert into parcm_level values(1,'au1','is1');
insert into parcm_level values(2,'au1','is2');
insert into parcm_level values(2,'au2','is22');
insert into parcm_level values(3,'au2','is11');
insert into parcm_level values(3,'au3','is111');
insert into parcm_level values(3,'au1','is4');

commit;

select a.* ,
case when (au,ins) in (select sp_au,sp_ins from parcm_handoff ) then 'sp' else null 
end 
from parcm_level a 
where 
((au,ins)  in (select sp_au,sp_ins from parcm_handoff ) 
  or
  (au,ins)  in (select sc_au,sp_ins from parcm_handoff ) );