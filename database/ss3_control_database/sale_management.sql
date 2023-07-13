create database sale_management;
use sale_management;

create table customer(
id_customer int auto_increment,
name_customer varchar(50),
age_customer int,
primary key(id_customer)
);

create table order_bill(
id_bill int auto_increment,
id_customer int,
buy_date date,
total_price double,
primary key(id_bill),
foreign key(id_customer) references customer(id_customer)
);

create table product(
id_product int auto_increment,
product_name varchar(50),
product_price double,
primary key(id_product)
);

create table order_detail(
id_bill int,
id_product int,
order_quality varchar(50),
primary key(id_bill,id_product),
foreign key(id_bill) references order_bill(id_bill),
foreign key(id_product) references product(id_product)
);

insert into customer(name_customer,age_customer) 
value ("Minh Quan", 10),("Ngoc Oanh", 20),("Hong Ha", 50);

insert into order_bill (id_customer,buy_date)
value (1,"2006-03-21"),(2,"2006-03-23"),(1,"2006-03-16");

insert into product (product_name,product_price)
value ("May Giat",3),("Tu Lanh",5),("Dieu Hoa",7),("Quat",1),("Bep Dien",2);

insert into order_detail
value (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

-- 1
select id_bill,buy_date,total_price 
from order_bill;
-- 2
select name_customer,product_name 
from customer
join order_bill on customer.id_customer = order_bill.id_customer
join order_detail on order_bill.id_bill = order_detail.id_bill
join product on order_detail.id_product = product.id_product;
-- 3
select name_customer,product_name 
from customer
left join order_bill on customer.id_customer = order_bill.id_customer
left join order_detail on order_bill.id_bill = order_detail.id_bill
left join product on order_detail.id_product = product.id_product
where product.product_name is null;
-- 4
set sql_mode = 0;
select ob.id_bill , ob.buy_date, sum(od.order_quality*p.product_price) as total_price
from order_bill ob
join order_detail od on od.id_bill = ob.id_bill
join product p on od.id_product = p.id_product
group by ob.id_bill;
set sql_mode = 1;
