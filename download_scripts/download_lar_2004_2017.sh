#!bin/bash
#Downloads LAR data if it does not exist

if [ ! -f data/lar/lar_2017.txt ]; then
	echo "LAR 2017 not found, downloading."
	curl https://s3.amazonaws.com/cfpb-hmda-public/prod/dynamic-data/2017_lar.txt --create-dirs -o data/lar/lar_2017.txt

elif [ -f data/lar/lar_2017.txt ]; then
	echo "LAR 2017 present."
fi

if [ ! -f data/lar/lar_2016.zip ]; then
    echo "LAR 2016 not found, downloading."
    curl https://www.ffiec.gov/hmdarawdata/LAR/National/2016HMDALAR%20-%20National.zip --create-dirs -o data/lar/lar_2016.zip
elif [ -f data/lar/lar_2016.zip ]; then
	echo "LAR 2016 present."
fi

if [ ! -f data/lar/lar_2015.zip ]; then
    echo "LAR 2015 not found, downloading."
    curl https://www.ffiec.gov/hmdarawdata/LAR/National/2015HMDALAR%20-%20National.zip --create-dirs -o data/lar/lar_2015.zip
elif [ -f data/lar/lar_2015.zip ]; then
	echo "LAR 2015 present."
fi

if [ ! -f data/lar/lar_2014.zip ]; then
    echo "LAR 2014 not found, downloading."
    curl https://www.ffiec.gov/hmdarawdata/LAR/National/2014HMDALAR%20-%20National.zip --create-dirs -o data/lar/lar_2014.zip
elif [ -f data/lar/lar_2014.zip ]; then
	echo "LAR 2014 present."
fi

wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2013/Lars.ultimate.2013.dat.zip -P data/lar
wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2012/Lars.ultimate.2012.dat.zip -P data/lar
wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UTL11/Lars.ultimate.2011.dat.zip -P data/lar
wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/UTL10/Lars.ultimate.2010.dat.zip -P data/lar
wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/ULAR09/2009_Ultimate_PUBLIC_LAR.dat.zip -P data/lar
wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/ULAR0708/lars.ultimate.2008.dat.zip -P data/lar
wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/ULAR0708/lars.ultimate.2007.dat.zip -P data/lar
wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/ULAR0506/LARS.ULTIMATE.2006.DAT.zip -P data/lar
wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/ULAR0506/LARS.ULTIMATE.2005.DAT.zip -P data/lar
wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/ULAR04/u2004lar.public.dat.zip -P data/lar



