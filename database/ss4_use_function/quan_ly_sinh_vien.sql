CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
CREATE TABLE classes
(
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    status    BIT
);
CREATE TABLE students
(
    student_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    status      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes (class_id)
);
CREATE TABLE subjects
(
    sub_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    status  BIT                  DEFAULT 1
);

CREATE TABLE marks
(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES subjects (sub_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id)
);
INSERT INTO classes
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO classes
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO classes
VALUES (3, 'B3', current_date, 0);

INSERT INTO students (student_name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO students (student_name, address, status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO students (student_name, address, phone, status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects(sub_name,credit,status)
VALUES ('CF', 5, 1),
       ('C', 6, 1),
       ('HDJ', 5, 1),
       ('RDBMS', 10, 1);

INSERT INTO marks (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

-- 1
select *
from subjects
where subjects.credit = (select max(subjects.credit) from subjects);
-- 2
select subjects.sub_id,subjects.sub_name,subjects.credit,subjects.status
from subjects
join marks on marks.sub_id = subjects.sub_id
where marks.mark = (select max(marks.mark) from marks);
-- 3
select students.student_name ,avg(marks.mark) as average_mark
from students
join marks on marks.student_id = students.student_id
group by students.student_id
order by students.student_id