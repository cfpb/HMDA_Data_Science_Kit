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
	respondent_zip_code VARCHAR,
	parent_name VARCHAR,
	parent_address VARCHAR,
	parent_city VARCHAR,
	parent_state VARCHAR,
	parent_zip_code VARCHAR,
	lar_count VARCHAR
	);

COPY hmda_public.ts_2017
FROM 
'{data_path}/data/ts/ts_2017.txt'
    DELIMITER '|' ENCODING 'latin1';
COMMIT;
