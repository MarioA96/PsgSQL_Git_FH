

SELECT DISTINCT continent from country;

ALTER TABLE country add CHECK(
    (continent = 'Asia'::TEXT) OR
    (continent = 'South America'::TEXT) OR 
    (continent = 'North America'::TEXT) OR 
    (continent = 'Oceania'::TEXT) OR 
    (continent = 'Antarctica'::TEXT) OR 
    (continent = 'Africa'::TEXT) OR 
    (continent = 'Europe'::TEXT) OR
    (continent = 'Central America'::TEXT)
);

ALTER TABLE country DROP CONSTRAINT "country_continent_check";

SELECT * FROM country WHERE CODE = 'HND';

-- TablePlus en Linux Ubuntu no soporta de momento ciertas visualizaciones como la
-- de los constraints y copiado de scripts. 30/10/2025

-- Una posible alternativa para checar constraints es el siguiente script:
SELECT
    conname AS constraint_name,
    contype AS constraint_type,
    pg_get_constraintdef(c.oid) AS definition

FROM
    pg_constraint c
JOIN
    pg_class t ON c.conrelid = t.oid
WHERE
    t.relname = 'country';