/*Which region has the highest quantity of and orders and which region has the highest profit, on average */

SELECT region, SUM(quantity) AS total_region_quantity, AVG(sales) AS average_region_sales
FROM orders
GROUP BY region;

/*Who is the sales person that handled the most orders?*/
SELECT p.person AS sales_person, SUM(quantity) AS no_orders
FROM orders AS o
JOIN people AS p
ON o.region = p.region
GROUP BY p.person
ORDER BY no_orders DESC;

/*Which state had the best totalprofit?*/
SELECT country_state, SUM(profit) AS profit
FROM orders
GROUP BY country_state
ORDER BY profit DESC
limit 1;

/*Which state had the worst total loss?*/
SELECT country_state, SUM(profit) AS loss
FROM orders
GROUP BY country_state
ORDER BY loss 
limit 1;

/*Which date had the highest number of returned orders?*/
SELECT o.ship_date, COUNT(r.returned) as no_returned_orders
FROM orders AS o
JOIN returns AS r
ON o.order_id = r.order_id
WHERE returned = 'Yes'
GROUP BY o.ship_date
ORDER BY no_returned_orders DESC
LIMIT 1;

/*Which city had the highest number of returned orders?*/
SELECT o.city, COUNT(r.returned) as no_returned_orders
FROM orders AS o
JOIN returns AS r
ON o.order_id = r.order_id
WHERE returned = 'Yes'
GROUP BY o.city
ORDER BY no_returned_orders DESC
LIMIT 1;

/*Which category had the greatest profit?*/
SELECT category, SUM(profit) AS profit
FROM orders
GROUP BY category
ORDER BY profit DESC;

/*Which sub category had the highest number of orders?*/
SELECT sub_category, SUM(quantity) AS no_orders
FROM orders
GROUP BY sub_category
ORDER BY no_orders DESC;

/*Which product had the greatest sales?*/
SELECT product_name, SUM(SALES) AS sales
FROM orders
GROUP BY product_name
ORDER BY sales DESC
LIMIT 1;

/*Which customer ordered the most?*/
SELECT customer_name, SUM(quantity) AS no_orders
FROM orders
GROUP BY customer_name
ORDER BY no_orders DESC
limit 1;

/*What is the most preferred ship mode*/
SELECT ship_mode, COUNT(ship_mode) AS count
FROM orders
GROUP BY ship_mode
ORDER BY count DESC;