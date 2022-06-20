/*--All about regular expression
/*--https://www.techonthenet.com/oracle/regexp_like.php
*/
/*1REGEXP_LIKE

/*--1 : Find strings starts with a */
with t as( 
select 'a1b121c1' txt from dual)
select *  from t 
where regexp_like(TXT,'^[a-]');


/*--2 Start with  any numeric value*/
with t as( 
select '1a1b121c1' txt from dual
union
select '11' txt from dual
union
select 'aa11' txt from dual
)
select *  from t 
where regexp_like(TXT,'^[0-9]') ;

/*--3 string starts with 121 value */
with t as( 
select '121a1b121c1' txt from dual
union
select '123' txt from dual)
select *  from t 
where regexp_like(TXT,'^121') ;


/*--String having all the numbers ,atleast 4*/
with t as( 
select '95 611 61361' txt from dual
union
select '95 6116 1361' txt from dual
union
select '956' txt from dual
)
select *  from t 
where txt regexp '\s*[[:digit:]]{4}$' ;

/*--5 verify if phone is of format 2digit space 4 digit space 4 digit

with t as( 
select '95 611 61361' txt from dual
union
select '95 6116 1361' txt from dual
union

select '95 a116 1361' txt from dual
)
select *  from t 
where regexp_like(TXT,'^\d{2}\s\d{4}\s\d{4}') ;

/*--6 find if address format is correct  digits comma string comma 3digit
/*--incomplete 
with t as( 
select '11,asdadadas,361' txt from dual
union
select '1,s,361' txt from dual
)
select *  from t 
where regexp_like(TXT,'^\d{2}*[a-z]\d{3}') ;


/*======================================================================*/
/*--Regular expression extract 

/*--1 replace case when caluse with extract */
select regexp_extract(lower(category),'fur')
from orders;
