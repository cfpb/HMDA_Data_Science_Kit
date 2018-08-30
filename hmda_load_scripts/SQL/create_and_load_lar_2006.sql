
DROP TABLE IF EXISTS hmda_lar_2006;
CREATE TABLE hmda_lar_2006
(  year varchar,
    rid varchar,
    agency varchar,
    loan_type varchar,
    purpose varchar,
    occupancy varchar,
    amount varchar,
    action varchar,
    msa varchar,
    state varchar,
    county varchar,
    tract varchar,
    app_sex varchar,
    co_app_sex varchar,
    income varchar,
    purchaser varchar,
    denial_1 varchar,
    denial_2 varchar,
    denial_3 varchar,
    edit_status varchar,
    property_type varchar,
    preapproval varchar,
    app_eth varchar,
    co_eth varchar,
    race_1 varchar,
    race_2 varchar,
    race_3 varchar,
    race_4 varchar,
    race_5 varchar,
    co_race_1 varchar,
    co_race_2 varchar,
    co_race_3 varchar,
    co_race_4 varchar,
    co_race_5 varchar,
    rate_spread varchar,
    hoepa varchar,
    lien varchar,
    sequence_num varchar);

COMMIT;

CREATE TEMPORARY TABLE lar_load
(LAR varchar); -- LAR contains an entire LAR record

COPY lar_load
        -- Change this path to your local data path.
    FROM '/Users/roellk/HMDA/HMDA_Data_Science_Kit/data/lar/lar_ult_2006.dat';

COMMIT;

INSERT INTO hmda_lar_2006 (
    year,
    rid,
    agency,
    loan_type,
    purpose,
    occupancy,
    amount,
    action,
    msa,
    state,
    county,
    tract,
    app_sex ,
    co_app_sex,
    income,
    purchaser,
    denial_1,
    denial_2,
    denial_3,
    edit_status,
    property_type,
    preapproval,
    app_eth,
    co_eth,
    race_1,
    race_2,
    race_3,
    race_4,
    race_5,
    co_race_1,
    co_race_2,
    co_race_3,
    co_race_4,
    co_race_5,
    rate_spread,
    hoepa,
    lien,
    sequence_num)

SELECT 
SUBSTRING(LAR, 1,4),
SUBSTRING(LAR, 5,10),
SUBSTRING(LAR, 15,1),
SUBSTRING(LAR, 16,1),
SUBSTRING(LAR, 17,1),
SUBSTRING(LAR, 18,1),
SUBSTRING(LAR, 19,5),
SUBSTRING(LAR, 24,1),
SUBSTRING(LAR, 25,5),
SUBSTRING(LAR, 30,2),
SUBSTRING(LAR, 32,3),
SUBSTRING(LAR, 35,7),
SUBSTRING(LAR, 42,1),
SUBSTRING(LAR, 43,1),
SUBSTRING(LAR, 44,4),
SUBSTRING(LAR, 48,1),
SUBSTRING(LAR, 49,1),
SUBSTRING(LAR, 50,1),
SUBSTRING(LAR, 51,1),
SUBSTRING(LAR, 52,1),
SUBSTRING(LAR, 53,1),
SUBSTRING(LAR, 54,1),
SUBSTRING(LAR, 55,1),
SUBSTRING(LAR, 56,1),
SUBSTRING(LAR, 57,1),
SUBSTRING(LAR, 58,1),
SUBSTRING(LAR, 59,1),
SUBSTRING(LAR, 60,1),
SUBSTRING(LAR, 61,1),
SUBSTRING(LAR, 62,1),
SUBSTRING(LAR, 63,1),
SUBSTRING(LAR, 64,1),
SUBSTRING(LAR, 65,1),
SUBSTRING(LAR, 66,1),
SUBSTRING(LAR, 67,5),
SUBSTRING(LAR, 72,1),
SUBSTRING(LAR, 73,1),
SUBSTRING(LAR, 74,7)

FROM lar_load;
COMMIT;
DROP TABLE IF EXISTS lar_load; 
COMMIT;

