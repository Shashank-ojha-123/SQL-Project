-- ================================================
-- Query: Average Review Score by Product Category
-- Author: Shashank Ojha
-- ================================================

-- Business Question:
-- Which product categories receive the highest
-- and lowest customer review scores?

-- Tables Used:
-- olist_order_reviews, olist_order_items, 
-- olist_products

-- Methodology Note:
-- Categories below 25th percentile of review
-- count (75 reviews) excluded for statistical
-- reliability using PERCENTILE_CONT function

-- Key Finding:
-- Books highest rated at 4.45 reflecting simple
-- lightweight shipping
-- Office furniture lowest at 3.49 suggesting
-- systematic issues with large item delivery

-- ================================================
select round(avg(r.review_score),2) as avg_review_score ,
p.product_category_name as product_category,
count(distinct r.order_id ) as total_orders
from olist_order_reviews r
join olist_order_items o
on r.order_id=o.order_id
join olist_products p
on p.product_id=o.product_id 
where p.product_category_name is not null 
group by p.product_category_name
having count(distinct r.order_id)>75
order by avg_review_score asc
-- order by avg_review_score desc
limit 10;
