-- ========================================================
-- INDIA COAL MARKET ANALYSIS (2010-11 to 2014-15)
-- Database: MySQL 
-- ========================================================

-- 1. Top 5 Coal Producing States Across All 5 Years
SELECT 
    state,
    SUM(quantity_000tonne) AS total_production_000t,
    ROUND(SUM(value_inr) / 10000000.0, 2) AS total_value_cr
FROM coal_production
WHERE state != 'India'
GROUP BY state
ORDER BY total_production_000t DESC
LIMIT 5;

-- 2. Yearly State Production Ranking (Window Function)
SELECT 
    year,
    state,
    quantity_000tonne,
    DENSE_RANK() OVER (PARTITION BY year ORDER BY quantity_000tonne DESC) AS state_rank
FROM coal_production
WHERE state != 'India'
ORDER BY year, state_rank;

-- 3. Year-over-Year (YoY) Growth for Top 3 States (LAG Function)
WITH state_yearly AS (
    SELECT 
        state,
        year,
        quantity_000tonne,
        LAG(quantity_000tonne) OVER (PARTITION BY state ORDER BY year) AS prev_year_qty
    FROM coal_production
    WHERE state IN ('Chhattisgarh', 'Jharkhand', 'Odisha')
)
SELECT 
    state,
    year,
    quantity_000tonne,
    prev_year_qty,
    ROUND(((quantity_000tonne - prev_year_qty) / NULLIF(prev_year_qty, 0)) * 100.0, 2) AS yoy_growth_pct
FROM state_yearly;

-- 4. Market Share % Contribution by State
WITH total_national AS (
    SELECT SUM(quantity_000tonne) AS national_total
    FROM coal_production
    WHERE state != 'India'
)
SELECT 
    c.state,
    SUM(c.quantity_000tonne) AS state_total,
    ROUND((SUM(c.quantity_000tonne) * 100.0 / t.national_total), 2) AS market_share_pct
FROM coal_production c
CROSS JOIN total_national t
WHERE c.state != 'India'
GROUP BY c.state, t.national_total
ORDER BY market_share_pct DESC;