-- CREATE TABLE profession (
-- 	prof_id SERIAL PRIMARY KEY,
-- 	profession VARCHAR(100)
-- )

-- CREATE TABLE zip_code (
-- 	zip_code INTEGER PRIMARY KEY,
-- 	city VARCHAR(50),
-- 	state VARCHAR(50)
-- )

-- CREATE TABLE status (
-- 	status_id SERIAL PRIMARY KEY,
-- 	status VARCHAR(50)
-- )

-- CREATE TABLE interests (
-- 	interest_id SERIAL PRIMARY KEY,
-- 	interest VARCHAR(100)
-- )

-- CREATE TABLE seeking (
-- 	seeking_id SERIAL PRIMARY KEY,
-- 	seeking VARCHAR(100)
-- )

-- CREATE TABLE my_contacts (
-- 	contact_id SERIAL PRIMARY KEY,
-- 	last_name VARCHAR(100),
-- 	first_name VARCHAR(100),
-- 	phone BIGINT,
-- 	email VARCHAR(50),
-- 	gender CHAR(1),
-- 	birthday DATE,
-- 	prof_id INTEGER REFERENCES profession(prof_id),
-- 	zip_code INTEGER REFERENCES zip_code(zip_code),
-- 	status_id INTEGER REFERENCES status(status_id)
-- )

-- CREATE TABLE contact_interest (
-- 	contact_id INTEGER REFERENCES my_contacts(contact_id),
-- 	interest_id INTEGER REFERENCES interests(interest_id),
-- 	PRIMARY KEY (contact_id, interest_id)
-- )

-- CREATE TABLE contact_seeking (
-- 	contact_id INTEGER REFERENCES my_contacts(contact_id),
-- 	seeking_id INTEGER REFERENCES seeking(seeking_id),
-- 	PRIMARY KEY (contact_id, seeking_id)
-- )

-- INSERT INTO profession (profession) 
-- VALUES ('Engineer'), ('Artist');

-- INSERT INTO zip_code (zip_code, city, state) 
-- VALUES 
-- 	(90210, 'Beverly Hills', 'CA'),
-- 	(10001, 'New York', 'NY'), 
-- 	(30301, 'Atlanta', 'GA')

-- INSERT INTO status (status) 
-- VALUES ('Single'), ('Married')

-- INSERT INTO interests (interest)
-- VALUES 
-- 	('Cooking'), 
-- 	('Traveling'), 
-- 	('Reading');

-- INSERT INTO seeking (seeking) 
-- VALUES 
-- 	('Friendship'),
-- 	('Relationship')

-- INSERT INTO zip_code (zip_code, city, province)
-- VALUES 
-- 	(0001, 'Pretoria', 'Gauteng'),
-- 	(2000, 'Johannesburg', 'Gauteng'),
-- 	(9300, 'Bloemfontein', 'Free State'),
-- 	(9460, 'Welkom', 'Free State'),
-- 	(1240, 'Nelspruit', 'Mpumalanga'),
-- 	(1200, 'White River', 'Mpumalanga'),
-- 	(0700, 'Polokwane', 'Limpopo'),
-- 	(0850, 'Tzaneen', 'Limpopo'),
-- 	(2745, 'Mahikeng', 'North West'),
-- 	(0300, 'Rustenburg', 'North West'),
-- 	(8800, 'Upington', 'Northern Cape'),
-- 	(8300, 'Kimberly', 'Northern Cape'),
-- 	(7600, 'Stellenbosch', 'Western Cape'),
-- 	(8000, 'Cape Town', 'Western Cape'),
-- 	(4000, 'Durban', 'KwaZulu-Natal'),
-- 	(3201, 'Pietermaritzburg', 'KwaZulu-Natal')


-- INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id) 
-- VALUES
-- 	('Smith', 'John', 1234567890, 'john.smith@example.com', 'M', '1985-06-15', 1, 0001, 1),
-- 	('Johnson', 'Emily', 2345678901, 'emily.johnson@example.com', 'F', '1990-08-22', 2, 3201, 2),
-- 	('Williams', 'Michael', 3456789012, 'michael.williams@example.com', 'M', '1978-03-30', 1, 4000, 2),
-- 	('Jones', 'Sarah', 4567890123, 'sarah.jones@example.com', 'F', '1982-12-10', 2, 4000, 2),
-- 	('Brown', 'David', 5678901234, 'david.brown@example.com', 'M', '1991-07-19', 2, 8000, 1),
-- 	('Davis', 'Olivia', 6789012345, 'olivia.davis@example.com', 'F', '1989-05-05', 2, 1240, 2),
-- 	('Miller', 'James', 7890123456, 'james.miller@example.com', 'M', '1983-11-23', 1, 1200, 1),
-- 	('Wilson', 'Sophia', 8901234567, 'sophia.wilson@example.com', 'F', '1992-04-14', 2, 2745, 2),
-- 	('Moore', 'Daniel', 9012345678, 'daniel.moore@example.com', 'M', '1975-09-09', 2, 0300, 1),
-- 	('Taylor', 'Isabella', 1234567891, 'isabella.taylor@example.com', 'F', '1988-10-26', 1, 3201, 1),
-- 	('Anderson', 'Matthew', 2345678902, 'matthew.anderson@example.com', 'M', '1987-01-17', 1, 0850, 1),
-- 	('Thomas', 'Emma', 3456789013, 'emma.thomas@example.com', 'F', '1993-02-12', 1, 2000, 1),
-- 	('Jackson', 'Joshua', 4567890124, 'joshua.jackson@example.com', 'M', '1984-07-04', 1, 2000, 1),
-- 	('White', 'Mia', 5678901235, 'mia.white@example.com', 'F', '1981-11-30', 2, 1240, 2),
-- 	('Harris', 'Alexander', 6789012346, 'alexander.harris@example.com', 'M', '1995-03-03', 1, 4000, 1);

-- INSERT INTO contact_seeking(contact_id, seeking_id)
-- VALUES 
-- 	(14, 1),
-- 	(9, 1),
-- 	(13, 1),
-- 	(5, 1),
-- 	(4, 1),
-- 	(15, 1),
-- 	(8, 1),
-- 	(11, 1),
-- 	(7, 1),
-- 	(12, 1),
-- 	(16, 1),
-- 	(3, 1),
-- 	(6, 1),
-- 	(10, 1),
-- 	(2, 1)

-- INSERT INTO contact_interest(contact_id, interest_id)
-- VALUES 
-- 	(2, 1),
-- 	(2, 2),
-- 	(3, 2),
-- 	(3, 3),
-- 	(4, 1),
-- 	(4, 2),
-- 	(5, 1),
-- 	(5, 2),
-- 	(6, 3),
-- 	(6, 2),
-- 	(7, 1),
-- 	(7, 2),
-- 	(8, 3),
-- 	(8, 2),
-- 	(9, 3),
-- 	(9, 2),
-- 	(10, 1),
-- 	(10, 3),
-- 	(11, 1),
-- 	(11, 3),
-- 	(12, 2),
-- 	(12, 1),
-- 	(13, 1),
-- 	(13, 2),
-- 	(14, 1),
-- 	(14, 3),
-- 	(15, 1),
-- 	(15, 2),
-- 	(16, 2),
-- 	(16, 3)

SELECT 
	m.contact_id,
	m.first_name || ' ' || m.last_name AS fullname,
	m.phone,
	m.email,
	m.gender,
	m.birthday,
	p.profession,
	z.city,
	z.province,
	st.status,
	i.interest,
	sk.seeking
FROM my_contacts m
LEFT JOIN profession p ON m.prof_id = p.prof_id
LEFT JOIN zip_code z ON m.zip_code = z.zip_code
LEFT JOIN status st ON m.status_id = st.status_id
LEFT JOIN contact_interest ci ON m.contact_id = ci.contact_id
LEFT JOIN interests i ON ci.interest_id = i.interest_id
LEFT JOIN contact_seeking cs ON m.contact_id = cs.contact_id
LEFT JOIN seeking sk ON cs.seeking_id = sk.seeking_id
	
SELECT * FROM seeking


