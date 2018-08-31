**Table of Contents:**
- [Repository purpose and scope](https://github.com/Kibrael/HMDA_Data_Science_Kit/blob/readme/readme.md#repository-purpose-and-scope)
- [What is HMDA](https://github.com/Kibrael/HMDA_Data_Science_Kit/blob/readme/readme.md#what-is-hmda)
- [HMDA Datasets](https://github.com/Kibrael/HMDA_Data_Science_Kit/blob/readme/readme.md#hmda-datasets)
- [Integration of Census Data with HMDA](https://github.com/Kibrael/HMDA_Data_Science_Kit/blob/readme/readme.md#integration-of-census-data-with-hmda)

- [Official HMDA documentation](https://github.com/Kibrael/HMDA_Data_Science_Kit/blob/readme/readme.md#hmda-data-documentation)
- [Official HMDA data publications](https://github.com/Kibrael/HMDA_Data_Science_Kit/blob/readme/readme.md#hmda-publications)
- [Working With HMDA Data](https://github.com/Kibrael/HMDA_Data_Science_Kit/blob/readme/readme.md#working-with-hmda-data)
- [Getting Started: Basic Requirements](https://github.com/Kibrael/HMDA_Data_Science_Kit/blob/readme/readme.md#getting-started-basic-requirements)



#### Repository Purpose and Scope:
The primary goal of this repository is to provide data users with tools to enable them to produce accurate analytics results. Additionally, this repository provides an overview of HMDA resources, publications, and guidelines for proper use. This repository does not provide statutory interpretation or compliance assistance. 

#### What Is HMDA?
HMDA refers to the [Home Mortgage Disclosure Act of 1975](https://www.gpo.gov/fdsys/pkg/USCODE-2011-title12/pdf/USCODE-2011-title12-chap29.pdf).
HMDA requires many financial institutions to maintain, report, and publicly disclose loan-level information about mortgages. HMDA was originally enacted by Congress in 1975 and is implemented by [Regulation C](https://www.consumerfinance.gov/policy-compliance/rulemaking/final-rules/regulation-c-home-mortgage-disclosure-act/). 

Congress amended HMDA in 2010 and the Bureau finalized a rule implementing changes to HMDA in 2015. Most of the rule's provisions affect data collected in 2018 and reported in 2019. However, beginning with data collected in 2017, depository institutions that originated fewer than 25 covered closed-end mortgages in either of the preceding two years are not required to report.

The senate bill S2155 modified some reporting requirements for the 2018 data collection. These changes will be outlined in upcoming publications.

**What is the purpose of HMDA?**
- To provide the public with information that will help show whether financial institutions are serving the housing credit needs of the neighborhoods and communities in which they are located. 
- To aid public officials in targeting public investments from the private sector to areas where they are needed. 
- The FIRREA amendments of 1989 require the collection and disclosure of data about applicant and borrower characteristics to assist in identifying possible discriminatory lending patterns and enforcing antidiscrimination statutes.

#### HMDA Datasets
Three raw data files are published annually under HMDA authority. File formats (and schemas) vary by data source. The National Archives (NARA) use a .DAT format, the FFIEC site maintained by the Federal Reserve Board (FRB) use a .CSV format (with Census data appended) and the FFIEC site maintained by the BCFP us a pipe-delimited .TXT format (with Census data appended). Links to HMDA datasets are available in this [file](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/hmda_data_links.md).

These datasets include:
- The Loan Application Register (LAR): This dataset contains application and origination activity on covered transactions made by covered institutions. The LAR is distinct from many other mortgage datasets as it includes both application and origination data as well as borrower demographic information. The LAR has had several distinct schemas including a change from aggregate to transaction level data in 1990. LAR schemas are available in this [folder]() and a discussion of changes to underlying data (such as the benchmark for the rate spread variable) can be found in the [Working with HMDA Data]() document.

- The Transmittal Sheet (TS): This dataset contains information about the financial institutions that are covered by HMDA and submitted LAR data to the FFIEC. Transmittal sheet schemas can be found in this [folder]().

- The HMDA Reporter Panel: This dataset contains additional information regarding financial institutions such as identifier links to the National Information Center (NIC) and hierarchy information such as parent and top holder. The HMDA Reporter Panel is assembled by the Bureau on behalf of the FFIEC (beginning in 2017). Panel schemas can be found in this [folder]().


#### Integration of Census Data with HMDA
HMDA data is often joined to Census data to show context for the mortgage data. The FFIEC joins the following to the HMDA LAR data: area population, minority population percentage, FFIEC median family income, tract to MSA/MD median family income percentage, number of owner-occupied units, and the number of 1-4 family units. These data are joined at the tract level to provide context for mortgage activity in the relevant geography. The base data for this join are made available by the FFIEC on this [website](https://www.ffiec.gov/censusapp.htm). The year of the Census data correspond to the HMDA collection year. 

For examples on how to handle Census data and join Census data to LAR data please see the [Census directory]().

#### HMDA Data Documentation
- [2018 Filing Instruction Guide (FIG)](https://www.consumerfinance.gov/data-research/hmda/static/for-filers/2018/2018-hmda-fig.pdf): Outlines the file format, data fields, business rules, and valid values for data submitted in 2018.
- [2017 Filing Instruction Guide (FIG)](https://www.consumerfinance.gov/data-research/hmda/static/for-filers/2017/2017-hmda-fig.pdf): Outlines the the file format, data fields, business rules, and valid values for data submitted in 2017.
- [BCFP Small Entity Compliance Guide](https://s3.amazonaws.com/files.consumerfinance.gov/f/documents/cfpb_hmda_small-entity-compliance-guide.pdf): The purpose of this guide is to provide an easy-to-use summary of Regulation C, as amended by the HMDA Rule, and to highlight information that financial institutions and those that work with them might find helpful when implementing the HMDA Rule.
- [FFIEC Getting it Right Guides](https://www.ffiec.gov/Hmda/guide.htm): Guidelines for assembling HMDA data in accordance with Regulation C.
- [BCFP Regulatory Implementation Resrouces](https://www.consumerfinance.gov/policy-compliance/guidance/implementation-guidance/hmda-implementation/): Landing page for regulation implementation resources.
- [2018 Institution Coverage](https://s3.amazonaws.com/files.consumerfinance.gov/f/documents/201709_cfpb_2018-hmda-institutional-coverage.pdf): A flow chart showing whicn institutions are covered by Regulation C in 2018.
- [2017 Institution Coverage](https://files.consumerfinance.gov/f/201510_cfpb_2017-hmda-institutional-coverage.pdf): A flow chart showing whicn institutions are covered by Regulation C in 2017.
- [2018 Transaction Coverage](https://s3.amazonaws.com/files.consumerfinance.gov/f/documents/201709_cfpb_2018-hmda-institutional-coverage.pdf): Outlines which transactions are covered by Regulation C.
- [HMDA Loan Scenarios](https://www.consumerfinance.gov/data-research/hmda/static/for-filers/HMDA-Loan-Scenarios.pdf): Fictional scenarios designed to assist in compilation of LAR data to meet requirements under Regulation C.

#### Working With HMDA Data
The HMDA data are complex and care must be taken to ensure that analytics results are accurate. Please see [Working With HMDA Data]() for explanations of how to load, segment the data, handle NA values, and create accurate time-series tabulations.

#### HMDA Publications
For a list of HMDA publications, see [here](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/federal_pubs.md)

#### Getting Started: Basic Requirements
To begin using the HMDA data you will first need to download the data. Please see [HMDA data links](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/hmda_data_links.md) to begin downloading the data.

To download the data using a script:
`bash download_scripts/download_and_unzip_all.sh`

For troubleshooting downloads please go [here](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/download_scripts/readme.md)

To create a HMDA database on an existing Postgres installation:
`bash hmda_load_scripts/create_hmda_db.sh`

To create and populate HMDA tables on an existing Postgres installation:
`bash hmda_load_scripts/create_tables_2004_2017.sh`


The resources in this repository assume that a database has been installed and is functioning properly. The SQL code is written for [PostgreSQL](https://www.postgresql.org/), other SQL versions may require modification to the code. 

The Python resources assume that a functioning installation of [Python 3.5 or greater](https://www.python.org/downloads/) or greater is present.

