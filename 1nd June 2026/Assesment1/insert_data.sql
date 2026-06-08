USE retail_capstone_db;
-- Customers 

INSERT INTO customers VALUES
(1,'Rahul Sharma','Hyderabad','Telangana','Male','Gold'),
(2,'Priya Singh','Chennai','Tamil Nadu','Female','Silver'),
(3,'Amit Kumar','Bangalore','Karnataka','Male','Gold'),
(4,'Sneha Reddy','Hyderabad','Telangana','Female','Platinum'),
(5,'Kiran Rao','Pune','Maharashtra','Male','Silver'),
(6,'Meera Patel','Ahmedabad','Gujarat','Female','Gold'),
(7,'Arjun Nair','Kochi','Kerala','Male','Silver'),
(8,'Anjali Gupta','Delhi','Delhi','Female','Gold'),
(9,'Vikram Shah','Mumbai','Maharashtra','Male','Platinum'),
(10,'Pooja Verma','Chennai','Tamil Nadu','Female','Gold');

-- Products

INSERT INTO products VALUES
(101,'Laptop','Electronics',55000),
(102,'Smartphone','Electronics',25000),
(103,'Headphones','Electronics',3000),
(104,'T-Shirt','Fashion',1200),
(105,'Jeans','Fashion',2500),
(106,'Watch','Accessories',5000),
(107,'Shoes','Fashion',3500),
(108,'Keyboard','Electronics',1500),
(109,'Mouse','Electronics',800),
(110,'Backpack','Accessories',2000);

-- Orders

INSERT INTO orders VALUES
(1001,1,'2026-01-05','Completed'),
(1002,2,'2026-01-07','Completed'),
(1003,3,'2026-01-10','Completed'),
(1004,4,'2026-01-12','Cancelled'),
(1005,5,'2026-01-15','Completed'),
(1006,6,'2026-01-18','Pending'),
(1007,7,'2026-01-20','Completed'),
(1008,8,'2026-01-22','Completed'),
(1009,9,'2026-01-25','Pending'),
(1010,10,'2026-01-27','Completed'),
(1011,1,'2026-02-01','Completed'),
(1012,2,'2026-02-03','Cancelled'),
(1013,3,'2026-02-05','Completed'),
(1014,4,'2026-02-08','Pending'),
(1015,5,'2026-02-10','Completed');

-- Order Items 

INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,104,3),
(4,1002,105,1),
(5,1003,102,1),
(6,1003,109,2),
(7,1004,107,1),
(8,1005,106,1),
(9,1005,110,2),
(10,1006,108,2),
(11,1007,101,1),
(12,1008,104,2),
(13,1009,102,1),
(14,1010,103,1),
(15,1011,105,2),
(16,1012,107,1),
(17,1013,108,3),
(18,1014,109,2),
(19,1015,110,1),
(20,1015,106,1);

-- Payments 

INSERT INTO payments VALUES
(1,1001,'UPI','Success',61000),
(2,1002,'Card','Success',6100),
(3,1003,'UPI','Success',26600),
(4,1004,'Net Banking','Failed',0),
(5,1005,'UPI','Success',9000),
(6,1006,'Card','Pending',3000),
(7,1007,'UPI','Success',55000),
(8,1008,'Wallet','Success',2400),
(9,1009,'UPI','Pending',25000),
(10,1010,'Card','Success',3000),
(11,1011,'UPI','Success',5000),
(12,1012,'Net Banking','Failed',0),
(13,1013,'UPI','Success',4500),
(14,1014,'Wallet','Pending',1600),
(15,1015,'Card','Success',7000);

-- Deliveries 

INSERT INTO deliveries VALUES
(1,1001,'Delhivery','Delivered','Hyderabad'),
(2,1002,'Blue Dart','Delivered','Chennai'),
(3,1003,'Ekart','Delivered','Bangalore'),
(4,1004,'Delhivery','Cancelled','Hyderabad'),
(5,1005,'Blue Dart','Delivered','Pune'),
(6,1006,'Ekart','Pending','Ahmedabad'),
(7,1007,'Delhivery','Delivered','Kochi'),
(8,1008,'Blue Dart','Delivered','Delhi'),
(9,1009,'Ekart','Pending','Mumbai'),
(10,1010,'Delhivery','Delivered','Chennai'),
(11,1011,'Blue Dart','Delivered','Hyderabad'),
(12,1012,'Ekart','Cancelled','Chennai'),
(13,1013,'Delhivery','Delivered','Bangalore'),
(14,1014,'Blue Dart','Pending','Hyderabad'),
(15,1015,'Ekart','Delivered','Pune');