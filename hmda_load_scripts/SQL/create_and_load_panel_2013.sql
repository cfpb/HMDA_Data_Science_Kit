DROP TABLE IF EXISTS panel_2013;
CREATE TABLE panel_2013 (
    respondent_id VARCHAR,
    msa VARCHAR,
    agency_code VARCHAR,
    agency_group_code VARCHAR,
    respondent_name VARCHAR,
    respondent_city VARCHAR,
    respondent_state VARCHAR,
    respondent_state_fips VARCHAR,
    assets VARCHAR,
    other_lender_code VARCHAR,
    parent_id VARCHAR,
    parent_name VARCHAR,
    parent_city VARCHAR,
    parent_state VARCHAR,
    as_of_year VARCHAR,
    respondent_rssd VARCHAR);
 CREATE TEMPORARY TABLE panel_load
  (PANEL VARCHAR); -- LAR contains an entire LAR record
 COPY panel_load
        --Change to your local path
FROM '{data_path}HMDA_Data_Science_Kit/data/panel/panel_ult_2013.dat' 
    ENCODING 'latin1';
COMMIT;
 INSERT INTO panel_2013 (
    respondent_id,
    msa,
    agency_code,
    agency_group_code,
    respondent_name,
    respondent_city,
    respondent_state,
    respondent_state_fips,
    assets,
    other_lender_code,
    parent_id,
    parent_name,
    parent_city,
    parent_state,
    as_of_year,
    respondent_rssd
    )
 SELECT 
    SUBSTRING(PANEL, 1, 10),
    SUBSTRING(PANEL, 11, 5),
    SUBSTRING(PANEL, 16, 1),
    SUBSTRING(PANEL, 17, 2),
    SUBSTRING(PANEL, 19, 30),
    SUBSTRING(PANEL, 49, 25),
    SUBSTRING(PANEL, 74, 2),
    SUBSTRING(PANEL, 76, 2),
    SUBSTRING(PANEL, 78, 10),
    SUBSTRING(PANEL, 88, 1),
    SUBSTRING(PANEL, 89, 10),
    SUBSTRING(PANEL, 99, 30),
    SUBSTRING(PANEL, 129, 25),
    SUBSTRING(PANEL, 154, 2),
    SUBSTRING(PANEL, 156, 4),
    SUBSTRING(PANEL, 160, 10)
 FROM panel_load;
COMMIT;
DROP TABLE IF EXISTS panel_load; 
COMMIT;