

---- A. KPI’s


select * from pizza_sales;

select SUM(total_price) as Total_Revenue
from pizza_sales;


select SUM(total_price)/COUNT(distinct order_id) as Avg_Order_Value
from pizza_sales;


select SUM(quantity) as Total_Pizza_Sold
from pizza_sales;


select COUNT(distinct order_id) as Total_Orders
from pizza_sales;


select CAST (CAST( SUM(quantity) as decimal (10,2)) /
             CAST( COUNT(distinct order_id)  as decimal (10,2)) as decimal (10,2))
	   as Avg_Pizzas_Per_Order
from pizza_sales;





--- B. Daily Trend for Total Orders

select * from pizza_sales;

select DATENAME(DW, order_date) as order_day,
        COUNT (distinct order_id) as total_orders
from pizza_sales
group by DATENAME(DW, order_date);


--- C. Monthly Trend for Orders

select DATENAME(MONTH , order_date) as Month_name,
       COUNT(distinct order_id) as Total_orders
from pizza_sales
group by DATENAME(MONTH , order_date)
order by Total_orders desc;



--- D. % of Sales by Pizza Category

select pizza_category , SUM(total_price)*100 / (select SUM(total_price) from pizza_sales) as PCT
from pizza_sales 
group by pizza_category;



--- E. % of Sales by Pizza Size

select pizza_size, SUM(total_price)*100 / (select SUM(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_size;



---  F. Total Pizzas Sold by Pizza Category

select pizza_category, SUM(quantity) as Total_Quantity_Sold
from pizza_sales
group by pizza_category
order by Total_Quantity_Sold desc



--- G. Top 5 Pizzas by Revenue

select * from pizza_sales;

select Top 5 pizza_name, sum(total_price) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue desc;



----  H. Bottom 5 Pizzas by Revenue

select Top 5 pizza_name, sum(total_price) as Total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue asc;


--- I. Top 5 Pizzas by Quantity          

select top 5 pizza_name , sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold desc;


--- J. Bottom 5 Pizzas by Quantity

select top 5 pizza_name , sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold asc;


----  K. Top 5 Pizzas by Total Orders            

select top 5 pizza_name , count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders desc;

---- L. Bottom 5 Pizzas by Total Orders

select top 5 pizza_name , count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders asc;