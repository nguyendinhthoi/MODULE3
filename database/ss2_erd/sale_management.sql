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

