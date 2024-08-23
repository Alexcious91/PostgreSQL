-- CREATE TABLE meat_poultry_egg_inspect (
-- 	est_number varchar(50) CONSTRAINT est_number_key PRIMARY KEY,
--     company varchar(100),
--     street varchar(100),
--     city varchar(30),
--     st varchar(2),
--     zip varchar(5),
--     phone varchar(14),
--     grant_date date,
--     activities text,
--     dbas text
-- )

-- COPY meat_poultry_egg_inspect
-- FROM 'D:\bootcamp\06_sql\source_code\Chapter_09\MPI_Directory_by_Establishment_Name.csv'
-- WITH (FORMAT CSV, HEADER, DELIMITER ',')

-- CREATE INDEX company_idx ON meat_poultry_egg_inspect (company)

-- SELECT COUNT(*) FROM meat_poultry_egg_inspect

-- SELECT 
-- 	company,
-- 	street,
-- 	city,
-- 	st,
-- 	COUNT(*) AS address_count
-- FROM meat_poultry_egg_inspect
-- GROUP BY company, street, city, st
-- HAVING COUNT(*) > 1
-- ORDER BY company, street, city, st ASC

-- SELECT
-- 	st,
-- 	COUNT(*) AS st_count
-- FROM meat_poultry_egg_inspect
-- GROUP BY st
-- ORDER BY st

-- SELECT 
-- 	est_number,
-- 	company,
-- 	city,
-- 	st,
-- 	zip
-- FROM meat_poultry_egg_inspect
-- WHERE st IS NULL

-- SELECT 
-- 	company,
-- 	COUNT(*) AS company_count
-- FROM meat_poultry_egg_inspect
-- GROUP BY company
-- ORDER BY company ASC

-- SELECT 
-- 	st,
-- 	COUNT(*) AS st_count
-- FROM meat_poultry_egg_inspect
-- WHERE length(zip) < 5
-- GROUP BY st
-- ORDER BY st ASC

-- CREATE TABLE meat_poultry_egg_inspect_backup
-- AS SELECT * FROM meat_poultry_egg_inspect

-- SELECT 
-- 	(SELECT COUNT(*) FROM meat_poultry_egg_inspect) AS original,
-- 	(SELECT COUNT(*) FROM meat_poultry_egg_inspect_backup) AS backup

-- ALTER TABLE meat_poultry_egg_inspect
-- ADD COLUMN st_copy VARCHAR(2)

-- UPDATE meat_poultry_egg_inspect
-- SET st_copy = st

-- SELECT 
-- 	st,
-- 	st_copy
-- FROM meat_poultry_egg_inspect
-- ORDER BY st


-- UPDATE meat_poultry_egg_inspect
-- SET st = 'AL'
-- WHERE est_number = 'M45319+P45319'

-- UPDATE meat_poultry_egg_inspect
-- SET st = 'WI'
-- WHERE est_number = 'M263A+P263A+V263A';

-- UPDATE meat_poultry_egg_inspect
-- SET st = st_copy

-- UPDATE meat_poultry_egg_inspect original
-- SET st = backup.st
-- FROM meat_poultry_egg_inspect_backup backup
-- WHERE original.est_number = backup.est_number

-- ALTER TABLE meat_poultry_egg_inspect
-- ADD COLUMN company_standard VARCHAR(100)

-- UPDATE meat_poultry_egg_inspect
-- SET company_standard= company

-- UPDATE meat_poultry_egg_inspect
-- SET company_standard = 'Armour-Eckrich Meats'
-- WHERE company LIKE 'Armour%'

-- SELECT company, company_standard
-- FROM meat_poultry_egg_inspect
-- WHERE company LIKE 'Armour%'

-- ALTER TABLE meat_poultry_egg_inspect
-- ADD COLUMN zip_copy VARCHAR(5)

-- UPDATE meat_poultry_egg_inspect
-- SET zip_copy = zip

-- UPDATE meat_poultry_egg_inspect
-- SET zip = '00' || zip
-- WHERE st IN('PR', 'VI') AND LENGTH(zip) = 3

-- UPDATE meat_poultry_egg_inspect
-- SET zip = '0' || zip
-- WHERE st IN('CT','MA','ME','NH','NJ','RI','VT') AND length(zip) = 4;


















