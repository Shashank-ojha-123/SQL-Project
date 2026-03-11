select p.Payment_type ,p.payment_value,
order_purchase_timestamp,
 sum(Payment_value) over( order by o.order_purchase_timestamp) 
 from olist_order_payments p
 full join olist_orders o
 on p.order_id=o.order_id