-- Bước 1: Tạo cơ sở dữ liệu demo
create database demo;
use demo;

-- Bước 2: Tạo bảng products với các trường dữ liệu sau:
create table products (
    id int,
    product_code varchar(50),
    product_name varchar(100),
    product_price double,
    product_amount int,
    product_description varchar(100),
    product_status varchar(50)
);
insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
values ('001', 'Thien', 10.99, 100, 'Not good', 'Active'),
       ('002', 'Nguyen', 15.99, 50, 'Good job', 'Active'),
       ('003', 'Hai', 20.99, 200, 'Pretty Good', 'Inactive');
       

-- Bước 3: Tạo unique index trên bảng products (sử dụng cột product_code để tạo chỉ mục)
create unique index idx_product_code on products (product_code);

-- Tạo composite index trên bảng products (sử dụng 2 cột product_name và product_price)
create index idx_product_name_product_price on products (product_name, product_price);

-- Bước 4: Tạo view lấy về các thông tin: product_code, product_name, product_price, product_status từ bảng products.
create view product_info as
select product_code, product_name, product_price, product_status
from products;

-- Tiến hành sửa đổi view:
alter view product_info as
select product_code, product_name, product_price, product_status, product_amount
from products;

-- Tiến hành xoá view:
drop view if exists product_info;

-- Bước 5: Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng products.
delimiter //

create procedure get_all_products()
begin
    select *
    from products;
end //

delimiter ;

-- Tạo store procedure thêm một sản phẩm mới.
delimiter //

create procedure add_new_product(
    in p_product_code varchar(50),
    in p_product_name varchar(100),
    in p_product_price double,
    in p_product_amount int,
    in p_product_description varchar(100),
    in p_product_status varchar(50)
)
begin
    insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
    values (p_product_code, p_product_name, p_product_price, p_product_amount, p_product_description, p_product_status);
end //

delimiter ;


-- Tạo store procedure sửa thông tin sản phẩm theo id.
delimiter //

create procedure update_product(
    in p_id int,
    in p_product_name varchar(100)
    )
begin
    update products
		set product_name = p_product_name
    where id = p_id;
end //

delimiter ;

-- Tạo store procedure xoá sản phẩm theo id.
delimiter //

create procedure delete_product(
    in p_id int
)
begin
    delete from products
    where id = p_id;
end //

delimiter ;





