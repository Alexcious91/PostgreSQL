-- SELECT 
--  date_part('year', '2019-12-01 18:37:12 EST'::timestamptz) AS "year",
--  date_part('month', '2019-12-01 18:37:12 EST'::timestamptz) AS "month",
--  date_part('day', '2019-12-01 18:37:12 EST'::timestamptz) AS "day",
--  date_part('hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "hour",
--  date_part('minute', '2019-12-01 18:37:12 EST'::timestamptz) AS "minute",
--  date_part('seconds', '2019-12-01 18:37:12 EST'::timestamptz) AS "seconds",
--  date_part('timezone_hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "tz",
--  date_part('week', '2019-12-01 18:37:12 EST'::timestamptz) AS "week",
--  date_part('quarter', '2019-12-01 18:37:12 EST'::timestamptz) AS "quarter",
--  date_part('epoch', '2019-12-01 18:37:12 EST'::timestamptz) AS "epoch";

-- SELECT make_date(2018, 2, 22);
-- SELECT make_time(18, 4, 30.3); 
-- -- 	   make_timestamptz(year, month, day, hour, minute, second, time zone) 
-- SELECT make_timestamptz(2018, 2, 22, 18, 4, 30.3, 'Europe/Lisbon');

-- SELECT
--     current_date,
--     current_time,
--     current_timestamp,
--     localtime,
--     localtimestamp,
--     now();

-- SHOW timezone

-- SELECT * FROM pg_timezone_abbrevs
-- SELECT * FROM pg_timezone_names


-- SET timezone TO 'US/Pacific';

-- CREATE TABLE time_zone_test (
-- 	test_date timestamptz
-- )

-- SET timezone TO 'US/Eastern';

-- SELECT '2024/08/18'::date - '2024/08/15'::date AS date_difference;

-- CREATE TABLE nyc_yellow_taxi_trips_2016_06_01 (
--  trip_id bigserial PRIMARY KEY,
--  vendor_id varchar(1) NOT NULL,
--  tpep_pickup_datetime timestamp with time zone NOT NULL,
--  tpep_dropoff_datetime timestamp with time zone NOT NULL,
--  passenger_count integer NOT NULL,
--  trip_distance numeric(8,2) NOT NULL,
--  pickup_longitude numeric(18,15) NOT NULL,
--  pickup_latitude numeric(18,15) NOT NULL,
--  rate_code_id varchar(2) NOT NULL,
--  store_and_fwd_flag varchar(1) NOT NULL,
--  dropoff_longitude numeric(18,15) NOT NULL,
--  dropoff_latitude numeric(18,15) NOT NULL,
--  payment_type varchar(1) NOT NULL,
--  fare_amount numeric(9,2) NOT NULL,
--  extra numeric(9,2) NOT NULL,
--  mta_tax numeric(5,2) NOT NULL,
--  tip_amount numeric(9,2) NOT NULL,
--  tolls_amount numeric(9,2) NOT NULL,
--  improvement_surcharge numeric(9,2) NOT NULL,
--  total_amount numeric(9,2) NOT NULL
-- );

-- COPY nyc_yellow_taxi_trips_2016_06_01 (
--  vendor_id,
--  tpep_pickup_datetime,
--  tpep_dropoff_datetime,
--  passenger_count,
--  trip_distance,
--  pickup_longitude,
--  pickup_latitude,
--  rate_code_id,
--  store_and_fwd_flag,
--  dropoff_longitude,
--  dropoff_latitude,
--  payment_type,
--  fare_amount,
--  extra,
--  mta_tax,
--  tip_amount,
--  tolls_amount,
--  improvement_surcharge,
--  total_amount 
--  )
-- FROM 'D:\bootcamp\06_sql\source_code\Chapter_11\yellow_tripdata_2016_06_01.csv'
-- WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- CREATE INDEX tpep_pickup_idx
-- ON nyc_yellow_taxi_trips_2016_06_01 (tpep_pickup_datetime)

-- SELECT COUNT(*) FROM nyc_yellow_taxi_trips_2016_06_01

-- SET timezone TO 'US/Eastern'

-- SELECT 
-- 	date_part('hour', tpep_pickup_datetime) AS trip_hour,
-- 	COUNT(*)
-- FROM nyc_yellow_taxi_trips_2016_06_01
-- GROUP BY trip_hour
-- ORDER BY trip_hour
-- ORDER BY COUNT(*) DESC;


SELECT 
	date_part('hour', tpep_pickup_datetime) AS trip_hour,
	percentile_cont(.5)
		WITHIN GROUP (ORDER BY 
			tpep_dropoff_datetime - tpep_pickup_datetime
		) AS median_trip
FROM nyc_yellow_taxi_trips_2016_06_01
GROUP BY trip_hour
ORDER BY trip_hour























	