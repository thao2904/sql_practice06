SELECT customer_id from Customer
GROUP BY customer_id
HAVING COUNT(Distinct product_key ) = (SELECT COUNT(distinct product_key) 
from Product)
