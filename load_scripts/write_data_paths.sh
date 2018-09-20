#!bin/sh

#get current directory path
data_path=$PWD
#remove HMDA_Data_Science from path
path_remove=${data_path:${#data_path} - 21}
replace_path=${data_path%"$path_remove"}

#iterate over files in load_scripts/SQL and change {data_path} to the directory above HMDA_Data_Science
for filename in load_scripts/SQL/*.sql; do
	#get year of file for filtering files
	substr=${filename:${#filename} - 8}
	year=${substr:0:4}
	re='^[0-9]+$'

	#modify data path
	if [[ $year =~ $re ]] ; then
   		echo "Modifying data path for $filename"
   		sed -i '' "s+{data_path}+${replace_path}+g" $filename
	fi
	

done

