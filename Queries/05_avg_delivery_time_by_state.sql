-- ================================================
-- Query: Average Delivery Time by Customer State
-- Author: Shashank Ojha
-- ================================================

-- Business Question:
-- What is the average delivery time in days
-- for each Brazilian state?

-- Tables Used:
-- olist_customers, olist_orders

-- Methodology Note:
-- States with fewer than 500 orders excluded
-- for statistical reliability based on order
-- distribution analysis

-- Key Finding:
-- Sao Paulo fastest delivery reflecting central
-- location and seller concentration
-- Paraiba slowest revealing northeast logistics gap

-- ================================================

with delivery_time_data as(select c.customer_state,
date(o.order_delivered_customer_date)- date(o.order_purchase_timestamp)  
as delivery_time,o.order_id
from olist_customers c
join olist_orders o
on c.customer_id=o.customer_id
where o.order_delivered_customer_date is not null)

select  customer_state, Round(avg(delivery_time),1) 
as avg_delivery_time,
count(distinct order_id) 
as total_orders 
from delivery_time_data
group by customer_state
having count(distinct order_id)>500
order by avg_delivery_time asc
