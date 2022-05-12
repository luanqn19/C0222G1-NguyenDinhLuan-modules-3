create database if not exists student_management;
CREATE TABLE `student_management`.`class` (
    id INT,
    `name` VARCHAR(50)
);

CREATE TABLE `student_management`.`teacher` (
    id INT DEFAULT 0,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

insert into `student_management`.`class` values (1, "Luan");
insert into `student_management`.`teacher` values (1, "Hai", 20, "Viet Nam");