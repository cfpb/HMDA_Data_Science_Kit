DROP TABLE IF EXISTS mlar_2019_{lei};
CREATE TABLE mlar_2019_{lei} (  
    record_id NUMERIC,
    lei VARCHAR,
    loan_type NUMERIC, 
    loan_purpose NUMERIC,
    preapproval NUMERIC,
    construction_method NUMERIC,
    occupancy_type NUMERIC,
    loan_amount NUMERIC,
    action_taken NUMERIC,
    state_code VARCHAR,
    county_code VARCHAR,
    census_tract VARCHAR,
    applicant_ethnicity_1 VARCHAR,
    applicant_ethnicity_2 VARCHAR,
    applicant_ethnicity_3 VARCHAR,
    applicant_ethnicity_4 VARCHAR,
    applicant_ethnicity_5 VARCHAR,
    co_applicant_ethnicity_1 VARCHAR,
    co_applicant_ethnicity_2 VARCHAR,
    co_applicant_ethnicity_3 VARCHAR,
    co_applicant_ethnicity_4 VARCHAR,
    co_applicant_ethnicity_5 VARCHAR,
    applicant_ethnicity_observed NUMERIC,
    co_applicant_ethnicity_observed NUMERIC,
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
    applicant_race_observed NUMERIC,
    co_applicant_race_observed NUMERIC,
    applicant_sex NUMERIC,
    co_applicant_sex NUMERIC,
    applicant_sex_observed NUMERIC,
    co_applicant_sex_observed NUMERIC,
    applicant_age VARCHAR,
    applicant_age_above_62 VARCHAR,
    co_applicant_age VARCHAR,
    co_applicant_age_above_62 VARCHAR,
    income VARCHAR,    
    purchaser_type NUMERIC,
    rate_spread VARCHAR,
    hoepa_status NUMERIC,
    lien_status NUMERIC,
    applicant_credit_scoring_model NUMERIC,
    co_applicant_credit_scoring_model NUMERIC,
    denial_reason_1 NUMERIC,
    denial_reason_2 VARCHAR,
    denial_reason_3 VARCHAR,
    denial_reason_4 VARCHAR,
    total_loan_costs VARCHAR,
    total_points_and_fees VARCHAR,
    origination_charges VARCHAR,
    discount_points VARCHAR, 
    lender_credits VARCHAR,
    interest_rate VARCHAR,
    prepayment_penalty_term VARCHAR,
    debt_to_income_ratio VARCHAR,
    combined_loan_to_value_ratio VARCHAR,
    loan_term VARCHAR,
    intro_rate_period VARCHAR,
    balloon_payment NUMERIC,
    interest_only_payment NUMERIC, 
    negative_amortization NUMERIC,
    other_non_amortizing_features NUMERIC,
    property_value VARCHAR,
    manufactured_home_secured_property_type NUMERIC,
    manufactured_home_land_property_interest NUMERIC,
    total_units VARCHAR,
    multifamily_affordable_units VARCHAR,
    submission_of_application NUMERIC,
    initially_payable_to_institution NUMERIC,
    aus_1 NUMERIC,
    aus_2 VARCHAR,
    aus_3 VARCHAR,
    aus_4 VARCHAR,
    aus_5 VARCHAR,
    reverse_mortgage NUMERIC,
    open_end_credit NUMERIC,
    business_or_commercial_purpose NUMERIC
    );

COPY hmda_public.mlar_2019_{lei}
FROM '{data_path}/data/mlar/2019/{lei}.txt'
DELIMITER '|' ENCODING 'latin1';
COMMIT;
