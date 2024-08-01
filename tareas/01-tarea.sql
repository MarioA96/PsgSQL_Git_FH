-- 1. Ver todos los registros
SELECT * FROM users;
-- 2. Ver el registro cuyo id sea igual a 10
SELECT
    *
from
    users
WHERE
    id = 10;
-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT
    *
from
    users
WHERE
    name like 'Jim %';
-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT * FROM users WHERE name LIKE '% Alexander';
-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE users SET name = 'Mario Alberto' WHERE id = 1;
-- 6. Borrar el último registro de la tabla
-- SELECT
--     COUNT(*)
-- FROM
--     users;
-- DELETE FROM users WHERE id = 3980;
-- Con subquery
DELETE FROM users
WHERE id = ( SELECT max(id) FROM users );