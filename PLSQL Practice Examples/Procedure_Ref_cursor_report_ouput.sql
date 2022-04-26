create or replace PROCEDURE p_cursor_report (
    p_deptno        NUMBER,
    p_report_cursor OUT SYS_REFCURSOR
) AS 

BEGIN 
   OPEN p_report_cursor FOR   
    SELECT * 
    FROM employees e 
    where department_id=p_deptno;


/*

--Opening the cursor
SET SERVEROUTPUT ON 
variable usercur refcursor;

DECLARE

user_id  EMPLOYEES.DEPARTMENT_ID%TYPE;

BEGIN
user_id := 10;
P_CURSOR_REPORT(user_id,:usercur);

END;
/

print usercur;



*/

end ;