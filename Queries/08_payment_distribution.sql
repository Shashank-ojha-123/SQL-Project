-- ================================================
-- Query: Payment Method Distribution
-- Author: Shashank Ojha
-- ================================================

-- Business Question:
-- What payment methods do customers use and
-- what is the distribution across payment types?

-- Tables Used:
-- olist_order_payments

-- Key Finding:
-- Credit card dominates at 75% reflecting
-- Brazilian preference for installment payments
-- Boleto remains significant at 19% suggesting
-- diverse payment infrastructure needed

-- ================================================

select payment_type, count(distinct order_id) as total_orders , 
Round(count(distinct order_id)*100.0/sum(count(distinct order_id)) 
over(),2) as percentage
from olist_order_payments
group by payment_type
order by percentage desc
