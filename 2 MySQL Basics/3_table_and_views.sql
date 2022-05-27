use data_analysis;
/*
create table syntax 
CREATE TABLE [IF NOT EXISTS] table_name(  
    column_definition1,  
    column_definition2,  
    ........,  
    table_constraints  
);  
*/

create table dummy_table(
empid int auto_increment,
name varchar(100) not null,
emailid char(100),
birthdate date,
primary key(empid),
unique(emailid)
);
desc dummy_table;
show tables;

#alter the table 

alter table dummy_table
add salary int  default 0 ;

desc dummy_table;

alter table dummy_table
add mobilenumber int 
after emailid;

desc dummy_table;

/*
 ALTER TABLE table_name  
 ADD new_column_name column_definition  
 [ FIRST | AFTER column_name ],  
ADD new_column_name column_definition  
[ FIRST | AFTER column_name ],  
  ...  
*/

# alter property of column 

alter table dummy_table
modify mobilenumber int not null;

desc dummy_table;

alter table dummy_table
modify mobilenumber int not null;

alter table dummy_table 
drop column mobilenumber;

#change column name 
alter table dummy_table 
change column name ename varchar(50);

desc dummy_table;


#renaming table name
alter table dummy_table 
rename to dummy_tab;
desc dummy_tab;

create table dummy_tab_backup as select * from dummy_tab;

show full tables;

show tables in data_analysis;
show tables in student;
show full tables from data_analysis where table_type='BASE TABLE'; # U can mention view 

#==========================User and account locking===========================#
/*
A lock is a mechanism used to prevent unauthorized modifications into our database. It is essential to the security of our database.
In this article, we are going to learn how to use the CREATE USER… ACCOUNT LOCK and ALTER TABLE… ACCOUNT LOCK statements for locking the user accounts in the MySQL server.
We can lock the user accounts by using the CREATE USER... ACCOUNT LOCK statement as follows:
CREATE USER account_name IDENTIFIED BY 'password' ACCOUNT LOCK;  
ALTER USER account_name IDENTIFIED BY 'password' ACCOUNT LOCK;  
validate account lock status 
mysql> SELECT user, host, account_locked  
FROM mysql.user  
WHERE user = 'javatpoint' AND host = 'localhost';

Unlocking the account 
ALTER USER [IF EXISTS]   
    user_account_name1, user_account_name2, ...  
ACCOUNT UNLOCK;        
*/
