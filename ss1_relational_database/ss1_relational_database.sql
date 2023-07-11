create database student_management;

use student_management;

create table student(
id_student int auto_increment,
name_student varchar(100),
age_student int,
country varchar(255),
primary key (id_student)
);

insert into student(name_student,age_student,country) value("Thoi",18,"Da Nang"),("Nguyen",19,"Da Nang"),("Minh",20,"Da Nang");
select * from student;

set sql_safe_updates  = 0;
update student set name_student = "Mi" where name_student="Minh";
set sql_safe_updates = 1;

create table class(
id_class int auto_increment,
name_class varchar(100),
primary key	(id_class)
);

create table teacher(
id_teacher int auto_increment,
name_teacher varchar(100),
age_teacher int,
country varchar(255),
primary key (id_teacher)
);