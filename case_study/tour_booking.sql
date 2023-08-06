CREATE DATABASE travel_tour_booking;
USE travel_tour_booking;
CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50)
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_username VARCHAR(100) UNIQUE,
    account_password VARCHAR(100),
    role_id INT,
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
    customer_gender BIT(1),
    customer_email VARCHAR(255),
    customer_phone VARCHAR(20),
    customer_address TEXT,
    customer_type_id INT,
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
    booking_id INT PRIMARY KEY,
    customer_id INT,
    booking_date DATE,
    tour_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (tour_id) REFERENCES tours(tour_id)
);

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
    ('Tour Sapa Phiêu Lưu', 'Khám phá vẻ đẹp hùng vĩ của Sapa - vùng cao Bắc Hào Lưu, nằm trong dải núi Hoàng Liên Sơn tuyệt đẹp, với những thung lũng xanh ngát, những dãy núi hùng vĩ, và những cánh đồng bậc thang đẹp như tranh vẽ. Tour Sapa Phiêu Lưu hứa hẹn mang đến cho bạn những trải nghiệm phiêu lưu độc đáo như đi dạo qua những thác nước, leo núi Fansipan - "nóc nhà Đông Dương", thăm bản làng dân tộc, và thưởng thức ẩm thực đặc sản địa phương.', 1500000.00, 20, '2023-08-15', '2023-08-18', 2, 'Hà Nội', 'Sapa', 1,"https://images.unsplash.com/photo-1570366583862-f91883984fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80,https://images.unsplash.com/photo-1579613259121-29683cd01432?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80,https://images.unsplash.com/photo-1521087926340-f428c113026c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=422&q=80,https://images.unsplash.com/photo-1507166892816-41710bfc5180?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
    ('Khám phá Hạ Long', 'Khám phá vẻ đẹp tuyệt vời của Vịnh Hạ Long - di sản thiên nhiên thế giới, với hàng trăm hòn đảo đáng ngưỡng mộ và cảnh quan hùng vĩ. Tour Khám phá Hạ Long sẽ đưa bạn tham gia chuyến du thuyền trên vịnh, thăm các hang động kỳ quái, tắm biển tại bãi Dài, và thưởng thức hải sản tươi ngon đặc sản vùng biển.', 1800000.00, 25, '2023-08-18', '2023-08-21', 3, 'Hà Nội', 'Hạ Long', 1,"https://images.unsplash.com/photo-1643029891412-92f9a81a8c16?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1186&q=80,https://images.unsplash.com/photo-1558793352-3aa9adeba127?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80,https://images.unsplash.com/photo-1528127269322-539801943592?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80,https://images.unsplash.com/photo-1669178792498-332864ef96e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80,https://images.unsplash.com/photo-1661019912526-fb427f1dc77c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"),
    ('Tham quan Ninh Bình', 'Tham quan cảnh quan đẹp như tranh vẽ của Ninh Bình, nơi có những thảm đồng lúa chín vàng bát ngát, những hang động hùng vĩ, và những khu di tích lịch sử. Tour Tham quan Ninh Bình mang đến cho bạn cơ hội tham gia tour thuyền trên sông Tam Cốc, ngắm nhìn những cánh đồng lúa xanh thơ mộng, và thăm chùa Bái Đính - ngôi chùa lớn nhất Việt Nam.', 1900000.00, 22, '2023-09-03', '2023-09-06', 4, 'Hà Nội', 'Ninh Bình', 1,"https://images.unsplash.com/photo-1503539680555-732099a55a56?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
    ('Phiêu lưu Quảng Bình', 'Phiêu lưu khám phá những hang động kỳ quái và cảnh quan hoang sơ đặc biệt của Quảng Bình - thiên đường hang động của Việt Nam. Tour Phiêu lưu Quảng Bình sẽ đưa bạn đến thăm hang Sơn Đoòng - hang động lớn nhất thế giới, thưởng thức cảnh quan thiên nhiên tuyệt đẹp và tham gia những hoạt động phiêu lưu hấp dẫn như trekking, thả diều, và lặn ngắm san hô.', 1900000.00, 22, '2023-09-06', '2023-09-09', 6, 'Hà Nội', 'Quảng Bình', 2,"https://images.unsplash.com/photo-1638793770847-54861ae7cdf5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80"),
    ('Tour Lịch sử Huế', 'Khám phá vẻ đẹp lịch sử và văn hóa của thành phố cổ Huế - Di sản Văn hóa Thế giới của UNESCO. Tour Lịch sử Huế sẽ đưa bạn đến tham quan những công trình kiến trúc độc đáo như cố đô Huế, cung điện hoàng gia, và các ngôi chùa cổ kính. Hãy thưởng thức các món ăn truyền thống Huế đặc sản vùng miền.', 1600000.00, 18, '2023-09-09', '2023-09-12', 7, 'Hồ Chí Minh', 'Huế', 2,"https://images.unsplash.com/photo-1677560942518-0b15fbf8c787?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
    ('Khám phá Đà Nẵng', 'Khám phá sự hòa quyện giữa thiên nhiên và hiện đại tại thành phố Đà Nẵng. Tour Khám phá Đà Nẵng sẽ đưa bạn tham quan bà Nà Hills - khu du lịch núi cao, cung đường Ngũ Hành Sơn, và bãi biển Mỹ Khê tuyệt đẹp. Bên cạnh đó, bạn còn có cơ hội thưởng thức ẩm thực độc đáo đặc sản vùng miền.', 1800000.00, 25, '2023-09-12', '2023-09-15', 9, 'Hồ Chí Minh', 'Đà Nẵng', 2,"https://images.unsplash.com/photo-1555979864-7a8f9b4fddf8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80"),
    ('Tour Quy Nhơn Thám Hiểm', 'Khám phá vẻ đẹp hoang sơ của bãi biển Ky Co và Eo Gió, nơi có cát trắng mịn và nước biển xanh trong, tạo nên bức tranh tuyệt đẹp. Tour Quy Nhơn Thám Hiểm mang đến cho bạn cơ hội thư giãn trên biển, tham gia các hoạt động dưới nước như lặn ngắm san hô và chinh phục những đỉnh đồi với cảnh quan hùng vĩ.', 2000000.00, 15, '2023-09-15', '2023-09-18', 2, 'Hồ Chí Minh', 'Quy Nhơn', 3,"https://images.unsplash.com/photo-1560569588-fe52d930d1c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=835&q=80"),
    ('Tour Đà Lạt Hương Sắc Miền Sơn Cước', 'Khám phá vẻ đẹp thơ mộng và hương sắc miền Sơn Cước của Đà Lạt - thành phố ngàn hoa. Tour Đà Lạt Hương Sắc Miền Sơn Cước sẽ đưa bạn đến thăm các vườn hoa tuyệt đẹp như Vườn hoa Đà Lạt, thung lũng tình yêu, và hồ Tuyền Lâm. Thưởng thức những ly cafe đậm đà đặc sản vùng miền và khám phá các điểm du lịch nổi tiếng như Hồ Xuân Hương và thác Prenn.', 1800000.00, 20, '2023-09-18', '2023-09-21', 3, 'Hồ Chí Minh', 'Đà Lạt', 3,"https://images.unsplash.com/photo-1626667973496-73be1fc96390?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"),
    ('Tour Phú Quốc Hòn Ngọc Viễn Đông', 'Khám phá vẻ đẹp thiên nhiên hùng vĩ của Phú Quốc - hòn ngọc Viễn Đông, với những bãi biển cát trắng tuyệt đẹp, nước biển trong xanh và những khu rừng nguyên sinh bạt ngàn. Tour Phú Quốc Hòn Ngọc Viễn Đông mang đến cho bạn cơ hội tham gia tour lặn ngắm san hô, cùng nhau tắm biển và thưởng thức hải sản tươi ngon đặc sản vùng biển.', 2200000.00, 18, '2023-09-21', '2023-09-24', 4, 'Hồ Chí Minh', 'Phú Quốc', 3,"https://images.unsplash.com/photo-1567115220168-93d296e55a0a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80");
select employee_id, employee_name 
from employees ee
where employee_type_id =1;
select tour_name, tour_description, tour_price, tour_available_seats, start_date, end_date, employee_name, place_start, place_end, tour_places_name, image 
from tours as t
join employees as ee 
on t.employee_id = ee.employee_id
join tour_places as tp
on t.tour_places_id = tp.tour_places_id
where t.is_delete =1;
select * from tour_places;
select * from tours;
select * from employees;

select employee_id
from tours
where employee_id = 2 and (("2024-01-01" between start_date and end_date) or ("2024-02-02" between start_date and end_date)); -- tìm ra thằng có ngày bắt đầu nằm giữa ngày bắt đầu và kết thúc của 1 tour


select employee_id from tours where employee_id =3 group by employee_id;
update employees 
set employee_status = 1
where employees.employee_id 
in 
(select employee_id 
from tours); 




-- update tours set is_delete = 0 Where tour_id = 2;  
SELECT * FROM travel_tour_booking.tours;

update employees set
            employee_name = 'minh',
            employee_phone = 98744565,
            employee_email = 'eaej@gmail.com',
            employee_gender = false,
            employee_status = false,
			employee_type_id = 1
            where employee_id = 1;





