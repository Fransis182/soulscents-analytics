-- SoulScents Analytics | SQL business questions

-- 1) Total sales by region in 2024, only for Floral products
SELECT s.region, SUM(s.total_sale) AS total_sales
FROM sales s
INNER JOIN products p
    ON s.product = p.product
WHERE p.fragrance_family = 'Floral'
  AND EXTRACT(YEAR FROM s.sale_date) = 2024
GROUP BY s.region
ORDER BY total_sales DESC;

-- 2) Clients generating more than 15,000 in total sales, with industry
SELECT s.client, c.industry, SUM(s.total_sale) AS total_sales
FROM sales s
INNER JOIN clients c
    ON s.client = c.client
GROUP BY s.client, c.industry
HAVING SUM(s.total_sale) > 15000
ORDER BY total_sales DESC;

-- 3) Distinct clients by region in 2024
SELECT region, COUNT(DISTINCT client) AS distinct_clients_2024
FROM sales
WHERE EXTRACT(YEAR FROM sale_date) = 2024
GROUP BY region
ORDER BY distinct_clients_2024 DESC;

-- 4) Average total sale by fragrance family, only for FMCG clients
SELECT p.fragrance_family, AVG(s.total_sale) AS avg_total_sale
FROM sales s
INNER JOIN clients c
    ON s.client = c.client
INNER JOIN products p
    ON s.product = p.product
WHERE c.industry = 'FMCG'
GROUP BY p.fragrance_family
ORDER BY avg_total_sale DESC;
