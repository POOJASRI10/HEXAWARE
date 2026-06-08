--TABLE CREATION
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock_quantity INT,
    supplier_city VARCHAR(30)
);

--INSERTING VALUES INTO THE TABLES
INSERT INTO products VALUES
(1,'Laptop','Electronics',55000,10,'Hyderabad'),
(2,'Mobile','Electronics',25000,25,'Bangalore'),
(3,'Printer','Electronics',18000,8,'Pune'),
(4,'Office Chair','Furniture',7500,15,'Mumbai'),
(5,'Desk','Furniture',12000,5,'Chennai'),
(6,'Notebook','Stationery',80,200,'Hyderabad'),
(7,'Pen','Stationery',20,500,'Delhi'),
(8,'Water Bottle','Accessories',500,50,'Bangalore');

--SELECT FUNCTION
SELECT * FROM products;
SELECT product_name, price FROM products;

--AGGREGATE FUNCTIONS
SELECT COUNT(*) AS total_products
FROM products;

SELECT MAX(price) AS highest_price
FROM products;

SELECT MIN(price) AS lowest_price
FROM products;

SELECT AVG(price) AS average_price
FROM products;

SELECT SUM(stock_quantity) AS total_stock
FROM products;

--DISTINCT FUNCTION
SELECT DISTINCT category
FROM products;


--ALIAS FUNCTION
SELECT product_name AS Name,
price AS Cost
FROM products;

--FILTERING
SELECT * 
FROM products
WHERE category = 'Electronics';

SELECT *
FROM products
WHERE NOT category = 'Electronics';

SELECT *
FROM products
WHERE category = 'Electronics'
AND price > 20000;

SELECT *
FROM products
WHERE supplier_city = 'Hyderabad'
OR supplier_city = 'Delhi';

SELECT *
FROM products
WHERE price BETWEEN 500 AND 20000;

SELECT *
FROM products
WHERE supplier_city IN ('Hyderabad', 'Delhi');

-- Starts with P
SELECT *
FROM products
WHERE product_name LIKE 'P%';

-- Ends with r
SELECT *
FROM products
WHERE product_name LIKE '%r';

-- Contains top
SELECT *
FROM products
WHERE product_name LIKE '%top%';

--GROUPBY FUNCTION
SELECT category,
COUNT(*) AS product_count
FROM products
GROUP BY category;

SELECT category,
SUM(price) AS total_price
FROM products
GROUP BY category;

SELECT category,
COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 1;

--SORTING 
-- Ascending
SELECT *
FROM products
ORDER BY price ASC;

-- Descending
SELECT *
FROM products
ORDER BY price DESC;

USING LIMITS
SELECT *
FROM products
ORDER BY price ASC 
LIMIT 3;

--UPDATE FUNCTION
UPDATE products
SET price = 60000
WHERE product_id = 1;

--DELETE FUNCTION
DELETE FROM products
WHERE product_id = 8;
