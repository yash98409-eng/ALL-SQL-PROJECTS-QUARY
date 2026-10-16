/*
BUSINESS PROBLEM:
The business needs to understand customer distribution,
regional demand and which states generate the most sales.

BUSINESS VALUE:
Supports geographic marketing, regional planning and
customer segmentation.
*/

-- Query 1: Top 10 cities by customer count
-- Business question: Which cities have the largest customer base?

CREATE OR REPLACE VIEW top10_customers_by_city AS
SELECT
    customer_city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;

-- Query 2: Top states by customer count
-- Business question: Which states have the most customers?

CREATE OR REPLACE VIEW top_customers_by_state AS
SELECT
    customer_state,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC
LIMIT 10;

-- Query 3: State-wise total orders
-- Business question: Which states generate the most orders?

CREATE OR REPLACE VIEW state_wise_total_orders AS
SELECT
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- Query 4: State-wise item sales
-- Business question: Which states generate the highest item sales?

CREATE OR REPLACE VIEW state_wise_total_sales AS
SELECT
    c.customer_state,
    SUM(oi.price) AS total_item_sales
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_item_sales DESC;

-- Query 5: Average item sales per order by state
-- Business question: What is the average item-price value per order
-- in each state?

CREATE OR REPLACE VIEW total_sales_unique_orders AS
SELECT
    c.customer_state,
    SUM(oi.price) /
        NULLIF(COUNT(DISTINCT o.order_id), 0) AS avg_order_value
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY avg_order_value DESC;

-- Query 6: Top states by customer item revenue
-- Business question: Which states contribute the most item revenue?

CREATE OR REPLACE VIEW highest_revenue_by_states AS
SELECT
    c.customer_state,
    SUM(oi.price) AS total_revenue
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;
