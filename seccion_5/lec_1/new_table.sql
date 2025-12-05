Select distinct continent from country order by continent ASC;

create table continent
(
    code serial
        constraint code
            primary key,
    name text not null
);


alter table continent
    owner to alumno;


-- Volcado de Data de country(name) a continent
Insert Into continent (name)
    Select Distinct
        continent
    from country
    order by
        continent
    asc;