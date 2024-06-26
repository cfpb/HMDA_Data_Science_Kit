DROP TABLE IF EXISTS hmda_public.lar_2017;
CREATE TABLE hmda_public.lar_2017 (
    activity_year VARCHAR,
    respondent_id VARCHAR,
    agency_code VARCHAR,
    loan_type VARCHAR,
    property_type VARCHAR,
    loan_purpose VARCHAR,
    occupancy_type VARCHAR,
    loan_amount VARCHAR,
    preapproval VARCHAR,
    action_taken VARCHAR,
    msa_md VARCHAR,
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
    denial_reason_1 VARCHAR,
    denial_reason_2 VARCHAR,
    denial_reason_3 VARCHAR,
    rate_spread VARCHAR,
    hoepa_status VARCHAR,
    lien_status VARCHAR,
    tract_population VARCHAR,
    tract_minority_population_percent VARCHAR,
    ffiec_msa_md_median_family_income VARCHAR,
    tract_to_msa_income_percentage VARCHAR,
    tract_owner_occupied_units VARCHAR,
    tract_one_to_four_family_units VARCHAR,
	derived_loan_product_type VARCHAR, 
	derived_dwelling_category VARCHAR,
	derived_ethnicity VARCHAR,
	derived_race VARCHAR,
	derived_sex VARCHAR
    );

COPY hmda_public.lar_2017

FROM '{data_path}/data/lar/lar_2017.txt'

DELIMITER '|' ENCODING 'latin1';
