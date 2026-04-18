-- View entire dataset
SELECT * FROM sales;

-- Total revenue by region
SELECT region, SUM(revenue) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Top 10 products by revenue
SELECT product, SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 10;

-- Monthly sales trend
SELECT month, SUM(revenue) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- Profit by category
SELECT category, SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;
