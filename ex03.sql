WITH amount_call AS  
(SELECT policy_holder_id, COUNT( DISTINCT case_id) as amount_call
from callers
GROUP BY policy_holder_id)

SELECT COUNT(DISTINCT policy_holder_id) as policy_holder_count
from amount_call
WHERE amount_call >= 3
