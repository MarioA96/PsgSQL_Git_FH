
SELECT
	domain, total
FROM (
	SELECT
		count(*) as Total,
		SUBSTRING( email, POSITION('@' in email) + 1 ) as Domain,
		'Mario' as Name,
		27 as age
	FROM
		users
	GROUP BY
		SUBSTRING( email, POSITION('@' in email) + 1 )
	HAVING
		count(*) > 1
	ORDER BY
		SUBSTRING( email, POSITION('@' in email) + 1 ) ASC
) as email_domains