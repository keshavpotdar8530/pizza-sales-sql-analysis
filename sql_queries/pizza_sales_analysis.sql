-- =====================================================
-- PIZZA SALES SQL ANALYSIS
-- Queries used in the project
-- =====================================================

-- 1 Total Orders

SELECT
COUNT(order_id) AS Total_orders
FROM orders;

-- 2 Total Sales

SELECT
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS Total_sales
FROM order_details
JOIN pizzas
ON pizzas.pizza_id = order_details.pizza_id;

-- 3 Highest Priced Pizza

SELECT
pizza_types.name, pizzas.price
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- 4 Identify the most common pizza size ordered

SELECT
pizzas.size,
COUNT(order_details.order_details_id) AS Order_count
FROM pizzas
JOIN order_details
ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY Order_count DESC
LIMIT 1;

-- 5 Top 5 most ordered pizza types along with their quantities

SELECT
pizza_types.name,
SUM(order_details.quantity) AS Quantity
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Quantity DESC
LIMIT 5;

-- 6 Total quantity of each pizza category ordered

SELECT
pizza_types.category,
SUM(order_details.quantity) AS Quantity
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY Quantity DESC;

-- 7 Distribution of orders by hour of the day

SELECT
HOUR(order_time) AS hour,
COUNT(order_id) AS order_count
FROM orders
GROUP BY HOUR(order_time);

-- 8 Top 3 most ordered pizza types based on revenue

SELECT
pizza_types.name,
SUM(order_details.quantity * pizzas.price) AS revenue
FROM pizza_types
JOIN pizzas
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;

-- 9 Percentage contribution of each pizza category to total revenue

SELECT
pizza_types.category,
ROUND(
SUM(order_details.quantity * pizzas.price) /
(
SELECT SUM(order_details.quantity * pizzas.price)
FROM order_details
JOIN pizzas
ON pizzas.pizza_id = order_details.pizza_id
) * 100, 2
) AS revenue
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;

-- 10 Cumulative revenue generated over time

SELECT
order_date,
SUM(revenue) OVER (ORDER BY order_date) AS cum_revenue
FROM
(
SELECT
orders.order_date,
SUM(order_details.quantity * pizzas.price) AS revenue
FROM order_details
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
JOIN orders
ON orders.order_id = order_details.order_id
GROUP BY orders.order_date
) AS sales;

-- 11 Top 3 most ordered pizza types based on revenue for each category

SELECT name, revenue
FROM
(
SELECT
category,
name,
revenue,
RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rnk
FROM
(
SELECT
pizza_types.category,
pizza_types.name,
SUM(order_details.quantity * pizzas.price) AS revenue
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category, pizza_types.name
) AS a
) AS b
WHERE rnk <= 3;
