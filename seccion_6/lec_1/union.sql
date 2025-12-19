

Select code, name, '123' From continent Where name Like '%America'
Union
Select code, name, 'otra cosa' From continent Where code in (3,5) --Los tipos deben de coincidir en orden
Order By name Asc;