

Select a.name as country, b.name as continent From country a
Inner Join continent b on a.continent = b.code
Order by a.name ASC;