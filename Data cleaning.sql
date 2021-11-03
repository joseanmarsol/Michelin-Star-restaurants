-- The table is checked to have an overview
--select * from dbo.Michelin_restaurants

-- A Stored Procedure is created for the data cleaning process of each column

------------------------------------------------------------------------
---------------------- COUNTRY COLUMN ----------------------------------
------------------------------------------------------------------------
CREATE PROCEDURE CleanCountryColumn
AS
BEGIN
-- Remove MICHELIN GUIDE at the beginning 
UPDATE dbo.Michelin_restaurants
SET Country = REPLACE(Country, 'MICHELIN Guide ', '')
WHERE Country LIKE 'MICHELIN GUIDE %'

--- SELECT DISTINCT Country FROM dbo.Michelin_restaurants;
--- We observe that Beijing, Hong Kong, Guangzhou, California, 
--- Taipei & Taichung, Macau, Shanghai and Seoul are in this column.
--- We need to replace them with their corresponding countries

UPDATE dbo.Michelin_restaurants
SET Country = REPLACE(Country, 'Beijing', 'China')
WHERE Country LIKE 'Beijing'

UPDATE dbo.Michelin_restaurants
SET Country = REPLACE(Country, 'Hong Kong', 'China')
WHERE Country LIKE 'Hong Kong'

UPDATE dbo.Michelin_restaurants
SET Country = REPLACE(Country, 'Guangzhou', 'China')
WHERE Country LIKE 'Guangzhou'

UPDATE dbo.Michelin_restaurants
SET Country = REPLACE(Country, 'Macau', 'China')
WHERE Country LIKE 'Macau'

UPDATE dbo.Michelin_restaurants
SET Country = REPLACE(Country, 'Shanghai', 'China')
WHERE Country LIKE 'Shanghai'

UPDATE dbo.Michelin_restaurants
SET Country = REPLACE(Country, 'Taipei & Taichung', 'Taiwan')
WHERE Country LIKE 'Taipei & Taichung'

UPDATE dbo.Michelin_restaurants
SET Country = REPLACE(Country, 'Seoul', 'South Corea')
WHERE Country LIKE 'Seoul'

UPDATE dbo.Michelin_restaurants
SET Country = REPLACE(Country, 'California', 'United States')
WHERE Country LIKE 'California'

END; 

EXEC CleanCountryColumn

------------------------------------------------------------------------
---------------------- MICHELIN_STARS COLUMN ---------------------------
------------------------------------------------------------------------

-- We need to replace the html code for the number of stars with an integer 
-- which corresponds to the actual number:
-- m is 1
-- n is 2
-- o is 3

CREATE PROCEDURE CleanMichelinStarsColumn
AS
BEGIN

UPDATE dbo.Michelin_restaurants
SET Michelin_stars = REPLACE(Michelin_stars, 'm', 1)
WHERE Michelin_stars LIKE 'm'

UPDATE dbo.Michelin_restaurants
SET Michelin_stars = REPLACE(Michelin_stars, 'n', 2)
WHERE Michelin_stars LIKE 'n'

UPDATE dbo.Michelin_restaurants
SET Michelin_stars = REPLACE(Michelin_stars, 'o', 3)
WHERE Michelin_stars LIKE 'o'

END;

EXEC CleanMichelinStarsColumn

------------------------------------------------------------------------
---------------------- CUISINE COLUMN ----------------------------------
------------------------------------------------------------------------

--select distinct Cuisine from dbo.Michelin_restaurants;

-- There are duplicates within the same row in the Cuisine column
-- for example:
-- Scandinavian, Scandinavian
-- Catalan, Catalan
-- Modern French, Modern French
-- etc

-- We will remove the part of the string which is after the comma with
-- the statement below.
-- With CHARINDEX we find the position of the comma in the string,
-- with SUBSTRING we select the number of characters from the starting position (1)
-- to the position just before (-1) the character we are searching (',' in our case)

CREATE PROCEDURE CleanCuisineColumn
AS
BEGIN

UPDATE dbo.Michelin_restaurants
   SET Cuisine = SUBSTRING(Cuisine, 1, CHARINDEX(',', Cuisine) - 1)
 WHERE CHARINDEX(',', Cuisine) > 0 

 END;

 EXEC CleanCuisineColumn

 -----------------------------------------------------------------------------

 SELECT * FROM 
 dbo.Michelin_restaurants



