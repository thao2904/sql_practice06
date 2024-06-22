WITH total_spend AS
(SELECT 
category, product, 
SUM(spend) as total_spend 
FROM product_spend
WHERE EXTRACT(year from transaction_date) = 2022
GROUP BY category, product)

SELECT a.category, a.product, a.total_spend
from total_spend AS a  
WHERE 
(SELECT COUNT(distinct b.product) from total_spend AS b
WHERE b.total_spend >= a.total_spend 
AND b.category = a.category)
<= 2
ORDER BY category, total_spend DESC 
