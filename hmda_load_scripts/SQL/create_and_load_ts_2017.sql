DROP TABLE IF EXISTS ts_2017;
CREATE TABLE ts_2017 (
	record_id VARCHAR,
	respondent_id VARCHAR,
	agency_code VARCHAR,
	activity_year VARCHAR,
	tax_id VARCHAR,
	lar_entries VARCHAR,
	respondent_name VARCHAR,
	respondent_address VARCHAR,
	respondent_city VARCHAR,
	respondent_state VARCHAR,
	respondent_zip VARCHAR,
	parent_name VARCHAR,
	parent_address VARCHAR,
	parent_city VARCHAR,
	parent_state VARCHAR,
	parent_zip VARCHAR
	)

COPY ts_2017
FROM --'{data_path}HMDA_Data_Science_Kit/data/ts/ts_2017.txt'
'{data_path}HMDA_Data_Science_Kit/data/ts/ts_2017.txt'
    DELIMITER '|' ENCODING 'latin1';
COMMIT;
