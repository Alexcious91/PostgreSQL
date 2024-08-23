-- SELECT 
-- 	geo_name,
-- 	state_us_abbreviation AS "st",
-- 	p0010001 AS "Total Population",
-- 	p0010003 AS "White Alone",       
-- 	p0010004 AS "Black or African American Alone",       
-- 	p0010005 AS "Am Indian/Alaska Native Alone",       
-- 	p0010006 AS "Asian Alone",       
-- 	p0010007 AS "Native Hawaiian and Other Pacific Islander Alone",       
-- 	p0010008 AS "Some Other Race Alone",       
-- 	p0010009 AS "Two or More Races"
-- FROM us_counties_2010

-- SELECT 
-- 	geo_name,
-- 	state_us_abbreviation AS "st",
-- 	p0010003 AS "White Alone",
-- 	p0010004 AS "Black Alone",
-- 	p0010003 + p0010004 AS "Total Black And White"
-- FROM us_counties_2010

SELECT 
	geo_name,
	p0010001 AS "Total",
	p0010003  + p0010004 + p0010005 + p0010006 + p0010007 + p0010008 + p0010009 AS "All races",
	(p0010003 + p0010004 + p0010005 + p0010006 + p0010007 + p0010008 + p0010009 ) - p0010001 AS "Difference"
FROM us_counties_2010
ORDER BY "Difference" DESC

SELECT 
	geo_name,
	state_us_abbreviation AS "st",
	(CAST (p0010006 AS NUMERIC(8, 1)) / p0010001) * 100 AS "pct_asian"
FROM us_counties_2010
ORDER BY "pct_asian" DESC;

-- SELECT sum(p0010001) AS "County Sum",
-- 	ROUND(AVG(p0010001), 0) AS "Country Average"
-- FROM us_counties_2010

-- CREATE TABLE percentile_test (
-- 	numbers INTEGER
-- )

SELECT 
	percentile_cont(.5)
	WITHIN GROUP (ORDER BY numbers),
	percentile_disc(.5)
	WITHIN GROUP (ORDER BY numbers)
FROM percentile_test