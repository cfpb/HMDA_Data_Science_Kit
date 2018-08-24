#!bin/bash

#download Ulitmate Transittal Sheet Data from 2004-2013 and Transmittal Sheet data from 2014-2017
curl https://s3.amazonaws.com/cfpb-hmda-public/prod/dynamic-data/2017_ts.txt --create-dirs -o ../data/ts/ts_2017.txt
curl https://www.ffiec.gov/hmdarawdata/OTHER/2016HMDAInstitutionRecords.zip --create-dirs -o ../data/ts/ts_2016.zip
curl https://www.ffiec.gov/hmdarawdata/OTHER/2015HMDAInstitutionRecords.zip --create-dirs -o ../data/ts/ts_2015.zip
curl https://www.ffiec.gov/hmdarawdata/OTHER/2014HMDAInstitutionRecords.zip --create-dirs -o ../data/ts/ts_2014.zip
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2013/TS.ultimate.2013.dat?download=true --create-dirs -o ../data/ts/ts_ult_2013.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/TS.ultimate.2012.dat?download=true --create-dirs -o ../data/ts/ts_ult_2012.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2011/TS.ultimate.2011.dat?download=true --create-dirs -o ../data/ts/ts_ult_2011.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2010/TS.ultimate.2010.dat?download=true --create-dirs -o ../data/ts/ts_ult_2010.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2009/TS.ultimate.2009.dat?download=true --create-dirs -o ../data/ts/ts_ult_2009.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2008/TS.ultimate.2008.dat?download=true --create-dirs -o ../data/ts/ts_ult_2008.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2007/TS.ultimate.2007.dat?download=true --create-dirs -o ../data/ts/ts_ult_2007.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2006/TS.ultimate.2006.dat?download=true --create-dirs -o ../data/ts/ts_ult_2006.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2005/TS.ultimate.2005.dat?download=true --create-dirs -o ../data/ts/ts_ult_2005.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2004/TS.ultimate.2004.dat?download=true --create-dirs -o ../data/ts/ts_ult_2004.dat

for f in ../data/ts/*.zip; do unzip -p "$f" > "${f%.zip}.txt"; done