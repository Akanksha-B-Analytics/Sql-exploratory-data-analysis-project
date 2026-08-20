
/*=========================================================
  MONTHLY SALES TREND ANALYSIS
=========================================================*/

-- =====================================================
-- Method 1: Using YEAR() and MONTH()
-- Traditional approach
-- Separately extracts Year and Month from order_date
-- =====================================================

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    YEAR(order_date),
    MONTH(order_date);


-- =====================================================
-- Method 2: Using DATETRUNC()
-- Cleaner and more modern approach
--
-- Instead of calculating YEAR() and MONTH()
-- separately, DATETRUNC() automatically
-- groups dates at the required level.
--
-- DATETRUNC(month, order_date)
-- returns the first day of each month
-- (e.g. 2013-05-01)
--
-- Produces the same monthly aggregation
-- as the previous query with less code.
-- =====================================================

SELECT
    DATETRUNC(month, order_date) AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date);
