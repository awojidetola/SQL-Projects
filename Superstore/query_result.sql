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