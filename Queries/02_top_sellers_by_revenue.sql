-- ================================================
-- Query: Top 10 Sellers by Revenue
-- Author: Shashank Ojha
-- ================================================

-- Business Question:
-- Who are the top 10 sellers by total revenue
-- and how many orders did they fulfill?

-- Tables Used:
-- olist_order_items, olist_orders

-- Key Finding:
-- Highest revenue seller is not the highest volume
-- seller suggesting two distinct seller models exist
-- high value low volume vs high volume low value

-- ================================================
select oi.seller_id,sum(oi.price) as totalRevenue ,count(distinct o.order_id) as total_order
from olist_order_items oi
join olist_orders o
on oi.order_id=o.order_id
where order_status='delivered'
group by seller_id
order by totalRevenue desc
limit 10;
