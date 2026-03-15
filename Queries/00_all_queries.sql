-- ================================================
-- Olist E-Commerce SQL Analysis
-- Complete Query Collection
-- Author: Your Name
-- ================================================

-- Query 1: Monthly Revenue Trend
select 
To_char(o.order_purchase_timestamp, 'YYYY-MM') as year_month,
count(distinct o.order_id) as total_orders ,round(sum(i.price),2) as total_revenue
from olist_orders o
join olist_order_items i
on o.order_id=i.order_id
where o.order_status ='delivered' and o.order_delivered_customer_date is not null
group by year_month
order by year_month asc

-- Query 2: Top 10 Sellers by Revenue
select oi.seller_id,sum(oi.price) as totalRevenue ,count(distinct o.order_id) as total_order
from olist_order_items oi
join olist_orders o
on oi.order_id=o.order_id
where order_status='delivered'
group by seller_id
order by totalRevenue desc
limit 10;

-- Query 3: Top 10 Product Categories by Revenue
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

-- Query 4: Top 10 Product Categories by Order Count
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

-- Query 5: Average Delivery Time by Customer State

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

-- Query 6: Late Delivery Percentage

select  count(*) as total_orders,
sum(case when order_delivered_customer_date > order_estimated_delivery_date 
then 1 else 0 end) as late_orders,
Round(sum ( case when order_delivered_customer_date > order_estimated_delivery_date 
then 1 else 0 end)*100/count(*),2) as late_order_percentage
from olist_orders
where order_delivered_customer_date is not null and  order_status = 'delivered'

-- Query 7: Average Review Score by Product Category

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
limit 10;

-- Query 8: Payment Method Distribution

select payment_type, count(distinct order_id) as total_orders , 
Round(count(distinct order_id)*100.0/sum(count(distinct order_id)) 
over(),2) as percentage
from olist_order_payments
group by payment_type
order by percentage desc


-- Query 9: Late Delivery Impact on Review Scores
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

-- Query 10: Revenue and Order Value

SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    ROUND(SUM(oi.price)::numeric, 2) AS total_revenue,
    ROUND(AVG(oi.price)::numeric, 2) AS avg_order_value
FROM olist_orders o
JOIN olist_order_items oi 
    ON o.order_id = oi.order_id
WHERE order_status = 'delivered';              

