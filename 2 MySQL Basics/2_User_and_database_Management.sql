#Create user 
create user if not exists s_user identified by 's_user';
select user from mysql.user;
#  create user peter@localhost identified by 'jtp12345';  -- here we mntion username@hostname
/*Granting all privileges
ALL PRIVILEGES: It permits all privileges to a new user account.
CREATE: It enables the user account to create databases and tables.
DROP: It enables the user account to drop databases and tables.
DELETE: It enables the user account to delete rows from a specific table.
INSERT: It enables the user account to insert rows into a specific table.
SELECT: It enables the user account to read a database.
UPDATE: It enables the user account to update table rows.
*/
Grant all privileges on data_analysis to s_user;
show grants for s_user;
flush privileges;
drop user s_user;
select user();
select current_user();

#Show Current Logged User --We can see the currently logged user in the database server by using the following query in the MySQL server:
SELECT user, host, db, command FROM information_schema.processlist;  

#updating password 
set password for 's_user'='s_user1';
alter user s_user identified by 's_user1';

#setting up database for use
show databases;
use data_analysis;
create table dummy(a int);
SELECT * FROM information_schema.schemata;  

#drop database 
#DROP SCHEMA [IF EXISTS] database_name;    