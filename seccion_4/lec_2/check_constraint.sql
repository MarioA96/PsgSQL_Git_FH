

SELECT
    tc.constraint_name,
    tc.table_name,
    cc.check_clause
FROM
    information_schema.table_constraints AS tc
JOIN
    information_schema.check_constraints AS cc
ON
    tc.constraint_name = cc.constraint_name
WHERE
    tc.constraint_type = 'CHECK'
    AND tc.table_name = 'country';