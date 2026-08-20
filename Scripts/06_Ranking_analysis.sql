



/*=========================================================
  TOP 5 PRODUCTS GENERATING THE HIGHEST REVENUE
=========================================================*/

-- =====================================================
-- Method 1: Using TOP + ORDER BY DESC
-- Simple and efficient when you only need Top N records
-- =====================================================

SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- =====================================================
-- Method 2: Using DENSE_RANK()
-- More flexible for reporting and analysis
-- Unlike RANK(), DENSE_RANK() does NOT skip rankings
-- when multiple products have the same revenue.
--
-- Example:
-- Revenue: 1000, 900, 900, 800
--
-- RANK()       -> 1, 2, 2, 4
-- DENSE_RANK() -> 1, 2, 2, 3
--
-- Therefore DENSE_RANK() is preferred when handling ties.
-- =====================================================

SELECT *
FROM
(
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        DENSE_RANK() OVER
        (
            ORDER BY SUM(f.sales_amount) DESC
        ) AS revenue_rank
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.product_name
) ranked_products
WHERE revenue_rank <= 5;
