-- =========================
-- KPI: REVENUE VS TARGET
-- =========================
SELECT 
    SUM(revenue) AS total_revenue,
    SUM(target_revenue) AS target_revenue,
    ROUND(SUM(revenue)*100.0 / SUM(target_revenue),2) AS achievement_pct
FROM fact_sales;

-- =========================
-- FUNNEL CONVERSION RATES
-- =========================
SELECT 
    ROUND(SUM(calls)*100.0 / SUM(leads),2) AS lead_to_call_pct,
    ROUND(SUM(meetings)*100.0 / SUM(calls),2) AS call_to_meeting_pct,
    ROUND(SUM(deals)*100.0 / SUM(meetings),2) AS meeting_to_deal_pct
FROM fact_sales;

-- =========================
-- BOTTLENECK (DROP-OFF %)
-- =========================
SELECT 
    'Leads → Calls' AS stage,
    ROUND(100 - (SUM(calls)*100.0 / SUM(leads)),2) AS drop_off_pct
FROM fact_sales
UNION ALL
SELECT 
    'Calls → Meetings',
    ROUND(100 - (SUM(meetings)*100.0 / SUM(calls)),2)
FROM fact_sales
UNION ALL
SELECT 
    'Meetings → Deals',
    ROUND(100 - (SUM(deals)*100.0 / SUM(meetings)),2)
FROM fact_sales;

-- =========================
-- TOP SALESPEOPLE (RANK)
-- =========================
SELECT 
    s.name,
    SUM(f.revenue) AS revenue,
    SUM(f.deals) AS deals,
    RANK() OVER (ORDER BY SUM(f.revenue) DESC) AS rank
FROM fact_sales f
JOIN dim_salesperson s ON f.salesperson_id = s.salesperson_id
GROUP BY s.name;

-- =========================
-- REVENUE TREND (MONTH)
-- =========================
SELECT 
    d.month,
    d.year,
    SUM(f.revenue) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.month, d.year, d.date_id
ORDER BY d.date_id;

-- =========================
-- REGION PERFORMANCE
-- =========================
SELECT 
    r.region_name,
    SUM(f.revenue) AS revenue,
    ROUND(SUM(f.deals)*100.0 / SUM(f.leads),2) AS conversion_rate
FROM fact_sales f
JOIN dim_region r ON f.region_id = r.region_id
GROUP BY r.region_name
ORDER BY revenue DESC;

-- =========================
-- PRODUCT PERFORMANCE
-- =========================
SELECT 
    p.product_name,
    SUM(f.revenue) AS revenue,
    SUM(f.deals) AS deals
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;
