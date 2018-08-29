### This folder contains scripts to download and unzip HMDA datasets.

Note: Downloading data from the National Archives may fail. Failure is usually limited to downloading LAR data.

If this happens a file with the correct name will be written to disk and will have a size of 4KB. All LAR data are larger than 4KB. 

To fix this, delete the 4KB file and either re-run the Bash script (existing files will not be re-downloaded).

Alternatively, copy and paste the download command from the Bash file into a Terminal window. 

For example: 
`wget -nc -t=10 https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-082/hmda/2013/Lars.ultimate.2013.dat.zip -P ../data/lar`

*Note: these commands use relative directory paths. Please ensure that you are in the ~/hmda/HMDA_Data_Science_Kit/download_scripts directory.*