CREATE OR REPLACE TYPE  c_employee_details  AS OBJECT 
(
employee_id number,
employee_name varchar2(300) ,
department_name varchar2(100)
);
/

CREATE OR REPLACE TYPE C_EMP_TYPE IS TABLE OF c_employee_details;
/



CREATE OR REPLACE PROCEDURE p_collection_output (
    t_emp OUT c_emp_type -- define collection type associative array 
) AS
        v_count number;
BEGIN
    SELECT
        c_employee_details(employee_id, first_name|| ' '|| last_name, department_name)
    BULK COLLECT
    INTO t_emp
    FROM employees,departments
    WHERE employees.department_id = departments.department_id;


    SELECT COUNT(*) 
    INTO v_count
    from table(t_emp);

    INSERT INTO P_LOG VALUES('p_collection_output','COUNT OF RECORDS--'||V_COUNT);
    COMMIT;
    
 /*--Calling proc 
 
 
--Opening the cursor
SET SERVEROUTPUT ON 

DECLARE

tt_emp c_emp_type;
v number ;

BEGIN

DBMS_OUTPUT.PUT_LINE('--------execution started ----------');

p_collection_output(tt_emp);



END;
/

SELECT * FROM P_LOG;
*/
    
END;
