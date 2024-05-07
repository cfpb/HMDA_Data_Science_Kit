DROP TABLE IF EXISTS mlar_2017_{institution_id};
CREATE TABLE mlar_2017_{institution_id} (  
    record_id NUMERIC,
    respondent_id VARCHAR,
    agency_code NUMERIC, 
    loan_type NUMERIC,
    property_type NUMERIC,
    loan_purpose NUMERIC,
    occupancy_type NUMERIC,
    loan_amount NUMERIC,
    preapproval NUMERIC,
    action_taken NUMERIC,
    msa_md VARCHAR,
    state_code VARCHAR,
    county_code VARCHAR,
    census_tract VARCHAR,
    applicant_ethnicity NUMERIC,
    co_applicant_ethnicity NUMERIC,
    applicant_race_1 NUMERIC,
    applicant_race_2 VARCHAR,
    applicant_race_3 VARCHAR,
    applicant_race_4 VARCHAR,
    applicant_race_5 VARCHAR,
    co_applicant_race_1 NUMERIC,
    co_applicant_race_2 VARCHAR,
    co_applicant_race_3 VARCHAR,
    co_applicant_race_4 VARCHAR,
    co_applicant_race_5 VARCHAR,
    applicant_sex NUMERIC,
    co_applicant_sex NUMERIC,
    income NUMERIC,
    purchaser_type NUMERIC,
    denial_reason_1 VARCHAR,
    denial_reason_2 VARCHAR,
    denial_reason_3 VARCHAR,    
    rate_spread VARCHAR,
    hoepa_status NUMERIC,
    lien_status NUMERIC
    )

COPY hmda_public.mlar_2017_{institution_id}
FROM '{data_path}/data/mlar/2017/{institution_id}.txt'
DELIMITER '|' ENCODING 'latin1';
