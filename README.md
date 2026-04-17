# Retail_EDA_Analysis
A 6-step SQL Exploratory Data Analysis (EDA) project uncovering business insights from a retail database. Covers database mapping, customer demographics, and product performance ranking.
# SQL Exploratory Data Analysis: Retail Sales Analytics

## 🎯 Project Overview
This project focuses on performing a comprehensive Exploratory Data Analysis (EDA) using SQL. The goal is to explore a retail database to understand its structure, evaluate data quality, and extract actionable business insights regarding customers, products, and sales performance.

## 🛠️ Analytical Workflow

### **Step 1: Database Exploration**
* Initial mapping of the database structure.
* Exploring all available tables and columns using `INFORMATION_SCHEMA` to understand data types and relationships.

### **Step 2: Dimension Exploration**
* Investigating categorical data such as Country, Product Categories, and Subcategories.
* Identifying the unique "building blocks" of the business.

### **Step 3: Date Exploration**
* Analyzing the timeframe of the dataset (finding the first and last order dates).
* Calculating customer demographics, such as identifying the youngest and oldest customers using date functions.

### **Step 4: Measures Exploration**
* Calculating high-level Business KPIs:
    * Total Sales Revenue
    * Total Items Sold
    * Average Selling Price
    * Unique Order and Customer Counts
* Consolidating these metrics into a single report using `UNION ALL`.

### **Step 5: Magnitude Analysis**
* Breaking down performance by category and geography.
* Analyzing total customers by country and gender.
* Calculating total revenue and volume distribution across different product categories.

### **Step 6: Ranking Top N / Bottom N**
* Identifying the "Stars" and "Laggards" of the inventory.
* Ranking the Top 5 products by revenue.
* Identifying the 5 worst-performing products to highlight areas for business improvement.

## 🚀 Skills Demonstrated
* **Metadata Analysis:** Navigating system schemas.
* **Complex Aggregations:** Using `SUM`, `AVG`, `COUNT(DISTINCT)`.
* **Data Transformation:** Implementing `CASE` statements and `DATEDIFF`.
* **Table Relationships:** Utilizing `LEFT JOIN` to combine sales data with product and customer details.
* **Consolidated Reporting:** Mastering `UNION ALL` for multi-metric summaries.
