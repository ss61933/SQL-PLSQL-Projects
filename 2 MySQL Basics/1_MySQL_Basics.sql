select * from student.personal;

/*delcare variable */
set @maxage=31;
select * from student.personal where age=@maxage;
select @maxage;

/*--Data types  */
describe student.personal;

/* Show system variables*/
show variables;
show variables like '%wait%';
show databases;


/*if u want ot exit the database server  use EXIT command */
