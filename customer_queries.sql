
-- Top 10 high value customers
SELECT customer_id, SUM(purchase_amount) AS total_spent
FROM purchases
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Monthly revenue trend
SELECT DATE_TRUNC('month', purchase_date) AS month, SUM(purchase_amount) AS revenue
FROM purchases
GROUP BY month
ORDER BY month;

-- New vs returning customers by year
SELECT EXTRACT(YEAR FROM purchase_date) AS year, 
       COUNT(DISTINCT CASE WHEN order_number = 1 THEN customer_id END) AS new_customers,
       COUNT(DISTINCT CASE WHEN order_number > 1 THEN customer_id END) AS returning_customers
FROM purchases
GROUP BY year
ORDER BY year;
