SELECT 
	geo_name, 
	state_us_abbreviation,
	p0010001
FROM us_counties_2010
WHERE p0010001 >= (
	SELECT percentile_cont(0.9) WITHIN GROUP (ORDER BY p0010001)
	FROM us_counties_2010
)
ORDER BY p0010001 DESC

CREATE TABLE us_counties_2010_top10 AS 
SELECT * FROM us_counties_2010

DELETE FROM us_counties_2010_top10
WHERE p0010001 > (
	SELECT percentile_cont(0.9) WITHIN GROUP (ORDER BY p0010001)
	FROM us_counties_2010_top10
)

SELECT 
	round(calcs.average, 0) AS average,
	calcs.median,
	round(calcs.average - calcs.median, 0) AS median_average_diff
FROM (
	SELECT 
		avg(p0010001) as average,
		percentile_cont(0.5) 
			WITHIN GROUP (ORDER BY p0010001)::numeric(10, 1) AS median
		FROM us_counties_2010
)
AS calcs

SELECT 
	census.state_us_abbreviation AS st,
	census.st_population,
	plants.plant_count,
	round((plants.plant_count/census.st_population::numeric(10,1)) * 1000000, 1)
		AS plants_per_million
FROM (
	SELECT 
		st,
		count(*) AS plant_count
	FROM meat_poultry_egg_inspect
	GROUP BY st
) AS plants
JOIN (
	SELECT 
		state_us_abbreviation,
		sum(p0010001) AS st_population
	FROM us_counties_2010
	GROUP BY state_us_abbreviation
) AS census
ON plants.st = census.state_us_abbreviation
ORDER BY plants_per_million DESC

generating new columns 12.5

SELECT 
	geo_name,
	state_us_abbreviation AS st,
	p0010001 AS total_population,
	(SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY p0010001)
		FROM us_counties_2010
	) AS us_median
FROM us_counties_2010

WITH
	large_counties (geo_name, st, p0010001) -- create temp table but wont store it
AS 
	(
		SELECT geo_name, state_us_abbreviation, p0010001
		FROM us_counties_2010
		WHERE p0010001 >= 100000
	)
SELECT st, count(*)
FROM large_counties
GROUP BY st
ORDER BY count(*) DESC

WITH
    counties (st, population) AS
    (SELECT state_us_abbreviation, sum(population_count_100_percent)
     FROM us_counties_2010
     GROUP BY state_us_abbreviation),

    plants (st, plants) AS
    (SELECT st, count(*) AS plants
     FROM meat_poultry_egg_inspect
     GROUP BY st)

SELECT counties.st,
       population,
       plants,
       round((plants/population::numeric(10,1))*1000000, 1) AS per_million
FROM counties JOIN plants
ON counties.st = plants.st
ORDER BY per_million DESC;

a tool used for summarizing and show relations between variables

CREATE EXTENSION tablefunc

CREATE TABLE ice_cream_survey (
 response_id integer PRIMARY KEY,
 office varchar(20),
 flavor varchar(20)
);

COPY ice_cream_survey
FROM 'D:\bootcamp\06_sql\source_code\Chapter_12\ice_cream_survey.csv'
WITH (FORMAT CSV, HEADER);

SELECT *
FROM crosstab('SELECT office,
                      flavor,
                      count(*)
               FROM ice_cream_survey
               GROUP BY office, flavor
               ORDER BY office',

              'SELECT flavor
               FROM ice_cream_survey
               GROUP BY flavor
               ORDER BY flavor')

AS (office varchar(20),
    chocolate bigint,
    strawberry bigint,
    vanilla bigint);

























	