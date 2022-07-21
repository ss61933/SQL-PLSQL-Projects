

CREATE TABLE person_tbl (
   first_name CHAR(20) NOT NULL,
   last_name CHAR(20) NOT NULL,
   sex CHAR(10),
   PRIMARY KEY (last_name, first_name)
);


# insert record ,if exists ignore it 
INSERT IGNORE INTO person_tbl (last_name, first_name)
    VALUES( 'Jay', 'Thomas');
commit;

INSERT IGNORE INTO person_tbl (last_name, first_name,sex)
    VALUES( 'Jay', 'Thomas','m');
    
 #This will not throw error but    
select * from person_tbl ;

#use replace into ,it will update the record if exsits 

replace INTO person_tbl (last_name, first_name,sex)
    VALUES( 'Jay', 'Thomas','mm');
 select * from person_tbl ;
   
  replace INTO person_tbl (last_name, first_name,sex)
    VALUES( 'Jay', 'Thomas','mn');
 commit;
 select * from person_tbl ;
 
 #counting duplicate rows 
 
CREATE TABLE person_tbl1 (
   first_name CHAR(20) NOT NULL,
   last_name CHAR(20) NOT NULL,
   sex CHAR(10)
   
);


replace INTO person_tbl1 (last_name, first_name,sex)
    VALUES( 'Jay', 'Thomas','mn');
 commit;
 
  replace INTO person_tbl2 (last_name, first_name,sex)
    VALUES( 'Jay', 'Thomas','mn');
 commit;

#finding duplicate rows 
 select first_name,last_name,count(*)
 from person_tbl1
 group by first_name,last_name
 having count(*)>1;
 
 #selecting only one instance of row
  
 select distinct first_name,last_name
 from person_tbl1;
  
 select first_name,last_name
 from person_tbl1
 group by first_name,last_name;