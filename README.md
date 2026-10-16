#  E-Commerce Business Analysis Using SQL

**SQL | PostgreSQL | Data Analytics |Supabase| Business Intelligence**

##  Project Overview

This project focuses on analyzing e-commerce transactional data using SQL to uncover business insights related to sales performance, customer behaviour, product categories, seller performance, payment trends, order fulfilment, and customer satisfaction.

Using PostgreSQL, I developed SQL queries and reusable views to transform raw relational data into meaningful business metrics that can support data-driven decision-making.

The project demonstrates practical SQL skills, analytical problem-solving, and the ability to translate business questions into structured data analysis.

##  Business Problem

E-commerce businesses generate large amounts of data across customers, orders, products, payments, sellers, and reviews. However, raw data does not directly explain which products generate the most revenue, which customers make repeat purchases, or where operational improvements are needed.

The objective of this project is to analyze this data and answer important business questions to support revenue analysis, customer retention, seller evaluation, and operational decision-making.

## Tools & Technologies

- **SQL:** Data querying and business analysis
- **PostgreSQL:** Relational database querying
- **JOINs:** Combining data across multiple tables
- **Aggregate Functions:** SUM, AVG, COUNT, MAX
- **Data Grouping & Filtering:** GROUP BY, WHERE, HAVING
- **Subqueries:** Customer-level calculations and comparative analysis
- **Date Functions:** DATE_TRUNC and EXTRACT
- **CASE Statements:** Conditional classification
- **SQL Views:** Reusable analytical queries

##  Dataset Tables

The analysis uses related e-commerce tables:

| Table | Purpose |
|---|---|
| `customers` | Customer records and geographic information |
| `orders` | Order dates and order statuses |
| `order_items` | Product items, prices, and seller relationships |
| `products` | Product and category information |
| `payments` | Payment values, methods, and installments |
| `sellers` | Seller locations and identifiers |
| `reviews` | Customer ratings and written feedback |
| `translation` | Product-category translations, where available |

##  Key Areas of Analysis

### 1. Sales KPIs & Revenue Analysis

**Business Questions**
- What is the total recorded payment value?
- What is the total product item sales value?
- How many orders are recorded?
- What is the average item sales value per order?

**SQL Techniques:** SUM, COUNT DISTINCT, NULLIF and aggregate calculations.

**Business Value:** Establishes baseline performance metrics for sales monitoring and business reporting.

### 2. Product & Category Analysis

**Business Questions**
- Which product categories contain the most products?
- Which categories generate the most orders?
- Which categories contribute the highest item revenue?
- Which categories have above-average associated payment values?

**SQL Techniques:** JOINs, GROUP BY, SUM, AVG, subqueries and ORDER BY.

**Business Value:** Helps identify high-performing categories and supports inventory planning, product strategy, and marketing decisions.

### 3. Customer Behaviour & Retention

**Business Questions**
- Who are the top 10 customers by spending?
- How many orders does a customer place on average?
- How many customers are repeat buyers?
- How many customers have placed only one order?
- How much does each customer spend?

**SQL Techniques:** GROUP BY, HAVING, SUM, AVG, COUNT DISTINCT and subqueries.

**Business Value:** Supports customer segmentation, repeat-purchase analysis, loyalty initiatives, and retention strategies.

### 4. Regional Sales & Customer Analysis

**Business Questions**
- Which cities have the largest customer base?
- Which states generate the most orders?
- Which states contribute the highest item sales?
- How does average order value vary by state?

**SQL Techniques:** JOINs, COUNT, SUM, GROUP BY and calculated metrics.

**Business Value:** Helps identify important customer markets and supports regional marketing and demand planning.

### 5. Seller Performance Analysis

**Business Questions**
- Which sellers generate the highest revenue?
- Which sellers have the highest order-item volume?
- Which states generate the most seller revenue?
- Which cities have the most sellers?
- What is the average item price by seller?

**SQL Techniques:** Aggregation, ranking, JOINs and GROUP BY.

**Business Value:** Supports seller performance comparisons, marketplace planning, and identification of seller concentration.

### 6. Payment & Installment Analysis

**Business Questions**
- Which payment methods account for the highest payment value?
- How many orders use each payment method?
- How does payment value vary by installment count?

**SQL Techniques:** SUM, AVG, COUNT DISTINCT and GROUP BY.

**Business Value:** Helps understand payment behaviour and compare payment methods for business reporting.

### 7. Order Fulfilment Analysis

**Business Questions**
- How many orders fall into each status?
- How do delivered, canceled, and unavailable orders compare?
- What proportion of eligible orders is successfully delivered?

**SQL Techniques:** WHERE, IN, COUNT and GROUP BY.

**Business Value:** Supports fulfilment monitoring and investigation of cancellation or availability issues.

### 8. Monthly & Yearly Sales Trends

**Business Questions**
- How many orders are placed each month?
- Which months generate the highest item sales?
- Which months have the highest order volume?
- How does average order value change over time?
- How do sales vary by year?

**SQL Techniques:** DATE_TRUNC, EXTRACT, SUM, COUNT DISTINCT and aggregation.

**Business Value:** Helps identify sales peaks, seasonal demand patterns, and opportunities for better business planning.

### 9. Customer Reviews & Satisfaction

**Business Questions**
- How are review scores distributed?
- Which product categories have the highest average review scores?
- How does average review score vary by state?
- How do review scores relate to order status?
- How many reviews contain written comments?

**SQL Techniques:** AVG, COUNT, CASE, TRIM, JOINs and GROUP BY.

**Business Value:** Helps monitor customer satisfaction and identify categories or regions for further investigation.

##  Business Value & Potential Applications

This project provides a SQL-based foundation for:

- **Revenue analysis:** Comparing product categories and geographic markets.
- **Customer retention:** Identifying repeat buyers and high-spending customers.
- **Operational monitoring:** Analyzing order status and fulfilment outcomes.
- **Seller evaluation:** Comparing seller revenue and order-item activity.
- **Customer experience:** Examining review scores and written feedback.
- **Business planning:** Identifying monthly and yearly sales patterns.

These are potential business applications of the analysis. Specific improvements in revenue, retention, or operating costs would require validated query results and further measurement.

## 🧠 SQL Skills Demonstrated

- Writing structured SQL queries
- Joining multiple relational tables
- Aggregating transactional data
- Creating reusable SQL views
- Analyzing customer and seller behaviour
- Performing category and regional comparisons
- Working with date and time functions
- Using subqueries for analytical calculations
- Translating business questions into SQL analysis
- Identifying metric definitions and potential double-counting issues

##  Future Improvements

- Develop an interactive Power BI dashboard using validated SQL outputs.
- Add month-over-month and year-over-year growth analysis.
- Perform customer segmentation using RFM analysis.
- Analyze delivery delays and cancellation rates.
- Validate revenue calculations against payment and order-item data.
- Add screenshots of query outputs and dashboard visualizations.
- Document key findings using actual query results.

##  Conclusion

This project demonstrates how SQL can be used to explore e-commerce data and answer practical business questions across sales, products, customers, sellers, payments, order fulfilment, and customer satisfaction.

It reflects my approach to data analytics: understanding the business problem, selecting suitable SQL techniques, calculating relevant metrics, and identifying how the results can support better decisions.

**Created by Yash Rana | Aspiring Data Analyst**

