-- ==========================================================
-- PHASE 1: BASIC FILTERING, SORTING & AGGREGATION
-- ==========================================================

-- Task 1: Basic WHERE Filtering (Customers from Pune)
SELECT * 
FROM customer 
WHERE city = 'Pune';

-- Task 2: Multiple Conditions (Maharashtra signups in 2023)
SELECT * 
FROM customer 
WHERE state = 'Maharashtra' 
  AND YEAR(signup_date) = 2023;

-- Task 3: ORDER BY & LIMIT (Top 5 most expensive electronics)
SELECT product_name, price 
FROM products 
WHERE category = 'Electronics' 
ORDER BY price DESC 
LIMIT 5;

-- Task 4: Aggregate Metrics (Orders summary)
SELECT 
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_order_value,
    MAX(total_amount) AS max_order_value
FROM orders;

-- Task 5: GROUP BY (Category metrics)
SELECT 
    category,
    COUNT(product_id) AS total_products,
    ROUND(AVG(price), 2) AS avg_price,
    SUM(stock) AS total_stock
FROM products
GROUP BY category
ORDER BY total_stock DESC;

-- Task 6: HAVING Clause (Sellers with >= 3 products)
SELECT 
    seller_name,
    COUNT(*) AS total_products
FROM products
GROUP BY seller_name
HAVING COUNT(*) >= 3
ORDER BY total_products DESC;


-- ==========================================================
-- PHASE 2: JOINS & RELATIONAL ANALYSIS
-- ==========================================================

-- Task 7: INNER JOIN (Customer Order Details - Latest 10)
SELECT 
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customer AS c
INNER JOIN orders AS o 
    ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC
LIMIT 10;

-- Task 8: Multi-Table JOIN (Delivered Orders tracking across 5 tables)
SELECT 
    o.order_id,
    c.customer_name,
    oi.quantity,
    p.product_name,
    s.shipping_status
FROM orders AS o
JOIN customer AS c 
    ON o.customer_id = c.customer_id
JOIN order_items AS oi 
    ON o.order_id = oi.order_id
JOIN products AS p 
    ON oi.product_id = p.product_id
JOIN shipping AS s 
    ON o.order_id = s.order_id
WHERE s.shipping_status = 'Delivered'
LIMIT 5;

-- Task 9: Aggregated JOIN (Revenue & units sold per category)
SELECT 
    p.category,
    SUM(oi.quantity) AS total_sold_unit,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products AS p
JOIN order_items AS oi 
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Task 10: LEFT JOIN (Zero-order inactive customers)
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    c.signup_date
FROM customer AS c
LEFT JOIN orders AS o 
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- ==========================================================
-- PHASE 3: SUBQUERIES, CASE & ADVANCED ANALYTICS
-- ==========================================================

-- Task 11: Subquery (Orders above platform average value)
SELECT 
    order_id,
    customer_id,
    order_date,
    total_amount
FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders)
ORDER BY total_amount DESC;

-- Task 12: CASE Expression (Order tier classification)
SELECT 
    order_id,
    total_amount,
    CASE 
        WHEN total_amount >= 10000 THEN 'Premium'
        WHEN total_amount BETWEEN 2000 AND 9999 THEN 'Mid-Range'
        ELSE 'Budget'
    END AS order_tier
FROM orders
ORDER BY total_amount DESC
LIMIT 10;

-- Task 13: Time-Series Trends (Monthly order volume & revenue)
SELECT 
    DATE_FORMAT(order_date, '%y-%m') AS order_month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS month_revenue
FROM orders
GROUP BY order_month
ORDER BY order_month ASC;

-- Task 14: Window Function & CTE (Top 2 expensive products per category)
WITH RankedProducts AS (
    SELECT 
        category,
        product_name,
        price,
        DENSE_RANK() OVER (PARTITION BY category ORDER BY price DESC) AS price_rank
    FROM products
)
SELECT * 
FROM RankedProducts
WHERE price_rank <= 2;

-- Task 15: Customer Lifetime Value (Top 5 spenders)
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS lifetime_spend
FROM customer AS c
INNER JOIN orders AS o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY lifetime_spend DESC
LIMIT 5;

-- Task 16: Payment Distribution & Revenue Contribution Share
SELECT 
    payment_method,
    COUNT(payment_id) AS successful_transactions,
    SUM(amount) AS total_collected,
    ROUND(
        (SUM(amount) / (SELECT SUM(amount) FROM payments WHERE payment_status = 'Success')) * 100, 
        2
    ) AS percentage_share
FROM payments
WHERE payment_status = 'Success'
GROUP BY payment_method
ORDER BY total_collected DESC;
