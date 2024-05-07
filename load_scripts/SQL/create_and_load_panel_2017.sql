DROP TABLE IF EXISTS hmda_public.panel_2017;
CREATE TABLE hmda_public.panel_2017 (
	activity_year VARCHAR,
	respondent_id VARCHAR,
	agency_code VARCHAR,
	parent_respondent_id VARCHAR,
	parent_name VARCHAR,
	parent_city VARCHAR,
	parent_state VARCHAR,
	region VARCHAR,
	assets VARCHAR,
	other_lender_code VARCHAR,
	respondent_name VARCHAR,
	respondent_city VARCHAR,
	respondent_state VARCHAR,
	top_holder_rssd VARCHAR,
	top_holder_name VARCHAR,
	top_holder_city VARCHAR,
	top_holder_state VARCHAR,
	top_holder_country VARCHAR,
	respondent_rssd VARCHAR,
	parent_rssd VARCHAR,
	respondent_state_fips_number VARCHAR);

COPY hmda_public.panel_2017
FROM '{data_path}/data/panel/panel_2017.txt' 
	DELIMITER '|' ENCODING 'utf8';
COMMIT;
