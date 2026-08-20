
/*=========================================================
  SCRIPT: Generate Business Key Metrics Report
  PROJECT: SQL Data Warehouse Project
  
  DATABASE LAYER: Gold

  PURPOSE:
  This script generates a consolidated business KPI report
  by combining key sales, product, and customer metrics
  into a single result set.

  OBJECTIVES:
  1. Calculate total sales revenue.
  2. Calculate total quantity sold.
  3. Calculate average selling price.
  4. Count total orders placed.
  5. Count total products available.
  6. Count total customers in the database.

=========================================================*/


-- Generate a Report that Shows All Key Metrics of the Business

SELECT
    'Total Sales' AS measure_name,
    SUM(sales_amount) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT
    'Total Quantity',
    SUM(quantity)
FROM gold.fact_sales

UNION ALL

SELECT
    'Average Price',
    AVG(price)
FROM gold.fact_sales

UNION ALL

SELECT
    'Total Nr. Orders',
    COUNT(DISTINCT order_number)
FROM gold.fact_sales

UNION ALL

SELECT
    'Total Nr. Products',
    COUNT(product_name)
FROM gold.dim_products

UNION ALL

SELECT
    'Total Nr. Customers',
    COUNT(customer_key)
FROM gold.dim_customers;










