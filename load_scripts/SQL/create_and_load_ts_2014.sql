DROP TABLE IF EXISTS hmda_public.ts_2014;
CREATE TABLE ts_2014(
	activity_year VARCHAR,
	respondent_id VARCHAR,
	agency_code VARCHAR,
	id_tax VARCHAR,
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
	respondent_name_panel VARCHAR,
	respondent_city_panel VARCHAR,
	respondent_state_panel VARCHAR,
	assets_panel VARCHAR,
	olc_panel VARCHAR,
	region_code_panel VARCHAR,
	lar_count VARCHAR,
	edit_status VARCHAR
);

COPY hmda_public.ts_2014
-- Change to your local data path
FROM '/Users/mattlevitan/HMDA_Data_Science_Kit/data/ts/ts_2014.txt'
	DELIMITER E'\t' ENCODING 'latin1';
