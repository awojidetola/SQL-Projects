/* Find all the Pizza Categories present */

SELECT category, COUNT(*) FROM pizza_types
GROUP BY category;

/* Find the total number of orders by size category */

SELECT p.category AS Size_Category, SUM(o.quantity) AS Order_Qty
FROM pizza AS p
JOIN order_details AS o
ON p.pizza_id = o.pizza_id
GROUP BY p.category
ORDER BY category;

/* Find the day with the highest number of orders */
SELECT o.date, COUNT(od.quantity) AS quantity
FROM orders AS o
JOIN order_details AS od
ON o.order_id = od.order_id
GROUP BY o.date
ORDER BY COUNT(od.quantity)
LIMIT 1;

/*Group the Pizza Ingredients by Category*/
SELECT ingredients, category 
FROM pizza_types;

/*Select the time where Pizza is ordered the most*/
SELECT o.time, COUNT(od.quantity) AS quantity
FROM orders AS o
JOIN order_details AS od
ON o.order_id = od.order_id
GROUP BY o.time
ORDER BY COUNT(od.quantity)
LIMIT 1;

/*Select Pizza Names, their sizes and Pizza Category, Date and Time of Delivery */
SELECT p.name AS pizza_name, p.category AS pizza_size, pt.category AS pizza_category, o.date AS order_date, o.time AS order_time
FROM pizza AS p
JOIN pizza_types AS pt
ON pt.pizza_type_id = p.name
JOIN order_details AS od
ON od.pizza_id = p.pizza_id
JOIN orders AS o
ON o.order_id = od.order_id
LIMIT 10;

/* Select pizza name, pizza size, ingredients, date, time, quantity for the Supreme Pizza*/
SELECT p.name AS pizza_name, p.category AS pizza_size, pt.ingredients AS ingredients, o.date AS order_date, o.time AS order_time
FROM pizza AS p
JOIN pizza_types AS pt
ON pt.pizza_type_id = p.name
JOIN order_details AS od
ON od.pizza_id = p.pizza_id
JOIN orders AS o
ON o.order_id = od.order_id
WHERE pt.category = 'Supreme';