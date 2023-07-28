DROP TABLE IF EXISTS hmda_public.ts_2012;
CREATE TABLE hmda_public.ts_2012 (
	activity_year VARCHAR,
	agency_code VARCHAR,
	respondent_id VARCHAR,
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
	edit_status VARCHAR,
	tax_id VARCHAR);

CREATE TEMPORARY TABLE ts_load 
  (TS VARCHAR) ; -- TS contains an entire TS record per row

COPY ts_load 
-- Change to your local data path
FROM '/Users/nongarda/Documents/HMDA_Data_Science_Kit/data/ts/ts_2012.dat' 
    ENCODING 'latin1';
COMMIT;

INSERT INTO hmda_public.ts_2012 (
	activity_year,
	agency_code,
	respondent_id,
	respondent_name,
	respondent_address,
	respondent_city,
	respondent_state,
	respondent_zip_code,
	parent_name,
	parent_address,
	parent_city,
	parent_state,
	parent_zip_code,
	edit_status,
	tax_id
)

SELECT 
	SUBSTRING(TS, 1, 4),
	SUBSTRING(TS, 5, 1),
	SUBSTRING(TS, 6, 10),
	SUBSTRING(TS, 16, 30),
	SUBSTRING(TS, 46, 40),
	SUBSTRING(TS, 86,25),
	SUBSTRING(TS, 111,2),
	SUBSTRING(TS, 113, 10),
	SUBSTRING(TS, 123, 30),
	SUBSTRING(TS, 153, 40),
	SUBSTRING(TS, 193, 25),
	SUBSTRING(TS, 218, 2),
	SUBSTRING(TS, 220, 10),
	SUBSTRING(TS, 230, 1),
	SUBSTRING(TS, 231, 10)

FROM ts_load;
COMMIT;
DROP TABLE IF EXISTS ts_load; 
COMMIT;
