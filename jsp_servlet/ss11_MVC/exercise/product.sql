CREATE SCHEMA `product_management` ;

USE product_management;

CREATE TABLE `product_management`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NULL,
  `product_description` varchar(255) NULL,
  `product_brand` VARCHAR(100) NULL,
  `product_price` DOUBLE NULL,
  PRIMARY KEY (`product_id`));

INSERT INTO `product_management`.`product` (`product_name`, `product_description` , `product_brand`, `product_price`) VALUES ('Television', 'Innovative, Immersive, Sleek' ,'Samsung', '10000000');
INSERT INTO `product_management`.`product` (`product_name`, `product_description` , `product_brand`, `product_price`) VALUES ('Laptop', 'Reliable and Efficient' , 'Dell', '15000000');
INSERT INTO `product_management`.`product` (`product_name`, `product_description` , `product_brand`, `product_price`) VALUES ('Fan', 'Cool and Refreshing' , 'Kim Cuong', '300000');

SELECT * FROM product;

DELETE FROM product WHERE product_id = 5;

UPDATE product SET product_name = "Fan" , product_description = "ok" , product_brand = "Kim Cuong", product_price = "300000" 
WHERE product_id = 2; 