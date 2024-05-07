DROP TABLE IF EXISTS hmda_public.panel_2021;
CREATE TABLE hmda_public.panel_2021 (
	activity_year VARCHAR(4),
	lei VARCHAR(20),
	tax_id VARCHAR(10),
	agency_code VARCHAR(1),
	id_2017 VARCHAR(10),
	arid_2017 VARCHAR(11),
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

COPY hmda_public.panel_2021
FROM '{data_path}/data/panel/panel_2021.txt' 
	DELIMITER '|' ENCODING 'utf8' CSV HEADER;
COMMIT;
