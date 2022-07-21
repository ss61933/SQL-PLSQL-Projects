/* create procedure 
https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html*/
drop procedure  `proc_customerid`;

delimiter // 
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_customerid`
(IN p_orderid char(40),OUT p_customerid int, OUT p_total_count int)
begin
	 select count( customerid )
     into p_customerid
	 from orders 
	where orderid = p_orderid;
    
    select count(*)
    into p_total_count
    from orders
    limit 10;
 end
//

delimiter ;

call proc_customerid('CA-2018-152156',@customerid,@p_total_count);
select @customerid,@p_total_count;