-- Daily Trend for Total Orders
SELECT
    TO_CHAR(ps.order_date, 'Day') AS order_day,
    COUNT(DISTINCT ps.order_id) AS total_orders
FROM pizza_sales AS ps
GROUP BY TO_CHAR(ps.order_date, 'Day'), EXTRACT(DOW FROM ps.order_date)
ORDER BY EXTRACT(DOW FROM ps.order_date);

-- Monthly Trend for Total Orders
SELECT
    TO_CHAR(ps.order_date, 'Month') AS order_month,
    COUNT(DISTINCT ps.order_id) AS total_orders
FROM pizza_sales AS ps
GROUP BY TO_CHAR(ps.order_date, 'Month'), EXTRACT(MONTH FROM ps.order_date)
ORDER BY EXTRACT(MONTH FROM ps.order_date);

-- Percentage of Sales by Pizza Category
SELECT
    ps.pizza_category,
    SUM(ps.total_price) AS total_sales,
    CAST(SUM(ps.total_price)*100/(SELECT SUM(total_price) FROM pizza_sales WHERE EXTRACT(MONTH FROM order_date) = 1) AS DECIMAL(10,2)) AS pct
FROM pizza_sales AS ps
WHERE EXTRACT(MONTH FROM ps.order_date) = 1
GROUP BY ps.pizza_category;

-- Percentage of Sales by Pizza Size
SELECT
    ps.pizza_size,
    SUM(ps.total_price) AS total_sales,
    CAST(SUM(ps.total_price)*100/(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS pct
FROM pizza_sales AS ps
GROUP BY ps.pizza_size;

-- Total Pizzas Sold by Pizza Category
SELECT
    ps.pizza_category,
    SUM(ps.quantity) AS sold_pizzas
FROM pizza_sales AS ps
GROUP BY ps.pizza_category;

-- Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
SELECT
    ps.pizza_name,
    SUM(ps.total_price) AS revenue
FROM pizza_sales AS ps
GROUP BY ps.pizza_name
ORDER BY revenue DESC
LIMIT 5;

-- Top 5 Worst Sellers by Revenue, Total Quantity and Total Orders
SELECT
    ps.pizza_name,
    SUM(ps.total_price) AS revenue
FROM pizza_sales AS ps
GROUP BY ps.pizza_name
ORDER BY revenue
LIMIT 5;

