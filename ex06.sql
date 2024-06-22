SELECT SUBSTRING(b.trans_date FROM 1 for 7) AS month,
b.country, COUNT(*) AS trans_count, 
(SELECT COUNT(*) FROM transactions AS a 
WHERE a.state = 'approved'
AND SUBSTRING(a.trans_date FROM 1 for 7)  = SUBSTRING(b.trans_date FROM 1 for 7) AND 
a.country = b.country) AS approved_count, SUM(b.amount) AS trans_total_amount,
(SELECT SUM(c.amount) FROM transactions AS c
WHERE c.state = 'approved'
AND SUBSTRING(c.trans_date FROM 1 for 7)  = SUBSTRING(b.trans_date FROM 1 for 7)
AND c.country = b.country) AS approved_total_amount 
FROM transactions AS b
GROUP BY SUBSTRING(b.trans_date FROM 1 for 7), b.country

