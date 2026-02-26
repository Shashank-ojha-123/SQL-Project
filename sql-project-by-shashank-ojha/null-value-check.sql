select count(*) as total_rows, 
count(order_id) as order_count, 
count(customer_id) as customer_count,
count(order_status) as order_status,
count(order_purchase_timestamp) as count_purchase_timestamp,
count(order_approved_at) as order_approved_count ,
count(order_delivered_carrier_date) as carrier_count,
count(order_delivered_customer_date) as delivered_count,
count(order_estimated_delivery_date) as  estimated_delivery_date_count
from olist_orders