select 'olist_customers' as table_name , count(*) as row_count from olist_orders
union all
select 'olist_geolocation' , count(*) from olist_geolocation
union all
select 'olist_order_items', count(*) from olist_order_items
union all 
select 'olist_order_payments', count(*) from olist_order_payments
union all
select 'olist_order_reviews', count(*) from olist_order_reviews
union all
select 'olist_orders' , count(*) from olist_orders
union all 
select 'olist_products', count(*) from olist_products
union all
select 'olist_sellers', count(*) from olist_sellers