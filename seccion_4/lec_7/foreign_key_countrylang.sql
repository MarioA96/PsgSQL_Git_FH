Alter Table countrylanguage
    add constraint fk_country_code
    foreign key ( countrycode )
    references country( code );

Delete From country Where code = 'AFG';