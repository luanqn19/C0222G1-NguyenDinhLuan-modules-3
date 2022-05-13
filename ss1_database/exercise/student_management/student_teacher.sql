create database if not exists student_management;
CREATE TABLE class (
    id INT,
    `name` VARCHAR(50)
);

CREATE TABLE teacher (
    id INT DEFAULT 0,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

insert into class values (1, "Luan");
insert into teacher values (1, "Hai", 20, "Viet Nam");

SELECT * FROM teacher;