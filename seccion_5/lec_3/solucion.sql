

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);



-- Empezamos con un volcado previo de countrylanguage (language) en language (name)

Insert Into "language" (name)
Select distinct countrylanguage."language" from countrylanguage order by "language" ASC;

-- Empezar con el select para confirmar lo que vamos a actualizar

Select "language",
       ( Select name from "language" b where a."language" = b.name )
from countrylanguage a;

-- Actualizar todos los registros

Update countrylanguage a
Set languagecode = ( Select code from "language" b where a."language" = b.name );

Select * from countrylanguage;

-- Cambiar tipo de dato en countrylanguage - languagecode por int4

Alter Table countrylanguage
Alter COLUMN languagecode Type int4
Using languagecode::integer;

-- Crear el forening key y constraints de no nulo el language_code

-- De forma visual, Modify Column -> Add Foreign Key -> relacion entre countrylanguage(language) y language(code)

-- Revisar lo creado

Select * from countrylanguage;
