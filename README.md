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

## Seccion 4 - Relaciones, Llaves y Contraints

### Temas puntuales de la sección

El objetivo de esta sección es comprender sobre las llaves que no son más que constraints (restricciones)

Puntualmente veremos:

1. Exposición sobre las relaciones de bases de datos

Aqui veremos los diferentes tipos de relaciones que existen en las bases de datos relacionales

- Uno a Uno
Este tipo de relación se da cuando un registro en una tabla está asociado con un solo registro en otra tabla, y viceversa. Por ejemplo, una tabla de "Personas" y una tabla de "Pasaportes", donde cada persona tiene un único pasaporte.
- Uno a Muchos
Este tipo de relación se da cuando un registro en una tabla puede estar asociado con múltiples registros en otra tabla. Por ejemplo, una tabla de "Autores" y una tabla de "Libros", donde un autor puede haber escrito varios libros.
Un caso particular puede ser incluso de una `relación recursiva` (Relacion a si misma), como por ejemplo una tabla de "Empleados" donde un empleado puede tener varios subordinados, pero cada subordinado tiene un solo jefe.
- Muchos a Muchos
Este tipo de relación se da cuando múltiples registros en una tabla pueden estar asociados con múltiples registros en otra tabla. Por ejemplo, una tabla de "Estudiantes" y una tabla de "Cursos", donde un estudiante puede estar inscrito en varios cursos y un curso puede tener varios estudiantes. Para implementar este tipo de relación en una base de datos relacional, generalmente se utiliza una `tabla intermedia` (o tabla de unión) que contiene las `claves primarias` de ambas tablas.

2. Exposición sobre las llaves y diferentes tipos de llaves

Aqui veremos los diferentes tipos de llaves que existen en las bases de datos relacionales. Las llaves son atributos o conjuntos de atributos que se utilizan para identificar de manera única los registros en una tabla y establecer relaciones entre tablas.

- Llave primaria (Primary Key)
    - Identifica un registro de forma única en una tabla.
    - Una tabla puede tener varios identificadores unicos, pero solo una llave primaria.
    - La llave primaria esta basada en los requerimientos del negocio.
    - No puede contener valores nulos.

- Llave candidata (Candidate Key)
    - Un atributo o conjunto de ellos que identifican de forma única un registro en una tabla.
    - Menos la llave primaria, los demas se consideran claves candidatas.

- Super llave (Super Key)
    - Es un conjunto de atributos que puede identificar de forma única un registro en una tabla.
    - Es un superconjunto de la llave candidata.

- Llave foránea (Foreign Key)
    - Llaves foraneas son usadas para apuntar a la llave primaria de otra tabla.
    - Atributo o conjunto de atributos que establece una relación entre dos tablas.
    - Hace referencia a la llave primaria de otra tabla.
    - Puede contener valores nulos.

- Llave compuesta (Composite Key)
    - Cuando una llave primaria consta de más de un atributo, se conoce como clave compuesta.
    - Conjunto de dos o más atributos que se utilizan para identificar de forma única un registro en una tabla.
    - Se utiliza cuando ninguna de las columnas individuales puede identificar de forma única un registro.

- Llave sustituta (Surrogate Key)
    - Atributo o conjunto de atributos que se utilizan como llave primaria en lugar de la llave natural.
    - Generalmente es un número entero generado automáticamente.

- Llave alterna (Alternate Key)
    - Cualquier llave candidata que no ha sido elegida como llave primaria.

- Llave natural (Natural Key)
    - Atributo o conjunto de atributos que tienen un significado en el mundo real y se utilizan para identificar de forma única un registro.

- Llave artificial (Artificial Key)
    - Atributo o conjunto de atributos que se utilizan como llave primaria, pero que no tienen un significado en el mundo real.

3. Checks de columnas y tablas

4. Indices

5. Llaves foráneas

6. Restricciones con las relaciones

7. Eliminaciones y actualizaciones en cascada

8. Otros tipos de acciones automáticas.

---

## Seccion 5 - Separacion de data en otras tablas | Normalización

### Temas puntuales de la sección

Esta sección tiene por objetivo realizar labores cotidianas que sucederán si ustedes tienen que darle mantenimiento a alguna tabla o base de datos.

Puntualmente veremos

  1. Actualizaciones masivas
  2. Creación y volcado de información
  3. Alteración de índices y checks
  4. Eliminación de checks
  5. Modificación de columnas mediante GUI y manualmente
  6. Creación de tablas
  7. Relaciones

#### Volcado de una tabla a otra (mediante DataGrip)

Script created by DataGrip, 
```bash
country -> SQL Scripts -> SQL Generator
```

#### Ver relacion de un valor de una tabla (con foreign key) con otras tablas (mediante DataGrip)

```bash
Visulizando_de_tabla -> click derecho sobre el valor -> Go to -> Related Rows
```

#### Modificacion de tabla (mediante DataGrip)

```bash
Panel_izquierdo -> expande la tabla deseada -> Expande columnas -> Modify Column
```

---

## Seccion 6 - Joins & Uniones

### Temas puntuales de la sección

Esta sección está enfocada en uniones y joins entre tablas, explicaremos los más comunes y haremos ejercicios hasta con 4 tablas relacionadas entre sí.

Puntualmente veremos:
- Unions
- Conteos
- Joins
- Inner
    - Left
    - Right
    - Outer
    - Full
- Y más
