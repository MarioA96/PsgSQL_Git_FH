
SELECT 
	first_name,
	last_name,
	followers
From
	users
Where
-- 	followers > 4600 And followers < 4700
	followers BETWEEN 4601 AND 4699
order by
	followers DESC;