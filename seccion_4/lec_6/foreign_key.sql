-- Modificaciones en tabla con Alter
Alter Table city
    add constraint fk_country_code
    foreign key ( countrycode )
    references country( code ); -- On Delete Cascade

Select *
From country
Where code = 'AFG';

Select *
From city
Where countrycode = 'AFG';

INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');