DROP TABLE IF EXISTS hmda_public.panel_2016;
DROP TABLE IF EXISTS panel_load; 
CREATE TABLE hmda_public.panel_2016 (
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
    respondent_state_fips_number VARCHAR);

 CREATE TEMPORARY TABLE panel_load
    (PANEL VARCHAR); -- LAR contains an entire LAR record

COPY panel_load
FROM '{data_path}/data/panel/panel_2016.txt' 
    ENCODING 'latin1';
COMMIT;
 INSERT INTO hmda_public.panel_2016 (
    activity_year,
    respondent_id,
    agency_code,
    parent_respondent_id,
    parent_name,
    filler,
    parent_city,
    parent_state,
    region,
    assets,
    other_lender_code,
    respondent_name,
    respondent_city,
    respondent_state,
    filler2,
    filler3,
    top_holder_rssd,
    top_holder_name,
    top_holder_city,
    top_holder_state,
    top_holder_country,
    respondent_rssd,
    parent_rssd,
    respondent_state_fips_number
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
