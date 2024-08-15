-- Listing 2-1: Querying all rows and columns from the teachers table

SELECT * FROM teachers;

-- Listing 2-2: Querying a subset of columns

SELECT last_name, first_name, salary FROM teachers;

-- Listing 2-3: Querying distinct values in the school column

SELECT DISTINCT school
FROM teachers;

-- Listing 2-4: Querying distinct pairs of values in the school and salary
-- columns

SELECT DISTINCT school, salary
FROM teachers;

-- Listing 2-5: Sorting a column with ORDER BY

SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary DESC;

-- Listing 2-6: Sorting multiple columns with ORDER BY

SELECT last_name, school, hire_date
FROM teachers
ORDER BY school ASC, hire_date DESC;
