/*
BUSINESS PROBLEM:
The company needs to identify high-performing sellers,
seller concentration by location and differences in seller
revenue and order-item volume.

BUSINESS VALUE:
Supports seller evaluation, marketplace planning and
identification of important seller regions.
*/

-- Query 1: Total number of sellers
-- Business question: How many seller records are available?

SELECT
    COUNT(*) AS total_sellers
FROM sellers;

-- Query 2: Top 10 cities by seller count
-- Business question: Which cities have the most sellers?

CREATE OR REPLACE VIEW city_wise_seller AS
SELECT
    seller_city,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_city
ORDER BY total_sellers DESC
LIMIT 10;

-- Query 3: Seller count by state
-- Business question: Which states have the most sellers?

CREATE OR REPLACE VIEW highest_seller_state AS
SELECT
    seller_state,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;

-- Query 4: Top 10 sellers by revenue
-- Business question: Which sellers contribute the highest
-- total item sales value?

CREATE OR REPLACE VIEW top10_seller_revenue AS
SELECT
    seller_id,
    SUM(price) AS total_revenue
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 5: Top 10 sellers by order-item count
-- Business question: Which sellers fulfil the most order items?
-- Note: This counts order-item rows, not distinct orders.

CREATE OR REPLACE VIEW top10_sellers_by_numbers_of_orders AS
SELECT
    seller_id,
    COUNT(*) AS total_order_items
FROM order_items
GROUP BY seller_id
ORDER BY total_order_items DESC
LIMIT 10;

-- Query 6: Seller revenue by state
-- Business question: Which seller states generate the most
-- item sales value?

CREATE OR REPLACE VIEW state_wise_seller_revenue AS
SELECT
    s.seller_state,
    SUM(oi.price) AS total_revenue
FROM sellers AS s
JOIN order_items AS oi
    ON s.seller_id = oi.seller_id
GROUP BY s.seller_state
ORDER BY total_revenue DESC;

-- Query 7: Average item price by seller
-- Business question: What is the average selling price
-- of items associated with each seller?

CREATE OR REPLACE VIEW seller_wise_avg_product AS
SELECT
    seller_id,
    AVG(price) AS avg_product_price
FROM order_items
GROUP BY seller_id
ORDER BY avg_product_price DESC;

-- Query 8: Seller distribution by ZIP-code prefix
-- Business question: Which ZIP-code prefixes have the
-- most seller records?

CREATE OR REPLACE VIEW highest_seller_zip AS
SELECT
    seller_zip_code_prefix,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_zip_code_prefix
ORDER BY total_sellers DESC
LIMIT 10;

-- Query 9: Item count by seller state
-- Business question: Which seller states have the most
-- order-item activity?

CREATE OR REPLACE VIEW highest_items_by_seller_state AS
SELECT
    s.seller_state,
    COUNT(*) AS total_items
FROM order_items AS oi
JOIN sellers AS s
    ON oi.seller_id = s.seller_id
GROUP BY s.seller_state
ORDER BY total_items DESC
LIMIT 10;
