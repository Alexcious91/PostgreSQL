-- CREATE OR REPLACE VIEW nevada_counties_pop_2010 AS
--     SELECT geo_name,
--            state_fips,
--            county_fips,
--            p0010001 AS pop_2010
--     FROM us_counties_2010
--     WHERE state_us_abbreviation = 'NV'
--     ORDER BY county_fips;

-- SELECT *
-- FROM nevada_counties_pop_2010
-- LIMIT 5;

-- CREATE OR REPLACE VIEW county_pop_change_2010_2000 AS
--     SELECT c2010.geo_name,
--            c2010.state_us_abbreviation AS st,
--            c2010.state_fips,
--            c2010.county_fips,
--            c2010.p0010001 AS pop_2010,
--            c2000.p0010001 AS pop_2000,
--            round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
--                / c2000.p0010001 * 100, 1 ) AS pct_change_2010_2000
--     FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
--     ON c2010.state_fips = c2000.state_fips
--        AND c2010.county_fips = c2000.county_fips
--     ORDER BY c2010.state_fips, c2010.county_fips;

-- SELECT geo_name,
--        st,
--        pop_2010,
--        pct_change_2010_2000
-- FROM county_pop_change_2010_2000
-- WHERE st = 'NV'
-- LIMIT 5;

-- CREATE OR REPLACE VIEW employees_tax_dept AS
--      SELECT emp_id,
--             first_name,
--             last_name,
--             dept_id
--      FROM employees
--      WHERE dept_id = 1
--      ORDER BY emp_id
--      WITH LOCAL CHECK OPTION;

-- SELECT * FROM employees_tax_dept;
-- SELECT * FROM employees;

-- INSERT INTO employees_tax_dept (first_name, last_name, dept_id)
-- VALUES ('Suzanne', 'Legere', 1);

-- INSERT INTO employees_tax_dept (first_name, last_name, dept_id)
-- VALUES ('Jamil', 'White', 2);

-- SELECT * FROM employees_tax_dept;

-- SELECT * FROM employees;

-- UPDATE employees_tax_dept
-- SET last_name = 'Le Gere'
-- WHERE emp_id = 5;

-- SELECT * FROM employees_tax_dept;

-- DELETE FROM employees_tax_dept
-- WHERE emp_id = 5

-- CREATE OR REPLACE FUNCTION
-- percent_change(new_value numeric,
--                old_value numeric,
--                decimal_places integer DEFAULT 1)
-- RETURNS numeric AS
-- 'SELECT round(
--         ((new_value - old_value) / old_value) * 100, decimal_places
-- );'
-- LANGUAGE SQL
-- IMMUTABLE
-- RETURNS NULL ON NULL INPUT;


