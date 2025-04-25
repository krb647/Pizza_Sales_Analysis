--PIZZA SALES SQL QUERIES

-- KPI’s
SELECT * FROM pizza_sales;

--1.Total Revenue:
SELECT ROUND(SUM(total_price),2) AS Total_Revenue 
FROM pizza_sales;

--2.Average Order Value
SELECT ROUND(SUM(total_price)/ 
COUNT(DISTINCT order_id),2) AS Avg_order_val 
FROM pizza_sales;

--3.Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold 
FROM pizza_sales;

--4.Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales;

--5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizza_per_order 
FROM pizza_sales;

-- VISUALIZATION QUERIES:

--1. Daily Trends for Total Orders
SELECT DATENAME(DW,order_date) AS order_day,COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date);

--2. Hourly Trends for Total Orders
SELECT DATEPART(HOUR,order_time) AS order_hours,COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time);

--3. % of Sales by Pizza Category
SELECT 
	pizza_category,
	ROUND(SUM(total_price),2) AS total_sales,
	ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) AS PCT_sales
FROM pizza_sales
GROUP BY pizza_category;

--4. % of Sales by Pizza Size
SELECT 
	pizza_size,
	ROUND(SUM(total_price),2) AS total_sales,
	ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) AS PCT_sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT_sales DESC;

--5. Total Pizzas Sold by Pizza Category
SELECT pizza_category,SUM(quantity) AS total_pizza
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_pizza DESC;

--6. Top 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name,SUM(quantity) AS total_pizza 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza DESC;

--7. Bottom 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name,SUM(quantity) AS total_pizza 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza;

















