#!/bin/bash

bash download_scripts/download_hmda.sh
bash download_scripts/unzip_all.sh
bash load_scripts/create_and_load_hmda.sh
python3 load_scripts/reset_path.py