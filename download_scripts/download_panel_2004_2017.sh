#!bin/bash

#download Ulitmate Panel Data from 2004-2013 and Panel data from 2014-2017

#snapshot Panel from 4/18 is used as dynamic Panel is not yet available
#curl https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2017_public_panel_txt.zip --create-dirs -o data/panel/panel_2017.zip
wget -nc -t=10 -O data/panel/panel_2017.zip https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2017_public_panel_txt.zip
#curl https://www.ffiec.gov/hmdarawdata/OTHER/2016HMDAReporterPanel.zip --create-dirs -o data/panel/panel_2016.zip
wget -nc -t=10 -O data/panel/panel_2016.zip https://www.ffiec.gov/hmdarawdata/OTHER/2016HMDAReporterPanel.zip
#curl https://www.ffiec.gov/hmdarawdata/OTHER/2015HMDAReporterPanel.zip --create-dirs -o data/panel/panel_2015.zip
wget -nc -t=10 -O data/panel/panel_2015.zip https://www.ffiec.gov/hmdarawdata/OTHER/2015HMDAReporterPanel.zip
#curl https://www.ffiec.gov/hmdarawdata/OTHER/2014HMDAReporterPanel.zip --create-dirs -o data/panel/panel_2014.zip
wget -nc -t=10 -O data/panel/panel_2014.zip https://www.ffiec.gov/hmdarawdata/OTHER/2014HMDAReporterPanel.zip

wget -nc -t=10 -O data/panel/panel_ult_2013.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2013/Panel.ultimate.2013.dat
wget -nc -t=10 -O data/panel/panel_ult_2012.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2012.dat
wget -nc -t=10 -O data/panel/panel_ult_2011.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN11/Panel.ultimate.2011.dat
wget -nc -t=10 -O data/panel/panel_ult_2010.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN10/Panel.ultimate.2010.dat
wget -nc -t=10 -O data/panel/panel_ult_2009.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN09/2009_Ultimate_PUBLIC_Panel.dat
wget -nc -t=10 -O data/panel/panel_ult_2008.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN0708/panel.u.2008.dat
wget -nc -t=10 -O data/panel/panel_ult_2007.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN0708/panel.u.2007.dat
wget -nc -t=10 -O data/panel/panel_ult_2006.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN0506/PANEL.U.2006.DAT
wget -nc -t=10 -O data/panel/panel_ult_2005.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN0506/PANEL.U.2005.DAT
wget -nc -t=10 -O data/panel/panel_ult_2004.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN04/u2004pan.public.dat 

#wget --force-directories -r -q -O data/panel/panel_ult_2004.dat https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UPN04/u2004pan.public.dat 