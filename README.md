# Elavate-task-4


E-commerce Sales Data Analysis
This project contains a set of MySQL queries designed to extract actionable business insights from a raw e-commerce sales dataset (ecommerce_sales.csv). The analysis covers fundamental SQL techniques, including aggregation, filtering, joins, subqueries, and database optimization.

1. Data Source and Schema
The analysis is based on a single table, ecommerce_sales, derived from the source CSV file.

Table: ecommerce_sales (DDL)
The initial query in the analysis file defines the table structure (DDL) necessary to load the data:

Column Name

Data Type

Description

order_id

VARCHAR(10)

Primary Key, unique order identifier.

customer_id

VARCHAR(10)

Identifier for the purchasing customer.

category

VARCHAR(50)

Product category (e.g., Home, Electronics).

price

DECIMAL(10, 2)

Unit price of the product.

discount

DECIMAL(4, 2)

Discount rate applied (e.g., 0.15).

quantity

INT

Number of units purchased.

payment_method

VARCHAR(50)

Method used for payment.

order_date

VARCHAR(10)

Date of the order (stored as DD-MM-YYYY).

region

VARCHAR(50)

Geographical region of the order.

returned

VARCHAR(3)

Whether the item was returned ('Yes'/'No').

total_amount

DECIMAL(10, 2)

Total price after discount.

profit_margin

DECIMAL(10, 2)

Profit generated from the order.

customer_age

INT

Age of the customer.

2. Key Analysis Queries
The ecommerce_analysis.sql file contains multiple queries designed to answer specific business questions, organized by SQL technique used.

A. Aggregation, Grouping, and Filtering (SELECT, WHERE, GROUP BY, ORDER BY, SUM, AVG)
Query 1: Calculates Total Revenue, Total Orders, and Average Profit for each product category, excluding returned items.

Query 2: Identifies the Top 10 most profitable orders placed by younger customers (age ≤ 30).

Query 4: Calculates the Average Profit Margin and Delivery Time across all combinations of region and payment_method.

B. Joins (Self-Join)
Query 3: A self-join is used to find unique Customer IDs who have placed orders in both the 'Electronics' category and the 'Fashion' category.

C. Subqueries
Query 5: Uses a correlated subquery to flag orders where the total_amount is higher than the average total amount for its specific region. This is useful for identifying local high-value sales.

D. Views (for Reusable Analysis)
Query 6: Creates a View named high_value_profit_orders. Views simplify future reporting by pre-defining a complex filter. This view isolates orders that meet specific criteria:

total_amount ≥ 200

profit_margin ≥ 50

returned is 'No'

3. Database Optimization
To ensure fast query execution, especially as the data grows, the following indexes are created:

CREATE INDEX idx_category ON ecommerce_sales(category);
CREATE INDEX idx_customer_id ON ecommerce_sales(customer_id);

idx_category: Improves performance for queries that filter or group results by the product category (e.g., Query 1).

idx_customer_id: Speeds up operations involving customer lookups, such as the self-join used in Query 3.

4. Getting Started
Setup: Ensure you have a running MySQL or compatible database instance.

Schema: Execute the CREATE TABLE statement (Section 1) from the SQL file to set up the ecommerce_sales table.

Data Loading: Import the data from ecommerce_sales.csv into the newly created table.

Run Analysis: Execute the remaining queries in the ecommerce_analysis.sql file to perform the analysis and create the index/view.
