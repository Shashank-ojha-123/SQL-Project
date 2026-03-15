 -- ================================================
-- Query: Top 10 Product Categories by Revenue
-- Author: Shashank Ojha
-- ================================================

-- Business Question:
-- Which product categories generate 
-- the most revenue for the platform?

-- Tables Used:
-- olist_products, olist_order_items, olist_orders

-- Key Finding:
-- Beauty and health leads revenue despite not
-- leading in order volume suggesting high average
-- order value in this category

-- ===============================================
 with productRevenue as (
 select i.order_id, i.Price as price, p.product_category_name as category,
 o.order_status  as orderStatus
 from olist_products p 
 join olist_order_items i
on p.product_id=i.Product_id
 join olist_orders o
on i.order_id = o.order_id)

select category,count(distinct order_id) as totalOrders,sum(price) as totalRevenue
from ProductRevenue
where orderStatus ='delivered'
group by category
order by totalRevenue desc 
limit 10;
