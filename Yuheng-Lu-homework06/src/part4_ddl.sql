CREATE TABLE product (
	product_code int,
	description text,
	PRIMARY KEY(product_code)
);

CREATE TABLE outcomes (
	outcome_id serial,
	outcome varchar(255),
	PRIMARY KEY(outcome_id)
);

CREATE TABLE terms (
	term_id serial,
	term varchar(255),
	PRIMARY KEY(term_id)
);

CREATE TABLE reported (
	report_id varchar(255),
	created_date date,
	event_date date,
	patient_age integer,
	age_units varchar(255),
	sex varchar(255),
	term_id serial,
	outcome_id serial,
	PRIMARY KEY(report_id),
	FOREIGN KEY(outcome_id) REFERENCES outcomes(outcome_id),
	FOREIGN KEY(term_id) REFERENCES terms(term_id)
);

CREATE TABLE caers_events (
	caers_event_id serial,
	product_type text,
    product text,
	report_id varchar(255),
	product_code int,
	PRIMARY KEY(caers_event_id),
	FOREIGN KEY(report_id) REFERENCES reported(report_id),
	FOREIGN KEY(product_code) REFERENCES product(product_code)
);
