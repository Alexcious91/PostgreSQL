-- -- Case formatting
-- SELECT upper('Neal7');
-- SELECT lower('Randy');
-- SELECT initcap('at the end of the day');
-- -- Note initcap's imperfect for acronyms
-- SELECT initcap('Practical SQL');

-- -- Character Information
-- SELECT char_length(' Pat ');
-- SELECT length(' Pat ');
-- SELECT position(', ' in 'Tan, Bella');

-- -- Removing characters
-- SELECT trim('s' from 'socks');
-- SELECT trim(trailing 's' from 'socks');
-- SELECT trim(' Pat ');
-- SELECT char_length(trim(' Pat ')); -- note the length change
-- SELECT ltrim('socks', 's');
-- SELECT rtrim('socks', 's');

-- -- Extracting and replacing characters
-- SELECT left('703-555-1212', 3);
-- SELECT right('703-555-1212', 8);
-- SELECT replace('bat', 'b', 'c');


-- -- Table 13-2: Regular Expression Matching Examples

-- -- Any character one or more times
-- SELECT substring('The game starts at 7 p.m. on May 2, 2019.' from '.+');
-- -- One or two digits followed by a space and p.m.
-- SELECT substring('The game starts at 7 p.m. on May 2, 2019.' from '\d{1,2} (?:a.m.|p.m.)');
-- -- One or more word characters at the start
-- SELECT substring('The game starts at 7 p.m. on May 2, 2019.' from '^\w+');
-- -- One or more word characters followed by any character at the end.
-- SELECT substring('The game starts at 7 p.m. on May 2, 2019.' from '\w+.$');
-- -- The words May or June
-- SELECT substring('The game starts at 7 p.m. on May 2, 2019.' from 'May|June');
-- -- Four digits
-- SELECT substring('The game starts at 7 p.m. on May 2, 2019.' from '\d{4}');
-- -- May followed by a space, digit, comma, space, and four digits.
-- SELECT substring('The game starts at 7 p.m. on May 2, 2019.' from 'May \d, \d{4}');

-- CREATE TABLE crime_reports (
--     crime_id bigserial PRIMARY KEY,
--     date_1 timestamp with time zone,
--     date_2 timestamp with time zone,
--     street varchar(250),
--     city varchar(100),
--     crime_type varchar(100),
--     description text,
--     case_number varchar(50),
--     original_text text NOT NULL
-- );

-- COPY crime_reports (original_text)
-- FROM 'D:\bootcamp\06_sql\source_code\Chapter_13\crime_reports.csv'
-- WITH (FORMAT CSV, HEADER OFF, QUOTE '"');

SELECT 
	crime_id,
	regexp_matches(original_text, '\d{1,2}\/\d{1,2}\/\d{2}', 'g')
FROM crime_reports

-- Listing 13-5: Using regexp_match() to find the second date
-- Note that the result includes an unwanted hyphen
SELECT crime_id,
       regexp_match(original_text, '-\d{1,2}\/\d{1,2}\/\d{1,2}')
FROM crime_reports;

-- Listing 13-6: Using a capture group to return only the date
-- Eliminates the hyphen
SELECT crime_id,
       regexp_match(original_text, '-(\d{1,2}\/\d{1,2}\/\d{1,2})')
FROM crime_reports;

SELECT
    regexp_match(original_text, '(?:C0|SO)[0-9]+') AS case_number,
    regexp_match(original_text, '\d{1,2}\/\d{1,2}\/\d{2}') AS date_1,
	regexp_match(original_text, '-(\d{1,2}\/\d{1,2}\/\d{2})'),
    regexp_match(original_text, '\n(?:\w+ \w+|\w+)\n(.*):') AS crime_type,
    regexp_match(original_text, '(?:Sq.|Plz.|Dr.|Ter.|Rd.)\n(\w+ \w+|\w+)\n')
        AS city
FROM crime_reports;

SELECT *
FROM crime_reports


















