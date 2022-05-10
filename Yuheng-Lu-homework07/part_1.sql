DROP TABLE IF EXISTS staging_caers_events;

CREATE TABLE staging_caers_events (
	caers_event_id serial primary key,
	report_id varchar(255),
    created_date date,
    event_date date,
    product_type text,
    product text,
    product_code text,
    description text,
    patient_age integer,
    age_units varchar(255),
    sex varchar(255),
    terms text,
    outcomes text);

COPY staging_caers_events (
	report_id, created_date, event_date,
	product_type, product, product_code,
	description, patient_age, age_units,
	sex, terms, outcomes)
FROM '/Users/Yuheng_Lu/Desktop/NYU/Intra-curriculum/2021-2022/Fall 2021/CSCI-UA 479/HW/Yuheng-Lu-homework07/CAERS_ASCII_11_14_to_12_17.csv'
(FORMAT CSV, HEADER, ENCODING 'LATIN1');

SELECT report_id, upper(product) as product
FROM staging_caers_events
WHERE patient_age = 75;
-- I already inspect patient_age with different age_units.
-- For week(s), the max patient_age is 63 weeks, there will not be the case 3900 weeks = 75 years.
-- For day(s), the max patient_age is 104 days, there will not be the case 328500 days = 75 years
-- For month(s), the max patient_age is 49 months, there will not be the case 900 months = 75 years.
-- For Decade(s), all values in patient_age are integers, there will not be the case 7.5 decades = 75 years.
-- Therefore, we only consider when age_units is year(s).

EXPLAIN ANALYZE SELECT report_id, upper(product) as product
FROM staging_caers_events
WHERE patient_age = 75;
-------------------------------------------------------------------------------------------------------------------------
-- Seq Scan on staging_caers_events  (cost=0.00..1975.88 rows=553 width=39) (actual time=0.136..17.860 rows=561 loops=1)
--   Filter: (patient_age = 75)
--   Rows Removed by Filter: 49879
-- Planning Time: 0.674 ms
-- Execution Time: 17.987 ms

CREATE INDEX age_index on staging_caers_events(patient_age);
-- Index name: age_index

SELECT report_id, upper(product) as product
FROM staging_caers_events
WHERE patient_age <= 75;