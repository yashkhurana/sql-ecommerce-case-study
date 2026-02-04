-- find monthly sales and month on month growth %

WITH monthlyrevenue as (

select
DATE_TRUNC('month',o.order_date) AS Month,
sum(oi.quantity * p.price - oi.discount) as totalsales
from orders o
join order_items oi
ON o.order_id = oi.order_id
join products p
ON oi.product_id = p.product_id
-- where o.order_status = 'Completed'
GROUP BY Month
ORDER BY month ASC

)

select 
Month,
totalsales,
(totalsales / lag(totalsales) OVER(order by month asc) - 1 ) * 100 as mom_growth_percent
_
from monthlyrevenue


