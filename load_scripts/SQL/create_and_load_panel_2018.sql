DROP TABLE IF EXISTS hmda_public.panel_2018;
CREATE TABLE hmda_public.panel_2018 (
	activity_year VARCHAR(4),
	lei VARCHAR(20),
	tax_id VARCHAR(11),
	agency_code VARCHAR(1),
	id_2017 VARCHAR(10),
	respondent_rssd VARCHAR,
	respondent_name VARCHAR,
	respondent_state VARCHAR,
	respondent_city VARCHAR,
	assets VARCHAR,
	other_lender_code VARCHAR,
	parent_rssd VARCHAR,
	parent_name VARCHAR,
	top_holder_rssd VARCHAR,
	top_holder_name VARCHAR
	);

COPY hmda_public.panel_2018
FROM '{data_path}/data/panel/panel_2018.txt' 
	DELIMITER '|' ENCODING 'utf8' CSV HEADER;
COMMIT;
