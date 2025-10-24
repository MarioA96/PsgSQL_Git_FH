

select
	COUNT(*) as total_users,
    	MIN( followers ) as min_followers,
	MAX( followers ) as max_followers,
	AVG( followers ) as avg_followers,
	ROUND( AVG(followers) ) as avg_followers_round,
	SUM(followers) / COUNT(*) as avg_followers_manual
from
    	users;


SELECT
	first_name,
	last_name,
	followers
FROM
	users
WHERE
	followers = 4 OR followers = 4999;


SELECT
	count(*), followers
FROM
	users
WHERE
	followers = 4 OR followers = 4999
GROUP BY
	followers;


SELECT
	count(*), followers
FROM
	users
WHERE
	followers BETWEEN 4500 AND 4999
GROUP BY
	followers
ORDER BY
	followers DESC;
