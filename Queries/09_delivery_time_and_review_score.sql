-- ================================================
-- Query: Late Delivery Impact on Review Scores
-- Author: Shashank
-- ================================================

-- Business Question:
-- Do late deliveries result in significantly
-- lower customer review scores?

-- Tables Used:
-- olist_orders, olist_order_reviews

-- Key Finding:
-- Late deliveries average 2.57 vs 4.29 for
-- on time deliveries — a 1.72 point difference
-- on a 5 point scale representing 34% lower
-- customer satisfaction
-- This is the strongest and most actionable
-- finding in the entire analysis

-- ================================================
select 
(case when o.order_delivered_customer_date>order_estimated_delivery_date then 'Late' else 'Ontime' end) 
as delivery_status,
round(avg(r.review_score ),2)as avg_review_score, 
count(distinct o.order_id) as total_orders
from olist_orders o
join olist_order_reviews r
on o.order_id=r.order_id
where order_status = 'delivered' and order_delivered_customer_date is not null
group by delivery_status
