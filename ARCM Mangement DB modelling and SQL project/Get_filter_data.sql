--create or replace type t_filter_object as object (type varchar2(200), value varchar2(200));
SELECT * FROM (
SELECT decode(xt.Type,'AU','AU_Filter',type)filter_key,xt.value filter_value
FROM 
XMLTABLE('/Filters/Filter'
passing XMLTYPE('<?xml version="1.0"?>
<Filters>
     <Filter Type="AU" id="500"/>
     <Filter Type="ACTIVITY_ID" id="1"/>
     <Filter Type="ACTIVITY_LIB_ID" id="1"/>
     <Filter Type="ACTIVITY_LIB_DESC" id="parent1"/>
  </Filters>
') 
columns
    type varchar2(20) path'@Type',
   value varchar2(20) path'@id'
   )xt); 