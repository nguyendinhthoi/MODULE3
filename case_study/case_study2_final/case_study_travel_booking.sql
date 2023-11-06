CREATE DATABASE travel_tour_booking;
USE travel_tour_booking;

CREATE TABLE roles (
    role_id INT primary key auto_increment,
    role_name VARCHAR(50)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_username VARCHAR(100) unique,
    account_password VARCHAR(100),
    is_delete int,
    role_id INT,
    email varchar(100),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);
CREATE TABLE customer_types (
    customer_type_id INT PRIMARY KEY,
    customer_type_name VARCHAR(100)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_id_card VARCHAR(20),
    customer_gender bit(1),
    customer_email VARCHAR(255),
    customer_phone VARCHAR(20),
    customer_address TEXT,
    customer_type_id INT,
    is_delete bit(1),
    account_id INT,
    FOREIGN KEY (customer_type_id) REFERENCES customer_types(customer_type_id),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE employee_types (
    employee_type_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_type_name VARCHAR(100)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100),
    employee_phone VARCHAR(10),
    employee_email VARCHAR(100),
    employee_gender int,
    employee_type_id INT,
    employee_status int Default 0,
    is_delete bit(1) not null default 0,
    FOREIGN KEY (employee_type_id) REFERENCES employee_types(employee_type_id)
);

CREATE TABLE tour_places (
    tour_places_id INT PRIMARY KEY AUTO_INCREMENT,
    tour_places_name VARCHAR(100)
);
CREATE TABLE tours (
    tour_id INT PRIMARY KEY AUTO_INCREMENT,
    tour_name VARCHAR(255),
    tour_description TEXT,
    tour_price DOUBLE,
    tour_available_seats INT,
    start_date DATE,
    end_date DATE,
    employee_id INT,
    place_start VARCHAR(100),
    place_end VARCHAR(100),
    tour_places_id INT,
    image longtext,
    is_delete bit(1) not null default 0,
    FOREIGN KEY (tour_places_id) REFERENCES tour_places(tour_places_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_date DATE,
    quantity INT not null default 0,
    price double,
	is_delete bit(1),
    customer_id INT,
	tour_id INT,
    status bit(1) not null default 0 ,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (tour_id) REFERENCES tours(tour_id)
);

insert into roles 
value(1, "admin"),
	(2, "user");
    
insert into accounts
 value	(1,"Nguyen", "123",0,1,"nguyennguyenhong40@gmail.com"),
		(2,"admin", "123",0,1,"zhangming8443@gmail.com"),
		(3,"minh", "minh123",0,2,"ming8443@gmail.com"),
		(4,"loi", "123456",0,2,"vantanloi7585@gmail.com"),
        (5,"thoi", "1234",0,2,"Dinhthoi2411@gmail.com"),
        (6,"trung", "1234",0,2,"trung@gmail.com"),
        (7,"hai", "1234",0,2,"buihuuhai318@gmail.com"),
        (8,"thien", "1234",0,2,"thien97.night1@gmail.com"),
        (9,"an", "1234",0,2,"annguyen@gmail.com"),
        (10,"yen", "1234",0,2,"thiyen@gmail.com"),
        (11,"phat", "1234",0,2,"phatphat@gmail.com"),
        (12,"nghi", "1234",0,2,"annghi20@gmail.com"),
        (13,"dongha", "1234",0,2,"donghanguyen@gmail.com"),
        (14,"chau", "1234",0,2,"mocchau@gmail.com"),
        (15,"dung", "1234",0,2,"dung1107@gmail.com");
        
        insert into customer_types
        value   (1, "Thường"),
				(2, "V.I.P");
                
	INSERT INTO customers (customer_id,customer_name, customer_id_card, customer_gender, customer_email, customer_phone, customer_address,customer_type_id,is_delete,account_id) VALUES
(1,'Nguyễn Văn Nguyên', '1234567890', 1, 'nguyennguyenhong40@gmail.com', '0988009990', '123 Đường ABC, Thành phố',1,0,1),
(2,'Trần Thị Minh', '9876543210', 0, 'zhangming8443@gmail.com', '0122454445', '456 Đường XYZ, Thị trấn',1,0,2),
(3,	"Nguyễn Văn Minh","456231786",1,"ming8443@gmail.com",'0901234121',"295 Nguyễn Tất Thành, Đà Nẵng",1,0,3),
(4,	"Văn Tấn Lợi","654231234",0,"vantanloi7585@gmail.com",'0934212314',"22 Yên Bái, Đà Nẵng",1,0,4),
(5,	"Đình Thôi","999231723",0,"Dinhthoi2411@gmail.com",'0412352315',"K234/11 Điện Biên Phủ, Gia Lai",2,0,5),
(6,	"Nguyễn Đức Trung","123231365",1,"trung@gmail.com",'0374443232',"77 Hoàng Diệu, Quảng Trị",1,0,6),
(7,	"Bùi Hữu Hải","454363232",1,"buihuuhai318@gmail.com",'0902341231',"43 Yên Bái, Đà Nẵng",1,0,7),
(8,	"Thiện Hoàng","964542311",0,"thien97.night1@gmail.com",'0978653213',"294 Nguyễn Tất Thành, Đà Nẵng",2,0,8),
(9,	"Nguyễn An","534323231",0,"annguyen@gmail.com",'0941234553',"4 Nguyễn Chí Thanh, Huế",2,0,9),
(10,"Trần Thị Yến","234414123",1,"thiyen@gmail.com",'0642123111',"111 Hùng Vương, Hà Nội",2,0,10),
(11,"Tòng Phát","256781231",1,"phatphat@gmail.com",'0245144444',"213 Hàm Nghi, Đà Nẵng",1,0,11),
(12,"Nguyễn An Nghi","755434343",1,"annghi20@gmail.com",'0988767111',"6 Hoà Khánh, Đồng Nai",1,0,12),
(13,"Nguyễn Đông Hà","301545555",0,"donghanguyen@gmail.com","0945555455","23 Nguyễn Hoàng, Đà Nẵng",1,0,13),
(14,"Phạm Mộc Châu","205335555",0,"mocchau@gmail.com","0944444444","K77/14 Thái Phiên, Đà Nẵng",1,0,14),
(15,"Trường Dũng","205333333",1,"dung1107@gmail.com","0935555555","13 Lý Thái Tổ, Đà Nẵng",2,0,15);
		
INSERT INTO tour_places (tour_places_name)
VALUES
    ('Miền Bắc'),
    ('Miền Trung'),
    ('Miền Nam');
INSERT INTO employee_types (employee_type_id, employee_type_name) VALUES
(1, 'Hướng dẫn viên'),
(2, 'Lái xe');
INSERT INTO employees (employee_name, employee_phone, employee_email, employee_gender, employee_type_id)
 VALUES
('Nguyễn Văn Hoàng', '0789656565', 'nvhoang@gmail.com', 1, 2),
('Trần Thị Thắm', '0789454512', 'thamtran@gmail.com', 0, 1),
('Trương Văn Danh', '0321454585', 'trvdanh@gmai.com', 1, 1),
('Trần Thị Lực', '0985252534', 'luctranthi@gmail.com', 0, 1),
('Hoàng Văn Khánh', '0781425157', 'khahhoang@gmail.com', 1, 2),
('Nguyễn Thành Danh', '0386569897', 'danhthanhn@gmail.com', 1, 1),
('Nguyễn Quỳnh Như', '0125845789', 'nhuquynh@gmail.com', 0, 1),
('Nguyễn Hoàng Hà', '0125845789', 'hoangha31@gmail.com', 1, 2),
('Hồ Quỳnh Tâm', '0125845789', 'hqt012@gmail.com', 0, 1),
('Trương Công Quang', '0125845789', 'cogquag23tr@gmail.com', 1, 2),
('Trương Văn Tài', '0125845321', 'cogquag23tr@gmail.com', 1, 2),
('Nguyễn Đình Dương', '0125845723', 'cogquag23tr@gmail.com', 1, 2),
('Nguyễn Hoàng Long', '0125213559', 'cogquag23tr@gmail.com', 1, 2),
('Nguyễn Quỳnh Trang', '0120984879', 'cogquag23tr@gmail.com', 0, 1),
('Phan Thị Ngọc Minh', '0125763987', 'cogquag23tr@gmail.com', 0, 1),
('Lê Thị Tường Vy', '0999845789', 'cogquag23tr@gmail.com', 0, 1),
('Trần Thị Thu Hiền', '0940845789', 'cogquag23tr@gmail.com', 0, 1),
('Phạm Thị Ngọc Loan', '0928375989', 'cogquag23tr@gmail.com', 0, 1),
('Lê Văn Thành', '0985845789', 'cogquag23tr@gmail.com', 1, 2),
('Lê Thanh Công', '0324445789', 'cogquag23tr@gmail.com', 1, 2),
('Tôn Nữ Quỳnh Trang', '0912845789', 'cogquag23tr@gmail.com', 0, 1),
('Nguyễn Bảo Hân', '0925809089', 'cogquag23tr@gmail.com', 0, 1),
('Trần Hoàng Thanh Cư', '0725125789', 'tanhuy13@gmail.com', 1, 2);
INSERT INTO tours (tour_name, tour_description, tour_price, tour_available_seats, start_date, end_date, employee_id, place_start, place_end, tour_places_id,image)
VALUES
    ('Tour Sapa Phiêu Lưu', 'Khám phá vẻ đẹp hùng vĩ của Sapa - vùng cao Bắc Hào Lưu, nằm trong dải núi Hoàng Liên Sơn tuyệt đẹp, với những thung lũng xanh ngát, những dãy núi hùng vĩ, và những cánh đồng bậc thang đẹp như tranh vẽ. Tour Sapa Phiêu Lưu hứa hẹn mang đến cho bạn những trải nghiệm phiêu lưu độc đáo như đi dạo qua những thác nước, leo núi Fansipan - "nóc nhà Đông Dương", thăm bản làng dân tộc, và thưởng thức ẩm thực đặc sản địa phương.', 1500000.00, 20, '2023-08-15', '2023-08-18', 2, 'Hà Nội', 'Sapa', 1,"sp1.jpg,sp2.jpg,sp3.jpg"),
    ('Khám phá Hạ Long', 'Khám phá vẻ đẹp tuyệt vời của Vịnh Hạ Long - di sản thiên nhiên thế giới, với hàng trăm hòn đảo đáng ngưỡng mộ và cảnh quan hùng vĩ. Tour Khám phá Hạ Long sẽ đưa bạn tham gia chuyến du thuyền trên vịnh, thăm các hang động kỳ quái, tắm biển tại bãi Dài, và thưởng thức hải sản tươi ngon đặc sản vùng biển.', 1800000.00, 25, '2023-08-18', '2023-08-21', 3, 'Hà Nội', 'Hạ Long', 1,"hl1.jpg,hl2.jpg,hl3.jpg"),
    ('Tham quan Ninh Bình', 'Tham quan cảnh quan đẹp như tranh vẽ của Ninh Bình, nơi có những thảm đồng lúa chín vàng bát ngát, những hang động hùng vĩ, và những khu di tích lịch sử. Tour Tham quan Ninh Bình mang đến cho bạn cơ hội tham gia tour thuyền trên sông Tam Cốc, ngắm nhìn những cánh đồng lúa xanh thơ mộng, và thăm chùa Bái Đính - ngôi chùa lớn nhất Việt Nam.', 1900000.00, 22, '2023-09-03', '2023-09-06', 4, 'Hà Nội', 'Ninh Bình', 1,"nb1.jpg,nb2.jpg,nb3.jpg"),
    ('Phiêu lưu Quảng Bình', 'Phiêu lưu khám phá những hang động kỳ quái và cảnh quan hoang sơ đặc biệt của Quảng Bình - thiên đường hang động của Việt Nam. Tour Phiêu lưu Quảng Bình sẽ đưa bạn đến thăm hang Sơn Đoòng - hang động lớn nhất thế giới, thưởng thức cảnh quan thiên nhiên tuyệt đẹp và tham gia những hoạt động phiêu lưu hấp dẫn như trekking, thả diều, và lặn ngắm san hô.', 1900000.00, 22, '2023-09-06', '2023-09-09', 6, 'Hà Nội', 'Quảng Bình', 2,"qb1.jpg,qb2.jpg,qb3.jpg"),
    ('Tour Lịch sử Huế', 'Khám phá vẻ đẹp lịch sử và văn hóa của thành phố cổ Huế - Di sản Văn hóa Thế giới của UNESCO. Tour Lịch sử Huế sẽ đưa bạn đến tham quan những công trình kiến trúc độc đáo như cố đô Huế, cung điện hoàng gia, và các ngôi chùa cổ kính. Hãy thưởng thức các món ăn truyền thống Huế đặc sản vùng miền.', 1600000.00, 18, '2023-09-09', '2023-09-12', 7, 'Hồ Chí Minh', 'Huế', 2,"h1.jpg,h2.jpg,h3.jpg"),
    ('Khám phá Đà Nẵng', 'Khám phá sự hòa quyện giữa thiên nhiên và hiện đại tại thành phố Đà Nẵng. Tour Khám phá Đà Nẵng sẽ đưa bạn tham quan bà Nà Hills - khu du lịch núi cao, cung đường Ngũ Hành Sơn, và bãi biển Mỹ Khê tuyệt đẹp. Bên cạnh đó, bạn còn có cơ hội thưởng thức ẩm thực độc đáo đặc sản vùng miền.', 1800000.00, 25, '2023-09-12', '2023-09-15', 9, 'Hồ Chí Minh', 'Đà Nẵng', 2,"dn1.jpg,dn2.jpg,dn3.jpg"),
    ('Tour Quy Nhơn Thám Hiểm', 'Khám phá vẻ đẹp hoang sơ của bãi biển Ky Co và Eo Gió, nơi có cát trắng mịn và nước biển xanh trong, tạo nên bức tranh tuyệt đẹp. Tour Quy Nhơn Thám Hiểm mang đến cho bạn cơ hội thư giãn trên biển, tham gia các hoạt động dưới nước như lặn ngắm san hô và chinh phục những đỉnh đồi với cảnh quan hùng vĩ.', 2000000.00, 15, '2023-09-15', '2023-09-18', 2, 'Hồ Chí Minh', 'Quy Nhơn', 3,"qn1.jpg,qn2.jpg,qn3.jpg"),
    ('Tour Đà Lạt Hương Sắc Miền Sơn Cước', 'Khám phá vẻ đẹp thơ mộng và hương sắc miền Sơn Cước của Đà Lạt - thành phố ngàn hoa. Tour Đà Lạt Hương Sắc Miền Sơn Cước sẽ đưa bạn đến thăm các vườn hoa tuyệt đẹp như Vườn hoa Đà Lạt, thung lũng tình yêu, và hồ Tuyền Lâm. Thưởng thức những ly cafe đậm đà đặc sản vùng miền và khám phá các điểm du lịch nổi tiếng như Hồ Xuân Hương và thác Prenn.', 1800000.00, 20, '2023-09-18', '2023-09-21', 3, 'Hồ Chí Minh', 'Đà Lạt', 3,"dl1.jpg,dl2.jpg,dl3.jpg"),
    ('Tour Phú Quốc Hòn Ngọc Viễn Đông', 'Khám phá vẻ đẹp thiên nhiên hùng vĩ của Phú Quốc - hòn ngọc Viễn Đông, với những bãi biển cát trắng tuyệt đẹp, nước biển trong xanh và những khu rừng nguyên sinh bạt ngàn. Tour Phú Quốc Hòn Ngọc Viễn Đông mang đến cho bạn cơ hội tham gia tour lặn ngắm san hô, cùng nhau tắm biển và thưởng thức hải sản tươi ngon đặc sản vùng biển.', 2200000.00, 18, '2023-09-21', '2023-09-24', 4, 'Hồ Chí Minh', 'Phú Quốc', 3,"pq1.jpg,pq2.jpg,pq3.jpg");