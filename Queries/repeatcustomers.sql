How much revenue comes from repeat customers vs one-time buyers?

WITH CustomerType AS(
	select
	o.customer_id,
	Count(DISTINCT o.order_id) as Orders_count,
	case 
	when Count(o.order_id)= 1 then 'New Customer'
	else 'Repeat Customer'
	end as CustomerType
	from orders o 
	where o.order_status = 'Completed'
	GROUP BY o.customer_id
	),
	
	Completedorders AS
	(
	
	select
	o.customer_id,
	SUM(p.price * oi.quantity - oi.discount ) as Total_Revenue
	from orders o 
	join order_items oi
	on o.order_id = oi.order_id
	join products p
	on oi.product_id = p.product_id
	where o.order_status = 'Completed'
	GROUP BY o.customer_id
	
	),
	
	Customerrevenue as (
	select 
	ct.customertype,
	SUM(co.total_revenue) as Totalrevenue
	from customerType ct
	left join Completedorders co
	on ct.customer_id = co.customer_id
	GROUP BY ct.customertype
	)
	select
	customertype, Totalrevenue,
	ROUND((Totalrevenue / sum(Totalrevenue) over()) * 100,2)
	from Customerrevenue
`
