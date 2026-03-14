# 🛒 Olist E-Commerce SQL Analysis
### PostgreSQL | Advanced SQL | Business Intelligence

---

## 📊 Project Overview
![Data Overview](screenshots/00_data_overview.png)

---

## 📌 About This Project
Analyzed a real Brazilian e-commerce dataset from Olist 
marketplace containing over 100,000 orders across 8 
related tables. The goal was to answer key business 
questions around revenue performance, seller behavior, 
delivery logistics, customer satisfaction and payment 
preferences using advanced PostgreSQL techniques.

| Detail | Info |
|---|---|
| Dataset | Olist Brazilian E-Commerce (Kaggle) |
| Tool | PostgreSQL 18 |
| Tables | 8 related tables |
| Total Delivered Orders | 96,478 |
| Total Revenue | R$13,221,498 |
| Average Order Value | R$119.98 |
| Time Period | 2016 - 2018 |

---

## ❓ Business Problems Solved

1. What are the headline revenue and order KPIs?
2. How has monthly revenue trended over time?
3. Which product categories drive the most revenue?
4. Which product categories have the highest order volume?
5. Who are the top 10 sellers by revenue?
6. How does delivery time vary across Brazilian states?
7. What percentage of orders are delivered late?
8. Which product categories receive best and worst reviews?
9. What payment methods do customers prefer?
10. Does late delivery directly impact customer satisfaction?

---

## 🔍 Key Insights

**1. Late Delivery is the Strongest Driver of 
Customer Dissatisfaction**
Late deliveries average 2.57 review score versus 
4.29 for on time deliveries — a 1.72 point difference 
on a 5 point scale representing 34% lower customer 
satisfaction. With 8% of all delivered orders arriving 
late this is the single most actionable finding 
in the entire analysis.

**2. Revenue Leadership and Volume Leadership 
Belong to Different Categories**
Beauty and health products lead in total revenue 
while bed, table and bath products lead in order 
volume. This reveals two distinct customer purchasing 
patterns — high value infrequent purchases vs 
affordable everyday purchases.

**3. Top Revenue Seller is Not Top Volume Seller**
The highest revenue seller operates a high value 
low volume model while the highest order count seller 
operates a high volume low value model — two distinct 
seller business profiles requiring different platform 
support strategies.

**4. Northeast Brazil Has a Significant Logistics Gap**
After excluding states with fewer than 500 orders 
for statistical reliability, Paraiba shows the slowest 
average delivery time while Sao Paulo is fastest. 
The northeast region consistently underperforms on 
delivery speed representing both a service challenge 
and market opportunity.

**5. Office Furniture Has Systematic Customer 
Satisfaction Issues**
Office furniture is the lowest rated category at 
3.49 across 1,263 statistically reliable orders 
suggesting systematic issues with large item 
shipping, packaging or assembly experience.

**6. Credit Card Dominates But Boleto Remains Critical**
Credit card accounts for 75% of payments reflecting 
Brazilian consumer preference for installment purchases. 
Boleto bank slip at 19% indicates a significant 
customer segment requiring traditional payment 
infrastructure to be maintained.

**7. Black Friday Drives November Revenue Spike**
November 2017 represents peak monthly revenue 
coinciding with Black Friday — Brazil's largest 
shopping event. Consistent month over month growth 
confirms successful platform scaling throughout 
the 2016 to 2018 period.

**8. Books are Easiest to Satisfy, 
Furniture Hardest**
Books are the highest rated category at 4.45 
reflecting straightforward lightweight shipping. 
Office furniture at 3.49 reflects the complexity 
of large item logistics. The gap of nearly 1 full 
point on a 5 point scale is significant and actionable.

---

## 💡 Business Recommendations

1. **Make delivery reliability the top priority**
   The 1.72 point review score gap between late and 
   on time deliveries makes logistics improvement 
   the single highest ROI investment for customer 
   satisfaction improvement

2. **Invest in northeast logistics infrastructure**
   Paraiba and surrounding states show consistently 
   slow delivery times representing both a service 
   gap and untapped market opportunity

3. **Develop separate strategies for high value 
   vs high volume sellers**
   These two seller profiles have fundamentally 
   different needs and risks requiring tailored 
   retention and growth strategies

4. **Fix office furniture delivery experience**
   Lowest rated category at 3.49 with over 1,000 
   reliable data points suggests systematic packaging 
   or logistics failures for large items requiring 
   dedicated operational solution

5. **Maintain broad payment infrastructure**
   Despite credit card dominance at 75%, boleto at 
   19% represents nearly 1 in 5 customers who cannot 
   be ignored in payment strategy decisions

6. **Prepare inventory and logistics for November**
   Black Friday consistently drives peak demand 
   requiring advance seller preparation, inventory 
   stocking and logistics capacity planning

---

## 🛠️ SQL Techniques Demonstrated

**Joins:**
- INNER JOIN across 3 and 4 tables simultaneously
- Chaining multiple JOINs through foreign keys
- Proper alias usage for readability

**Aggregations:**
- SUM, COUNT, AVG with GROUP BY
- DISTINCT counts for accurate unique record counting
- ROUND with type casting for clean formatting

**Filtering:**
- WHERE with multiple conditions
- NULL handling with IS NOT NULL
- HAVING for post aggregation filtering
- Statistical threshold decisions using distribution 
  analysis

**Advanced Techniques:**
- CTEs for readable multi step analysis
- Window functions — SUM() OVER() for percentage 
  calculations without subqueries
- CASE WHEN for conditional logic and categorization
- PERCENTILE_CONT for data driven threshold decisions
- TO_CHAR for date formatting and time series
- DATE arithmetic for delivery time calculations
- Subqueries for complex multi step problems

---

## 📊 Query Index

| # | Business Question | Key Finding |
|---|---|---|
| 00 | Business Overview KPIs | 96,478 orders, R$13.2M revenue |
| 01 | Monthly Revenue Trend | Peak November 2017 — Black Friday |
| 02 | Top 10 Sellers by Revenue | High value vs high volume seller profiles |
| 03 | Top Categories by Revenue | Beauty and health leads revenue |
| 04 | Top Categories by Orders | Bed table bath leads volume |
| 05 | Delivery Time by State | SP fastest, PB slowest — NE gap |
| 06 | Late Delivery Percentage | 8% of orders delivered late |
| 07 | Review Score by Category | Books 4.45, Office furniture 3.49 |
| 08 | Payment Distribution | Credit card 75%, Boleto 19% |
| 09 | Late Delivery vs Review Score | 1.72 point satisfaction gap |

---

## 📁 Repository Structure
```
Olist-Ecommerce-SQL-Analysis/
│
├── README.md
│
├── queries/
│   ├── 00_business_overview.sql
│   ├── 01_monthly_revenue.sql
│   ├── 02_top_sellers.sql
│   ├── 03_top_categories_revenue.sql
│   ├── 04_top_categories_orders.sql
│   ├── 05_delivery_time_by_state.sql
│   ├── 06_late_delivery_percentage.sql
│   ├── 07_review_score_by_category.sql
│   ├── 08_payment_distribution.sql
│   └── 09_late_delivery_vs_review.sql
│
├── screenshots/
│   ├── 00_business_overview.png
│   ├── 01_monthly_revenue.png
│   ├── 02_top_sellers.png
│   ├── 03_top_categories_revenue.png
│   ├── 04_top_categories_orders.png
│   ├── 05_delivery_time_by_state.png
│   ├── 06_late_delivery_percentage.png
│   ├── 07_review_score_by_category.png
│   ├── 08_payment_distribution.png
│   └── 09_late_delivery_vs_review.png
│
└── data/
    └── source_link.md
```

---

## 🔗 Database Schema and Relationships

| Table | Description | Approx Rows |
|---|---|---|
| olist_orders | Order headers and status | 99,000 |
| olist_customers | Customer details and location | 99,000 |
| olist_order_items | Individual items per order | 112,000 |
| olist_products | Product details and categories | 32,000 |
| olist_sellers | Seller details and location | 3,000 |
| olist_order_payments | Payment method and value | 103,000 |
| olist_order_reviews | Customer review scores | 99,000 |
| olist_geolocation | ZIP code coordinates | 1,000,000 |

**Table Relationships:**

| Table | Join Column | Related Table |
|---|---|---|
| olist_orders | customer_id | olist_customers |
| olist_orders | order_id | olist_order_items |
| olist_order_items | product_id | olist_products |
| olist_order_items | seller_id | olist_sellers |
| olist_orders | order_id | olist_order_payments |
| olist_orders | order_id | olist_order_reviews |

---

## 📉 Methodology and Threshold Decisions

**Delivery Time Analysis:**
States with fewer than 500 orders were excluded 
based on order distribution analysis showing a 
natural break in the data. This removed statistically 
unreliable remote states without impacting the 
meaningful analysis.

**Review Score Analysis:**
Categories below the 25th percentile of review 
count were excluded using PERCENTILE_CONT function 
which returned a threshold of 75 reviews. This 
data driven approach ensures all included categories 
have statistically reliable average scores.

**Revenue Analysis:**
All revenue calculations filtered to delivered 
orders only ensuring cancelled, returned and 
in transit orders do not inflate figures.

**Why These Thresholds Matter:**
Arbitrary thresholds were deliberately avoided. 
Every exclusion decision was based on either data 
distribution analysis or established statistical 
methods making all findings defensible and 
reproducible.

---

## 📂 Data Source
Dataset sourced from Kaggle:Olist Brazilian E-Commerce Dataset

Real anonymized commercial data from Olist — 
a Brazilian e-commerce marketplace connecting 
sellers to customers across Brazil.
Used for educational and portfolio purposes only.
