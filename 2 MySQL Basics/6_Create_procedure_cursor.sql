/* create procedure with cursor 
https://www.mysqltutorial.org/mysql-cursor/ */

drop procedure  `proc_customerid_cursor`;

delimiter // 
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_customerid_cursor`
(inout namelist varchar(4000))
begin
	declare is_done int default 0;
    declare s_name varchar(200) default "";
    
    declare cus_record  cursor  for 
    select customerid
    from orders limit 10;
		
	declare continue handler for not found SET is_done=1;
    
    OPEN cus_record;
    
    get_list: LOOP
    FETCH cus_record INTO s_name ;
    
    IF is_done=1 THEN 
    LEAVE get_list;
    END IF;
    SET namelist =concat(s_name,",",namelist);
    
    END LOOP get_list;
    
    CLOSE cus_record;
    
 end
//

delimiter ;

set @customerlist="";
call proc_customerid_cursor(@customerlist);
select @customerlist;