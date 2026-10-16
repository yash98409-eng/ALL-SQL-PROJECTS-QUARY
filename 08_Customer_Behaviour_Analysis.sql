/*
BUSINESS PROBLEM:
The company needs to understand customer spending,
purchase frequency and repeat-customer behaviour.

BUSINESS VALUE:
Supports customer segmentation, loyalty initiatives and
customer-retention strategies.
*/

-- Query 1: Top 10 customers by spending
-- Business question: Which customers have the highest
-- total item spending?

CREATE OR REPLACE VIEW top10_customers_by_spending AS
SELECT
    o.customer_id,
    SUM(oi.price) AS total_spending
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spending DESC
LIMIT 10;

-- Query 2: Average number of orders per customer
-- Business question: How many orders does a customer place
-- on average?

CREATE OR REPLACE VIEW avg_orders_per_customer AS
SELECT
    AVG(order_count) AS avg_orders_per_customer
FROM (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM orders
    GROUP BY customer_id
) AS customer_orders;

-- Query 3: Number of repeat customers
-- Business question: How many customers have placed
-- more than one order?

CREATE OR REPLACE VIEW repeat_customer AS
SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_id) > 1
) AS repeat_customers_list;

-- Query 4: Number of one-time customers
-- Business question: How many customers have placed
-- exactly one order?

CREATE OR REPLACE VIEW one_time_customer AS
SELECT
    COUNT(*) AS one_time_customers
FROM (
    SELECT
        customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_id) = 1
) AS one_time_customers_list;

-- Query 5: Customer spending and order count
-- Business question: How much does each customer spend,
-- and how many orders have they placed?

CREATE OR REPLACE VIEW spending_number_of_orders AS
SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price) AS total_spending
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spending DESC;
