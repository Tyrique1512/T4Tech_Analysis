--What were the order counts, sales and AOV for Macbooks sold in North America for each quarter across all years?
SELECT date_trunc(ord.purchase_ts, quarter) quarter,
        count(distinct ord.id) order_count,
        round((sum(ord.usd_price)),2) total_sales,
        round((avg(ord.usd_price)), 2) aov

FROM core.orders ord
 LEFT JOIN core.customers cust 
  ON ord.customer_id=cust.id
 LEFT JOIN core.geo_lookup geo
  ON cust.country_code=geo.country_code

WHERE ord.product_name = 'Macbook Air Laptop' AND geo.region= 'NA'

GROUP BY 1
ORDER BY 1

--What is the average quarterly order count and total sales for Macbooks sold in North America (i.e. "For North America MacBooks, average of x units sold per quarter and Y in dollar sales per quarter")

WITH qtr_sales AS (SELECT date_trunc(ord.purchase_ts, quarter) purchase_quarter,
        count(distinct ord.id) order_count,
        round((sum(ord.usd_price)),2) total_sales,
        round((avg(ord.usd_price)), 2) aov

        FROM core.orders ord
        LEFT JOIN core.customers cust 
        ON ord.customer_id=cust.id
        LEFT JOIN core.geo_lookup geo
        ON cust.country_code=geo.country_code

        WHERE ord.product_name = 'Macbook Air Laptop' AND geo.region= 'NA'

        GROUP BY 1
        ORDER BY 1)

SELECT round((avg(qtr_sales.order_count)), 2) avg_qtr_sales_count,
        round((avg(qtr_sales.total_sales)), 2) avg_qtr_sales_revenue

FROM qtr_sales

--For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver?

SELECT  geo.region,
        avg(date_diff(o_sts.delivery_ts, o_sts.purchase_ts, day)) avg_delivery_time

FROM core.order_status o_sts
 LEFT JOIN core.orders ord
  ON o_sts.order_id= ord.id
 LEFT JOIN core.customers cust
  ON ord.customer_id = cust.id
 LEFT JOIN core.geo_lookup geo
  ON cust.country_code = geo.country_code
WHERE (extract(year FROM o_sts.purchase_ts)= 2022 AND ord.purchase_platform= 'website') OR ord.purchase_platform= 'mobile'
GROUP BY 1
ORDER BY 2 DESC

--For products purchased in 2022 on the website or Samsung purchases made in 2021, which region has the average highest time to deliver in weeks?

SELECT  geo.region,
        avg(date_diff(o_sts.delivery_ts, o_sts.purchase_ts, week)) delivery_time_weeks

FROM core.order_status o_sts
 LEFT JOIN core.orders ord
  ON o_sts.order_id=ord.id
 LEFT JOIN core.customers cust
  ON ord.customer_id=cust.id
 LEFT JOIN core.geo_lookup geo
  ON cust.country_code=geo.country_code

WHERE (extract(year FROM o_sts.purchase_ts)= 2022 AND ord.purchase_platform= 'website') OR (extract(year FROM o_sts.purchase_ts)= 2021 AND ord.product_name LIKE 'Samsung%')

GROUP BY 1
ORDER BY 2 DESC

--What was the refund rate and refund count for each product overall?
SELECT  ord.product_name,
        count(o_sts.refund_ts) refund_count,
        (count(o_sts.refund_ts)/count(o_sts.purchase_ts))*100 refund_rate_percentage

FROM core.order_status o_sts
 LEFT JOIN core.orders ord 
  ON o_sts.order_id=ord.id

GROUP BY 1

----What was the refund rate and refund count for each product overall?

SELECT case when product_name= '27in"" 4k gaming monitor' then '27in 4K gaming monitor' else product_name end as product_clean,
 SUM(case when refund_ts is not null then 1 else 0 end) as refunds,
 avg(case when refund_ts is not null then 1 else 0 end) as refund_rate

from core.orders
left join core.order_status 
 on orders.id=order_status.order_id

GROUP BY 1


-- Within each region, what is the most popular product?
WITH popularity AS(
 SELECT geo.region as region_name,
    ord.product_name as product_name,
    count(ord.id) as order_count
 FROM core.order_status ord_sts 
  LEFT JOIN core.orders ord   
    ON ord_sts.order_id=ord.id
  LEFT JOIN core.customers cust
    ON ord.customer_id=cust.id
  LEFT JOIN core.geo_lookup geo
    ON geo.country=cust.country_code
  GROUP BY 1,2), 

 product_rank AS(
 SELECT *,
 ROW_NUMBER() over(partition by popularity.region_name order by popularity.order_count DESC) AS ranking
 FROM popularity)

 SELECT *
 FROM product_rank
 WHERE ranking=1

-- How does the time to make a purchase differ between loyalty customers and non-loyalty customers?

SELECT case when cust.loyalty_program= 1 then 'loyalty' else 'non-loyalty' end as loyalty_sts,
 round(avg(date_diff(ord.purchase_ts, cust.created_on , day)), 2)  as days_to_purchase,
 round(avg(date_diff(ord.purchase_ts, cust.created_on , month)), 2)  as months_to_purchase

FROM core.order_status ord_sts
 JOIN core.orders ord
  ON ord_sts.order_id=ord.id
 JOIN core.customers cust
  ON ord.customer_id=cust.id

GROUP BY 1