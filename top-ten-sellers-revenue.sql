select oi.seller_id,sum(oi.price) as totalRevenue ,count(distinct o.order_id) as total_order
from olist_order_items oi
join olist_orders o
on oi.order_id=o.order_id
where order_status='delivered'
group by seller_id
order by totalRevenue desc
limit 10;
