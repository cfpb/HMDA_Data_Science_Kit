DROP TABLE IF EXISTS hmda_public.lar_2017;
CREATE TABLE hmda_public.lar_2017 (
    record_id VARCHAR(1),
    respondent_id VARCHAR,
    agency_code VARCHAR,
    loan_type VARCHAR,
    property_type VARCHAR,
    loan_purpose VARCHAR,
    occupancy VARCHAR,
    loan_amount VARCHAR,
    preapprovals VARCHAR,
    action_type VARCHAR,
    msa VARCHAR,
    state_code VARCHAR,
    county_code VARCHAR,
    census_tract VARCHAR,
    applicant_ethnicity VARCHAR,
    co_applicant_ethnicity VARCHAR,
    applicant_race_1 VARCHAR,
    applicant_race_2 VARCHAR,
    applicant_race_3 VARCHAR,
    applicant_race_4 VARCHAR,
    applicant_race_5 VARCHAR,
    co_applicant_race_1 VARCHAR,
    co_applicant_race_2 VARCHAR,
    co_applicant_race_3 VARCHAR,
    co_applicant_race_4 VARCHAR,
    co_applicant_race_5 VARCHAR,
    applicant_sex VARCHAR,
    co_applicant_sex VARCHAR,
    income VARCHAR,
    purchaser_type VARCHAR,
    denial_1 VARCHAR,
    denial_2 VARCHAR,
    denial_3 VARCHAR,
    rate_spread VARCHAR,
    hoepa_status VARCHAR,
    lien_status VARCHAR,
    tract_population VARCHAR,
    tract_minority_population_percent VARCHAR,
    ffiec_msamd_median_income VARCHAR,
    tract_to_msa_income_percent VARCHAR,
    tract_owner_occupied_units VARCHAR,
    tract_one_to_four_units VARCHAR
    );

COPY hmda_public.lar_2017

FROM '{data_path}/data/lar/lar_2017.txt'

DELIMITER '|' ENCODING 'latin1';
