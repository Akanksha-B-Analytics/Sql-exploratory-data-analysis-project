
## Database Exploration

### Purpose
These queries are used to explore the database structure and understand the available tables and columns before performing data analysis.

### Queries

#### 1. Explore All Tables
Returns a list of all tables available in the database.

```sql
SELECT *
FROM INFORMATION_SCHEMA.TABLES;
```

#### 2. Explore Columns for a Specific Table
Returns column details for the `dim_customers` table.

```sql
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
```
