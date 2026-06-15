USE retail_capstone_db;
-- PART 3 : BASIC QUERIES

-- 1. Display all customers
SELECT * FROM customers;

-- 2. Display customer name, city, and membership type
SELECT customer_name, city, membership_type
FROM customers;

-- 3. Display all products sorted by price descending
SELECT *
FROM products
ORDER BY price DESC;

-- 4. Find customers from Hyderabad
SELECT *
FROM customers
WHERE city = 'Hyderabad';

-- 5. Find Gold membership customers
SELECT *
FROM customers
WHERE membership_type = 'Gold';

-- 6. Find products priced between ₹500 and ₹5000
SELECT *
FROM products
WHERE price BETWEEN 500 AND 5000;

-- 7. Find products from Electronics and Fashion
SELECT *
FROM products
WHERE category IN ('Electronics','Fashion');

-- 8. Find orders placed after 2026-01-01
SELECT *
FROM orders
WHERE order_date > '2026-01-01';

-- 9. Find payments made using UPI
SELECT *
FROM payments
WHERE payment_mode = 'UPI';

-- 10. Find deliveries still pending
SELECT *
FROM deliveries
WHERE delivery_status = 'Pending';

-- PART 4 : AGGREGATE QUERIES

-- 1. Count total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. Count total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 3. Count total products
SELECT COUNT(*) AS total_products
FROM products;

-- 4. Total revenue from successful payments
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'Success';

-- 5. Average payment amount
SELECT AVG(amount) AS avg_payment
FROM payments;

-- 6. Highest payment amount
SELECT MAX(amount) AS highest_payment
FROM payments;

-- 7. Lowest payment amount
SELECT MIN(amount) AS lowest_payment
FROM payments;

-- 8. Count customers by city
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city;

-- 9. Count products by category
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- 10. Count orders by status
SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- PART 5 : JOINS

-- 1. Customer name with order ID and order date
SELECT c.customer_name,
       o.order_id,
       o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- 2. Order ID, product name, quantity and price
SELECT oi.order_id,
       p.product_name,
       oi.quantity,
       p.price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- 3. Customer name, product name, quantity and order date
SELECT c.customer_name,
       p.product_name,
       oi.quantity,
       o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;

-- 4. Order ID with payment details
SELECT o.order_id,
       p.payment_mode,
       p.payment_status,
       p.amount
FROM orders o
JOIN payments p
ON o.order_id = p.order_id;

-- 5. Order ID with delivery details
SELECT o.order_id,
       d.delivery_partner,
       d.delivery_status
FROM orders o
JOIN deliveries d
ON o.order_id = d.order_id;

-- 6. Full Order Report
SELECT c.customer_name,
       c.city,
       o.order_id,
       o.order_date,
       p.product_name,
       p.category,
       oi.quantity,
       p.price,
       pay.payment_status,
       d.delivery_status
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
JOIN payments pay
ON o.order_id = pay.order_id
JOIN deliveries d
ON o.order_id = d.order_id;

-- PART 6 : GROUP BY & HAVING

-- 1. Total revenue by city
SELECT c.city,
       SUM(p.amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Success'
GROUP BY c.city;

-- 2. Total revenue by customer
SELECT c.customer_name,
       SUM(p.amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Success'
GROUP BY c.customer_name;

-- 3. Total quantity sold by product
SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- 4. Revenue by category
SELECT p.category,
       SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category;

-- 5. Number of orders by customer
SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 6. Customers having more than 1 order
SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;

-- 7. Categories having revenue > 10000
SELECT p.category,
       SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
HAVING SUM(p.price * oi.quantity) > 10000;

-- 8. Cities having more than 2 customers
SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 2;

-- 9. Products sold more than 3 times
SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
HAVING SUM(oi.quantity) > 3;

-- PART 7 : SUBQUERIES

-- 1. Customers who placed orders
SELECT *
FROM customers
WHERE customer_id IN
(
SELECT customer_id
FROM orders
);

-- 2. Customers who never placed orders
SELECT *
FROM customers
WHERE customer_id NOT IN
(
SELECT customer_id
FROM orders
);

-- 3. Products never ordered
SELECT *
FROM products
WHERE product_id NOT IN
(
SELECT product_id
FROM order_items
);

-- 4. Orders with payment greater than average
SELECT *
FROM payments
WHERE amount >
(
SELECT AVG(amount)
FROM payments
);

-- 5. Customer who made highest payment
SELECT c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
WHERE p.amount =
(
SELECT MAX(amount)
FROM payments
);

-- 6. Products above average price
SELECT *
FROM products
WHERE price >
(
SELECT AVG(price)
FROM products
);

-- 7. Customers who ordered Electronics
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
WHERE oi.product_id IN
(
SELECT product_id
FROM products
WHERE category='Electronics'
);

-- 8. Orders with successful payments
SELECT *
FROM orders
WHERE order_id IN
(
SELECT order_id
FROM payments
WHERE payment_status='Success'
);

-- 9. Orders not delivered yet
SELECT *
FROM orders
WHERE order_id IN
(
SELECT order_id
FROM deliveries
WHERE delivery_status <> 'Delivered'
);

-- 10. Customers spending above average
SELECT c.customer_name,
       SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_name
HAVING SUM(p.amount) >
(
SELECT AVG(customer_total)
FROM
(
SELECT SUM(amount) AS customer_total
FROM payments p
JOIN orders o
ON p.order_id = o.order_id
GROUP BY o.customer_id
) avg_table
);

-- PART 8 : DATA QUALITY CHECKS

-- 1. Orders without payments
SELECT *
FROM orders
WHERE order_id NOT IN
(
SELECT order_id
FROM payments
);

-- 2. Orders without deliveries
SELECT *
FROM orders
WHERE order_id NOT IN
(
SELECT order_id
FROM deliveries
);

-- 3. Payments where amount is NULL or 0
SELECT *
FROM payments
WHERE amount IS NULL
OR amount = 0;

-- 4. Cancelled orders with successful payment
SELECT o.order_id,
       o.order_status,
       p.payment_status
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
WHERE o.order_status='Cancelled'
AND p.payment_status='Success';

-- 5. Delivered orders with failed payment
SELECT o.order_id,
       d.delivery_status,
       p.payment_status
FROM orders o
JOIN deliveries d
ON o.order_id = d.order_id
JOIN payments p
ON o.order_id = p.order_id
WHERE d.delivery_status='Delivered'
AND p.payment_status='Failed';

-- 6. Order items with invalid product IDs
SELECT oi.*
FROM order_items oi
LEFT JOIN products p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- 7. Orders with invalid customer IDs
SELECT o.*
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;