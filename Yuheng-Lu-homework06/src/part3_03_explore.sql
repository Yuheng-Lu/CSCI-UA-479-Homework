-- 1. This query tries to determine whether or not report_id is unique.
SELECT report_id, COUNT(*)
FROM staging_caers_events
GROUP BY report_id
HAVING COUNT(*) > 1;
--    report_id    | count
-------------------+-------
-- 180072          |     3
-- 181790          |     4
-- 204980          |     3
-- 184966          |     2
-- 180281          |    10
-- 174642          |     2
-- 192864          |     2
-- ...             |   ...

-- 2. This query tries to determine whether or not report_id has one to one mapping with created_date, event_date, patient_age, age_units, sex, terms, and outcomes.
SELECT report_id, COUNT(created_date), COUNT(event_date), COUNT(patient_age), COUNT(age_units), COUNT(sex), COUNT(terms), COUNT(outcomes)
FROM (SELECT report_id, created_date, event_date, patient_age, age_units, sex, terms, outcomes FROM staging_caers_events
	  GROUP BY report_id, created_date, event_date, patient_age, age_units, sex, terms, outcomes) SUBTABLE
GROUP BY report_id
HAVING COUNT(created_date) > 1 OR COUNT(event_date) > 1 OR COUNT(patient_age) > 1 OR COUNT(age_units) > 1 OR COUNT(sex) > 1 OR COUNT(terms) > 1 OR COUNT(outcomes) > 1;
-- report_id | count | count | count | count | count | count | count
-------------+-------+-------+-------+-------+-------+-------+-------
--(0 rows)

-- 3. This query tries to determine whether or not caers_event_id is unique.
SELECT caers_event_id, COUNT(*)
FROM staging_caers_events
GROUP BY caers_event_id
HAVING COUNT(*) > 1;
-- caers_event_id | count
------------------+-------
--(0 rows)

-- 4. This query tries to determine whether or not product_code is unique.
SELECT product_code, COUNT(*)
FROM staging_caers_events
GROUP BY product_code
HAVING COUNT(*) > 1;
-- product_code | count
----------------+-------
--              |    18
-- 12           |   121
-- 54           | 28221
-- 41G          |    61
-- 7            |   296
-- 13           |   313
-- ...          |   ...
--(46 rows)

-- 5. This query tries to determine whether or not product_code and description are one to one mapping (each description has a product_code).
SELECT product_code, COUNT(description)
FROM (SELECT product_code, description FROM staging_caers_events
	  GROUP BY product_code, description) SUBTABLE
GROUP BY product_code
HAVING COUNT(description) > 1;
-- product_code | count
----------------+-------
-- 9            |     2
-- 20           |     2
-- 5            |     2
-- 16           |     2
--(4 rows)

SELECT product_code, description FROM staging_caers_events
GROUP BY product_code, description
HAVING product_code = '9' OR product_code = '20' OR product_code = '5' OR product_code = '16';
-- product_code |         description
----------------+------------------------------
-- 16           | Fishery/Seafood Prod
-- 20           |  Fruit/Fruit Prod
-- 20           | Fruit/Fruit Prod
-- 5            |  Cereal Prep/Breakfast Food
-- 9            | Milk/Butter/Dried Milk Prod
-- 9            |  Milk/Butter/Dried Milk Prod
-- 16           |  Fishery/Seafood Prod
-- 5            | Cereal Prep/Breakfast Food
--(8 rows)
