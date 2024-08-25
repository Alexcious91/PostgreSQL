-- CREATE TABLE department (
-- 	depart_id SERIAL PRIMARY KEY,
-- 	depart_name VARCHAR(50),
-- 	depart_city VARCHAR(50)
-- )

-- CREATE TABLE roles (
-- 	role_id SERIAL PRIMARY KEY,
-- 	role VARCHAR(50)
-- )

-- CREATE TABLE SALARIES (
-- 	salary_id SERIAL PRIMARY KEY,
-- 	salary_pa NUMERIC(10, 2)
-- )

-- CREATE TABLE overtime_hours (
-- 	overtime_id SERIAL PRIMARY KEY,
-- 	overtime_hours INTEGER
-- )

-- CREATE TABLE employees (
-- 	emp_id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(100),
-- 	surname VARCHAR(100),
-- 	gender CHAR(1),
-- 	address TEXT,
-- 	email VARCHAR(100),
-- 	depart_id SERIAL REFERENCES department(depart_id),
-- 	role_id SERIAL REFERENCES roles(role_id),
-- 	salary_id SERIAL REFERENCES salaries(salary_id),
-- 	overtime_id SERIAL REFERENCES overtime_hours(overtime_id)
-- )

-- Insert data 

-- INSERT INTO department (depart_name, depart_city)
-- VALUES 
-- 	('HR', 'New York City'),
-- 	('IT', 'Newcastle')

-- INSERT INTO roles(role)
-- VALUES 
-- 	('HR Manager'),
-- 	('Software Developer')

-- INSERT INTO salaries(salary_pa)
-- VALUES 
-- 	('70000.00'),
-- 	('91000.00')

-- INSERT INTO overtime_hours(overtime_hours)
-- VALUES 
-- 	(10),
-- 	(7)

-- INSERT INTO Employees (first_name, surname, gender, address, email, depart_id, role_id, salary_id, overtime_id) 
-- VALUES
--   ('Maddy', 'Max', 'F', '123 Main St', 'johndoe@example.com', 2, 2, 1, 1)
--   ('John', 'Scott', 'M', '123 Main St', 'johndoe@example.com', 2, 2, 1, 1),
--   ('Alex', 'Smith', 'M', '456 Buffalo St', 'alexsmith@example.com', 2, 2, 1, 1),
--   ('Michael', 'Bolton', 'M', '789 Oak St', 'michaelbolton@example.com', 1, 1, 2, 2);

SELECT 
	e.first_name || ' ' || e.surname AS employee_name,
	d.depart_name AS department_name,
	r.role AS employee_role,
	s.salary_pa AS salary_per_annum,
	o.overtime_hours
FROM 
	department d
LEFT JOIN 
	employees e ON d.depart_id = e.depart_id
LEFT JOIN 
	roles r ON e.role_id = r.role_id
LEFT JOIN 
	salaries s ON e.salary_id = s.salary_id
LEFT JOIN 
	overtime_hours o ON e.overtime_id = o.overtime_id



