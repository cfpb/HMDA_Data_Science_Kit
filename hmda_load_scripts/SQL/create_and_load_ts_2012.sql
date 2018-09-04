DROP TABLE IF EXISTS ts_2012;
CREATE TABLE ts_2012 (
	as_of_date VARCHAR,
	agency_code VARCHAR,
	respondent_id VARCHAR,
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
	edit_status VARCHAR,
	id_tax VARCHAR);

CREATE TEMPORARY TABLE ts_load 
  (TS VARCHAR) ; -- TS contains an entire TS record per row

COPY ts_load 
-- Change to your local data path
FROM '/Users/roellk/HMDA/HMDA_Data_Science_Kit/data/ts/ts_ult_2012.dat' 
    ENCODING 'latin1';
COMMIT;

INSERT INTO ts_2012 (
	as_of_date,
	agency_code,
	respondent_id,
	respondent_name,
	respondent_address,
	respondent_city,
	respondent_state,
	respondent_zip,
	parent_name,
	parent_address,
	parent_city,
	parent_state,
	parent_zip,
	edit_status,
	id_tax
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