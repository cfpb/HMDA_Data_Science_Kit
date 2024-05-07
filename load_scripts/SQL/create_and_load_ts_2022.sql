DROP TABLE IF EXISTS hmda_public.ts_2022;
CREATE TABLE hmda_public.ts_2022 (
	activity_year VARCHAR(4),
	calendar_quarter VARCHAR,
	lei VARCHAR(20),
	tax_id VARCHAR(10),
	agency_code VARCHAR(1),
	respondent_name VARCHAR,
	respondent_state VARCHAR(2),
	respondent_city VARCHAR,
	respondent_zip_code VARCHAR,
	lar_count VARCHAR
	);

COPY hmda_public.ts_2022
FROM 
'{data_path}/data/ts/ts_2022.txt'
    DELIMITER '|' ENCODING 'utf8' CSV HEADER;
COMMIT;
