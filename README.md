# Sales Data Analysis Using SQL

## Project Overview

This project uses SQL to analyze sales performance and customer purchasing behavior in a relational database. The goal is to answer business questions related to revenue generation, product performance, and customer activity using structured query language (SQL).

By querying sales data across customers, products, and orders, the analysis demonstrates how SQL can support business decision-making through data aggregation and relational joins.

---

## Business Questions

This analysis focuses on answering key business questions using SQL:

- Which products generate the most revenue?
- Which customers contribute the most to total sales?
- What purchasing patterns can be identified from transaction data?
- How can SQL be used to combine multiple tables to generate actionable business insights?

---

## Database Structure

The database contains three tables that represent a simplified sales system.

### Customers Table

| customer_id | name | city |
|-------------|------|------|
| 1 | John Smith | New York |
| 2 | Maria Garcia | Miami |
| 3 | Alex Chen | San Francisco |

This table stores customer information.

---

### Products Table

| product_id | product_name | price |
|-------------|-------------|------|
| 1 | Laptop | 1200 |
| 2 | Smartphone | 800 |
| 3 | Tablet | 500 |

This table stores product details and pricing.

---

### Orders Table

| order_id | customer_id | product_id | revenue |
|----------|-------------|------------|---------|
| 1 | 1 | 1 | 1200 |
| 2 | 2 | 2 | 800 |
| 3 | 3 | 3 | 500 |
| 4 | 1 | 2 | 800 |

This table records transactions linking customers to the products they purchased.

---

## Query 1: Revenue by Product

### Business Question

Which products generate the most revenue?

### SQL Query

```sql
SELECT product_id, SUM(revenue)
FROM orders
GROUP BY product_id;
```

### Result

![Revenue by Product](revenue_by_product.PNG)

### Insight

This analysis shows which products are driving the majority of revenue. Product 2 is the top-performing item, generating the highest total revenue, followed by Product 1 and Product 3. From a business perspective, this indicates where demand is strongest. A business owner could use this insight to prioritize high-performing products, allocate more inventory, and focus marketing efforts on the items that generate the most revenue. This directly supports revenue growth and more efficient resource allocation.

---

## Query 2: Customer Purchase Report

### Business Question

Which customers purchased which products?

### SQL Query

```sql
SELECT customers.name,
       products.product_name,
       orders.revenue
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id;
```

### Result

![Customer Purchase Report](customer_purchase_report.PNG)

### Insight

This query provides a transaction-level view of customer purchasing behavior, showing which customers bought specific products and how much revenue each transaction generated. From a business standpoint, this helps identify purchasing patterns and customer preferences. For example, repeat purchases or high-value transactions can signal strong customer relationships. A business owner can use this information to target customers with personalized offers, improve product recommendations, and increase customer retention and lifetime value.

---

## Query 3: Top Customers by Revenue

### Business Question  
Which customers generate the most total revenue?

### SQL Query
```sql
SELECT c.name,
       SUM(o.revenue) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;
```

### Result

John Smith generated the highest total revenue, followed by Maria Garcia and Alex Chen.

### Insight

This analysis identifies the most valuable customers based on total spending. High-value customers are critical to business success because they contribute a large portion of total revenue. A business owner can use this insight to focus on customer retention strategies, such as loyalty programs, personalized promotions, or priority service. Retaining high-value customers is often more cost-effective than acquiring new ones and can significantly increase long-term profitability.

## Final Business Impact

This project demonstrates how raw transactional data can be transformed into actionable business insights using SQL.

By analyzing product performance, customer behavior, and revenue patterns, businesses can:

Identify top-performing products and optimize inventory decisions
Focus on high-value customers to increase retention and lifetime value
Improve pricing and promotional strategies based on purchasing behavior
Make data-driven decisions to increase revenue and operational efficiency

This highlights the real-world value of data analysis in supporting business growth and strategic decision-making.
