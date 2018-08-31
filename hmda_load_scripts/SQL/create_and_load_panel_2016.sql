DROP TABLE IF EXISTS panel_2016;
CREATE TABLE panel_2016 (
	activity_year VARCHAR,
	respondent_id VARCHAR,
	agency_code VARCHAR,
	parent_respondent_id VARCHAR,
	parent_name VARCHAR,
	filler VARCHAR,
	parent_city VARCHAR,
	parent_state VARCHAR,
	region VARCHAR,
	assets VARCHAR,
	other_lender_code VARCHAR,
	respondent_name VARCHAR,
	respondent_city VARCHAR,
	respondent_state VARCHAR,
	filler2 VARCHAR,
	filler3 VARCHAR,
	top_holder_rssd VARCHAR,
	top_holder_name VARCHAR,
	top_holder_city VARCHAR,
	top_holder_state VARCHAR,
	top_holder_country VARCHAR,
	respondent_rssd VARCHAR,
	parent_rssd VARCHAR,
	respondent_state_fips VARCHAR);

CREATE TEMPORARY TABLE panel_load
	(PANEL VARCHAR); -- LAR contains an entire LAR record

COPY panel_load
FROM '{data_path}HMDA_Data_Science_Kit/data/panel/panel_2016.txt' 
	ENCODING 'latin1';
COMMIT;

INSERT INTO panel_2016 (
	activity_year,
	resp_id,
	agency,
	parent_resp_id,
	parent_name,
	parent_city,
	parent_state,
	region,
	assets,
	olc,
	resp_name,
	filler,
	resp_city,
	resp_state,
	filler2,
	filler3,
	top_holder_rssd,
	top_holder_name,
	top_holder_city,
	top_holder_state,
	top_holder_country,
	resp_rssd,
	parent_rssd,
	resp_state_fips
	)

SELECT 
	SUBSTRING(PANEL, 1, 4),
	SUBSTRING(PANEL, 5, 10),
	SUBSTRING(PANEL, 15, 1),
	SUBSTRING(PANEL, 16, 10),
	SUBSTRING(PANEL, 26, 30),
	SUBSTRING(PANEL, 56, 80),
	SUBSTRING(PANEL, 81, 2),
	SUBSTRING(PANEL, 83, 2),
	SUBSTRING(PANEL, 85, 10),
	SUBSTRING(PANEL, 95, 1),
	SUBSTRING(PANEL, 96, 30),
	SUBSTRING(PANEL, 126, 40),
	SUBSTRING(PANEL, 166, 25),
	SUBSTRING(PANEL, 191, 2),
	SUBSTRING(PANEL, 193, 10),
	SUBSTRING(PANEL, 203, 10),
	SUBSTRING(PANEL, 213, 10),
	SUBSTRING(PANEL, 223, 30),
	SUBSTRING(PANEL, 253, 25),
	SUBSTRING(PANEL, 278, 2),
	SUBSTRING(PANEL, 280, 40),
	SUBSTRING(PANEL, 320, 10),
	SUBSTRING(PANEL, 330, 10),
	SUBSTRING(PANEL, 340, 2)

FROM panel_load;
COMMIT;
DROP TABLE IF EXISTS panel_load; 
COMMIT;