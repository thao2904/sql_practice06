SELECT product_id, MIN(year) as first_year, quantity, price
FROM sales
WHERE product_id IN (SELECT product_id from Product
WHERE product_id is NOT NULL)
GROUP BY product_id
