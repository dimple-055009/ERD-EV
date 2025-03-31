show databases;
create database ac_ev;
drop database if exists ac_ev;
create database ac;
drop database if exists ac;
create database ac_ev;
use ac_ev;
CREATE TABLE vehicles(
    Vehicle_ID INT PRIMARY KEY, -- Vehicle ID is the primary key
    Model_Name VARCHAR(100),    -- Model Name
    Battery_Capacity FLOAT,     -- Battery Capacity in kWh or suitable units
    avg_range INT,                  -- Range in kilometers or miles
    Price DECIMAL(10, 2),       -- Price with up to 10 digits and 2 decimal places
    Manufacturing_Date DATE,    -- Manufacturing Date
    Status VARCHAR(50)          -- Status (e.g., Available, Sold, etc.)
);
drop table if exists vehicle_id;
CREATE TABLE dealerships (
    Dealership_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each dealership
    Dealer_Name VARCHAR(100) NOT NULL,                  -- Name of the dealership
    Location VARCHAR(150),                       -- Location of the dealership
    Contact VARCHAR(15),                         -- Contact number (e.g., phone)
    Manager_Name VARCHAR(100)                    -- Name of the manager
);
CREATE TABLE customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique Customer ID (auto-incremented)
    Cust_Name VARCHAR(100) NOT NULL,                -- Name of the customer
    Email VARCHAR(150) UNIQUE,                 -- Email address (must be unique)
    Phone VARCHAR(15),                         -- Phone number
    Address VARCHAR(255),                      -- Address of the customer
    Date_of_Birth DATE,                        -- Date of Birth in YYYY-MM-DD format
    Customer_Type VARCHAR(50)                  -- Type of customer (e.g., Regular, Premium, etc.)
);
CREATE TABLE suppliers (
    Supplier_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique Supplier ID (auto-incremented)
    Supp_Name VARCHAR(100) NOT NULL,                -- Name of the supplier
    Supp_Contact VARCHAR(15),                       -- Contact number (e.g., phone)
    Supp_Address VARCHAR(255)                       -- Address of the supplier
);
CREATE TABLE orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,   -- Unique Order ID (auto-incremented)
    Customer_ID INT NOT NULL,                  -- Foreign Key referencing customers table
    Vehicle_ID INT NOT NULL,                   -- Foreign Key referencing vehicle_id table
    Order_Date DATE NOT NULL,                  -- Order date
    Delivery_Date DATE,                        -- Delivery date
    Payment_Status VARCHAR(50),               -- Payment status (e.g., Paid, Pending, etc.)
    FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID), -- FK to customers
    FOREIGN KEY (Vehicle_ID) REFERENCES vehicles(Vehicle_ID)   -- FK to vehicle_id
);
show tables;
CREATE TABLE supply_record (
    Record_ID INT PRIMARY KEY AUTO_INCREMENT,    -- Unique Record ID (auto-incremented)
    Supplier_ID INT NOT NULL,                    -- Foreign Key referencing suppliers table
    Vehicle_ID INT NOT NULL,                     -- Foreign Key referencing vehicle_id table
    Part VARCHAR(100) NOT NULL,                  -- Part supplied (e.g., Battery, Engine, etc.)
    Supply_Date DATE NOT NULL,                   -- Date of supply
    FOREIGN KEY (Supplier_ID) REFERENCES suppliers(Supplier_ID), -- FK to suppliers
    FOREIGN KEY (Vehicle_ID) REFERENCES vehicles(Vehicle_ID)   -- FK to vehicle_id
);
CREATE TABLE services (
    Service_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique Service ID (auto-incremented)
    Vehicle_ID INT NOT NULL,                   -- Foreign Key referencing vehicle_id table
    Service_Type VARCHAR(100) NOT NULL,        -- Type of service (e.g., Maintenance, Repair, etc.)
    Service_Date DATE NOT NULL,                -- Date of the service
    Service_Cost DECIMAL(10, 2) NOT NULL,      -- Cost of the service
    FOREIGN KEY (Vehicle_ID) REFERENCES vehicles(Vehicle_ID) -- FK to vehicle_id
);
CREATE TABLE charging_station (
    Station_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique Station ID (auto-incremented)
    Location VARCHAR(150) NOT NULL,            -- Location of the charging station
    Capacity INT NOT NULL                     -- Capacity of the station (e.g., number of charging points)
);
CREATE TABLE batteries (
    Battery_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique Battery ID (auto-incremented)
    Capacity FLOAT NOT NULL,                   -- Capacity of the battery (e.g., in kWh)
    Installation_Date DATE NOT NULL,           -- Installation date of the battery
    Warranty_Expiry DATE NOT NULL              -- Warranty expiry date
);

/* 
comments
*/
show tables;
create database dummy;
use dummy;
drop table if exists customer;
CREATE TABLE customer (
    Customer_ID INT , -- Unique Customer ID (auto-incremented)
    Cust_Name VARCHAR(100) NOT NULL,                -- Name of the customer
    Email VARCHAR(150) UNIQUE,                 -- Email address (must be unique)
    Phone VARCHAR(15),                         -- Phone number
    Address VARCHAR(255),                      -- Address of the customer
    Date_of_Birth DATE,                        -- Date of Birth in YYYY-MM-DD format
    Customer_Type VARCHAR(50)                  -- Type of customer (e.g., Regular, Premium, etc.)
);
alter table customer
ADD Loyalty_Points INT DEFAULT 0; -- Adds a new column 'Loyalty_Points' with a default value of 0
alter table customer
MODIFY Phone FLOAT;
ALTER TABLE customer
ADD CONSTRAINT Unique_Phone UNIQUE (Phone);
ALTER TABLE customer
DROP INDEX Unique_Phone;
ALTER TABLE customer
MODIFY Phone FLOAT NOT NULL; 
ALTER TABLE customer
ALTER COLUMN Customer_Type SET DEFAULT 'Regular';
ALTER TABLE customer
ADD CONSTRAINT Check_Loyalty_Points CHECK (Loyalty_Points >= 0);
select * from customer;

INSERT INTO customer (Customer_ID, Cust_Name, Email, Phone, Address, Date_of_Birth, Customer_Type, Loyalty_Points)
VALUES
(15, 'Anjala', 'anjala@example.com', '9876543211', '12 Rose St, Delhi', '1994-05-10', 'Premium', 50),
(16, 'Ishika', 'ishika@example.com', '8765432109', '45 Lotus Ave, Mumbai', '1998-11-23', 'Regular', 20),
(17, 'Ashish', 'ashish@example.com', '7654321098', '78 Orchid Rd, Bangalore', '1990-07-15', 'Premium', 70),
(18, 'Itighne', 'itighne@example.com', '6543210987', '90 Tulip Ln, Pune', '1989-09-03', 'Regular', 10),
(19, 'Ashwin', 'ashwin@example.com', '5432109876', '23 Marigold Dr, Chennai', '1992-03-12', 'Regular', 30),
(20, 'Dimple', 'dimple@example.com', '4321098765', '67 Jasmine Blvd, Hyderabad', '1995-06-18', 'Premium', 40),
(21, 'Krish', 'krish@example.com', '3210987654', '89 Lily St, Kolkata', '1997-01-25', 'Regular', 15);
SET SQL_SAFE_UPDATES = 0;
DELETE FROM customer WHERE Phone = '1112220000';
select * from customer ;
ALTER TABLE customer
ADD Gender VARCHAR(10);
UPDATE customer
SET Gender = 'Male'
WHERE Cust_Name IN ('Alice Johnson','Bob Brown','Ashish', 'Krish', 'Ashwin', 'Itighne');
UPDATE customer
SET Gender = 'Female'
WHERE Cust_Name IN ('Anjala', 'Ishika', 'Dimple');
DESCRIBE customer;

INSERT INTO customer (Customer_ID, Cust_Name, Email, Phone, Address, Date_of_Birth, Customer_Type, Loyalty_Points, Gender) 
VALUES
(11, 'Navneet', 'navneet@example.com', '9876543211', 'Address 1', '1990-01-01', 'Regular', 10, 'Male'),
(12, 'Mohit', 'mohit@example.com', '9876543212', 'Address 2', '1992-02-01', 'Premium', 20, 'Male'),
(13, 'Vidushi', 'vidushi@example.com', '9876543213', 'Address 3', '1995-03-01', 'Regular', 15, 'Female'),
(14, 'Harshit', 'harshit@example.com', '9876543214', 'Address 4', '1993-04-01', 'Premium', 25, 'Male'),
(15, 'Shefali', 'shefali@example.com', '9876543215', 'Address 5', '1996-05-01', 'Regular', 12, 'Female'),
(16, 'Amar Nath', 'amar@example.com', '9876543216', 'Address 6', '1988-06-01', 'Regular', 18, 'Male'),
(17, 'Tanu', 'tanu@example.com', '9876543217', 'Address 7', '1997-07-01', 'Regular', 14, 'Female'),
(18, 'Rahul', 'rahul@example.com', '9876543218', 'Address 8', '1991-08-01', 'Premium', 30, 'Male'),
(19, 'Radhika', 'radhika@example.com', '9876543219', 'Address 9', '1998-09-01', 'Regular', 16, 'Female'),
(20, 'Rohan', 'rohan@example.com', '9876543220', 'Address 10', '1994-10-01', 'Premium', 22, 'Male');

select * from customer;