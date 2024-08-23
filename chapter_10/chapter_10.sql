-- CREATE TABLE widget_companies (
-- 	id BIGSERIAL,
-- 	company VARCHAR(30) NOT NULL,
-- 	widget_output INTEGER NOT NULL
-- )

-- INSERT INTO widget_companies (company, widget_output)
-- VALUES 
-- 	('Morse Widgets', 125000),
-- 	('Springfield Widget Masters', 143000),
-- 	('Best Widgets', 196000),
-- 	('Acme Inc.', 133000),
-- 	('District Widget Inc.', 201000),
-- 	('Clarke Amalgamated', 620000),
-- 	('Stavesacre Industries', 244000),
-- 	('Bowers Widget Emporium', 201000);

-- SELECT 
-- 	company,
-- 	widget_output,
-- 	rank() OVER (ORDER BY widget_output DESC),
-- 	dense_rank() OVER (ORDER BY widget_output DESC)
-- FROM widget_companies

-- 10.7

-- CREATE TABLE store_sales (
-- 	store VARCHAR(30),
-- 	category VARCHAR(30) NOT NULL,
-- 	unit_sales BIGINT NOT NULL,
-- 	CONSTRAINT store_category_key PRIMARY KEY (store, category)
-- );

-- INSERT INTO store_sales (store, category, unit_sales)
-- VALUES
--  ('Broders', 'Cereal', 1104),
--  ('Wallace', 'Ice Cream', 1863),
--  ('Broders', 'Ice Cream', 2517),
--  ('Cramers', 'Ice Cream', 2112),
--  ('Broders', 'Beer', 641),
--  ('Cramers', 'Cereal', 1003),
--  ('Cramers', 'Beer', 640),
--  ('Wallace', 'Cereal', 980),
--  ('Wallace', 'Beer', 988);

-- SELECT 
-- 	category,
-- 	store,
-- 	unit_sales,
-- 	RANK() OVER (
-- 		PARTITION BY category
-- 		ORDER BY unit_sales DESC
-- 	)
-- FROM store_sales

-- 10.8

-- CREATE TABLE fbi_crime_data_2015 (
-- 	st VARCHAR(20),
-- 	city VARCHAR(50),
-- 	population INTEGER,
-- 	violent_crime INTEGER,
-- 	property_crime INTEGER,
-- 	burglary INTEGER,
-- 	larcency_theft INTEGER,
-- 	motor_vehicle_theft INTEGER,
-- 	CONSTRAINT st_city_key PRIMARY KEY (st, city)
-- )

-- COPY fbi_crime_data_2015
-- FROM 'D:\bootcamp\06_sql\source_code\Chapter_10\fbi_crime_data_2015.csv'
-- WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- SELECT * FROM fbi_crime_data_2015
-- ORDER BY population DESC

SELECT 
	city,
	st,
	population,
	property_crime,
	ROUND(
		(property_crime::numeric / population) * 1000, 1
	) AS pc_per_1000
FROM fbi_crime_data_2015
WHERE population >=500000
ORDER BY (property_crime::numeric / population) * 1000 DESC





