-- CREATE TABLE person_info (
-- 	license_id VARCHAR(10),
-- 	first_name VARCHAR(50),
-- 	last_name VARCHAR(50),
-- 	CONSTRAINT license_key PRIMARY KEY (license_id)
-- );

-- INSERT INTO person_info (license_id, first_name, last_name)
-- VALUES ('T229901', 'Sam', 'Tracy')

-- 7.5

-- CREATE TABLE surrogate_example (
-- 	order_number BIGSERIAL,
-- 	product_name VARCHAR(50),
-- 	order_date DATE,
-- 	CONSTRAINT order_key PRIMARY KEY(order_number)
-- )

-- INSERT INTO surrogate_example (product_name, order_date)
-- VALUES 
-- 	('Beachball Polish', '2015-03-17'),
-- 	('Wrinkle De-Atomizer', '2017-05-22'),
-- 	('Flux Capacitor', '1985-10-26')

-- SELECT * FROM surrogate_example

-- 7.6 

-- CREATE TABLE licenses (
-- 	license_id VARCHAR(10),
-- 	first_name VARCHAR(50),
-- 	last_name VARCHAR(50),
-- 	CONSTRAINT licenses_key PRIMARY KEY (license_id)
-- )

-- CREATE TABLE registrations (
-- 	registration_id VARCHAR(10),
-- 	registration_date DATE,
-- 	license_id VARCHAR(10) REFERENCES licenses (license_id),
-- 	CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
-- )

-- INSERT INTO licenses (license_id, first_name, last_name)
-- VALUES ('T229901', 'Lynn', 'Malero')

-- INSERT INTO registrations (registration_id, registration_date, license_id)
-- VALUES ('A203391', '2017-03-17', 'T229901');

-- INSERT INTO registrations (registration_id, registration_date, license_id)
-- VALUES ('A75772', '2017-03-17', 'T000001');

SELECT 
	r.registration_id,
	r.registration_date,
	l.first_name || ' ' || l.last_name AS full_name,
	l.license_id
FROM registrations r
JOIN licenses l
ON r.license_id = l.license_id



