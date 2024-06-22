SELECT page_id from pages  
WHERE page_id NOT IN (SELECT page_id from page_likes 
WHERE page_id is NOT NULL)   
