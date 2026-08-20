

/*=========================================================
  SCRIPT: Explore Sales Period and Customer Ages
  PROJECT: SQL Data Warehouse Project
  
  DATABASE LAYER: Gold

  PURPOSE:
  This script explores the available sales period and
  analyzes the age range of customers in the database.

  OBJECTIVES:
  1. Identify the first and last order dates.
  2. Calculate the total sales period in months.
  3. Identify the oldest and youngest customers.
  4. Calculate the ages of the oldest and youngest customers.

=========================================================*/


-- How Many Years of Sales Are Available?
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(month, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales;


-- Find the Youngest and the Oldest Customer
SELECT
    MIN(birthdate) AS oldest_birthdate,
    DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_birthdate,
    DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;
