-- ================================================
-- Query: Revenue and Order Value
-- Author: Shashank Ojha
-- ================================================

-- Business Question:
-- What are the headline business metrics
-- for the entire delivered orders dataset?

-- Tables Used:
-- olist_orders, olist_order_items

-- Key Finding:
-- 96,478 delivered orders generating R$13.2M 
-- total revenue with average order value of R$119.98

-- ================================================

SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    ROUND(SUM(oi.price)::numeric, 2) AS total_revenue,
    ROUND(AVG(oi.price)::numeric, 2) AS avg_order_value
FROM olist_orders o
JOIN olist_order_items oi 
    ON o.order_id = oi.order_id
WHERE order_status = 'delivered';