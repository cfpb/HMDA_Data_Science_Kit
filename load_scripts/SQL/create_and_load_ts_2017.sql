DROP TABLE IF EXISTS hmda_public.ts_2017;
CREATE TABLE hmda_public.ts_2017 (
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

COPY hmda_public.ts_2017
FROM 
'/Users/roellr/Documents/HMDA_Repos/HMDA_Data_Science_Kit/data/ts/ts_2017.txt'
    DELIMITER '|' ENCODING 'latin1';
COMMIT;
