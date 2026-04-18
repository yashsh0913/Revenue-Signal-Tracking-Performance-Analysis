# Sales Dashboard (SQL + Power BI)

## Project Overview
This project was built to analyze sales data and understand how revenue, products, and regions are performing over time. The goal was to turn raw sales data into meaningful insights that can help in better business decision-making.

SQL was used to clean and aggregate the data, and Power BI was used to build an interactive dashboard for visualization.

---

## Tools Used
- SQL (Data exploration & analysis)
- Power BI (Dashboard & visualization)
- Excel / CSV (Dataset)

---

## What I Focused On
Instead of just building charts, I focused on answering real business questions like:
- Which regions are driving the most revenue?
- Which products are performing consistently well?
- How do sales change month by month?
- Which categories are actually generating profit?

---

## SQL Analysis

### Revenue by Region
```sql
SELECT region, SUM(revenue) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;
