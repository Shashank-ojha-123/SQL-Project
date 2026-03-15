-- ================================================
-- Query: Top 10 Product Categories by Order Count
-- Author: Shashank Ojha
-- ================================================

-- Business Question:
-- Which product categories have the highest
-- order volume on the platform?

-- Tables Used:
-- olist_products, olist_order_items, olist_orders

-- Key Finding:
-- Bed table and bath leads order volume but ranks
-- third by revenue confirming it is a high volume
-- moderate value category unlike beauty and health

-- ================================================
select product_category_name, count( distinct o.order_id) as total_orders
from olist_products p
join olist_order_items i
on p.product_id=i.product_id
join olist_orders o
on o.order_id=i.order_id
where product_category_name is not null and order_status = 'delivered'
group by product_category_name
order by total_orders desc
limit 10;
