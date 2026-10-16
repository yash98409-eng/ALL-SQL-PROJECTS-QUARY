/*
BUSINESS PROBLEM:
Management needs core performance indicators to understand
overall payment volume, item sales, order volume and average
order value.

BUSINESS VALUE:
These KPIs provide a baseline for monitoring business performance.
*/

-- Query 1: Total recorded payment value
-- Business question: What is the total payment value recorded?

CREATE OR REPLACE VIEW total_payment AS
SELECT
    SUM(payment_value) AS total_payment
FROM payments;

-- Query 2: Total product item sales
-- Business question: What is the total value of products sold,
-- excluding freight and other payment components?

CREATE OR REPLACE VIEW product_total_payment AS
SELECT
    SUM(price) AS total_item_sales
FROM order_items;

-- Query 3: Total number of orders
-- Business question: How many orders exist in the dataset?

CREATE OR REPLACE VIEW total_orders AS
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- Query 4: Average order value
-- Business question: What is the average item-price value per order?
-- Note: This calculation excludes freight and other charges.

CREATE OR REPLACE VIEW average_order_value AS
SELECT
    SUM(price) / NULLIF(COUNT(DISTINCT order_id), 0)
        AS average_order_value
FROM order_items;
