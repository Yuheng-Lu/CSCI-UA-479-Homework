-- write your queries underneath each number:
-- 1. the total number of rows in the database
SELECT COUNT(*)
FROM citi_bike_jc;

-- 2. show the first 15 rows, but only display 3 columns (your choice)
SELECT ride_id, start_station_name, start_lat
FROM citi_bike_jc
LIMIT 15;

-- 3. do the same as above, but chose a column to sort on, and sort in descending order
SELECT ride_id, start_station_name, start_lat
FROM citi_bike_jc
ORDER BY start_lat DESC
LIMIT 15;

-- 4. add a new column without a default value
ALTER TABLE citi_bike_jc
ADD ride_duration interval;

-- 5. set the value of that new column
UPDATE citi_bike_jc
SET ride_duration = ended_at - started_at;

-- 6. show only the unique (non duplicates) of a column of your choice
SELECT DISTINCT start_station_name
FROM citi_bike_jc;

-- 7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 
SELECT start_station_name, COUNT(*)
FROM citi_bike_jc
GROUP BY start_station_name
ORDER BY count DESC;

-- 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups
SELECT start_station_name, COUNT(*)
FROM citi_bike_jc
GROUP BY start_station_name
HAVING COUNT(*) > 3000;

-- 9. group by end_station_name, and show the numbers of bikes stopped in each stations in descending order
SELECT end_station_name, COUNT(*)
FROM citi_bike_jc
GROUP BY end_station_name
ORDER BY count DESC;

-- 10. group by start_station_name, and show users start from which stations have a more than 30 minutes ride on average
SELECT start_station_name, AVG(ride_duration)
FROM citi_bike_jc
GROUP BY start_station_name
HAVING AVG(ride_duration) > INTERVAL '30 MINUTE';

-- 11. group by member_casual, and count how many are member and how many are casual
SELECT member_casual, COUNT(*)
FROM citi_bike_jc
GROUP BY member_casual;

-- 12. group by rideable_tupe, and count how many are classic bike and how many are docked bike
SELECT rideable_type, COUNT(*)
FROM citi_bike_jc
GROUP BY rideable_type;
