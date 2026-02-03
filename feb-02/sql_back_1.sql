use college_db;
create table student(
	student_id bigint primary key,
	name varchar(50),
	email varchar(100),
	age int,
	join_date date,	
	active_flag bit default 1);

create table courses(
	course_id int primary key,
	course_name varchar(255) not null,
	fees decimal);
create table enrollments(
	enroll_id bigint primary key,
	student_id bigint,
	course_id int,
	enroll_timestamp datetime2 default sysdatetime()
	);

select * from courses;

insert into student(
	student_id,name,email ,age,join_date,active_flag )
values
(101,'ankit','ankit123@gmail.com',21,'2025-06-13',1),
(102, 'Rahul Sharma', 'rahul.sharma@gmail.com', 20, '2025-06-15', 1),
(103, 'Priya Verma', 'priya.verma@gmail.com', 21, '2025-07-01', 0),
(104, 'Amit Patel', 'amit.patel@gmail.com', 22, '2025-05-20', 0),
(105, 'Sneha Iyer', 'sneha.iyer@gmail.com', 19, '2025-08-10', 1),
(106, 'Karan Singh', 'karan.singh@gmail.com', 23, '2025-04-05', 0),
(107, 'Neha Gupta', 'neha.gupta@gmail.com', 20, '2025-09-12', 1),
(108, 'Arjun Reddy', 'arjun.reddy@gmail.com', 22, '2025-03-18', 0),
(109, 'Pooja Nair', 'pooja.nair@gmail.com', 21, '2025-10-02', 1),
(110, 'Vikas Malhotra', 'vikas.malhotra@gmail.com', 24, '2025-01-25', 0);

insert into courses(course_id,course_name,fees)
	values
(1201,'CSE',950),
(1202,'IT',850),
(1203,'AIML',900),
(1204,'ECE',1050),
(1205,'EEE',1150);

INSERT INTO enrollments (enroll_id, student_id, course_id)
VALUES
(1, 101, 1201),
(2, 102, 1202),
(3, 103, 1203),
(4, 104, 1204),
(5, 105, 1205),

(6, 106, 1201),
(7, 107, 1202),
(8, 108, 1203),
(9, 109, 1204),
(10, 110, 1205),

(11, 101, 1201),
(12, 102, 1202),
(13, 103, 1203),
(14, 104, 1204),
(15, 105, 1205);

insert into student(
	student_id,name,email,age,join_date,active_flag )
values
(111,'alice','alice123@gmail.com',21,'2026-06-13',1),
(112,'bob','bob123@gmail.com',21,'2026-06-14',0),
(113,'rob','rob123@gmail.com',21,'2026-06-15',1);

select * from student;
select * from enrollments;
select * from courses;

insert into courses(course_id,course_name,fees)
	values
(1206,'AIDS',2000);

INSERT INTO enrollments (enroll_id, student_id, course_id)
VALUES
(16, 116, 1201);

/*task - 3 */
select * from student;

select name,email from student;
select * from student order by age desc;
select top 5 * from student order by join_date desc;

select distinct age from student;
select distinct course_name from courses;

update student set age = 35 where student_id = 110;

update student set active_flag = 0 where student_id = 105;
update student set active_flag = 0 where student_id = 107;

update courses set fees = fees * 1.10;
select * from student;
select * from courses;
select * from enrollments;

delete  from student where student_id = 109;
select * from student;
delete  from courses where fees < 1000;

alter table student
alter column email varchar(200);

exec sp_rename  'student.join_date', 'registration_date', 'column';

alter table student 
add ph_no bigint;

alter table student
alter column ph_no varchar(15);

/* task - 4 */
select * from student where age > 21;
select * from student where active_flag = 1;

select * from courses 
where fees 
between 1000 and 5000;

select * from student where age in(20,22,25);

select * from student where age > 20 and active_flag = 1;
select * from student where age < 20 or active_flag = 0;

select course_name from courses where fees > 2000 and course_name like '%s';

alter table courses 
add city varchar(50);

select * from courses;

update courses 
set city = 'NewYork'
where course_id = 1205;

update courses 
set city = 'Germany'
where course_id = 1206;

select email from student where  email like '%gmail.com';
select course_name from courses where  course_name like '%cse';
select city from courses where city like '%NewYork';

insert into student 
values
(114,'preetham','preetham123@gmail.com', null,'2026-01-08',1,null);

select * from  student where age is null;
select * from  student where age is not null;

/*task-5*/
SELECT COUNT(*) AS total_students
FROM student WHERE active_flag=1;

select sum(fees) as Total_course_fees ,max(fees) as MAXFEE, AVG(fees) as AVGFEE from courses;

select min(age) from student;

select max(fees) from courses;

select TOP 1 * from student
order by registration_date DESC;

select TOP 1 * from student
order by registration_date ASC;

select active_flag, count(student_id) from student
group by active_flag;

select age, count(student_id) from student
group by age;

select course_name , sum(fees) from courses
group by course_name;

select course_id from ENROLLMENTS
group by course_id
Having COUNT(student_id) >2;


select age from student
group by age 
Having avg(age)>21;

select course_id from ENROLLMENTS
group by course_id
having count(enroll_id)>2;

/*task-6*/

select * from students 
where age >21
ORDER BY age DESC;

select count(name) as namecount from students
where name LIKE '%a%'

select course_name , fees from courses
where fees BETWEEN 10000 AND 1000000
ORDER BY fees DESC;

select name , age from students
where active_flag =0 and age is NOT NULL;

select course_id from ENROLLMENTS
group by course_id
having count(enroll_id)>1;






