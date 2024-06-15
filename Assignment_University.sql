create database university;
show databases;
use university;
create table student (
rollno int ,
name varchar(30) not null,
degree varchar(30) ,
year int ,
sex char );

-- alter the table to add 2 more columns
alter table student add (deptNo varchar(30) not null, advisor char (40));

-- alter the table to make rollno as Primary key
alter table student add primary key(rollno);
alter table student rename column name to sname;
desc student;

 
create table department(
deptID int primary key,
dname char(30) not null,
hod int,
phone bigint not null); 


create table professor(
empID int primary key,
sex char ,
startYear mediumint not null,
deptNo varchar(40) not null,
phone bigint not null );

alter table professor add column ename varchar(40) not null;

create table course(
courseID varchar(30) primary key,
cname char(30) not null,
credits int ,
deptNo int not null);

 
-- add the foreign key on the deptno column of student

alter table student add constraint fk_deptno_student foreign key(deptNo) 
references department(deptID);
-- because there is mismatch in the data type, there is an error
-- so i have to alter the data type in student table/department table

alter table student modify column deptNo int;

alter table student add constraint fk_deptno_student foreign key(deptNo) 
references department(deptID);

-- add the foreign key on the deptno column of student
desc student;
desc professor;
-- again data type mismatch... so alter to modify
alter table student modify column advisor int;


alter table student add constraint fk_advisor_student foreign key(advisor) 
references professor(empid);

-- make hod as FK to refer the professor table emp id
desc department;
alter table department add constraint fk_hod_dept foreign key(hod) 
references professor(empid);


-- alter the dept no of professor table as FK to refer the department table
-- alter the professor to modify the deptno data type to int
alter table professor modify column deptno int;

alter table professor add constraint fk_deptno_professor foreign key(deptNo) 
references department(deptID);

-- alter the dept no of course table as a FK to refer the department table
alter table course add constraint fk_deptno_course foreign key(deptNo) 
references department(deptID);

create table enrollment
(rollno int,
courseid varchar(30),
sem int,
years int,
grade char,
primary key(rollno,courseid,sem,years));

alter table enrollment add constraint
fk_rollno_enroll foreign key(rollno)
references student(rollno);

alter table enrollment add constraint
fk_courseid_enroll foreign key(courseid)
references course(courseid);


create table teaching
(empid int ,
courseid varchar(30) ,
sem int,
years int,
classroom varchar(10),
primary key(empid,courseid,sem,years),
constraint fk_empid_teaching foreign key(empid)
references professor(empid),
constraint fk_courseid_teaching foreign key(courseid)
references course(courseid) );

-- prerequisite
create table prerequisite(prereq varchar(30),courseid varchar(30),
primary key(prereq,courseid),
constraint fk_prereq_prerequisite foreign key(prereq)
references course(courseid) ,
constraint fk_courseid_prerequisite foreign key(courseid)
references course(courseid));

use university;
desc department;
select *from department;
insert into department (deptID,dname,phone) values (10,'civil',7777),(19,'cse',2777);

desc professor;
insert into professor values(10,'M',2022,1,7972,'rothkar');
insert into professor values(11,'M',2023,2,79752,'ravithkar');
select *from professor;
 
 -- update the profeesor 
 update department
 set hod=1004
 where deptid=10;















