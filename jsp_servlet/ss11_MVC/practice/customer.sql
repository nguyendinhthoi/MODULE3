create database customer_management;
CREATE TABLE `customer_management`.`customer` (
  `id_customer` INT NOT NULL AUTO_INCREMENT,
  `name_customer` VARCHAR(100) ,
  `email_customer` VARCHAR(100) ,
  `address_customer` VARCHAR(100) ,
  PRIMARY KEY (`id_customer`));
  insert into customer(name_customer,email_customer,address_customer) 
  value ("nguyễn thị hồng nguyên","hongnguyennguyenthi@gmail.com","đà nẵng"),
		("bùi thị hữu hải","huuhaibuithi@gmail.com","đà nẵng"),
		("lê thị công thiện","thienle@gmail.com","đà nẵng"),
		("nguyễn thị xuân nghĩa","nghiathixuan@gmail.com","đà nẵng");
ALTER TABLE `customer_management`.`customer` 
ADD COLUMN `status_customer` INT NULL DEFAULT 0 ;
