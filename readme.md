### Table of Contents changing something

- [Repository purpose and scope](#repository-purpose-and-scope)
- [What is HMDA](#what-is-hmda)
- [HMDA Datasets](#hmda-datasets)
- [Integration of Census Data with HMDA](#integration-of-census-data-with-hmda)
- [Official HMDA documentation](#hmda-data-documentation)
- [Official HMDA data publications](#hmda-publications)
- [Working With HMDA Data](#working-with-hmda-data)
- [Getting Started: Basic Requirements](#basic-requirements-and-instructions)

## Repository Purpose and Scope:
The primary goal of this repository is to provide data users with tools to enable them to produce accurate analytics results. Additionally, this repository provides an overview of HMDA resources, publications, and guidelines for proper use. This repository does not provide statutory interpretation or compliance assistance.

## What Is HMDA?

HMDA refers to the [Home Mortgage Disclosure Act of 1975](https://www.gpo.gov/fdsys/pkg/USCODE-2011-title12/pdf/USCODE-2011-title12-chap29.pdf).
HMDA requires many financial institutions to maintain, report, and publicly disclose loan-level information about mortgages. HMDA was originally enacted by Congress in 1975 and is implemented by [Regulation C](https://www.consumerfinance.gov/policy-compliance/rulemaking/final-rules/regulation-c-home-mortgage-disclosure-act/).

Congress amended HMDA in 2010 and the Bureau finalized a rule implementing changes to HMDA in 2015. Most of the rule's provisions affect data collected in 2018 and reported in 2019. However, beginning with data collected in 2017, depository institutions that originated fewer than 25 covered closed-end mortgages in either of the preceding two years are not required to report.

The senate bill S2155 modified some reporting requirements for the 2018 data collection. These changes will be outlined in upcoming publications.


**What is the purpose of HMDA?**
- To provide the public with information that will help show whether financial institutions are serving the housing credit needs of the neighborhoods and communities in which they are located.
- To aid public officials in targeting public investments from the private sector to areas where they are needed.
- The FIRREA amendments of 1989 require the collection and disclosure of data about applicant and borrower characteristics to assist in identifying possible discriminatory lending patterns and enforcing antidiscrimination statutes.

## HMDA Datasets

Three raw data files are published annually under HMDA authority. File formats (and schemas) vary by data source. The National Archives (NARA) use a .DAT format, the FFIEC site maintained by the Federal Reserve Board (FRB) use a .CSV format (with Census data appended) and the FFIEC site maintained by the CFPB use a pipe-delimited .TXT format (with Census data appended). Links to HMDA datasets are available in this [file](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/hmda_data_links.md).

These datasets include:
- The Loan Application Register (LAR): This dataset contains application and origination activity on covered transactions made by covered institutions. The LAR is distinct from many other mortgage datasets as it includes both application and origination data as well as borrower demographic information. The LAR has had several distinct schemas including a change from aggregate to transaction level data in 1990. LAR schemas are available in this [folder](https://github.com/cfpb/HMDA_Data_Science_Kit/tree/master/documentation_resources/schemas/lar) 

Additional elements discussing of changes to underlying data (such as the benchmark for the rate spread variable) will be added in the future. Check the [Platform FAQ Pages](https://ffiec.cfpb.gov/documentation/2020/faqs/) for common tips.

- The Transmittal Sheet (TS): This dataset contains information about the financial institutions that are covered by HMDA and submitted LAR data to the FFIEC. Transmittal sheet schemas can be found in this [folder](https://github.com/cfpb/HMDA_Data_Science_Kit/tree/master/documentation_resources/schemas/ts/schemas).

- The HMDA Reporter Panel: This dataset contains additional information regarding financial institutions such as identifier links to the National Information Center (NIC) and hierarchy information such as parent and top holder. The HMDA Reporter Panel is assembled by the Bureau on behalf of the FFIEC (beginning in 2017). Panel schemas can be found in this [folder](https://github.com/cfpb/HMDA_Data_Science_Kit/tree/master/documentation_resources/schemas/panel/schemas).

## HMDA Data Browser:
The [HMDA Data Browser](https://ffiec.cfpb.gov/data-browser/data/2019?category=states&ethnicities=&sexes=) provides filtering and download capability for the LAR datasets.

## Integration of Census Data with HMDA
HMDA data is often joined to Census data on the county FIPS code to show context for the mortgage data at the geographic level. The FFIEC joins the following to the HMDA LAR data: area population, minority population percentage, FFIEC median family income, tract to MSA/MD median family income percentage, number of owner-occupied units, and the number of 1-4 family units. These data are joined at the tract level to provide context for mortgage activity in the relevant geography. The base data for this join are made available by the FFIEC on this [website](https://www.ffiec.gov/censusapp.htm). The year of the Census data correspond to the HMDA collection year.

The [HMDA-Census](https://github.com/cfpb/hmda-census) repository contains code that can be used to download FFIEC Census flat files and OMB MSA Delineation files and create joined cuts of those datasets for use with HMDA.


## HMDA Data Documentation
[**FIGs**](https://ffiec.cfpb.gov/documentation/faq/data-collection-timelines#filing-instructions-guide-fig)
- [2024 Filing Instruction Guide (FIG)](https://ffiec.cfpb.gov/documentation/fig/overview): Outlines the file format, data fields, business rules, and valid values for data submitted in 2024.
- [2023 Filing Instruction Guide (FIG)](https://ffiec.cfpb.gov/documentation/fig/2023/overview): Outlines the file format, data fields, business rules, and valid values for data submitted in 2023.
- [2022 Filing Instruction Guide (FIG)](https://ffiec.cfpb.gov/documentation/fig/2022/overview): Outlines the file format, data fields, business rules, and valid values for data submitted in 2022.
- [2021 Filing Instruction Guide (FIG)](https://ffiec.cfpb.gov/documentation/fig/2021/overview): Outlines the file format, data fields, business rules, and valid values for data submitted in 2021.
- [2020 Filing Instruction Guide (FIG)](https://s3.amazonaws.com/cfpb-hmda-public/prod/help/2020-hmda-fig.pdf): Outlines the file format, data fields, business rules, and valid values for data submitted in 2020.
- [2019 Filing Instruction Guide (FIG)](https://s3.amazonaws.com/cfpb-hmda-public/prod/help/2019-hmda-fig.pdf): Outlines the file format, data fields, business rules, and valid values for data submitted in 2019.
- [2018 Filing Instruction Guide (FIG)](https://www.consumerfinance.gov/data-research/hmda/static/for-filers/2018/2018-hmda-fig.pdf): Outlines the file format, data fields, business rules, and valid values for data submitted in 2018.
- [2017 Filing Instruction Guide (FIG)](https://www.consumerfinance.gov/data-research/hmda/static/for-filers/2017/2017-hmda-fig.pdf): Outlines the the file format, data fields, business rules, and valid values for data submitted in 2017.

**Compliance Guides**
- [CFPB Small Entity Compliance Guide](https://s3.amazonaws.com/files.consumerfinance.gov/f/documents/cfpb_hmda_small-entity-compliance-guide.pdf): The purpose of this guide is to provide an easy-to-use summary of Regulation C, as amended by the HMDA Rule, and to highlight information that financial institutions and those that work with them might find helpful when implementing the HMDA Rule.
- [FFIEC Getting it Right Guides](https://www.ffiec.gov/Hmda/guide.htm): Guidelines for assembling HMDA data in accordance with Regulation C.


**Regulatiory Implementation Resources**
- [CFPB Regulatory Implementation Resources](https://www.consumerfinance.gov/policy-compliance/guidance/implementation-guidance/hmda-implementation/): Landing page for regulation implementation resources.
- [2020 Final Rule Summary](https://www.consumerfinance.gov/documents/8720/cfpb_hmda_executive-summary_2020-04.pdf)
- [2019 Final Rule Summary](https://www.consumerfinance.gov/documents/8126/cfpb_executive-summary-2019-reg-C-final-rule.pdf)
- [2018 Data Disclosure Policy](https://www.consumerfinance.gov/documents/7052/HMDA_Data_Disclosure_Policy_Guidance.Executive_Summary.FINAL.12212018.pdf)
- [2018 Procedural Rule Summary](https://www.consumerfinance.gov/documents/6724/bcfp_hmda_interpretive-procedural-rule_2018-08_executive-summary.pdf)
- [2018 Institution Coverage](https://s3.amazonaws.com/files.consumerfinance.gov/f/documents/201709_cfpb_2018-hmda-institutional-coverage.pdf): A flow chart showing whicn institutions are covered by Regulation C in 2018.


**Transactional Coverage Charts**
- [2023 Transaction Coverage](https://files.consumerfinance.gov/f/documents/cfpb_hmda-transactional-coverage_2023.pdf): Outlines which transactions are covered by Regulation C.
- [2022 Transaction Coverage](https://www.consumerfinance.gov/documents/8725/cfpb_2022-hmda-transactional-coverage.pdf): Outlines which transactions are covered by Regulation C.
- [2020 Transaction Coverage](https://www.consumerfinance.gov/documents/8724/cfpb_2020-hmda-transactional-coverage.pdf): Outlines which transactions are covered by Regulation C.
- [2018 Transaction Coverage](https://s3.amazonaws.com/files.consumerfinance.gov/f/documents/201709_cfpb_2018-hmda-institutional-coverage.pdf): Outlines which transactions are covered by Regulation C.


**Institutional Coverage Charts**
- [2023 Institution Coverage](https://files.consumerfinance.gov/f/documents/cfpb_hmda-institutional-coverage_2023.pdf): A flow chart showing whicn institutions are covered by Regulation C in 2023.
- [2022 Institution Coverage](https://www.consumerfinance.gov/documents/8723/cfpb_2022-hmda-institutional-coverage.pdf): A flow chart showing whicn institutions are covered by Regulation C in 2022.
- [2020 Institution Coverage](https://www.consumerfinance.gov/documents/8722/cfpb_2020-hmda-institutional-coverage.pdf): A flow chart showing whicn institutions are covered by Regulation C in 2020.
- [2018 Institution Coverage](https://www.consumerfinance.gov/documents/5630/201709_cfpb_2018-hmda-institutional-coverage.pdf): A flow chart showing whicn institutions are covered by Regulation C in 2018.
- [2017 Institution Coverage](https://files.consumerfinance.gov/f/201510_cfpb_2017-hmda-institutional-coverage.pdf): A flow chart showing whicn institutions are covered by Regulation C in 2017.


**Reportable Data**
- [2023](https://files.consumerfinance.gov/f/documents/cfpb_reportable-hmda-data_regulatory-and-reporting-overview-reference-chart_2023-02.pdf): Reference tool for HMDA data required to be collected and recorded in 2023 and reported in 2024, as well as when and how to report HMDA data as "not applicable."
- [2022](https://files.consumerfinance.gov/f/documents/2022_cfpb_reportable-hmda-data_regulatory-and-reporting-overview-reference-chart.pdf): Reference tool for HMDA data required to be collected and recorded in 2022 and reported in 2023, as well as when and how to report HMDA data as "not applicable."
- [2021](https://files.consumerfinance.gov/f/documents/202010_cfpb_reportable-hmda-data_regulatory-and-reporting-overview-reference-chart.pdf): Reference tool for HMDA data required to be collected and recorded in 2021 and reported in 2022, as well as when and how to report HMDA data as "not applicable."
- [2020](https://www.consumerfinance.gov/documents/8129/cfpb_2020-reportable-hmda-data.pdf): Reference tool for HMDA data required to be collected and recorded in 2020 and reported in 2021, as well as when and how to report HMDA data as "not applicable."
- [2019](https://www.consumerfinance.gov/documents/7219/cfpb_reportable-hmda-data_regulatory-and-reporting-overview-reference-chart-2019.pdf): Reference tool for HMDA data required to be collected and recorded in 2019 and reported in 2020, as well as when and how to report HMDA data as "not applicable."
- [2018](https://www.consumerfinance.gov/documents/5710/201710_cfpb_reportable-hmda-data_regulatory-and-reporting-overview-reference-chart.pdf): Reference tool for HMDA data required to be collected and recorded in 2018 and reported in 2019, as well as when and how to report HMDA data as "not applicable."


**Other**
- [HMDA Loan Scenarios](https://www.consumerfinance.gov/data-research/hmda/static/for-filers/HMDA-Loan-Scenarios.pdf): Fictional scenarios designed to assist in compilation of LAR data to meet requirements under Regulation C.

## Working With HMDA Data

The HMDA data are complex and care must be taken to ensure that analytics results are accurate. 


## HMDA Publications

For a list of HMDA publications, see [here](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/federal_pubs.md)


## Basic Requirements and Instructions


### Requirements

#### Requirements
The resources in this repository assume that a database has been installed and is functioning properly. The SQL code is written for [PostgreSQL](https://www.postgresql.org/), other SQL versions may require modification to the code.

The Python resources assume that a functioning installation of [Python 3.5 or greater](https://www.python.org/downloads/) is present. Convention in these instructions and code resources will use python3 to invoke python scripts. If two versions of Python are not present, this command may need to be changed to python, without the 3.

This repository has a requirements.txt file that can be used to install the Python libraries used in the repository:
- `pip install -r requirements.txt`

### Downloading and Unzipping Data

To begin using the HMDA data you will first need to download the data. A list of data resources is available in [HMDA data links](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/hmda_data_links.md).

These data can be downloaded manually from the links listed or the following script can be run from the HMDA_Data_Science_Kit directory:  
- `bash download_scripts/download_hmda.sh` 

Fair warning, these are very large files (each LAR zip file is ~500mb) and will take a substantial amount of time to download. 

The script can download HMDA ultimate data files for LAR, Transmittal Sheet, and Panel for the years 2004 through 2022.

Running the script without flags will download all LAR, Transmittal Sheet, and Panel files that are not present.

The script accepts the following option flags:

- -a: Prints to console the available files for download.
- -s: Allows a specific file to be downloaded if it is not present. The name convention for specific files is as follows: lar_<year>, panel_<year>, or ts_<year>.
- -p: Downloads all Panel files that are not present.
- -t: Downloads all Transmittal Sheet files that are not present.
- -l: Downloads all LAR files that are not present.
- -F: Deletes the file or file types to be downloaded (the files are then redownloaded).
- -h: Prints to console the instructions for using the script.

#### Usage examples

- To download LAR files: `bash download_scripts/download_hmda.sh -l`
- To download Panel files: `bash download_scripts/download_hmda.sh -p`
- To download Transmittal Sheet files: `bash download_scripts/download_hmda.sh -t`
- To download a specific file: `bash download_scripts/download_hmda.sh -s filename`
- To delete and download Panel files: `bash download_scripts/download_hmda.sh -Fp`
- To delete and download a specific file: `bash download_scripts/download_hmda.sh -Fs filename`
- To delete and download LAR 2004: `bash download_scripts/download_hmda.sh -Fs lar_2004`

#### Download Troubleshooting

Sometimes files from the National Archives fail to download correctly. An indicator that this happens is the presence of a file with the correct name (such as LAR_20013.zip) that has a filesize of 4kb. In these cases the file must be deleted and redownloaded. One way to do this is:
 - `bash download_scripts/download_hmda.sh -Fs <filename>`.

A note on 2015-2016 data: the FFIEC website where these files are held cannot be scraped using the utility in this codebase. We recommend that you manually download the panel, TS, and LAR files for those years from the links in the code. All code calling 2015-2016 data will simply be skipped if the files are not present. 

**Unzipping Compressed Files**

All of the LAR files, and several of the Panel and Transmittal Sheets download as zip files. Prior to loading these data the files must be unzipped. To do so, run the following script:
- `bash download_scripts/unzip_all.sh`

The above script will unzip all the zipped files and standardize the names of the files.

Alternatively, the LAR, Panel, and Transmittal Sheet files can be unzipped as groups using the following commands:

- `bash download_scripts/unzip_and_rename_lar.sh`
- `bash download_scripts/unzip_panel.sh`
- `bash download_scripts/unzip_ts.sh`

### Creating Postgres Tables and Loading Data

The default installation of Postgres should create both a Postgres role (superuser account) and a Postgres database. The default behavior of the load scripts uses these for login. If the role or the database are not present then a user and/or database will need to be specified when running the load scripts. Examples are provided later in this section. Fair warning that creating the postgres tables will take a very long time. 

Available option flags for the load scripts are as follows:
- `-u`: Sets the user role for the Postgres connection, default is postgres.
- `-p`: Sets the password for the Postgres connection, default is blank.
- `-d`: Sets the database for connection, default is postgres.
- `-h`: Sets the database host, default is localhost.
- `-o`: Sets the database connection port, the default is 5432.
- `--help`: Displays the options available for the script.

The script below creates a HMDA database on an existing Postgres installation, creates the hmda_public schema, creates tables, and loads data:
- `bash load_scripts/create_hmda_db.sh`

To load subsets of the HMDA data (LAR, Transmittal Sheet, or Panel) use the scripts below. These scripts will create a database named 'hmda' if one does not exist. They will also create a hmda_public schema in which all the data tables will be created and populated.
- `bash load_scripts/create_and_load_lar_2004_2019.sh`
- `bash load_scripts/create_and_load_ts_2004_2019.sh`
- `bash load_scripts/create_andload_panel_2004_2019.sh`

#### Using Options Flags

All of the load scripts support the same option flags. The example below use the create_hmda_db.sh script, but any script can be substituted.

To specify a username:
- `bash load_scripts/create_hmda_db.sh -u <username>`

To specify a password:
- `bash load_scripts/create_hmda_db.sh -p <password>`

To specify a database:
- `bash load_scripts/create_hmda_db.sh -d <database>`

To specify a username and password:
- `bash load_scripts/create_hmda_db.sh -u <username> -p <password>`

The SQL scripts provided in HMDA_Data_Science_Kit/load_scripts/SQL require an update to the path for the data sources before they can be used. The placeholder is {data_path}. This placeholder is replaced with the full path to the HMDA data when any of the load scripts are run. For example {data_path}HMDA_Data_Science_Kit/data/lar/lar_ult_2004.dat' on a Mac will become /Users/<username>/HMDA_Data_Science_Kit/data/lar/lar_ult_2004.dat'.

This change can be undone by running the following:
- `python3 load_scripts/reset_path.py`

### Quickstart

To download all supported HMDA data, unzip any zipped data, and add the data to a Postgres database, you'll run the following commands in order:

```
bash download_scripts/download_hmda.sh
bash download_scripts/unzip_all.sh
bash load_scripts/create_and_load_hmda.sh
```

After the downloading step, you'll need to check if all files successfully downloaded. [See above for more information](#download-troubleshooting).


## Contributing

In the open to maximize transparency and encourage third party contributions. If you want to contribute, please read and abide by the terms of the [License](LICENSE) for this project.

We use GitHub issues in this repository to track features, bugs, and enhancements to the software. [Pull Requests](https://help.github.com/articles/using-pull-requests/) are welcome

## Open source licensing info
1. [TERMS](TERMS.md)
2. [LICENSE](LICENSE)
3. [CFPB Source Code Policy](https://github.com/cfpb/source-code-policy/)

