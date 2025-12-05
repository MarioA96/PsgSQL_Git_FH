-- Script created by DataGrip, country -> SQL Scripts -> SQL Generator
create table country_bk
(
    code           char(3) not null
        primary key,
    name           text    not null,
    continent      text    not null
        constraint country_continent_check
            check ((continent = 'Asia'::text) OR (continent = 'South America'::text) OR
                   (continent = 'North America'::text) OR (continent = 'Oceania'::text) OR
                   (continent = 'Antarctica'::text) OR (continent = 'Africa'::text) OR (continent = 'Europe'::text) OR
                   (continent = 'Central America'::text)),
    region         text    not null,
    surfacearea    real    not null
        constraint country_surfacearea_check
            check (surfacearea >= (0)::double precision),
    indepyear      smallint,
    population     integer not null,
    lifeexpectancy real,
    gnp            numeric(10, 2),
    gnpold         numeric(10, 2),
    localname      text    not null,
    governmentform text    not null,
    headofstate    text,
    capital        integer,
    code2          char(2) not null
);



alter table country
    owner to alumno;

-- Volcado de Data de country a country_bk
Insert Into country_bk
SELECT *
From country;

Select * from country_bk;

Select * from country;

Alter table country Drop Constraint country_continent_check;