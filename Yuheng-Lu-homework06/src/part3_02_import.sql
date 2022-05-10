COPY staging_caers_events (
	report_id, created_date, event_date,
	product_type, product, product_code,
	description, patient_age, age_units,
	sex, terms, outcomes)
FROM '/Users/Yuheng_Lu/Desktop/NYU/2021-2022/Fall 2021/CSCI-UA 479/HW/Yuheng-Lu-homework06/data/CAERS_ASCII_11_14_to_12_17.csv'
(FORMAT CSV, HEADER, ENCODING 'LATIN1');
