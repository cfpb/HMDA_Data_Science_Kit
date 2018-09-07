#!/bin/bash

#This file unzips all compressed files in the data/lar, data/ts, and data/panel directories.
#Files are renamed to match the schema <hmda_dataset_hmda_year>.<extension> format.
bash download_scripts/unzip_and_rename_lar.sh
bash download_scripts/unzip_ts.sh
bash download_scripts/unzip_panel.sh