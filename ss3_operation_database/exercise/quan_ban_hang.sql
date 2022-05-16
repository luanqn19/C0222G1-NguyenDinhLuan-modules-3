create database quanlybanhang;
-- drop database quanlybanhang;
use quanlybanhang;

CREATE TABLE customer (
    cID INT,
    cName VARCHAR(50) NOT NULL,
    cAge INT NOT NULL,
    PRIMARY KEY (cID)
);

CREATE TABLE orderproduct (
    oID INT,
    cID INT ,
    oDate DATE NOT NULL,
    oTotalPrice DOUBLE,
    PRIMARY KEY (oID)
);

CREATE TABLE product (
    pID INT,
    pName VARCHAR(50) NOT NULL,
    pPrice DOUBLE,
    PRIMARY KEY (pID)
);

CREATE TABLE orderproductdetail (
    oID INT,
    pID INT,
    amount INT,
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
insert into customer values (1,"Minh Quan",10);
insert into customer values (2,"Ngoc Oanh",20);
insert into customer values (3,"Hong Ha",50);

-- order
insert into orderproduct values (1,1,'2022-03-21', Null);
insert into orderproduct values (2,2,'2022-03-23', Null);
insert into orderproduct values (3,1,'2022-03-16', Null);

-- product
insert into product values (1,"May Giat",3);
insert into product values (2,"Tu Lanh",5);
insert into product values (3,"Dieu Hoa",7);
insert into product values (4,"Quat",1);
insert into product values (5,"Bep Dien",2);


-- detail
insert into orderproductdetail values (1,1,3);
insert into orderproductdetail values (1,3,7);
insert into orderproductdetail values (1,4,2);
insert into orderproductdetail values (2,1,1);
insert into orderproductdetail values (3,1,8);
insert into orderproductdetail values (2,5,4);
insert into orderproductdetail values (2,3,3);

-- Yeu cau 1
SELECT orderproduct.oID, orderproduct.oDate, orderproduct.oTotalPrice
FROM orderproduct;

-- Yeu cau 2
SELECT c.cID, c.cName, p.pName, p.pPrice
FROM (((orderproductdetail as od
	INNER JOIN orderproduct as o ON od.oID = o.oID)
	INNER JOIN product as p ON od.pID = p.pID)
	INNER JOIN customer as c ON o.cID = c.cID);

-- Yeu cau 3
SELECT customer.cID, customer.cName
FROM customer
WHERE customer.cID NOT IN (SELECT orderproduct.cID FROM orderproduct);

-- Yeu cau 4
SELECT o.oID as Order_ID, o.oDate as Order_Date, SUM(od.amount * p.pPrice) as tong_tien
FROM ((orderproductdetail as od
	INNER JOIN orderproduct as o ON od.oID = o.oID)
	INNER JOIN product as p ON od.pID = p.pID)
GROUP BY o.oID;
