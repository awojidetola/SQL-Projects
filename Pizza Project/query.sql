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

/*Find the ingredients for each Pizza Category*/
SELECT ingredients, category 
FROM pizza_types;

/*What time does Pizza Place have the highest number of orders*/
SELECT o.time, COUNT(od.quantity) AS quantity
FROM orders AS o
JOIN order_details AS od
ON o.order_id = od.order_id
GROUP BY o.time
ORDER BY COUNT(od.quantity)
LIMIT 1;

/*Find each Pizza name, size, category, date and time of delivery */
SELECT p.name AS pizza_name, p.category AS pizza_size, pt.category AS pizza_category, o.date AS order_date, o.time AS order_time
FROM pizza AS p
JOIN pizza_types AS pt
ON pt.pizza_type_id = p.name
JOIN order_details AS od
ON od.pizza_id = p.pizza_id
JOIN orders AS o
ON o.order_id = od.order_id
LIMIT 10;

/* For the Supreme Pizza category, find each pizza name, size, ingredients, date & time and quanitity ordered */
SELECT p.name AS pizza_name, p.category AS pizza_size, pt.ingredients AS ingredients, o.date AS order_date, o.time AS order_time
FROM pizza AS p
JOIN pizza_types AS pt
ON pt.pizza_type_id = p.name
JOIN order_details AS od
ON od.pizza_id = p.pizza_id
JOIN orders AS o
ON o.order_id = od.order_id
WHERE pt.category = 'Supreme';

/* How many pizzas are typically in an order? Do we have any bestsellers?*/
SELECT pt.name AS pizza_name, SUM(od.quantity) AS order_no
FROM order_details AS od
JOIN pizza AS p
ON p.pizza_id = od.pizza_id
JOIN pizza_types AS pt
ON pt.pizza_type_id = p.name
GROUP BY pt.name
ORDER BY order_no DESC;
