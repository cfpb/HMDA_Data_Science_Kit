#!/bin/bash
#Note: the data files used are either Snapshot, Final, or Ultimate, whichever is latest
#      Dynamic files are not used
#LAR URL list for data downloading
lar_2022_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2022/2022_public_lar_pipe.zip"
lar_2021_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2021/2021_public_lar_pipe.zip"
lar_2020_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2020/2020_public_lar_pipe.zip"
lar_2019_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/three-year-data/2019/2019_public_lar_three_year_pipe.zip"
lar_2018_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/three-year-data/2018/2018_public_lar_three_year_pipe.zip"
lar_2017_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/three-year-data/2017/2017_public_lar_three_year_pipe.zip"
lar_2016_url="https://www.ffiec.gov/hmdarawdata/LAR/National/2016HMDALAR%20-%20National.zip" #The FFIEC has updated their website such that 2015 and 2016 are no longer wget scrapable. You will need to manually download LAR, TS, and Panel data from the FFIEC's website directly. 
lar_2015_url="https://www.ffiec.gov/hmdarawdata/LAR/National/2015HMDALAR%20-%20National.zip" #The FFIEC has updated their website such that 2015 and 2016 are no longer wget scrapable. You will need to manually download LAR, TS, and Panel data from the FFIEC's website directly. 
lar_2014_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/2014/ULAR_2014.zip"
lar_2013_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/2013/Lars.ultimate.2013.dat.zip"
lar_2012_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/2012/Lars.ultimate.2012.dat.zip"
lar_2011_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTL11/Lars.ultimate.2011.dat.zip"
lar_2010_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTL10/Lars.ultimate.2010.dat.zip"
lar_2009_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/ULAR09/2009_Ultimate_PUBLIC_LAR.dat.zip"
lar_2008_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/ULAR0708/lars.ultimate.2008.dat.zip"
lar_2007_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/ULAR0708/lars.ultimate.2007.dat.zip"
lar_2006_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/ULAR0506/LARS.ULTIMATE.2006.DAT.zip"
lar_2005_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/ULAR0506/LARS.ULTIMATE.2005.DAT.zip"
lar_2004_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/ULAR04/u2004lar.public.dat.zip"

#store download URLs in list for later iteration
declare -a lar_url_list=(${lar_2004_url} ${lar_2005_url} ${lar_2006_url} ${lar_2007_url} ${lar_2008_url} ${lar_2009_url} ${lar_2010_url}
	${lar_2011_url} ${lar_2012_url} ${lar_2013_url} ${lar_2014_url} ${lar_2015_url} ${lar_2016_url} ${lar_2017_url}
	${lar_2018_url} ${lar_2019_url} ${lar_2020_url} ${lar_2021_url} ${lar_2022_url})

#TS URL list for data downloading
ts_2022_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2022/2022_public_ts_pipe.zip"
ts_2021_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2021/2021_public_ts_pipe.zip"
ts_2020_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2020/2020_public_ts_pipe.zip"
ts_2019_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/three-year-data/2019/2019_public_ts_three_year_pipe.zip"
ts_2018_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/three-year-data/2018/2018_public_ts_three_year_pipe.zip"
ts_2017_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/three-year-data/2017/2017_public_ts_three_year_pipe.zip"
ts_2016_url="https://www.ffiec.gov/hmdarawdata/OTHER/2016HMDAInstitutionRecords.zip" #The FFIEC has updated their website such that 2015 and 2016 are no longer wget scrapable. You will need to manually download LAR, TS, and Panel data from the FFIEC's website directly. 
ts_2015_url="https://www.ffiec.gov/hmdarawdata/OTHER/2015HMDAInstitutionRecords.zip" #The FFIEC has updated their website such that 2015 and 2016 are no longer wget scrapable. You will need to manually download LAR, TS, and Panel data from the FFIEC's website directly. 
ts_2014_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/2014/TS_ultimate_2014.txt"
ts_2013_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/2013/TS.ultimate.2013.dat"
ts_2012_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/2012/TS.ultimate.2012.dat"
ts_2011_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTL11/TS.ultimate.2011.dat"
ts_2010_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTL10/TS.ultimate.2010.dat"
ts_2009_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTS09/2009_Ultimate_PUBLIC_TS.dat"
ts_2008_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTS0708/ts.ultimate.2008.dat"
ts_2007_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTS0708/ts.ultimate.2007.dat"
ts_2006_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTS0506/TS.ULTIMATE.2006.DAT"
ts_2005_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTS0506/TS.ULTIMATE.2005.DAT"
ts_2004_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UTS04/u2004ts.public.dat"

#store download URLs in list for later iteration
declare -a ts_url_list=(${ts_2004_url} ${ts_2005_url} ${ts_2006_url} ${ts_2007_url} ${ts_2008_url} ${ts_2009_url} ${ts_2010_url}
	${ts_2011_url} ${ts_2012_url} ${ts_2013_url} ${ts_2014_url} ${ts_2015_url} ${ts_2016_url} ${ts_2017_url}
	${ts_2018_url} ${ts_2019_url} ${ts_2020_url} ${ts_2021_url} ${ts_2022_url})

#Panel URL list for data downloading

panel_2022_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2022/2022_public_panel_pipe.zip"
panel_2021_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2021/2021_public_panel_pipe.zip"
panel_2020_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/snapshot-data/2020/2020_public_panel_pipe.zip"
panel_2019_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/three-year-data/2019/2019_public_panel_three_year_pipe.zip"
panel_2018_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/three-year-data/2018/2018_public_panel_three_year_pipe.zip"
panel_2017_url="https://s3.amazonaws.com/cfpb-hmda-public/prod/three-year-data/2017/2017_public_panel_three_year_pipe.zip"
panel_2016_url="https://www.ffiec.gov/hmdarawdata/OTHER/2016HMDAReporterPanel.zip" #The FFIEC has updated their website such that 2015 and 2016 are no longer wget scrapable. You will need to manually download LAR, TS, and Panel data from the FFIEC's website directly. 
panel_2015_url="https://www.ffiec.gov/hmdarawdata/OTHER/2015HMDAReporterPanel.zip" #The FFIEC has updated their website such that 2015 and 2016 are no longer wget scrapable. You will need to manually download LAR, TS, and Panel data from the FFIEC's website directly. 
panel_2014_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/2014/Panel.ultimate.2014.dat"
panel_2013_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/2013/Panel.ultimate.2013.dat"
panel_2012_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/2012/Panel.ultimate.2012.dat"
panel_2011_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UPN11/Panel.ultimate.2011.dat"
panel_2010_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UPN10/Panel.ultimate.2010.dat"
panel_2009_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UPN09/2009_Ultimate_PUBLIC_Panel.dat"
panel_2008_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UPN0708/panel.u.2008.dat"
panel_2007_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UPN0708/panel.u.2007.dat"
panel_2006_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UPN0506/PANEL.U.2006.DAT"
panel_2005_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UPN0506/PANEL.U.2005.DAT"
panel_2004_url="https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/UPN04/u2004pan.public.dat "

#store download URLs in list for later iteration
declare -a panel_url_list=(${panel_2004_url} ${panel_2005_url} ${panel_2006_url} ${panel_2007_url} ${panel_2008_url} ${panel_2009_url}
	${panel_2010_url} ${panel_2011_url} ${panel_2012_url} ${panel_2013_url} ${panel_2014_url} ${panel_2015_url} 
	${panel_2016_url} ${panel_2017_url} ${panel_2018_url} ${panel_2019_url} ${panel_2020_url} ${panel_2021_url} ${panel_2022_url})

#declaration of variables used in later logic
FORCE="false" #set force download (overwrite) to false
TS="false" #set download of TS files to false
LAR="false" #set download of LAR files to false
PANEL="false" #set download of Panel files to false
NC="-nc" #part of a wget call construction for omitting downloads of files already present, can be overridden by -F
SPECIFIC_FILE=""

#option setting: declare variables based on option flags passed
#this section defines what options are available in this script and provides basic instructions for use

while getopts "asptlFh" OPTION; do
        case ${OPTION} in

        		s) 		SPECIFIC_FILE=${2}
						;;
				p)		PANEL="true"
						;;
				t)		TS="true"
						;;
				l)		LAR="true"
						;;

        		F)		FORCE="true"
						NC=""
						;;

				a)
						echo "Panel Files:"
						echo "panel_2022"
						echo "panel_2021"
						echo "panel_2020"
						echo "panel_2019"
						echo "panel_2018"
						echo "panel_2017"
						echo "panel_2016"
						echo "panel_2015"
						echo "panel_2014"
						echo "panel_2013"
						echo "panel_2012"
						echo "panel_2011"
						echo "panel_2010"
						echo "panel_2009"
						echo "panel_2008"
						echo "panel_2007"
						echo "panel_2006"
						echo "panel_2005"
						echo "panel_2004"
						echo ""
						echo "Transmittal Sheet Files:"
						echo "ts_2022"
						echo "ts_2021"
						echo "ts_2020"
						echo "ts_2019"
						echo "ts_2018"
						echo "ts_2017"
						echo "ts_2016"
						echo "ts_2015"
						echo "ts_2014"
						echo "ts_2013"
						echo "ts_2012"
						echo "ts_2011"
						echo "ts_2010"
						echo "ts_2009"
						echo "ts_2008"
						echo "ts_2007"
						echo "ts_2006"
						echo "ts_2005"
						echo "ts_2004"
						echo ""
						echo "LAR Files:"
						echo "lar_2022"
						echo "lar_2021"
						echo "lar_2020"
						echo "lar_2019"
						echo "lar_2018"
						echo "lar_2017"
						echo "lar_2016"
						echo "lar_2015"
						echo "lar_2014"
						echo "lar_2013"
						echo "lar_2012"
						echo "lar_2011"
						echo "lar_2010"
						echo "lar_2009"
						echo "lar_2008"
						echo "lar_2007"
						echo "lar_2006"
						echo "lar_2005"
						echo "lar_2004"
						exit 0
						;;
                h)
                        echo "Usage:"
                        echo "download_hmda.sh -h "
                        echo "download_hmda.sh -F "
                        echo "download_hmda.sh -s "
                        echo "download_hmda.sh -p "
                        echo "download_hmda.sh -t "
                        echo "download_hmda.sh -l "
                        echo "Options may be combined, use the following format:"
                        echo "download_options.sh -Fpt"
                        echo ""
                        echo " "
                        echo "   -F 	force download files and overwrite existing"
                        echo "   -t 	download all Transittal Sheet files 2004 through 2017"
                        echo "   -p 	download all Panel files 2004 through 2017"
                        echo "   -l 	download all LAR files 2004 through 2017"
                        echo "   -s     download specific file using name format:"
                        echo " 	  p for panel, t for transmittal sheet and l for LAR"
                        echo " 	  and a four digit number indicating the desired year, such as 2017."
                        echo " 	  example: panel_2017 for the 2017 panel file, lar_2017 for the 2017 LAR file"
                        echo "    or ts_2017 for the 2017 Transmittal Sheet file"
                        echo "   -a 	show all files available for download"
                        echo "   -h     help (this output)"
                        exit 0
                        ;;

        esac
done

#create directories to store downloaded files
echo "making data storage directories for LAR, TS, and Panel"
mkdir data
mkdir data/lar
mkdir data/ts
mkdir data/panel

#no option behavior: attempt no clobber (-nc) download of each file for LAR/TS/Panel
if [ $# -eq 0 ]; then
        echo "No options selected, running full script"
        echo "(run $0 -h for help)"
        echo "(run $0 -a to show a list of files available for download"
        echo ""

    #iterate over TS URL array
    YEAR=2004 #set start year to 2004, this code does not support downloads prior to 2004
	for i in "${ts_url_list[@]}"
	do #wget each URL in the TS array
	   #specify file type for filename by year
	   if [ $YEAR -gt 2014 ]; then
			FILE_TYPE=".zip"
		elif [ $YEAR = 2014 ]; then #we leave 2014 TS only as a .txt file because it did not come zipped or .dat'd
			FILE_TYPE=".txt"
		else
			FILE_TYPE=".dat"
	   fi
	   TS_FILENAME="ts_${YEAR}${FILE_TYPE}" #set TS filename based on year
	   YEAR=$((YEAR+1))
	   if [ "${FORCE}" = "true" ]; then
	   		rm data/ts/${TS_FILENAME}
	   fi
	   wget -q -nc -c -t 10 --show-progress -O data/ts/${TS_FILENAME} "${i}" #write file to disk
	done #end loop

	#iterate over Panel URL array
	YEAR=2004 #set start year to 2004, this code does not support downloads prior to 2004
	for i in "${panel_url_list[@]}"
	do #wget each URL in Panel array
		#specify file type for filename by year
		if [ $YEAR -gt 2014 ]; then
			FILE_TYPE=".zip"
		else
			FILE_TYPE=".dat"
		fi
		PANEL_FILENAME="panel_${YEAR}${FILE_TYPE}"
		YEAR=$((YEAR+1))
		if [ "${FORCE}" = "true" ]; then
			rm data/panel/${PANEL_FILENAME}
		fi
		wget -q -nc -c -t 10 --show-progress -O data/panel/${PANEL_FILENAME} "${i}"
	done

	#iterate over LAR URL array
	YEAR=2004 #set start year to 2004, this code does not support downloads prior to 2004
	for i in "${lar_url_list[@]}"
	do #wget each URL in LAR array
		#echo
		#echo
		#specify file type for filename by year
	   if [ $YEAR = 2017 ]; then
			FILE_TYPE=".txt"
		else
			FILE_TYPE=".zip"
	   fi
		LAR_FILENAME="lar_${YEAR}${FILE_TYPE}" #set LAR filename based on year
		YEAR=$((YEAR+1))
		if [ "${FORCE}" = "true" ]; then
			rm data/lar/${LAR_FILENAME}
		fi
		wget -q -nc -c -t 10 --show-progress -O  data/lar/${LAR_FILENAME} "${i}"
	done
	exit 0
fi

#option -p or -t or -l behavior: attempt no clobber download of each file for LAR/TS/Panel
#if -F is also passed force download of each file type passed
if [ "${LAR}" = "true" ]; then
	if [ "${NC}" = "-nc" ]; then
		echo "downloading LAR files if not present"
	elif [ "${NC}" = "" ]; then
		echo "Force downloading all LAR files"
	fi
	#iterate over LAR URL array
	YEAR=2004 #set start year to 2004, this code does not support downloads prior to 2004
	for i in "${lar_url_list[@]}"
	do #wget each URL in LAR array
		#echo
		#echo
		#specify file type for filename by year
	   if [ $YEAR = 9999 ]; then #I have no idea why, but this was set to 2017 before and that made the .zip file a .txt instead which broke things. Changed to 9999 for now. 
			FILE_TYPE=".txt"
		else
			FILE_TYPE=".zip"
	   fi
		LAR_FILENAME="lar_${YEAR}${FILE_TYPE}" #set LAR filename based on year
		YEAR=$((YEAR+1))
		if [ "${FORCE}" = "true" ]; then
			rm data/lar/${LAR_FILENAME}
		fi
		wget -q ${NC} -c -t 10 --show-progress -O  data/lar/${LAR_FILENAME} "${i}"
	done
fi

#option -p or -t or -l behavior: attempt no clobber download of each file for LAR/TS/Panel
#if -F is also passed force download of each file type passed
if [ "$TS" = "true" ]; then
	if [ "${NC}" = "-nc" ]; then
		echo "downloading TS files if not present"
	elif [ "${NC}" = "" ]; then
		echo "Force downloading all TS files"
	fi

	#iterate over TS URL array
    YEAR=2004 #set start year to 2004, this code does not support downloads prior to 2004
	for i in "${ts_url_list[@]}"
	do #wget each URL in the TS array
	   #specify file type for filename by year
	   if [ $YEAR -gt 2014 ]; then
			FILE_TYPE=".zip"
		elif [ $YEAR = 2014 ]; then #we leave 2014 TS only as a .txt file because it did not come zipped or .dat'd
			FILE_TYPE=".txt"			
		else
			FILE_TYPE=".dat"
	   fi
	   TS_FILENAME="ts_${YEAR}${FILE_TYPE}" #set TS filename based on year
	   YEAR=$((YEAR+1))
	   if [ "${FORCE}" = "true" ]; then
	   		rm data/ts/${TS_FILENAME}
	   fi
	   wget -q ${NC} -c -t 10 --show-progress -O data/ts/${TS_FILENAME} "${i}" #write file to disk
	done #end loop
fi

#option -p or -t or -l behavior: attempt no clobber download of each file for LAR/TS/Panel
#if -F is also passed force download of each file type passed
if [ "${PANEL}" = "true" ]; then
	if [ "${NC}" = "-nc" ]; then
		echo "downloading Panel files if not present"
	elif [ "${NC}" = "" ]; then
		echo "Force downloading Panel files"
	fi
		#iterate over Panel URL array
	YEAR=2004 #set start year to 2004, this code does not support downloads prior to 2004
	for i in "${panel_url_list[@]}"
	do #wget each URL in Panel array
		#specify file type for filename by year
		if [ $YEAR -gt 2014 ]; then
			FILE_TYPE=".zip"
		else
			FILE_TYPE=".dat"
		fi
		PANEL_FILENAME="panel_${YEAR}${FILE_TYPE}"
		YEAR=$((YEAR+1))
		if [ "${FORCE}" = "true" ]; then
			rm data/panel/${PANEL_FILENAME}
		fi
		wget -q ${NC} -c -t 10 --show-progress -O data/panel/${PANEL_FILENAME} "${i}"
	done
fi

#option -s behavoir: download specific named file, requires second parameter as file key
#if -F is also passed force download of file
#check if file in list of available files to download
if [ "$SPECIFIC_FILE" != "" ]; then
	if [ "${NC}" = "-nc" ]; then
		echo "downloading ${SPECIFIC_FILE} if not exists"
	elif [ "${NC}" = "" ]; then
		echo "Force downloading ${SPECIFIC_FILE}"
	fi

	#set file type .DAT, .TXT, .ZIP for the $SPECIFC_FILE variable
	#set $URL for specific file by checking arrays by dataset, use year - 2004 for index reference

	NO_EXT="${SPECIFIC_FILE%.*}"
	YEAR=${NO_EXT:(-4)}
	URL_INDEX="$((YEAR - 2004))"

	if [ "${SPECIFIC_FILE:0:1}" = "p" ]; then
		URL=${panel_url_list[$URL_INDEX]}
		FOLDER="panel"
		if [ $YEAR -gt 2014 ]; then
			FILE_EXT=".zip"
		else
			FILE_EXT=".dat"
		fi

	elif [ "${SPECIFIC_FILE:0:1}" = "t" ]; then
		URL=${ts_url_list[$URL_INDEX]}
		FOLDER="ts"
		if [ $YEAR -gt 2014 ]; then
			FILE_EXT=".zip"
		elif [ $YEAR = 2014 ]; then #we leave 2014 TS only as a .txt file because it did not come zipped or .dat'd
			FILE_TYPE=".txt"			
		else
			FILE_EXT=".dat"
		fi

	elif [ "${SPECIFIC_FILE:0:1}" = "l" ]; then
		URL=${lar_url_list[URL_INDEX]}
		FOLDER="lar"
		if [ $YEAR = 2025 ]; then #I have no idea why, but this was set to 2017 before and that made the .zip file a .txt instead which broke things. Changed to 9999 for now.
			FILE_EXT=".txt"
		else
			FILE_EXT=".zip"
		fi
		
	fi

	#remove specific file if force flag was passed
	if [ "${FORCE}" = "true" ]; then
		rm data/$FOLDER/"${SPECIFIC_FILE}${FILE_EXT}"
	fi
	#download the specific file using passed force parameter
	wget -q ${NC} -c -t 10 --show-progress -O data/$FOLDER/"${SPECIFIC_FILE}${FILE_EXT}" "${URL}"
fi
