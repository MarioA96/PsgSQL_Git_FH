select
	COUNT(*) as total_users,
    MIN( followers ) as min_followers,
	MAX( followers ) as max_followers,
	AVG( followers ) as avg_followers,
	ROUND( AVG(followers) ) as avg_followers_round,
	SUM(followers) / COUNT(*) as avg_followers_manual
from
    	users;
