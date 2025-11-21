Select *
From city
Where
    name='Jinzhou' AND
    countrycode='CHN' AND
    district='Liaoning';

-- Para la creacion de un indice es por medio de CREATE

Create Unique Index "unique_name_countrycode_district" On city (
    name, countrycode, district
);

Create Index "index_district" on city (
    district
);