

SELECT * from country;

ALTER TABLE country
  ADD PRIMARY KEY (code);

SELECT * from country where code = 'NLD' and code2 = 'NA';

DELETE from country where code = 'NLD' and code2 = 'NA';