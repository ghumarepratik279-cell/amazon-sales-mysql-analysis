# 🛒 Amazon Sales Data Analysis using MySQL

## 📌 Project Overview

This project focuses on analyzing e-commerce sales data using MySQL to generate meaningful business insights.

The database is designed using a normalized relational structure consisting of 7 tables: customers, products, orders, order items, payments, shipping, and reviews.

The project demonstrates practical SQL skills including filtering, aggregation, joins, subqueries, CASE expressions, CTEs, window functions, and business-oriented analysis.

---

## 🗄️ Database Schema

The database contains the following 7 relational tables:

### 1. Customer
- customer_id (Primary Key)
- customer_name
- email
- city
- state
- signup_date

### 2. Products
- product_id (Primary Key)
- product_name
- category
- price
- stock
- seller_name

### 3. Orders
- order_id (Primary Key)
- customer_id (Foreign Key)
- order_date
- total_amount
- order_status

### 4. Order Items
- order_item_id (Primary Key)
- order_id (Foreign Key)
- product_id (Foreign Key)
- quantity
- unit_price

### 5. Payments
- payment_id (Primary Key)
- order_id (Foreign Key)
- payment_date
- payment_method
- payment_status
- amount

### 6. Shipping
- shipping_id (Primary Key)
- order_id (Foreign Key)
- shipping_date
- delivery_date
- shipping_status

### 7. Reviews
- review_id (Primary Key)
- customer_id (Foreign Key)
- product_id (Foreign Key)
- rating
- review_date

---

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Workbench
- Relational Database Design

---

## 📊 SQL Analysis Performed

### Basic Analysis
- Filtering records using WHERE
- Range filtering using AND
- Sorting using ORDER BY
- Top-N analysis using LIMIT

### Aggregation & Grouping
- COUNT()
- SUM()
- AVG()
- GROUP BY
- HAVING

### Joins
- INNER JOIN
- LEFT JOIN
- Multi-table joins
- Customer and order analysis
- Product and category analysis
- Fulfillment tracking

### Advanced SQL
- Subqueries
- CASE expressions
- DATE_FORMAT()
- Common Table Expressions (CTEs)
- Window Functions
- DENSE_RANK()

### Business Analysis
- Customer Lifetime Value (CLV)
- Monthly revenue trends
- Category revenue analysis
- Payment method contribution
- Customer inactivity analysis
- Top products by category

---

## 🔍 Key Business Insights

- Electronics contributes over 70% of total revenue despite having lower transaction volume compared with Fashion.
- May 2024 recorded the highest monthly revenue at ₹68,478.
- UPI generated the highest transaction volume with 25 orders.
- Credit Cards contributed 72.43% of total collected revenue.
- 6 registered customer accounts were identified with zero orders, providing potential targets for re-engagement analysis.

---

## 🎯 Project Objectives

The main objectives of this project are:

1. Design a normalized e-commerce relational database.
2. Perform business-oriented analysis using SQL.
3. Practice intermediate and advanced SQL concepts.
4. Extract actionable insights from sales data.
5. Build a portfolio-ready MySQL project.

---

## Skills Demonstrated

- SQL Query Writing
- Database Design
- Data Analysis
- Data Aggregation
- Relational Database Management
- Complex Joins
- Subqueries
- CTEs
- Window Functions
- Business Intelligence
- Customer Analytics
- Revenue Analysis

---

## 📁 Project Status

**Technical SQL Analysis: Completed ✅**

The next stage of the project focuses on documentation, portfolio presentation, and project showcase.
