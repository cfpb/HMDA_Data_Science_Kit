DROP TABLE IF EXISTS ts_2017;
CREATE TABLE ts_2017 (
	activity_year VARCHAR,
	respondent_id VARCHAR,
	agency_code VARCHAR,
	tax_id VARCHAR,
	respondent_name VARCHAR,
	respondent_address VARCHAR,
	respondent_city VARCHAR,
	respondent_state VARCHAR,
	respondent_zip VARCHAR,
	parent_name VARCHAR,
	parent_address VARCHAR,
	parent_city VARCHAR,
	parent_state VARCHAR,
	parent_zip VARCHAR,
	lar_count VARCHAR
	);

COPY ts_2017
FROM 
'/Users/fureym/hmda/HMDA_Data_Science_Kit/data/ts/ts_2017.txt'
    DELIMITER '|' ENCODING 'latin1';
COMMIT;
