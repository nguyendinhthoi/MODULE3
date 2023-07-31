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
    employee_gender BIT(1),
    employee_type_id INT,
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