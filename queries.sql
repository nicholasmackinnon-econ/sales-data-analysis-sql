-- ============================================
-- SALES DATA ANALYSIS USING SQL
-- ============================================


-- ============================================
-- Query 1: Revenue by Product
-- Business Question:
-- Which products generate the most revenue?
-- ============================================

SELECT 
    o.product_id,
    SUM(o.revenue) AS total_revenue
FROM orders o
GROUP BY o.product_id;



-- ============================================
-- Query 2: Customer Purchase Report
-- Business Question:
-- Which customers purchased which products?
-- ============================================

SELECT 
    c.name,
    p.product_name,
    o.revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;



-- ============================================
-- Query 3: Top Customers by Revenue
-- Business Question:
-- Which customers generate the most total revenue?
-- ============================================

SELECT 
    c.name,
    SUM(o.revenue) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;
