create database quanlybanhang;
-- drop database quanlybanhang;
use quanlybanhang;

CREATE TABLE customer (
    cID INT(5) AUTO_INCREMENT,
    cName VARCHAR(50) NOT NULL,
    cAge INT NOT NULL,
    PRIMARY KEY (cID)
);

CREATE TABLE orderproduct (
    oID INT(5) AUTO_INCREMENT,
    cID INT(5) ,
    oDate DATE NOT NULL,
    oTotalPrice DOUBLE NOT NULL,
    PRIMARY KEY (oID)
);

CREATE TABLE product (
    pID INT(5) AUTO_INCREMENT,
    pName VARCHAR(50) NOT NULL,
    pPrice DOUBLE NOT NULL,
    PRIMARY KEY (pID)
);

CREATE TABLE orderproductdetail (
    oID INT(5),
    pID INT(5),
    amount INT NOT NULL,
    PRIMARY KEY (oID , pID)
);

-- add foreign key orderproduct
alter table orderproduct
add foreign key (cID) references customer(cID);

-- add foreign key orderproductdetail
alter table orderproductdetail
add foreign key (oID) references orderproduct(oID),
add foreign key (pID) references product(pID);

-- customer
alter table customer AUTO_INCREMENT = 10000;
insert into customer(cName, cAge) values ("Hong",30);
insert into customer(cName, cAge) values ("Hoa",18);
insert into customer(cName, cAge) values ("Hue",24);

-- order
alter table orderproduct AUTO_INCREMENT = 10000;
insert into orderproduct(cID, oDate, oTotalPrice) values (10001, '2022-03-05', 1500);
insert into orderproduct(cID, oDate, oTotalPrice) values (10002, '2022-09-20', 3500);
insert into orderproduct(cID, oDate, oTotalPrice) values (10000, '2022-10-07', 2000);

-- product
alter table product AUTO_INCREMENT = 10000;
insert into product(pName, pPrice) values ("Day",1000);
insert into product(pName, pPrice) values ("Khoa",1500);
insert into product(pName, pPrice) values ("Vai",1200);

-- detail
insert into orderproductdetail values (10000,10000,5);
-- insert into orderproductdetail values (10000,10000,5);
insert into orderproductdetail values (10001,10001,10);
