-- connected order_items with orders using order_id
alter table olist_order_items
add constraint fk_order_items_orders
foreign key(order_id) references olist_orders(order_id);

-- connectd order_reviews with orders using order_id 
alter table olist_order_reviews
add constraint fk_reviews_orders
foreign key(order_id) references olist_orders(order_id);

-- connect order_payments with order_payments using order_id
alter table olist_order_payments
add constraint fk_payments_orders
foreign key(order_id) references olist_orders(order_id)

-- conncect orders with customers using customer_id
alter table olist_orders
add constraint fk_orders
foreign key(customer_id) references olist_customers(customer_id)

-- conncect order_items with products using product_id
alter table olist_order_items
add constraint fk_olist_order_items
foreign key(product_id) references olist_products(product_id)

-- conncect order_items with sellers using seller_id
alter table olist_order_items
add constraint fk_items_order
foreign key(seller_id) references olist_sellers(seller_id)

