/*
PROJECT: E-Commerce Business Analysis
SECTION: Data Exploration and Table Relationships

BUSINESS PROBLEM:
Business data is distributed across multiple tables.
Before performing analysis, we need to understand customer
records, orders, products and their relationships.

ANALYSIS:
1. Inspect customer records.
2. Combine orders with customer location.
3. Combine order items with product categories and prices.

BUSINESS VALUE:
Creates a foundation for customer, product and regional
business analysis.
*/

-- Query 1: Explore customer data
SELECT *
FROM customers
LIMIT 10;

-- Query 2: Orders with customer location
-- Business question:
-- Which customers placed orders, and in which cities and states?

SELECT
    o.order_id,
    o.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_status
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
LIMIT 10;

-- Query 3: Order items with product information
-- Business question:
-- Which products and categories are associated with each order item?

SELECT
    oi.order_id,
    oi.product_id,
    p.product_category_name,
    oi.price
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
LIMIT 10;
