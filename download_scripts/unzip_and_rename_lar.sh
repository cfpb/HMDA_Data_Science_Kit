#!/bin/sh

#This file unzips and renames the LAR files in the data/lar directory.
#unzip and rename files
unzip data/lar/lar_2022.zip -d data/lar
unzip data/lar/lar_2021.zip -d data/lar
unzip data/lar/lar_2020.zip -d data/lar
unzip data/lar/lar_2019.zip -d data/lar
unzip data/lar/lar_2018.zip -d data/lar
unzip data/lar/lar_2017.zip -d data/lar
unzip data/lar/lar_2016.zip -d data/lar
unzip data/lar/lar_2015.zip -d data/lar
unzip data/lar/lar_2014.zip -d data/lar
unzip data/lar/lar_2013.zip -d data/lar
unzip data/lar/lar_2012.zip -d data/lar
unzip data/lar/lar_2011.zip -d data/lar
unzip data/lar/lar_2010.zip -d data/lar
unzip data/lar/lar_2009.zip -d data/lar
unzip data/lar/lar_2008.zip -d data/lar
unzip data/lar/lar_2007.zip -d data/lar
unzip data/lar/lar_2006.zip -d data/lar
unzip data/lar/lar_2005.zip -d data/lar
unzip data/lar/lar_2004.zip -d data/lar

mv data/lar/2022_public_lar_pipe.txt data/lar/lar_2022.txt 
mv data/lar/2021_public_lar_psv.txt data/lar/lar_2021.txt
mv data/lar/2020_lar_pipe.txt data/lar/lar_2020.txt
mv data/lar/2019_public_lar_three_year_pipe.txt data/lar/lar_2019.txt
mv data/lar/2018_public__lar_three_year_psv.txt data/lar/lar_2018.txt
mv data/lar/2017_public_lar_three_year.txt data/lar/lar_2017.txt
mv data/lar/2016HMDALAR\ -\ National.csv data/lar/lar_2016.csv
mv data/lar/2015HMDALAR\ -\ National.csv data/lar/lar_2015.csv
mv data/lar/Lars_ultimate_2014.txt data/lar/lar_2014.txt
mv data/lar/Lars.ultimate.2013.dat data/lar/lar_2013.dat
mv data/lar/Lars.ultimate.2012.dat data/lar/lar_2012.dat
mv data/lar/Lars.ultimate.2011.dat data/lar/lar_2011.dat
mv data/lar/Lars.ultimate.2010.dat data/lar/lar_2010.dat
mv data/lar/2009_Ultimate_PUBLIC_LAR.dat data/lar/lar_2009.dat
mv data/lar/Lars.ultimate.2008.dat data/lar/lar_2008.dat
mv data/lar/Lars.ultimate.2007.dat data/lar/lar_2007.dat
mv data/lar/Lars.ultimate.2006.dat data/lar/lar_2006.dat
mv data/lar/LARS.ULTIMATE.2005.DAT data/lar/lar_2005.dat
mv data/lar/u2004lar.public.dat data/lar/lar_2004.dat
