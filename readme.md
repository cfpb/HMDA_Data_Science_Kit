**Table of Contents:**
- Repository purpose and scope
- What is HMDA?
- What data are available to the public?
- How does HMDA data relate to Census data?
- Official HMDA data publications
- Official HMDA documentation
- Things to know about working with HMDA data


**Repository Purpose and Scope:**
The primary goal of this repository is to provide data users with tools to enable them to produce accurate analytics results. Additionally, this repository provides an overview of HMDA resources, publications, and guidelines for proper use. This repository does not provide statutory interpretation or compliance assistance. 

**What Is HMDA?**
HMDA refers to the [Home Mortgage Disclosure Act of 1975](https://www.gpo.gov/fdsys/pkg/USCODE-2011-title12/pdf/USCODE-2011-title12-chap29.pdf).
HMDA requires many financial institutions to maintain, report, and publicly disclose loan-level information about mortgages. HMDA was originally enacted by Congress in 1975 and is implemented by [Regulation C](https://www.consumerfinance.gov/policy-compliance/rulemaking/final-rules/regulation-c-home-mortgage-disclosure-act/). 

Congress amended HMDA in 2010 and the Bureau finalized a rule implementing changes to HMDA in 2015. Most of the rule's provisions affect data collected in 2018 and reported in 2019. However, beginning with data collected in 2017, depository institutions that originated fewer than 25 covered closed-end mortgages in either of the preceding two years are not required to report.

The senate bill S2155 modified some reporting requirements for the 2018 data collection. These changes will be outlined in upcoming publications.

**What is the purpose of HMDA?**
- To provide the public with information that will help show whether financial institutions are serving the housing credit needs of the neighborhoods and communities in which they are located. 
- To aid public officials in targeting public investments from the private sector to areas where they are needed. 
- The FIRREA amendments of 1989 require the collection and disclosure of data about applicant and borrower characteristics to assist in identifying possible discriminatory lending patterns and enforcing antidiscrimination statutes.

**HMDA Dataset Structure**
Three raw data files are published annually under HMDA authority. File formats (and schemas) vary by data source. The National Archives (NARA) use a .DAT format, the FFIEC site maintained by the Federal Reserve Board (FRB) use a .CSV format (with Census data appended) and the FFIEC site maintained by the BCFP us a pipe-delimited .TXT format (with Census data appended). Links to HMDA datasets are available in this [file](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/data_links/hmda_data_links.md).

These datasets include:
- The Loan Application Register (LAR): This dataset contains application and origination activity on covered transactions made by covered institutions. The LAR is distinct from many other mortgage datasets as it includes both application and origination data as well as borrower demographic information. The LAR has had several distinct schemas including a change from aggregate to transaction level data in 1990. LAR schemas are available in this [folder]() and a discussion of changes to underlying data (such as the benchmark for the rate spread variable) can be found in the [Working with HMDA Data]() document.

- The Transmittal Sheet (TS): This dataset contains information about the financial institutions that are covered by HMDA and submitted LAR data to the FFIEC. Transmittal sheet schemas can be found in this [folder]().

- The HMDA Reporter Panel: This dataset contains additional information regarding financial institutions such as identifier links to the National Information Center (NIC) and hierarchy information such as parent and top holder. The HMDA Reporter Panel is assembled by the Bureau on behalf of the FFIEC (beginning in 2017). Panel schemas can be found in this [folder]().


**Use of Census Data with HMDA**
HMDA data is often joined to Census data to show context for the mortgage data. The FFIEC joins the following to the HMDA LAR data: area population, minority population percentage, FFIEC median family income, tract to MSA/MD median family income percentage, number of owner-occupied units, and the number of 1-4 family units. These data are joined at the tract level to provide context for mortgage activity in the relevant geography. The base data for this join are made available by the FFIEC on this [website](https://www.ffiec.gov/censusapp.htm). The year of the Census data correspond to the HMDA collection year.

The FFIEC Census flat file fields of interest are (column number :name): 0:HMDA Year, 1:MSA, 2:State, 3:County, 4:Tract, 14:Area Population, 20: Minority Population Percentage, 915:Number of Owner-Occupied Units, 899:Number of 1-4 Family Units, 580:Tract Median Family Income, 12:Tract to MSA Median Family Income Percentage, 952:Median Age of Housing Stock, 13:FFIEC Median Family Income. For examples on how to handle this file and join Census data to LAR data please see this [directory]().

With the exception of FFIEC median family income percentage, the base data are available in the American Community Survey (ACS) or the Summary File from the [US Census Bureau](). The FFIEC median family income data are made available by the FFIEC on this [website](https://www.ffiec.gov/Medianincome.htm). Please note that the data provided by the FRB on behalf of the FFIEC incorporates annual changes made to geographic boundaries. These provided data update Census base data on a 5 year cycle, for example activity years 2012-2016 used the 2010 SF1/ACS 5 year datasets and the 2017 activity year changes to the 2015 ACS 5 year dataset. Some reference fields also change during this update cycle. For these reasons it is recommended to use the FFIEC Census data as these data will provide consistency with other HMDA publications, such as Aggregate and Disclosure reports.

**HMDA Publications**
**2017 and beyond is provided by the BCFP on behalf of the FFIEC**
- [BCFP HMDA publication page](https://ffiec.cfpb.gov/data-publication/)
- [Modified LAR (MLAR)](https://ffiec.cfpb.gov/data-publication/modified-lar) is the LAR data for a single institution with the following fields redacted: application date, action date, loan ID.
- [Static data from 4/18](https://ffiec.cfpb.gov/data-publication/snapshot-national-loan-level-dataset) are the LAR, TS, and Panel data as of 4/18/2018. These files are the input to the 2017 HMDA Data Point. These files are not updated.
- [Dynamic Data](https://ffiec.cfpb.gov/data-publication/dynamic-national-loan-level-dataset) are TS and LAR datasets containing information from all reporting institutions. These data are updated weekly.
- [HMDA Explorer](https://www.consumerfinance.gov/data-research/hmda/explore) is a BCFP project that allows users to query HMDA datasets and download slices of the data with customizable filters.
- [Aggregate Reports](https://ffiec.cfpb.gov/data-publication/aggregate-reports/2017) are single-year tabular data for all reporting institutions that show application and origination activity by MSA (sometimes by Census Tract) for demographic and loan characteristics.
- [National Aggregate Reports](https://ffiec.cfpb.gov/data-publication/national-aggregate-reports/2017) are single-year tabular data for all reporting institutions that show application and origination activity on a national level for demographic and loan characteristicts.
- [Disclosure Reports](https://ffiec.cfpb.gov/data-publication/disclosure-reports/2017) are single-year tabular data for a single reporting institution that show application and origination activity by MSA (soetimes by Census Tract) for demographic and loan characteristics.
- [2017 HMDA Data Point](https://www.consumerfinance.gov/data-research/research-reports/cfpb-data-point-mortgage-market-activity-and-trends/) outlines 2017 application and origination actiivty and highlights time-series trends in the HMDA data. This publication draws inspiration from FRB HMDA Bulletin publications of previous years.

**2016 and prior is provided by the FRB on behalf of the FFIEC**
- [FRB HMDA Publication page](https://www.ffiec.gov/hmda/hmdaproducts.htm)
- [HMDA Flat Files](https://www.ffiec.gov/hmda/hmdaflat.htm)
- [Aggregate Reports 1999-2016](https://www.ffiec.gov/hmdaadwebreport/aggwelcome.aspx) are single-year tabular data for all reporting institutions that show application and origination activity by MSA (sometimes by Census Tract) for demographic and loan characteristics.
- [Disclosure Reports 1999-2016](https://www.ffiec.gov/hmdaadwebreport/DisWelcome.aspx) are single-year tabular data for a single reporting institution that show application and origination activity by MSA (soetimes by Census Tract) for demographic and loan characteristics.
- [HMDA Bulletin 2016](https://www.federalreserve.gov/publications/2017-november-residential-mortgage-lending-in-2016.htm)
- [HMDA Bulletin 2015](https://www.federalreserve.gov/pubs/bulletin/2016/articles/hmda/2015-hmda-data.htm)
- [HMDA Bulletin 2014](https://www.federalreserve.gov/pubs/bulletin/2015/pdf/2014_HMDA.pdf)
- [HMDA Bulletin 2013](https://www.federalreserve.gov/pubs/bulletin/2014/pdf/2013_HMDA.pdf)
- [HMDA Bulletin 2012](https://www.federalreserve.gov/pubs/bulletin/2013/pdf/2012_HMDA.pdf)
- [HMDA Bulletin 2011](https://www.federalreserve.gov/pubs/bulletin/2012/pdf/2011_HMDA.pdf)
- [HMDA Bulletin 2010](https://www.federalreserve.gov/pubs/bulletin/2011/pdf/2010_HMDA_final.pdf)
- [HMDA Bulletin 2009](https://www.federalreserve.gov/pubs/bulletin/2010/articles/2009HMDA/default.htm)
- [HMDA Bulletin 2008](https://www.federalreserve.gov/pubs/Bulletin/2010/articles/HMDA/default.htm)
- [HMDA Bulletin 2007](https://www.federalreserve.gov/pubs/bulletin/2008/articles/hmda/default.htm)
- [HMDA Bulletin 2006](https://www.federalreserve.gov/pubs/bulletin/2007/articles/hmda/default.htm)
- [HMDA Bulletin 2005](https://www.federalreserve.gov/pubs/bulletin/2006/hmda/default.htm)

**Working With HMDA Data**
The HMDA data are complex and care must be taken to ensure that analytics results are accurate. Please see [Working With HMDA Data]() for explanations of how to load, segment the data, handle NA values, and create accurate time-series tabulations.

**Getting Started: What You Need**
To begin using the HMDA data you will first need to download the data. Please see [HMDA data links](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/data_links/hmda_data_links.md) to begin downloading the data.

The resources in this repository assume that a database has been installed and is functioning properly. The SQL code is written for [PostgreSQL](https://www.postgresql.org/), other SQL versions may require modification to the code. 

The Python resources assume that a functioning installation of [Python 3.5](https://www.python.org/downloads/) or greater is present.

