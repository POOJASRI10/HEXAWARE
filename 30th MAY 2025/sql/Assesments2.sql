---Exercises: SELECT, WHERE, DISTINCT, IN,BETWEEN, LIKE, ORDER BY
### Exercise 1

Display all books.

SELECT *
FROM books;

### Exercise 2

Display only book_title, category, and price.

SELECT book_title, category, price
FROM books;

### Exercise 3

Display all unique book categories.

SELECT DISTINCT category
FROM books;

### Exercise 4

Find all books from the Programming category.

SELECT *
FROM books
WHERE category = 'Programming';

### Exercise 5

Find books priced above ₹700.

SELECT *
FROM books
WHERE price > 700;

### Exercise 6

Find books where stock is less than 15.

SELECT *
FROM books
WHERE stock < 15;

### Exercise 7

Find books from Programming, Database, and AI categories using IN.

SELECT *
FROM books
WHERE category IN ('Programming', 'Database', 'AI');

### Exercise 8

Find books priced between ₹500 and ₹900.

SELECT *
FROM books
WHERE price BETWEEN 500 AND 900;

### Exercise 9

Find books whose title contains SQL.

SELECT *
FROM books
WHERE book_title LIKE '%SQL%';

### Exercise 10

Find books whose title starts with Data.

SELECT *
FROM books
WHERE book_title LIKE 'Data%';

### Exercise 11

Sort books by price from highest to lowest.

SELECT *
FROM books
ORDER BY price DESC;

### Exercise 12

Sort books by category ascending and price descending.

SELECT *
FROM books
ORDER BY category ASC, price DESC;

---Exercises: Aggregate Functions, GROUP BY,HAVING
### Exercise 13

Find total number of books.

SELECT COUNT(*) AS total_books
FROM books;

### Exercise 14

Find highest book price.

SELECT MAX(price) AS highest_price
FROM books;

### Exercise 15

Find lowest book price.

SELECT MIN(price) AS lowest_price
FROM books;

### Exercise 16

Find average book price.

SELECT AVG(price) AS average_price
FROM books;

### Exercise 17

Find total stock available.

SELECT SUM(stock) AS total_stock
FROM books;

### Exercise 18

Display number of books in each category.

SELECT category, COUNT(*) AS book_count
FROM books
GROUP BY category;

### Exercise 19

Display average price by category.

SELECT category, AVG(price) AS average_price
FROM books
GROUP BY category;

### Exercise 20

Display total stock by category.

SELECT category, SUM(stock) AS total_stock
FROM books
GROUP BY category;

### Exercise 21

Display categories having more than 1 book.

SELECT category, COUNT(*) AS book_count
FROM books
GROUP BY category
HAVING COUNT(*) > 1;

### Exercise 22

Display categories where average price is greater than ₹700.

SELECT category, AVG(price) AS average_price
FROM books
GROUP BY category
HAVING AVG(price) > 700;

/*Table 2 and 3: Departments and Employees

Use this for JOINs and NULL handling.

CREATE TABLE departments
(
department_id INT PRIMARY KEY,
department_name VARCHAR(50),
location VARCHAR(50)
);

CREATE TABLE employees
(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
department_id INT,
salary DECIMAL(10,2),
city VARCHAR(50),
manager_id INT
);

INSERT INTO departments VALUES
(10, 'IT', 'Hyderabad'),
(20, 'HR', 'Bangalore'),
(30, 'Finance', 'Mumbai'),
(40, 'Sales', 'Delhi'),
(50, 'Marketing', NULL);

INSERT INTO employees VALUES
(101, 'Rahul Sharma', 10, 75000, 'Hyderabad', 201),
(102, 'Priya Reddy', 10, 85000, 'Bangalore', 201),
(103, 'Amit Kumar', 20, 55000, NULL, 202),
(104, 'Sneha Patel', 30, 65000, 'Mumbai', 203),
(105, 'Arjun Verma', NULL, 60000, 'Chennai', 204),
(106, 'Neha Singh', 60, 50000, 'Delhi', NULL),
(107, 'Farhan Ali', 40, NULL, 'Hyderabad', 205),
(108, 'Meera Nair', 10, 90000, 'Pune', 201);
*/

---Exercises: INNER JOIN, LEFT JOIN, RIGHT, JOIN

### Exercise 23

Display employee name, salary, department name and department location using INNER JOIN.

SELECT e.employee_name,
e.salary,
d.department_name,
d.location
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

### Exercise 24

Display all employees and their department details using LEFT JOIN.

SELECT e.employee_name,
e.salary,
d.department_name,
d.location
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

### Exercise 25

Find employees who do not have a valid department.

SELECT e.employee_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

### Exercise 26

Display all departments and employees using RIGHT JOIN.

SELECT e.employee_name,
d.department_name,
d.location
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

### Exercise 27

Find departments where no employees are assigned.

SELECT d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

### Exercise 28

Find employees where salary is NULL.

SELECT *
FROM employees
WHERE salary IS NULL;

### Exercise 29

Find employees where city is NULL.

SELECT *
FROM employees
WHERE city IS NULL;

### Exercise 30

Find departments where location is NULL.

SELECT *
FROM departments
WHERE location IS NULL;

### Exercise 31

Display department-wise employee count.

SELECT department_id,
COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

### Exercise 32

Display department-wise average salary.

SELECT department_id,
AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

### Exercise 33

Display departments having more than 2 employees.

SELECT department_id,
COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;

### Exercise 34

Display department-wise highest salary.

SELECT department_id,
MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;

/* Table 4: Customers and Payments

Use this for subqueries.

CREATE TABLE customers_new
(

customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50),
membership_type VARCHAR(30)
);

CREATE TABLE payments
(
payment_id INT PRIMARY KEY,
customer_id INT,
amount DECIMAL(10,2),
payment_mode VARCHAR(30),
payment_status VARCHAR(30)
);

INSERT INTO customers_new VALUES
(1, 'Ramesh Gupta', 'Hyderabad', 'Gold'),
(2, 'Sana Khan', 'Bangalore', 'Silver'),
(3, 'John Mathew', 'Mumbai', 'Gold'),
(4, 'Ayesha Begum', 'Chennai', 'Bronze'),
(5, 'Vikram Rao', 'Delhi', 'Silver'),
(6, 'Divya Sharma', 'Pune', NULL);

INSERT INTO payments VALUES
(1001, 1, 15000, 'UPI', 'Success'),
(1002, 1, 8000, 'Card', 'Success'),
(1003, 2, 5000, 'Cash', 'Pending'),
(1004, 3, 22000, 'UPI', 'Success'),
(1005, 7, 12000, 'Card', 'Failed'),
(1006, NULL, 3000, 'Cash', 'Pending'),
(1007, 4, NULL, 'UPI', 'Success'),
(1008, 5, 7000, NULL, 'Success');
*/

---Exercises: Subqueries

### Exercise 35
Find customers who made payments.

SELECT *
FROM customers_new
WHERE customer_id IN
(
    SELECT customer_id
    FROM payments
);

### Exercise 36
Find customers who never made payments.

SELECT *
FROM customers_new c
WHERE NOT EXISTS
(
    SELECT 1
    FROM payments p
    WHERE p.customer_id = c.customer_id
);

### Exercise 37
Find payments greater than average payment amount.

SELECT *
FROM payments
WHERE amount >
(
    SELECT AVG(amount)
    FROM payments
);

### Exercise 38
Find customer who made the highest payment.

SELECT *
FROM customers_new
WHERE customer_id =
(
    SELECT customer_id
    FROM payments
    WHERE amount =
    (
        SELECT MAX(amount)
        FROM payments
    )
);

### Exercise 39
Find Gold customers who made payments.

SELECT *
FROM customers_new
WHERE membership_type = 'Gold'
AND customer_id IN
(
    SELECT customer_id
    FROM payments
);

### Exercise 40
Find customers whose total payment is greater than ₹10,000.

SELECT customer_id,
       SUM(amount) AS total_payment
FROM payments
GROUP BY customer_id
HAVING SUM(amount) > 10000;

### Exercise 41
Find payments where customer does not exist.

SELECT *
FROM payments p
WHERE NOT EXISTS
(
    SELECT 1
    FROM customers_new c
    WHERE c.customer_id = p.customer_id
);

### Exercise 42
Find customers using EXISTS.

SELECT *
FROM customers_new c
WHERE EXISTS
(
    SELECT 1
    FROM payments p
    WHERE p.customer_id = c.customer_id
);

### Exercise 43
Find customers using NOT EXISTS.

SELECT *
FROM customers_new c
WHERE NOT EXISTS
(
    SELECT 1
    FROM payments p
    WHERE p.customer_id = c.customer_id
);

### Exercise 44
Find customers whose payment amount is greater than all payments made by customer 2.

SELECT *
FROM customers_new c
WHERE c.customer_id IN
(
    SELECT customer_id
    FROM payments
    WHERE amount >
    ALL
    (
        SELECT amount
        FROM payments
        WHERE customer_id = 2
    )
);

