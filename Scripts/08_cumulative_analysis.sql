
/*
===============================================================================
Cumulative Analysis: Running Total Sales & Moving Average Price
===============================================================================
Purpose:
    - Calculate yearly total sales.
    - Calculate cumulative (running) sales over time.
    - Calculate moving average price over time.
    - Identify long-term sales growth trends.

SQL Concepts Used:
    - DATETRUNC()
    - Aggregations (SUM, AVG)
    - Window Functions
    - OVER()
    - Running Totals
    - Moving Averages
===============================================================================
*/

SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
    SELECT
        DATETRUNC(year, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(year, order_date)
) t;
