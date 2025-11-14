Select * from country where continent = 'Africa';

create UNIQUE index "unique_country_name" on country(
   name
);

create index "country_continent" on country(
   continent
);