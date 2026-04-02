-- Query 1: Revenue by Product
-- Business Question: Which products generate the most revenue?

SELECT product_id, SUM(revenue) AS total_revenue
FROM orders
GROUP BY product_id;



-- Query 2: Customer Purchase Report
-- Business Question: Which customers purchased which products?

SELECT customers.name,
       products.product_name,
       orders.revenue
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id;



-- Query 3: Top Customers by Revenue
-- Business Question: Which customers generate the most total revenue?

SELECT customers.name,
       SUM(orders.revenue) AS total_spent
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC;
