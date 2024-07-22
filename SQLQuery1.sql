
select order_id , Sum(total_price)
from pizza_sales_excel_file
group by order_id
order by order_id;

select sum(total_price) / count(Distinct order_id)
as Avg_Order_value
from pizza_sales_excel_file 

select sum(quantity) as Total_Pizza_Sold from pizza_sales_excel_file

/**Pizzas per order **/
select cast(cast(sum(quantity) as decimal(10,2)) / cast(max(order_id) as decimal(10,2)) as decimal(10,2))
as Avg_pizzas_per_Order from pizza_sales_excel_file

/** CHARTS REQ **/
select * from pizza_sales_excel_file

select DATENAME(DW , order_date) as order_day , count(distinct order_id) as Total_orders 
from pizza_sales_excel_file
group by DATENAME(DW , order_date)

select datename(Month , order_date) as month_name, count(distinct order_id) as Total_orders
from pizza_sales_excel_file
group by datename(Month , order_date)
order by Total_orders desc

select pizza_category , sum(total_price) * 100 / (
	select sum(total_price) from pizza_sales_excel_file
	where month(order_date) = 1
) as "Sales(%age)"
from pizza_sales_excel_file
where month(order_date) = 1
group by pizza_category


select pizza_size , sum(total_price) * 100 / (
	select sum(total_price) from pizza_sales_excel_file
	where month(order_date) = 1
) as "Sales(%age)"
from pizza_sales_excel_file
where month(order_date) = 1
group by pizza_size
order by "Sales(%age)" desc


SELECT top 5 pizza_name , SUM(total_price) as Total_revenue 
from pizza_sales_excel_file
group by pizza_name
order by Total_revenue desc

SELECT top 5 pizza_name , SUM(quantity) as Total_quantity
from pizza_sales_excel_file
group by pizza_name
order by Total_quantity 

SELECT top 5 pizza_name , count(distinct order_id) as Total_orders
from pizza_sales_excel_file
group by pizza_name
order by Total_orders


