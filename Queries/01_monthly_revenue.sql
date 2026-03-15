-- ================================================
-- Query: Monthly Revenue and Order Trend
-- Author: Shashank Ojha
-- ================================================

-- Business Question:
-- What is the monthly revenue and order trend
-- across the entire dataset period?

-- Tables Used:
-- olist_orders, olist_order_payments

-- Key Finding:
-- Consistent growth from 2016 to 2018 with 
-- November 2017 representing peak revenue
-- coinciding with Black Friday shopping event

-- ================================================
select 
To_char(o.order_purchase_timestamp, 'YYYY-MM') as year_month,
count(distinct o.order_id) as total_orders ,round(sum(i.price),2) as total_revenue
from olist_orders o
join olist_order_items i
on o.order_id=i.order_id
where o.order_status ='delivered' and o.order_delivered_customer_date is not null
group by year_month
order by year_month asc
