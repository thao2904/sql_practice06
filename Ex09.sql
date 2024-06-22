SELECT a.employee_id FROM Employees AS a
WHERE a.manager_id is NOT NULL
and a.manager_id NOT IN (SELECT b.employee_id from Employees as b
WHERE a.manager_id = b.employee_id)
AND a.salary < 30000
ORDER BY a.employee_id
