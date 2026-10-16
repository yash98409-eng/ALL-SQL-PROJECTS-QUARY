/*
BUSINESS PROBLEM:
The company needs to understand customer satisfaction,
review patterns and the availability of written feedback.

BUSINESS VALUE:
Supports identification of low-satisfaction categories,
customer-experience issues and opportunities for improvement.
*/

-- Query 1: Review score distribution
-- Business question: How many reviews were given each score?

CREATE OR REPLACE VIEW review_score_distribution AS
SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score;

-- Query 2: Average review score by product category
-- Business question: Which categories receive the highest
-- average review scores?

CREATE OR REPLACE VIEW product_category_review_score AS
SELECT
    p.product_category_name,
    AVG(r.review_score) AS avg_review_score,
    COUNT(*) AS total_reviews
FROM reviews AS r
JOIN order_items AS oi
    ON r.order_id = oi.order_id
JOIN products AS p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY avg_review_score DESC;

-- Query 3: Average review score by customer state
-- Business question: How does average customer satisfaction
-- vary across states?

CREATE OR REPLACE VIEW state_wise_avg_score AS
SELECT
    c.customer_state,
    AVG(r.review_score) AS avg_review_score,
    COUNT(*) AS total_reviews
FROM reviews AS r
JOIN orders AS o
    ON r.order_id = o.order_id
JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY avg_review_score DESC;

-- Query 4: Review score by order status
-- Business question: How are review scores distributed
-- across different order statuses?

CREATE OR REPLACE VIEW score_vs_order_status AS
SELECT
    o.order_status,
    r.review_score,
    COUNT(*) AS total_reviews
FROM reviews AS r
JOIN orders AS o
    ON r.order_id = o.order_id
GROUP BY o.order_status, r.review_score
ORDER BY o.order_status, r.review_score;

-- Query 5: Reviews with comments vs without comments
-- Business question: How many reviews include written feedback?

CREATE OR REPLACE VIEW reviews_count AS
SELECT
    CASE
        WHEN review_comment_message IS NULL
             OR TRIM(review_comment_message) = ''
        THEN 'No Comment'
        ELSE 'Has Comment'
    END AS comment_status,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY
    CASE
        WHEN review_comment_message IS NULL
             OR TRIM(review_comment_message) = ''
        THEN 'No Comment'
        ELSE 'Has Comment'
    END;
