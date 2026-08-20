
/*
===============================================================================
Category Contribution Analysis

Objective:
Identify which product categories contribute the most to overall sales.

Key Concepts:
- CTE
- Window Functions
- Percentage Calculation

Insights:
- Calculates total sales by category.
- Calculates overall company sales.
- Determines each category's contribution percentage.
- Helps identify the most important revenue-generating categories.

Use Case:
Used by business teams to understand revenue distribution across categories
and prioritize high-performing product lines.
===============================================================================
*/

WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
)

SELECT
    category,
    total_sales,
    SUM(total_sales) OVER() AS overall_sales,
    CONCAT(
        ROUND(
            CAST(total_sales AS FLOAT)
            / SUM(total_sales) OVER() * 100,
            2
        ),
        '%'
    ) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
