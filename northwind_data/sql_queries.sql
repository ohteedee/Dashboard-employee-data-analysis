-- Create Table

DROP TABLE IF EXISTS countries;
CREATE TABLE countries(
    country VARCHAR(50),
    population DECIMAL NOT NULL,
    fertility FLOAT,
    continent VARCHAR(25)
);

-- Fill the table

COPY countries
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/05_week/large_countries_2015.csv'
DELIMITER ','
CSV Header;

-- SELECT
-- Select all values
SELECT * FROM countries;
-- Select only the columns country and population
SELECT country,population FROM countries;
-- Select the distinct continents
SELECT DISTINCT continent FROM countries;
-- Select only the columns country and population and order by population size
SELECT country,population 
FROM countries 
ORDER BY population DESC;
--  Select all countries with more than 200,000,000 inhabitants
SELECT * FROM countries 
WHERE population > 200000000;
-- Select the three countries with the highest fertility rate
SELECT country,fertility
FROM countries
ORDER BY fertility;
-- What if we only wanted Asia to appear

-- Select all countries which start with "I"
SELECT * FROM countries WHERE country LIKE 'I%';
-- Select all countries which start with "I" and have more than 200,000,000 inhabitants
SELECT * FROM countries WHERE country LIKE 'I%' AND population > 200000000;
-- Show the average population by continent
SELECT continent, AVG(population) AS avg_pop
FROM countries GROUP BY continent;
-- Show the average population by continent if it exceeds 300,000,000
SELECT continent, AVG(population) as avg_pop
FROM countries GROUP BY continent
HAVING AVG(population) > 300000000;
-- Update South America and North America to The Americas
SELECT *,
CASE
    WHEN continent ='North America' THEN 'The Americas'
    WHEN continent ='South America' THEN 'The Americas'
    ELSE continent
END as Updated_continent
FROM countries;

SELECT * from countries;

--Update and make the change of renaming continents permamnent
UPDATE countries
SET continent = CASE
    WHEN continent ='North America' THEN 'The Americas'
    WHEN continent ='South America' THEN 'The Americas'
    ELSE continent
    END;


-- Add a new column
-- check  ..
ALTER TABLE countries
ADD COLUMN new_col INTEGER DEFAULT 1;

-- Delete column from a table
ALTER TABLE countries
DROP COLUMN new_col;

-- Delete rows from a table

SELECT * FROM countries;
-- Delete all entries from a table
TRUNCATE TABLE countries;

-- Delete whole database table
DROP TABLE countries;
-- Delete whole database