# Overview

### Source of the Data

1. Name / Title: JC-202108-citibike-tripdata

2. Link to Data: https://s3.amazonaws.com/tripdata/JC-202108-citibike-tripdata.csv.zip

3. Source / Origin: 
   - Author or Creator: Bikeshare
   - Publication Date: Sep 9th, 2021
   - Publisher: Bikeshare
   - Version or Data Accessed: 1.0 (the version is not listed, so I assume it as Ver 1.0)

4. License: Citi Bike Data License Agreement https://ride.citibikenyc.com/data-sharing-policy

5. Can You Use this Data Set for Your Intended Use Case? Yes.

### What it contains?

- Field/Column 1: ride_id.

- Field/Column 2: rideable_type.

- Field/Column 3: started_at.

- Field/Column 4: ended_at.

- Field/Column 5: start_station_name.

- Field/Column 6: start_station_id.

- Field/Column 7: end_station_name.

- Field/Column 8: end_station_id.

- Field/Column 9: start_lat.

- Field/Column 10: start_lng.

- Field/Column 11: end_lat.

- Field/Column 12: end_lng.

- Field/Column 13: member_casual.

# Table Design

- Field/Column 1: ride_id, varchar, primary key, unique not null.

- Field/Column 2: rideable_type, string, null allowed.

- Field/Column 3: started_at, timestamp, null allowed.

- Field/Column 4: ended_at, timestamp, null allowed.

- Field/Column 5: start_station_name, varchar, null allowed.

- Field/Column 6: start_station_id, varchar, null allowed.

- Field/Column 7: end_station_name, varchar, null allowed.

- Field/Column 8: end_station_id, varchar, null allowed.

- Field/Column 9: start_lat, real, null allowed.

- Field/Column 10: start_lng, real, null allowed.

- Field/Column 11: end_lat, real, null allowed.

- Field/Column 12: end_lng, real, null allowed.

- Field/Column 13: member_casual, varchar, null allowed.

# Import

Import succeeded without error.

# Database Information
```
             List of relations
 Schema |     Name     | Type  |   Owner   
--------+--------------+-------+-----------
 public | citi_bike_jc | table | Yuheng_Lu
(1 row)
```
```
                            Table "public.citi_bike_jc"
       Column       |            Type             | Collation | Nullable | Default 
--------------------+-----------------------------+-----------+----------+---------
 ride_id            | character varying(50)       |           | not null | 
 rideable_type      | character varying(20)       |           |          | 
 started_at         | timestamp without time zone |           |          | 
 ended_at           | timestamp without time zone |           |          | 
 start_station_name | character varying(100)      |           |          | 
 start_station_id   | character varying(100)      |           |          | 
 end_station_name   | character varying(100)      |           |          | 
 end_station_id     | character varying(100)      |           |          | 
 start_lat          | real                        |           |          | 
 start_lng          | real                        |           |          | 
 end_lat            | real                        |           |          | 
 end_lng            | real                        |           |          | 
 member_casual      | character varying(100)      |           |          | 
Indexes:
    "citi_bike_jc_pkey" PRIMARY KEY, btree (ride_id)
```

# Query Results

```
### 1. the total number of rows in the database
 count 
-------
 93800
```
```
### 2. show the first 15 rows, but only display 3 columns (your choice)
     ride_id      | start_station_name | start_lat 
------------------+--------------------+-----------
 FB5C4694D6F164FB | Madison St & 1 St  |  40.73879
 F022F2BB749C71BD | Sip Ave            | 40.730896
 09BF7EC3DDDB668C | Paulus Hook        | 40.714146
 DBD0BB5F8D3E17FB | Dixon Mills        |  40.72163
 0BBEFFC0A57E84EB | Grand St           |  40.71518
 794D5A82D44F8E54 | Newark Ave         | 40.721523
 51C6A21B765E7ED5 | Newport PATH       | 40.727222
 D88DB3062694D03D | Marin Light Rail   | 40.714584
 797A787170E708D4 | Manila & 1st       |  40.72165
 FE2BD7E0E0374262 | Newport Pkwy       | 40.728745
 28198BD23664B5AB | Newport PATH       | 40.727222
 521DA65F0A4923EB | Warren St          | 40.721123
 54F85C900E951198 | Warren St          | 40.721123
 5B1CD7142270592D | Warren St          | 40.721123
 91719089D1967326 | Marin Light Rail   | 40.714584
```
```
### 3. do the same as above, but chose a column to sort on, and sort in descending order
     ride_id      |  start_station_name   | start_lat 
------------------+-----------------------+-----------
 6EAC132164D20762 | Bloomfield St & 15 St |  40.75453
 1B7A543E3CD55ABD | Bloomfield St & 15 St |  40.75453
 FEBD0D0E513C5B2D | Bloomfield St & 15 St |  40.75453
 AFBEA4B330769081 | Bloomfield St & 15 St |  40.75453
 62E0EA4EA3CE7FC1 | Bloomfield St & 15 St |  40.75453
 08EB2C98C7BB39F6 | Bloomfield St & 15 St |  40.75453
 9EB9875246DAAB5F | Bloomfield St & 15 St |  40.75453
 E0F8A300DC680946 | Bloomfield St & 15 St |  40.75453
 1C60AC3B9B5FDDEE | Bloomfield St & 15 St |  40.75453
 3BB565EA4159C77F | Bloomfield St & 15 St |  40.75453
 FCBAE13DF36FCA68 | Bloomfield St & 15 St |  40.75453
 C9DC9AE790B45083 | Bloomfield St & 15 St |  40.75453
 35B357256565AFCB | Bloomfield St & 15 St |  40.75453
 FFA9066D2BC39305 | Bloomfield St & 15 St |  40.75453
 61E3B159251F8450 | Bloomfield St & 15 St |  40.75453
```
```
### 4. add a new column without a default value
ALTER TABLE
```
```
### 5. set the value of that new column
UPDATE 93800
```
```
### 6. show only the unique (non duplicates) of a column of your choice
              start_station_name              
----------------------------------------------
 Glenwood Ave
 Bloomfield St & 15 St
 South Waterfront Walkway - Sinatra Dr & 1 St
 Dixon Mills
 Harborside
 Essex Light Rail
 4 St & Grand St
 Bergen Ave & Stegman St
 McGinley Square
 Journal Square
 City Hall
 Grand St
 9 St HBLR - Jackson St & 8 St
 Grand St & 2 St
 Christ Hospital
 Manila & 1st
 Newport PATH
 8 St & Washington St
 Lincoln Park
 6 St & Grand St
 14 St Ferry - 14 St & Shipyard Ln
 Brunswick & 6th
 Morris Canal
 5 Corners Library
 Brunswick St
 Hamilton Park
 Washington St
 Mama Johnson Field - 4 St & Jackson St
 Willow Ave & 12 St
 Oakland Ave
 Communipaw & Berry Lane
 12 St & Sinatra Dr N
 Church Sq Park - 5 St & Park Ave
 Jackson Square
 Jersey & 3rd
 Grand St & 14 St
 Hoboken Terminal - Hudson St & Hudson Pl
 Lafayette Park
 Leonard Gordon Park
 Marin Light Rail
 Jersey & 6th St
 Monmouth and 6th
 Columbus Drive
 Grant Ave & MLK Dr
 Heights Elevator
 Grove St PATH
 Montgomery St
 Hilltop
 11 St & Washington St
 Newark Ave
 Newport Pkwy
 Van Vorst Park
 Columbus Park - Clinton St & 9 St
 Union St
 Southwest Park - Jackson St & Observer Hwy
 Pershing Field
 Madison St & 1 St
 Columbus Dr at Exchange Pl
 Liberty Light Rail
 JC Medical Center
 Warren St
 7 St & Monroe St
 Bergen Ave
 Dey St
 Stevens - River Ter & 6 St
 Paulus Hook
 Clinton St & 7 St
 Astor Place
 Baldwin at Montgomery
 Hoboken Terminal - River St & Hudson Pl
 Sip Ave
 Hoboken Ave at Monmouth St
 Madison St & 10 St
 Riverview Park
 Adams St & 11 St
 JCBS Depot
```
```
### 7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 
              start_station_name              | count 
----------------------------------------------+-------
 South Waterfront Walkway - Sinatra Dr & 1 St |  4593
 Hoboken Terminal - Hudson St & Hudson Pl     |  3899
 Grove St PATH                                |  3739
 Hoboken Terminal - River St & Hudson Pl      |  3329
 Newport Pkwy                                 |  3119
 14 St Ferry - 14 St & Shipyard Ln            |  2583
 Newport PATH                                 |  2530
 Hamilton Park                                |  2468
 Sip Ave                                      |  2327
 Marin Light Rail                             |  2250
 11 St & Washington St                        |  2165
 Columbus Dr at Exchange Pl                   |  2127
 Harborside                                   |  2081
 Hoboken Ave at Monmouth St                   |  2064
 Washington St                                |  1947
 Liberty Light Rail                           |  1865
 City Hall                                    |  1790
 8 St & Washington St                         |  1715
 Warren St                                    |  1669
 Madison St & 1 St                            |  1665
 Church Sq Park - 5 St & Park Ave             |  1568
 Columbus Drive                               |  1506
 Grand St & 2 St                              |  1453
 Newark Ave                                   |  1440
 JC Medical Center                            |  1409
 Grand St & 14 St                             |  1361
 Columbus Park - Clinton St & 9 St            |  1255
 Southwest Park - Jackson St & Observer Hwy   |  1255
 McGinley Square                              |  1242
 Bloomfield St & 15 St                        |  1227
 Brunswick St                                 |  1165
 7 St & Monroe St                             |  1154
 Manila & 1st                                 |  1153
 Paulus Hook                                  |  1145
 Van Vorst Park                               |  1128
 Grand St                                     |  1048
 12 St & Sinatra Dr N                         |  1023
 4 St & Grand St                              |  1022
 Morris Canal                                 |  1005
 Baldwin at Montgomery                        |   922
 9 St HBLR - Jackson St & 8 St                |   899
 Jersey & 3rd                                 |   870
 Monmouth and 6th                             |   850
 6 St & Grand St                              |   817
 Clinton St & 7 St                            |   816
 Willow Ave & 12 St                           |   769
 Lafayette Park                               |   754
 Pershing Field                               |   729
 Essex Light Rail                             |   725
 Adams St & 11 St                             |   718
 Hilltop                                      |   709
 Bergen Ave                                   |   681
 Mama Johnson Field - 4 St & Jackson St       |   671
 Jersey & 6th St                              |   662
 Lincoln Park                                 |   653
 Journal Square                               |   643
 Montgomery St                                |   618
 Dixon Mills                                  |   614
 Oakland Ave                                  |   595
 Madison St & 10 St                           |   587
 Riverview Park                               |   529
 Astor Place                                  |   523
 Heights Elevator                             |   507
 Brunswick & 6th                              |   482
 Christ Hospital                              |   424
 Glenwood Ave                                 |   411
 Leonard Gordon Park                          |   342
 Communipaw & Berry Lane                      |   332
 Stevens - River Ter & 6 St                   |   287
 Dey St                                       |   255
 5 Corners Library                            |   235
 Union St                                     |   216
 Jackson Square                               |   212
 Bergen Ave & Stegman St                      |   168
 Grant Ave & MLK Dr                           |    89
 JCBS Depot                                   |     2
```
```
### 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups
              start_station_name              | count 
----------------------------------------------+-------
 South Waterfront Walkway - Sinatra Dr & 1 St |  4593
 Hoboken Terminal - Hudson St & Hudson Pl     |  3899
 Grove St PATH                                |  3739
 Newport Pkwy                                 |  3119
 Hoboken Terminal - River St & Hudson Pl      |  3329
```
```
### 9. group by end_station_name, and show the numbers of bikes stopped in each stations in descending order
               end_station_name               | count 
----------------------------------------------+-------
 South Waterfront Walkway - Sinatra Dr & 1 St |  4606
 Hoboken Terminal - Hudson St & Hudson Pl     |  3933
 Grove St PATH                                |  3868
 Hoboken Terminal - River St & Hudson Pl      |  3270
 Newport Pkwy                                 |  3111
 14 St Ferry - 14 St & Shipyard Ln            |  2624
 Newport PATH                                 |  2533
 Hamilton Park                                |  2456
 Sip Ave                                      |  2289
 Marin Light Rail                             |  2247
 Columbus Dr at Exchange Pl                   |  2183
 11 St & Washington St                        |  2150
 Hoboken Ave at Monmouth St                   |  2091
 Harborside                                   |  2072
 Washington St                                |  1952
 City Hall                                    |  1871
 Liberty Light Rail                           |  1858
 Warren St                                    |  1710
 8 St & Washington St                         |  1691
 Madison St & 1 St                            |  1637
 Church Sq Park - 5 St & Park Ave             |  1558
 Columbus Drive                               |  1503
 Grand St & 2 St                              |  1456
 Newark Ave                                   |  1441
 JC Medical Center                            |  1435
 Grand St & 14 St                             |  1365
 Southwest Park - Jackson St & Observer Hwy   |  1272
 Columbus Park - Clinton St & 9 St            |  1272
 Manila & 1st                                 |  1212
 Bloomfield St & 15 St                        |  1208
 7 St & Monroe St                             |  1186
 Paulus Hook                                  |  1163
 Brunswick St                                 |  1155
 Van Vorst Park                               |  1155
 McGinley Square                              |  1064
 12 St & Sinatra Dr N                         |  1061
 Grand St                                     |  1057
 4 St & Grand St                              |  1018
 Morris Canal                                 |   981
 Baldwin at Montgomery                        |   903
 9 St HBLR - Jackson St & 8 St                |   902
 Jersey & 3rd                                 |   871
 Monmouth and 6th                             |   840
 Clinton St & 7 St                            |   811
 6 St & Grand St                              |   778
 Willow Ave & 12 St                           |   767
 Lafayette Park                               |   759
 Essex Light Rail                             |   744
 Adams St & 11 St                             |   741
 Pershing Field                               |   684
 Bergen Ave                                   |   664
 Mama Johnson Field - 4 St & Jackson St       |   664
 Lincoln Park                                 |   662
 Montgomery St                                |   628
 Jersey & 6th St                              |   624
 Dixon Mills                                  |   604
 Madison St & 10 St                           |   598
 Journal Square                               |   596
 Hilltop                                      |   547
                                              |   522
 Astor Place                                  |   507
 Oakland Ave                                  |   504
 Riverview Park                               |   458
 Heights Elevator                             |   451
 Christ Hospital                              |   406
 Brunswick & 6th                              |   354
 Glenwood Ave                                 |   353
 Communipaw & Berry Lane                      |   352
 Leonard Gordon Park                          |   315
 Stevens - River Ter & 6 St                   |   287
 Dey St                                       |   238
 Union St                                     |   225
 Jackson Square                               |   201
 5 Corners Library                            |   187
 Bergen Ave & Stegman St                      |   179
 Grant Ave & MLK Dr                           |    99
 Vesey Pl & River Terrace                     |     6
 12 Ave & W 40 St                             |     5
 Clinton St\t& Cherry St                      |     5
 JCBS Depot                                   |     4
 John St & William St                         |     3
 Cabrini Blvd & W 177 St                      |     3
 Greenwich St & W Houston St                  |     2
 Schermerhorn St & Court St                   |     2
 Harrison St & Hudson St                      |     2
 W 45 St & 8 Ave                              |     2
 11 Ave & W 59 St                             |     2
 Greenwich St & Hubert St                     |     1
 W 4 St & 7 Ave S                             |     1
 10 Ave & W 14 St                             |     1
 Cathedral Pkwy & Broadway                    |     1
 6 Ave & W 33 St                              |     1
 LaGuardia Pl & W 3 St                        |     1
 South St & Gouverneur Ln                     |     1
 Great Jones St                               |     1
 Carmine St & 6 Ave                           |     1
 Pearl St & Hanover Square                    |     1
 Carlton Ave & Dean St                        |     1
 Washington St & Gansevoort St                |     1
 W Broadway & W Houston St                    |     1
 Fort Washington Ave & W 183 St               |     1
 Broadway & W 155 St                          |     1
 E 16 St & 5 Ave                              |     1
 Riverside Dr & W 72 St                       |     1
 West St & Chambers St                        |     1
 Albany St & Greenwich St                     |     1
 W 163 St & Riverside Dr                      |     1
 52 St & 1 Ave                                |     1
 8 Ave & W 33 St                              |     1
 West End Ave & W 60 St                       |     1
 11 Ave & W 27 St                             |     1
 Myrtle Ave & St Edwards St                   |     1
```
```
### 10. group by start_station_name, and show users start from which stations have a more than 30 minutes ride on average
   start_station_name    |       avg       
-------------------------+-----------------
 Bergen Ave & Stegman St | 00:50:58.02381
 Lincoln Park            | 00:30:42.695253
 Communipaw & Berry Lane | 00:37:45.216867
 Jackson Square          | 01:04:51.75
 Grant Ave & MLK Dr      | 00:53:13.955056
 Liberty Light Rail      | 00:30:51.641287
```
```
### 11.  group by member_casual, and count how many are member and how many are casual
 member_casual | count 
---------------+-------
 member        | 41031
 casual        | 52769
```
```
### 12.  group by rideable_tupe, and count how many are classic bike and how many are docked bike
 rideable_type | count 
---------------+-------
 classic_bike  | 92286
 docked_bike   |  1514
```
