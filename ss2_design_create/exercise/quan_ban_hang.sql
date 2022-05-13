create database quanlybanhang;
-- drop database quanlybanhang;
use quanlybanhang;

create table customer (
	cID int(5) not null AUTO_INCREMENT,
    cName VARCHAR(50) not null,
    cAge int not null,
    PRIMARY KEY (cID)
);

create table orderproduct (
	oID int(5) not null AUTO_INCREMENT,
    cID int(5) not null,
    oDate date not null,
    oTotalPrice double not null,
    PRIMARY KEY (oID, cID)
);

create table product (
	pID int(5) not null AUTO_INCREMENT,
    pName VARCHAR(50) not null,
    pPrice DOUBLE not null,
    PRIMARY KEY (pID)
);

create table orderproductdetail (
	oID int(5) not null,
    pID int(5) not null,
    amount int not null
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
insert into orderproductdetail values (10000,10000,5);
insert into orderproductdetail values (10001,10001,10);
