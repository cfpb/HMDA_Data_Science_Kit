#!bin/bash

#download Ulitmate Panel Data from 2004-2013 and Panel data from 2014-2017

#snapshot Panel from 4/18 is used as dynamic Panel is not yet available
curl https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2017_public_panel_txt.zip --create-dirs -o data/panel/panel_2017.zip
curl https://www.ffiec.gov/hmdarawdata/OTHER/2016HMDAReporterPanel.zip --create-dirs -o data/panel/panel_2016.zip
curl https://www.ffiec.gov/hmdarawdata/OTHER/2015HMDAReporterPanel.zip --create-dirs -o data/panel/panel_2015.zip
curl https://www.ffiec.gov/hmdarawdata/OTHER/2014HMDAReporterPanel.zip --create-dirs -o data/panel/panel_2014.zip
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2013/Panel.ultimate.2013.dat --create-dirs -o data/panel/panel_ult_2013.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2012.dat --create-dirs -o data/panel/panel_ult_2012.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2011/Panel.ultimate.2012.dat --create-dirs -o data/panel/panel_ult_2011.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2010.dat --create-dirs -o data/panel/panel_ult_2010.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2009.dat --create-dirs -o data/panel/panel_ult_2009.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2008.dat --create-dirs -o data/panel/panel_ult_2008.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2007.dat --create-dirs -o data/panel/panel_ult_2007.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2006.dat --create-dirs -o data/panel/panel_ult_2006.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2005.dat --create-dirs -o data/panel/panel_ult_2005.dat
curl https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2004.dat --create-dirs -o data/panel/panel_ult_2004.dat

for f in data/panel/*.zip; do unzip -p "$f" > "${f%.zip}.txt"; done
