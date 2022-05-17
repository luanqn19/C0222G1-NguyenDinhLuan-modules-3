create database demo;
use demo;
-- drop database demo;

create table product(
	id int primary key auto_increment,
    product_code varchar(5),
    product_name varchar(50),
    product_price double,
    product_amount int,
    product_description varchar(100),
    product_status varchar(50)
);

insert into product values
(1,"PD001", "Socolic",100, 1000, "Sugar Socola", "Stored"),
(2,"PD002", "Candy",200, 1000, "Sugar Candy", "Stored"),
(3,"PD003", "Conut",150, 1000, "Sugar Conut", "Stored"),
(4,"PD004", "Snack",50, 1000, "Potato Snack", "Stored"),
(5,"PD005", "Choco",20, 1000, "Sugar Choco", "Stored"),
(6,"PD006", "Banana",150, 1000, "Banana Green", "Stored"),
(7,"PD007", "Vegeta",100, 1000, "Fresh Vegeta", "Stored");
-- create view
create view product_view as
select id, product_code, product_name, product_amount
from product;

select * from product_view;

-- edit view
create or replace view product_view as
select id, product_code, product_name, product_amount, product_description
from product;

select * from product_view;

-- drop view
-- drop view product_view;

-- create unique index
ALTER TABLE product ADD UNIQUE INDEX idx_product_code(product_code);
EXPLAIN SELECT * FROM product WHERE product_code = "PD005"; 

-- drop unique index
ALTER TABLE product DROP INDEX idx_product_code;

-- create composite index
ALTER TABLE product ADD INDEX idx_composite_product(product_name, product_price);
EXPLAIN SELECT * FROM product WHERE product_name = 'Choco' or product_price = 150;

-- create store procedure get all product
call findAllProducts();

-- create store procedure add new product
call add_new("PD008", "New Product",500, 5000, "New product from store procedure", "Done");

-- create store procedure edit product by id
call edit_by_id(6,"Apple");

-- create store procedure delete product by id
call delete_by_id(6);


