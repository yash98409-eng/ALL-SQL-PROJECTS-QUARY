/*
BUSINESS PROBLEM:
The company needs to understand monthly order demand,
yearly sales trends, peak sales months and average order value.

BUSINESS VALUE:
Supports seasonal planning, performance tracking and
future demand forecasting.
*/

-- Query 1: Monthly order volume
-- Business question: How many orders were placed each month?

CREATE OR REPLACE VIEW month_total_orders AS
SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY DATE_TRUNC('month', order_purchase_timestamp)
ORDER BY month;

-- Query 2: Yearly item sales
-- Business question: How does item sales value vary by year?

CREATE OR REPLACE VIEW year_total_sales AS
SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
    SUM(oi.price) AS total_sales
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY EXTRACT(YEAR FROM o.order_purchase_timestamp)
ORDER BY year;

-- Query 3: Top five months by item sales
-- Business question: Which months generated the highest item sales?

CREATE OR REPLACE VIEW highest_top5_sales_by_month AS
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS total_sales
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY total_sales DESC
LIMIT 5;

-- Query 4: Top five months by order volume
-- Business question: Which months generated the most orders?

CREATE OR REPLACE VIEW highest_top5_orders_month AS
SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY DATE_TRUNC('month', order_purchase_timestamp)
ORDER BY total_orders DESC
LIMIT 5;

-- Query 5: Monthly average item value per order
-- Business question: How does average item sales value per order
-- change over time?

CREATE OR REPLACE VIEW monthly_avg_order AS
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(oi.price) /
        NULLIF(COUNT(DISTINCT o.order_id), 0) AS avg_order_value
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY month;
