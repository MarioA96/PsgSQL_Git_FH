Problema:

- docker container:
- **[Errno 13] Permissiondenied:'/var/lib/pgadmin/sessions'**

Para arreglar el problema de la conexion de pgadmin4 en el puerto mapeado (o su
variante) 8080:80 -> localhost:8080

Primero baja todos los servicios (contenedor) Luego cambia el modo y los
grupos/usuario de la carpeta /pgadmin

```bash
$ sudo chown -R 5050:5050 ./pgadmin
```

Luego de ello en el docker-compose.yml Agrega la siguiente linea en el apartado
de pdAdmin:

```yml
pdAdmin:
    ...
    user: '5050:5050' # '$UID:$GID'
    ...
```

Tras ellos, es conveniente realizar el build de nuestro contenedor:

```bash
$ sudo docker compose build
```

Y lo volvemos a levantar:

```bash
$ sudo docker compose up -d
```

Esto veras el resultado de manera inmediata mediante la creacion automatica de
las carpetas en pgadmin

Links:
[stackoverflow](https://stackoverflow.com/questions/64781245/permission-denied-var-lib-pgadmin-sessions-in-docker)
[doc de pgadmin](https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html#mapped-files-and-directories)

# Curso de Bases de datos con PostgreSQL

## Pasos para levantar el proyecto

1. Tener docker Desktop (opcional) o el daemon de Docker corriendo
2. Clonar el proyecto
3. Navegar a la carpeta del proyecto
4. Ejecutar `docker compose up -d`
5. Revisar el _**archivo docker-compose.yml**_ para los usuarios y contrasenas

- Container_name: my-database

- POSTGRES_USER=alumno
- POSTGRES_PASSWORD=123456
- POSTGRES_DB=course-db

- PGADMIN_DEFAULT_EMAIL=alumno@google.com
- PGADMIN_DEFAULT_PASSWORD=123456

- Nuestro proyecto tiene 2 GUI para poder manipular la base de datos

1. PgAdmin
2. TablePlus *

---

## Seccion 2 - Generalidades y primeros pasos

### Temas puntuales de la sección.

El objetivo de esta sección es empezar nuestro camino en las bases de datos con
las sentencias más comunes y explicaciones generales para comprender a qué nos
estamos metiendo. Puntualmente veremos:

- Queries: Creación de tablas Drop / Truncate SELECT INSERT DELETE UPDATE

- Funciones y operadores como: Substring Position Concat ||

- Constrains básicos
- Serial

La idea principal es tener nuestra introducción en un ambiente controlado que
nos permita jugar y aprender desde cero y poco a poco, ir escribiendo sentencias
más específicas.

---

## Seccion 3 - Funciones agregadas | agrupaciones y ordenamiento

### Temas puntuales de la sección

Esta sección tiene por objetivo aprender a realizar agrupaciones, conteos y en
general poder extraer información de tablas mediante queries. Puntualmente
veremos:

- Aggregation Functions Count Min Max Avg

- Group By
- Round
- Between
- Distinct
- Agrupaciones por partes de strings
- Introducción a subqueries

- Comandos SQL - Terminologia
  1. DDL - Data Definition Language
     - Create, Alter, Truncate
  2. DML - Data Manipulation Language
     - Insert, Delete, Update
  3. TCL - Transaction Control Language
     - Commit, Rollback
  4. DQL - Data Query Language
     - Select

- Aggregate Functions & Filtering
  - Aggregate Functions
    - Count
    - Sum
    - Max
    - Min
    - Group By
    - Having
    - Order By
  - Filtering
    - Like
    - In
    - Is Null
    - Is Not Null
    - Where
    - And
    - Or
    - Between

- Estructura general de un SELECT

```sql
select distinct 
        -- *, campos, alias, funciones
where 
        -- condicion, condiciones, and, or, in, like
joins
group by 
        -- campo agrupador, ALL
having 
        -- condicion
order by 
        -- expresion, asc, desc
limit 
        -- valor, ALL
offset 
        -- punto de inicio
```

Esta sección se preocupará en ayudarlos a poder generar estadísticas que pueden
llegar a necesitar a la hora de crear reportes o brindar información a quien lo
solicite de una forma digerible y eficiente.

---
