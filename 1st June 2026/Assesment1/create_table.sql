-- Create Database
CREATE DATABASE retail_capstone_db;
USE retail_capstone_db;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    gender VARCHAR(10),
    membership_type VARCHAR(30)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30)
);

-- Order Items Table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_mode VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2)
);

-- Deliveries Table
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    delivery_partner VARCHAR(50),
    delivery_status VARCHAR(30),
    delivery_city VARCHAR(50)
);

-- Foreign Keys
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);

ALTER TABLE payments
ADD CONSTRAINT fk_payment_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

ALTER TABLE deliveries
ADD CONSTRAINT fk_delivery_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

SHOW TABLES;

DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE payments;
DESCRIBE deliveries;