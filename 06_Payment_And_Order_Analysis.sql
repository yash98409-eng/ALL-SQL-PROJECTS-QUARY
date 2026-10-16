/*
BUSINESS PROBLEM:
Management needs to understand payment preferences,
installment behaviour and order fulfilment outcomes.

BUSINESS VALUE:
Supports payment-method analysis, order monitoring and
investigation of cancellations or unavailable orders.
*/

-- Query 1: Total payment and distinct orders by payment method
-- Business question: Which payment methods account for the
-- largest payment value and number of orders?

CREATE OR REPLACE VIEW payment_method_total_pay AS
SELECT
    payment_type,
    SUM(payment_value) AS total_payment,
    COUNT(DISTINCT order_id) AS total_orders
FROM payments
GROUP BY payment_type
ORDER BY total_payment DESC;

-- Query 2: Installment-wise payment analysis
-- Business question: How do payment value and order count vary
-- across installment plans?

CREATE OR REPLACE VIEW installment_wise_pay AS
SELECT
    payment_installments,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(payment_value) AS total_payment,
    AVG(payment_value) AS avg_payment
FROM payments
GROUP BY payment_installments
ORDER BY payment_installments;

-- Query 3: Order count by status
-- Business question: How many orders fall into each status?

CREATE OR REPLACE VIEW order_wise_count AS
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- Query 4: Delivered vs cancelled vs unavailable orders
-- Business question: How do the three key order outcomes compare?

CREATE OR REPLACE VIEW delivered_vs_cancelled_vs_unavailable AS
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
WHERE order_status IN ('delivered', 'canceled', 'unavailable')
GROUP BY order_status
ORDER BY total_orders DESC;

-- Query 5: Delivered-order count
-- Business question: How many orders have been delivered?

SELECT
    COUNT(*) AS delivered_orders
FROM orders
WHERE order_status = 'delivered';
