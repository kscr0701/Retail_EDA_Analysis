--USE DataWarehouseAnalytics

--Step 1: DATABASE EXPLORATION

--Explore all objects in the database

SELECT* FROM INFORMATION_SCHEMA.TABLES

--Explore all columns in the database

SELECT* FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'

--Step 2: DIMENSIONS EXPLORATION

SELECT DISTINCT Country FROM gold.dim_customers

SELECT DISTINCT Category FROM gold.dim_products

SELECT DISTINCT Category, subcategory FROM gold.dim_products

--Step 3: DATE EXPLORATION

--Find the date of the first and last order

SELECT
	MIN(order_date) First_orderdate,
	MAX(order_date) Last_orderdate,
--How many years of sales are available
	DATEDIFF(year, MIN(order_date), MAX(order_date) ) Order_rangeyears
FROM gold.fact_sales

--Find the youngest and  the oldest customer--

SELECT
	MIN(birthdate) oldest_birthdate,
	DATEDIFF(year, MIN(birthdate), GETDATE()) oldest_age, 
	MAX(birthdate) youngest_birthdate,
	DATEDIFF(year, MAX(birthdate), GETDATE()) youngest_age
FROM gold.dim_customers

--Step 4: MEASURES EXPLORATION

--Find the total sales
SELECT
	SUM(sales_amount) total_sales,
--Find how many items are sold
	SUM(quantity) total_quantity,
--Find the avg selling price
	AVG(price) avg_price,
--Find the total number of orders
	COUNT(DISTINCT order_number) total_orders,
--Find total number of products
	COUNT(DISTINCT product_key) total_products,
--Find total customers
	COUNT(DISTINCT customer_key) total_customers
FROM gold.fact_sales

--Generate a report that shows all key metrics of the business

SELECT 'Total Sales' AS measure_name, SUM(Sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price',		AVG(Price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total quantity', COUNT(customer_key) FROM gold.dim_customers

--Step 5: MAGNITUDE ANALYSIS

--Find total customer by countries

SELECT
	country,
	COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY country

--Find total customer by gender

SELECT
	gender,
	COUNT(customer_key) AS total_customers
FROM gold.dim_customers
GROUP BY gender

--Find total products by category

SELECT
	category,
	COUNT(product_key) AS total_products
FROM gold.dim_products
GROUP BY category

--What is avg cost of each category

SELECT
	category,
	AVG(cost) AS Avg_cost
FROM gold.dim_products
GROUP BY category

--What is the total revenue genrated for each category

SELECT
p.category,
SUM(f.sales_amount) total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC

--What is the distribution of sold items across countries

SELECT
c.country,
SUM(f.quantity) AS total_sold_items
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.country

--Step 6: RANKING TOP N / BOTTOM N

--Which 5 products generate the highest revenue

SELECT TOP 5
p.product_name,
SUM(f.sales_amount) total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC

--What are the 5 worst performing products in terms of sales

SELECT TOP 5
p.product_name,
SUM(f.sales_amount) total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue 









				


