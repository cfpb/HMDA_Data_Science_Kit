#!bin/sh

#get current directory path
data_path=$PWD

#iterate over files in load_scripts/SQL and change {data_path} to the HMDA_Data_Science_Kit base directory
for filename in load_scripts/SQL/*.sql; do
	#get year of file for filtering files
	substr=${filename:${#filename} - 8}
	year=${substr:0:4}
	re='^[0-9]+$'

	#modify data path
	if [[ $year =~ $re ]] ; then
   		echo "Modifying data path for $filename"
   		sed -i '' "s+{data_path}+${data_path}+g" $filename
	fi
	

done

