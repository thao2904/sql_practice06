SELECT EXTRACT (MONTH from a.event_date) AS month,
COUNT(DISTINCT a.user_id) AS monthly_active_users
FROM user_actions AS a
JOIN user_actions AS b 
ON a.user_id = b.user_id 
AND EXTRACT(month from b.event_date) = 
EXTRACT(month from a.event_date - interval '1 month')
WHERE EXTRACT(month from a.event_date) = 7
AND EXTRACT(year from a.event_date) = 2022 
GROUP BY EXTRACT(month from a.event_date)
