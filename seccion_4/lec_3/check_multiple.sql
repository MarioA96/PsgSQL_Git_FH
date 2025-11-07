

SELECT DISTINCT continent from country;

ALTER TABLE country add CHECK(
    (continent = 'Asia'::TEXT) OR
    (continent = 'South America'::TEXT) OR 
    (continent = 'North America'::TEXT) OR 
    (continent = 'Oceania'::TEXT) OR 
    (continent = 'Antarctica'::TEXT) OR 
    (continent = 'Africa'::TEXT) OR 
    (continent = 'Europe'::TEXT)
);