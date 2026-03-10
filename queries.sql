-- Query 1: Revenue by Product
SELECT product_id, SUM(revenue)
FROM orders
GROUP BY product_id;

-- Query 2: Customer Purchase Report
SELECT customers.name,
       products.product_name,
       orders.revenue
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id;