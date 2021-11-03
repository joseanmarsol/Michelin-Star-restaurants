------------------------------------------------------
-- Views are created to get a view of the restaurants 
-- with 1, 2 and 3 Michelin Stars
------------------------------------------------------

CREATE VIEW OneMichelinStar
AS (
SELECT * 
FROM [dbo].[Michelin_restaurants]
WHERE [Michelin_stars] = 1
)


CREATE VIEW TwoMichelinStar
AS (
SELECT * 
FROM [dbo].[Michelin_restaurants]
WHERE [Michelin_stars] = 2
)


CREATE VIEW ThreeMichelinStar
AS (
SELECT * 
FROM [dbo].[Michelin_restaurants]
WHERE [Michelin_stars] = 3
)


SELECT * FROM OneMichelinStar
SELECT * FROM TwoMichelinStar
SELECT * FROM ThreeMichelinStar
------------------------------------------------------------------------
-- Number of restaurants grouped by country, first all stars, 
-- then 1, 2 and 3 stars. Views are created from this
-- Finally, we join the results of the views to get a complete overview
------------------------------------------------------------------------

CREATE VIEW AllByCountry AS
SELECT TOP 10 [Country], count(*) AS Number_of_Michelin_restaurants
FROM [dbo].[Michelin_restaurants] 
GROUP BY [Country]
ORDER BY Number_of_Michelin_restaurants DESC

CREATE VIEW OneByCountry AS
SELECT TOP 20 [Country], count(*) AS Number_of_1_Star_restaurants
FROM OneMichelinStar
GROUP BY [Country]
ORDER BY Number_of_1_Star_restaurants DESC

CREATE VIEW TwoByCountry AS
SELECT TOP 30 [Country], count(*) AS Number_of_2_Star_restaurants
FROM TwoMichelinStar
GROUP BY [Country]
ORDER BY Number_of_2_Star_restaurants DESC

CREATE VIEW ThreeByCountry AS
SELECT TOP 40 [Country], count(*) AS Number_of_3_Star_restaurants
FROM ThreeMichelinStar
GROUP BY [Country]
ORDER BY Number_of_3_Star_restaurants DESC

SELECT a.*, b.Number_of_1_Star_restaurants, c.Number_of_2_Star_restaurants, d.Number_of_3_Star_restaurants  
FROM AllByCountry a
LEFT JOIN OneByCountry b
ON a.[Country] = b.[Country]
LEFT JOIN TwoByCountry c
ON a.[Country] = c.[Country]
LEFT JOIN ThreeByCountry d
ON a.[Country] = d.[Country]

----------------------------------------------------------------
-- Same as before, but for 'City' instead of 'Country'
----------------------------------------------------------------

CREATE VIEW AllByCity AS
SELECT TOP 10 [City], count(*) AS Number_of_Michelin_restaurants
FROM [dbo].[Michelin_restaurants] 
GROUP BY [City]
ORDER BY Number_of_Michelin_restaurants DESC

CREATE VIEW OneByCity AS
SELECT TOP 20 [City], count(*) AS Number_of_1_Star_restaurants
FROM OneMichelinStar
GROUP BY [City]
ORDER BY Number_of_1_Star_restaurants DESC

CREATE VIEW TwoByCity AS
SELECT TOP 30 [City], count(*) AS Number_of_2_Star_restaurants
FROM TwoMichelinStar
GROUP BY [City]
ORDER BY Number_of_2_Star_restaurants DESC

CREATE VIEW ThreeByCity AS
SELECT TOP 100 [City], count(*) AS Number_of_3_Star_restaurants
FROM ThreeMichelinStar
GROUP BY [City]
ORDER BY Number_of_3_Star_restaurants DESC

SELECT a.*, b.Number_of_1_Star_restaurants, c.Number_of_2_Star_restaurants, d.Number_of_3_Star_restaurants  
FROM AllByCity a
LEFT JOIN OneByCity b
ON a.[City] = b.[City]
LEFT JOIN TwoByCity c
ON a.[City] = c.[City]
LEFT JOIN ThreeByCity d
on a.[City] = d.[City]

----------------------------------------------------------------
-- Number of restaurants grouped by 'Cuisine', in this case for 
-- just all restaurants no matter the number of stars
----------------------------------------------------------------

SELECT TOP 10 [Cuisine],  count(*) AS Number_of_Michelin_restaurants
FROM [dbo].[Michelin_restaurants]
GROUP BY [Cuisine]
ORDER BY Number_of_Michelin_restaurants DESC
