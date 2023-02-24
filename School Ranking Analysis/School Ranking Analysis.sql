create database school_ranking;
use school_ranking;

/*Write a query to create a students table with appropriate data types for student id,
student first name, student last name, class, and age where the student last name, 
student first name, and student id should be a NOT NULL constraint, and the student id should be in a primary key.*/
create table student(
student_id int not null primary key,
student_first_name varchar(20) not null,
student_last_name varchar(20) not null,
class varchar(20),
age int);

describe student;

/*Write a query to create a marksheet table that includes score, year, ranking, class, and student id.*/
create table marksheet(
score int,
year date,
ranking varchar(20),
class int,
student_id int
);
alter table marksheet
modify column ranking int;
alter table marksheet
modify column year int;

describe marksheet;

select * from student;


insert into marksheet(score,year,ranking,class,student_id)
values
(989	,2014	,10	,1	,1),
(454	,2014	,10	,10	,2),
(880	,2014	,10	,4	,3),
(870	,2014	,10	,5	,4),
(720	,2014	,10	,7	,5),
(670	,2014	,10	,8	,6),
(900	,2014	,10	,3	,7),
(540	,2014	,10	,9	,8),
(801	,2014	,10	,6	,9),
(420	,2014	,10	,11	,10),
(970	,2014	,10	,2	,11),
(720	,2014	,10	,12	,12);

select * from marksheet;


/*Write a query to display student id and student first name from the student 
table if the age is greater than or equal to 16 and the student's last name is Kumar.*/
select student_id,student_first_name from student
where age >=16 and student_last_name = 'kumar';

/*Write a query to display all the details from the marksheet table if the score is between 800 and 1000.*/
select * from marksheet
where score between 800 and 1000;


/*Write a query to display the marksheet details from the marksheet table by adding
 5 to the score and by naming the column as new score.*/
select score + 5 as 'new_score',year,ranking,class,student_id from marksheet ;


/*Write a query to display the marksheet table in descending order of the  score.*/
select * from marksheet
order by score desc;

/*Write a query to display details of the students whose first name starts with a.*/
select * from student where student_first_name like 'a%';

