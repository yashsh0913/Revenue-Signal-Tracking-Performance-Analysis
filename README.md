# Sales Dashboard (SQL + Power BI)

## Project Overview
This project analyzes sales data to identify key business insights such as revenue trends, top-performing products, regional performance, and category-wise profitability. SQL is used for data analysis and Power BI is used for visualization.

## Tools Used
- SQL
- Power BI
- Excel / CSV

## Key Insights
- Identified top-performing regions based on revenue  
- Found top 10 products contributing the highest revenue  
- Analyzed monthly sales trends  
- Evaluated category-wise profit performance  

## SQL Queries

### Total Revenue by Region
SELECT region, SUM(revenue) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

### Top 10 Products by Revenue
SELECT product, SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 10;

### Monthly Sales Trend
SELECT month, SUM(revenue) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

### Profit by Category
SELECT category, SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

## Dashboard
![Sales Dashboard](dashboard.png)

## Outcome
This project helps understand sales performance and supports data-driven business decisions.
