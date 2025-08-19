--- Total Revenue
SELECT SUM(ps.total_price) AS total_revenue FROM pizza_sales ps;

--- Average Order Value
SELECT (SUM(ps.total_price) / COUNT(DISTINCT ps.order_id)) AS avg_order_value FROM pizza_sales ps;

--- Total pizzas Sold
SELECT SUM(ps.quantity) AS total_pizzAS_sold FROM pizza_sales ps;

--- Total Orders
SELECT COUNT(DISTINCT ps.order_id) AS total_orders FROM pizza_sales ps;

--- Average Pizzas Per Order
SELECT CAST(CAST(SUM(ps.quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT ps.order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS avg_pizzas_per_order FROM pizza_sales ps;

