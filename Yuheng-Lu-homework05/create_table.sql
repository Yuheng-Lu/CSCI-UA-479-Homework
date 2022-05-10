-- write your table creation sql here!
CREATE TABLE citi_bike_jc (
	ride_id varchar(50) UNIQUE NOT NULL,
	rideable_type varchar(20),
	started_at timestamp,
	ended_at timestamp,
	start_station_name varchar(100),
	start_station_id varchar(100),
	end_station_name varchar(100),
	end_station_id varchar(100),
	start_lat real,
	start_lng real,
	end_lat real,
	end_lng real,
	member_casual varchar(100),
	PRIMARY KEY (ride_id)
);
