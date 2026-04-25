-- =========================
-- DROP TABLES (for reruns)
-- =========================
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_salesperson;
DROP TABLE IF EXISTS dim_region;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_date;

-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_salesperson (
    salesperson_id SERIAL PRIMARY KEY,
    name TEXT,
    team TEXT
);

CREATE TABLE dim_region (
    region_id SERIAL PRIMARY KEY,
    region_name TEXT
);

CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    category TEXT
);

CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,
    month TEXT,
    quarter TEXT,
    year INT
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    id SERIAL PRIMARY KEY,
    salesperson_id INT REFERENCES dim_salesperson(salesperson_id),
    region_id INT REFERENCES dim_region(region_id),
    product_id INT REFERENCES dim_product(product_id),
    date_id INT REFERENCES dim_date(date_id),
    leads INT,
    calls INT,
    meetings INT,
    deals INT,
    revenue INT,
    target_revenue INT
);

-- =========================
-- INSERT DIMENSION DATA
-- =========================

INSERT INTO dim_salesperson (name, team) VALUES
('Amit','Team A'),
('Rahul','Team A'),
('Neha','Team B'),
('Priya','Team B');

INSERT INTO dim_region (region_name) VALUES
('North'), ('South'), ('East'), ('West');

INSERT INTO dim_product (product_name, category) VALUES
('Product A','Software'),
('Product B','Hardware'),
('Product C','Service');

INSERT INTO dim_date (month, quarter, year) VALUES
('Jan','Q1',2025),
('Feb','Q1',2025),
('Mar','Q1',2025),
('Apr','Q2',2025);

-- =========================
-- INSERT FACT DATA
-- =========================

INSERT INTO fact_sales
(salesperson_id, region_id, product_id, date_id, leads, calls, meetings, deals, revenue, target_revenue)
VALUES
(1,1,1,1,120,90,60,30,300000,320000),
(2,2,2,1,100,80,50,25,250000,260000),
(3,3,3,2,90,70,40,20,200000,220000),
(4,4,1,2,110,85,55,28,280000,300000),

(1,1,2,3,130,95,65,35,350000,340000),
(2,2,3,3,105,85,52,27,270000,280000),
(3,3,1,4,95,75,45,22,220000,240000),
(4,4,2,4,115,88,58,30,300000,310000);
