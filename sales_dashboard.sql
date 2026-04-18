-- =========================================
-- Sales Performance Dashboard Project
-- =========================================

-- 1. Create Table
CREATE TABLE business_performance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesperson VARCHAR(100),
    region VARCHAR(50),
    quarter VARCHAR(10),
    product VARCHAR(100),
    calls INT,
    meetings INT,
    deals INT,
    revenue DECIMAL(12,2)
);

-- =========================================
-- 2. Insert Data
-- =========================================

INSERT INTO business_performance 
(salesperson, region, quarter, product, calls, meetings, deals, revenue)
VALUES
('Aisha', 'North', 'Q1', 'Enterprise Suite', 77, 31, 13, 220155),
('Aisha', 'North', 'Q1', 'Add-ons', 69, 21, 7, 82677),
('Aisha', 'North', 'Q1', 'Starter Plan', 110, 42, 19, 321632),
('Aisha', 'North', 'Q2', 'Professional', 78, 34, 13, 123747),

('Rahul', 'South', 'Q1', 'Enterprise Suite', 65, 28, 11, 198500),
('Rahul', 'South', 'Q1', 'Starter Plan', 120, 50, 22, 350000),

('Neha', 'West', 'Q1', 'Add-ons', 70, 25, 10, 90000),
('Neha', 'West', 'Q2', 'Enterprise Suite', 80, 30, 14, 230000);

-- =========================================
-- 3. Analysis Queries
-- =========================================

-- View Data
SELECT * FROM business_performance;

-- Total Revenue
SELECT SUM(revenue) AS total_revenue 
FROM business_performance;

-- Revenue by Salesperson
SELECT salesperson, SUM(revenue) AS total_revenue
FROM business_performance
GROUP BY salesperson
ORDER BY total_revenue DESC;

-- Revenue by Region
SELECT region, SUM(revenue) AS total_revenue
FROM business_performance
GROUP BY region
ORDER BY total_revenue DESC;

-- Conversion Rate (Efficiency)
SELECT 
    salesperson,
    SUM(deals) * 1.0 / SUM(calls) AS conversion_rate
FROM business_performance
GROUP BY salesperson;

-- Revenue by Product
SELECT product, SUM(revenue) AS total_revenue
FROM business_performance
GROUP BY product
ORDER BY total_revenue DESC;

-- Top Performer
SELECT salesperson, SUM(revenue) AS total_revenue
FROM business_performance
GROUP BY salesperson
ORDER BY total_revenue DESC
LIMIT 1;