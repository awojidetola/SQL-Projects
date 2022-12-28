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