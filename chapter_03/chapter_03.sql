-- Listing 3-1: Character data types in action

CREATE TABLE char_data_types (
    varchar_column varchar(10),
    char_column char(10),
    text_column text
);

INSERT INTO char_data_types
VALUES
    ('abc', 'abc', 'abc'),
    ('defghi', 'defghi', 'defghi');

COPY char_data_types TO 'D:\typetest2.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');


-- Listing 3-2: Number data types in action

CREATE TABLE number_data_types (
    numeric_column numeric(20, 5),
    real_column real,
    double_column double precision
);

INSERT INTO number_data_types
VALUES
    (.7, .7, .7),
    (2.13579, 2.13579, 2.13579),
    (2.1357987654, 2.1357987654, 2.1357987654);

SELECT * FROM number_data_types;
