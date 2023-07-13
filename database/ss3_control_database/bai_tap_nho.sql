use quan_ly_sinh_vien;

-- 1
select * from students
where student_name like "h%";
-- 2
select * from classes where month(start_date)=12;
-- 3
select * from subjects 
where credit between 3 and 5;
-- 4
set sql_safe_updates =0;
update students 
set class_id = 2
where student_name like "Hung";
set sql_safe_updates =1;
-- 5
select student_name ,sub_name ,mark 
from students
join marks on students.student_id = marks.student_id
join subjects on marks.sub_id = subjects.sub_id
order by mark DESC
