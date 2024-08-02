SELECT
    id, 
    UPPER(name) as upper_name, 
    LOWER(name) as lower_name,
    LENGTH(name) as length_name,
    (20*2) as constante,
    CONCAT(id, '-', name, '*'),
    '*'||id||'-'||name||'*' as barcode,
    name
FROM
    users;


SELECT
    name,
    SUBSTRING( name, 0, 5 ),
    POSITION( 'E' in name ),
    SUBSTRING( name, 0, POSITION( ' ' in name ) ) as first_name,
    SUBSTRING( name, POSITION( ' ' in name ) + 1 ) as last_name
--     TRIM(SUBSTRING( name, POSITION( ' ' in name ) )) as last_name
--     SUBSTRING( name, POSITION( ' ' in name ) + 1, LENGTH(name) ) as last_name
FROM
    users;


UPDATE users
SET 
	first_name = ( SUBSTRING(name, 0, POSITION(' ' in name)) ),
	last_name = ( SUBSTRING(name, POSITION( ' ' in name) + 1 ) )
	
SELECT * from users;