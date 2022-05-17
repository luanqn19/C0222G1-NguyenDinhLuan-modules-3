CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

CREATE TABLE class (
    class_id INT NOT NULL PRIMARY KEY,
    class_name VARCHAR(45),
    start_date DATE,
    `status` BIT
);
INSERT INTO class VALUES(1, 'A1', '2008-12-20', 1);
INSERT INTO class VALUES(2, 'A2', '2008-12-22', 1);
INSERT INTO class VALUES(3, 'B3', current_date, 0);

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(45),
    address VARCHAR(100),
    phone VARCHAR(10),
    `status` BIT,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);
INSERT INTO student VALUES(1,'Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student(student_id, student_name, address, `status`, class_id) VALUES(2,'Hoa', 'Hai phong', 1, 1);
INSERT INTO student VALUES(3,'Manh', 'HCM', '0123123123', 0, 2);

CREATE TABLE `subject` (
    sub_id INT PRIMARY KEY,
    sub_name VARCHAR(45),
    credit TINYINT,
    `status` BIT
);
INSERT INTO `subject` VALUES (1, 'CF', 5, 1), (2, 'C', 6, 1), (3, 'HDJ', 5, 1);	

CREATE TABLE mark (
    mark_id INT PRIMARY KEY,
    sub_id INT,
    student_id INT,
    mark FLOAT,
    exam_times TINYINT,
    FOREIGN KEY (sub_id) REFERENCES `subject` (sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
INSERT INTO mark VALUES (1, 1, 1, 8, 1), (2, 1, 2, 10, 2), (3, 2, 1, 12, 1);

-- Yeu cau 1
SELECT * FROM `subject`
WHERE credit = (SELECT MAX(credit) FROM `subject`);

-- Yeu cau 2
SELECT * FROM mark
WHERE mark = (SELECT MAX(mark) FROM mark);

-- Yeu cau 3
SELECT s.student_id, s.student_name, s.address, AVG(m.mark)
FROM (mark as m
INNER JOIN student as s ON m.student_id = s.student_id)
GROUP BY s.student_id
ORDER BY AVG(m.mark) DESC, s.student_name ASC;