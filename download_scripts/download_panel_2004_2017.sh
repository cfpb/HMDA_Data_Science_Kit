#!bin/bash

#download Ulitmate Panel Data from 2004-2013 and Panel data from 2014-2017

#snapshot Panel from 4/18 is used as dynamic Panel is not yet available
curl https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2017_public_panel_txt.zip --create-dirs -o data/panel/panel_2017.zip
curl https://www.ffiec.gov/hmdarawdata/OTHER/2016HMDAReporterPanel.zip --create-dirs -o data/panel/panel_2016.zip
curl https://www.ffiec.gov/hmdarawdata/OTHER/2015HMDAReporterPanel.zip --create-dirs -o data/panel/panel_2015.zip
curl https://www.ffiec.gov/hmdarawdata/OTHER/2014HMDAReporterPanel.zip --create-dirs -o data/panel/panel_2014.zip
wget -nc -t=10 -O panel_ult_2013.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2013/Panel.ultimate.2013.dat -P data/panel
wget -nc -t=10 -O panel_ult_2012.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2012.dat -P data/panel
wget -nc -t=10 -O panel_ult_2011.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2011/Panel.ultimate.2011.dat -P data/panel
wget -nc -t=10 -O panel_ult_2010.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2010/Panel.ultimate.2010.dat -P data/panel
wget -nc -t=10 -O panel_ult_2009.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2009/Panel.ultimate.2009.dat -P data/panel
wget -nc -t=10 -O panel_ult_2008.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2008/Panel.ultimate.2008.dat -P data/panel
wget -nc -t=10 -O panel_ult_2007.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2007/Panel.ultimate.2007.dat -P data/panel
wget -nc -t=10 -O panel_ult_2006.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2006/Panel.ultimate.2006.dat -P data/panel
wget -nc -t=10 -O panel_ult_2005.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2005/Panel.ultimate.2005.dat -P data/panel
wget -nc -t=10 -O panel_ult_2004.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN04/u2004pan.public.dat -P data/panel


#worked with wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2013/Panel.ultimate.2013.dat -P data/panel
#wget -nc -t=10 -O panel_ult_2004.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN04/u2004pan.public.dat -P data/panel