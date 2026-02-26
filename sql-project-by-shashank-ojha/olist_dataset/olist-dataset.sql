-- select count(*) from olist_order_items
select 'olist_customers' as table_name , count(*) as row_count from olist_customers
union all
select 'olist_orders',count(*) from olist_orders
