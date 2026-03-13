select  count(*) as total_orders,
sum(case when order_delivered_customer_date > order_estimated_delivery_date 
then 1 else 0 end) as late_orders,
Round(sum ( case when order_delivered_customer_date > order_estimated_delivery_date 
then 1 else 0 end)*100/count(*),2) as late_order_percentage
from olist_orders
where order_delivered_customer_date is not null and  order_status = 'delivered'
