

/*=========================================================
  SCRIPT: Explore Customer Countries and Product Hierarchy
  PROJECT: SQL Data Warehouse Project
  
  DATABASE LAYER: Gold

  PURPOSE:
  This script explores the geographical distribution of
  customers and the hierarchical structure of products.

  OBJECTIVES:
  1. Identify all unique countries our customers come from.
  2. Explore the product hierarchy across category,
     subcategory, and product levels.

=========================================================*/


-- Explore All Countries Our Customers Come From
SELECT DISTINCT country
FROM gold.dim_customers;


-- Explore All Categories, Subcategories, and Products
SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
