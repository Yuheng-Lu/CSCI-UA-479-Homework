-- write your COPY statement to import a csv here
COPY citi_bike_jc 
-- please replace what in the single quote with the path where you save the csv file
FROM 'JC-202108-citibike-tripdata.csv'
DELIMITER ','
CSV HEADER;