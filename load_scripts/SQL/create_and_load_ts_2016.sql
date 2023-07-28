DROP TABLE IF EXISTS hmda_public.ts_2016;
CREATE TABLE hmda_public.ts_2016(
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
	respondent_name_panel VARCHAR,
	respondent_city_panel VARCHAR,
	respondent_state_panel VARCHAR,
	assets_panel VARCHAR,
	olc_panel VARCHAR,
	region_code_panel VARCHAR,
	lar_count VARCHAR,
	edit_status VARCHAR
);

COPY hmda_public.ts_2016
-- Change to your local data path
FROM '/Users/nongarda/Documents/HMDA_Data_Science_Kit/data/ts/ts_2016_fixed.txt'
	DELIMITER E'\t' ENCODING 'latin1';
