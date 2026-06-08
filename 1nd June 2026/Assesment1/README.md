# RETAIL CAPSTONE PROJECT REPORT

## 1. Database Design

The Retail Capstone Database is designed to manage and analyze the operations of an online retail business. The database stores information about customers, products, orders, payments, and deliveries. It helps the company track sales, monitor customer behavior, analyze revenue, manage deliveries, and generate business reports.

The database consists of six tables:

### Customers

Stores customer details such as:

* Customer ID
* Customer Name
* City
* State
* Gender
* Membership Type

### Products

Stores product information such as:

* Product ID
* Product Name
* Category
* Price

### Orders

Stores order details including:

* Order ID
* Customer ID
* Order Date
* Order Status

### Order_Items

Stores products included in each order along with quantity purchased.

### Payments

Stores payment information including:

* Payment Mode
* Payment Status
* Amount Paid

### Deliveries

Stores delivery information including:

* Delivery Partner
* Delivery Status
* Delivery City


## 2. Table Relationships

The database tables are connected through primary keys and foreign keys.

### Customers → Orders

Relationship: One-to-Many

A customer can place multiple orders.

Customers.customer_id
        ↓
Orders.customer_id

### Orders → Order_Items

Relationship: One-to-Many

An order can contain multiple products.

Orders.order_id
        ↓
Order_Items.order_id

### Products → Order_Items

Relationship: One-to-Many

A product can appear in multiple orders.

Products.product_id
        ↓
Order_Items.product_id

### Orders → Payments

Relationship: One-to-One

Each order has an associated payment record.

Orders.order_id
        ↓
Payments.order_id

### Orders → Deliveries

Relationship: One-to-One

Each order has an associated delivery record.

Orders.order_id
        ↓
Deliveries.order_id


## 3. Key Insights from Reports

After analyzing the data using SQL queries, the following business insights were identified:

### Revenue Analysis

* Electronics products generated the highest revenue.
* High-value products contributed significantly to total sales.
* Successful payments formed the majority of total revenue.

### Customer Analysis

* Gold membership customers contributed a large portion of revenue.
* Repeat customers placed multiple orders and increased profitability.
* Customers from Hyderabad, Chennai, and Bangalore generated substantial sales.

### Product Analysis

* Electronics was the most popular product category.
* Frequently purchased products showed higher sales volume.
* Some products were never ordered, indicating low demand.

### Payment Analysis

* UPI was one of the most commonly used payment methods.
* A small number of payments failed and required attention.
* Successful payments significantly exceeded failed payments.

### Delivery Analysis

* Most deliveries were completed successfully.
* Some deliveries remained pending and required follow-up.
* Cancelled orders affected overall operational efficiency.

## 4. Conclusion

The Retail Capstone Database successfully manages customer, product, order, payment, and delivery information. Using SQL queries, the company can analyze customer behavior, monitor sales performance, identify operational issues, and make data-driven business decisions. The project demonstrates the practical application of database design, SQL querying, data analysis, and reporting in a real-world retail environment.
