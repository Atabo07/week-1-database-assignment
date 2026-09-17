-- Week 1 Database Assignment
-- Topic: Hotel Management

-- Create the database
CREATE DATABASE hotel_management;

-- Select the database
USE hotel_management;

-- Create Guests table
CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Create Rooms table
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- Create Bookings table
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- Create Payments table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(30),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Insert sample guests
INSERT INTO guests (full_name, phone, email)
VALUES
('Esther Atabo', '0712345678', 'esther@example.com'),
('John Kamau', '0723456789', 'john@example.com'),
('Mary Achieng', '0734567890', 'mary@example.com');

-- Insert sample rooms
INSERT INTO rooms (room_number, room_type, price_per_night, status)
VALUES
('101', 'Single', 2500.00, 'Available'),
('102', 'Double', 4000.00, 'Occupied'),
('103', 'Deluxe', 6000.00, 'Available');

-- Insert sample bookings
INSERT INTO bookings (guest_id, room_id, check_in, check_out)
VALUES
(1, 2, '2026-09-18', '2026-09-20'),
(2, 1, '2026-09-19', '2026-09-21');

-- Insert sample payments
INSERT INTO payments (booking_id, amount, payment_date, payment_method)
VALUES
(1, 8000.00, '2026-09-18', 'M-Pesa'),
(2, 5000.00, '2026-09-19', 'Cash');

-- Display the tables
SHOW TABLES;

-- Display sample data
SELECT * FROM guests;
SELECT * FROM rooms;
SELECT * FROM bookings;
SELECT * FROM payments;

