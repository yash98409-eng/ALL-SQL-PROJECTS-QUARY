/*
BUSINESS PROBLEM:
The company needs to identify product categories that generate
the most revenue, attract the most orders and have higher
average payment values.

BUSINESS VALUE:
Supports product assortment decisions, inventory planning
and category-level marketing.
*/

-- Query 1: Average payment value for categories
-- Business question:
-- Which categories are associated with above-average payments?
-- Note: Payment values are aggregated at order level here.
-- A payment may be repeated across multiple items in an order,
-- so validate the metric before using it for category decisions.

CREATE OR REPLACE VIEW avg_amount_product AS
SELECT
    p.product_category_name,
    AVG(pay.payment_value) AS avg_payment
FROM payments AS pay
JOIN order_items AS oi
    ON pay.order_id = oi.order_id
JOIN products AS p
    ON oi.product_id = p.product_id
WHERE pay.payment_value > (
    SELECT AVG(payment_value)
    FROM payments
)
GROUP BY p.product_category_name
ORDER BY avg_payment DESC
LIMIT 10;

-- Query 2: Highest product count by category
-- Business question: Which category contains the most products?

CREATE OR REPLACE VIEW highest_product_category_count AS
SELECT
    product_category_name,
    COUNT(*) AS product_count
FROM products
GROUP BY product_category_name
ORDER BY product_count DESC
LIMIT 1;

-- Query 3: Lowest product count by category
-- Business question: Which category contains the fewest products?

CREATE OR REPLACE VIEW lowest_product_category_count AS
SELECT
    product_category_name,
    COUNT(*) AS product_count
FROM products
GROUP BY product_category_name
ORDER BY product_count ASC
LIMIT 1;

-- Query 4: Top product categories by order count
-- Business question: Which product categories generate the
-- highest number of orders?

CREATE OR REPLACE VIEW top_product_categories_by_orders AS
SELECT
    p.product_category_name,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_orders DESC
LIMIT 10;

-- Query 5: Top product categories by item revenue
-- Business question: Which categories generate the highest
-- product item sales value?
-- Uses item price to avoid multiplying order payment values.

CREATE OR REPLACE VIEW highest_product_category_by_revenue AS
SELECT
    p.product_category_name,
    SUM(oi.price) AS total_revenue
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;
