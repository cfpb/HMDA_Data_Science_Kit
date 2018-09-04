#!/bin/bash

bash download_scripts/download_ts_2004_2017.sh
bash download_scripts/download_panel_2004_2017.sh
bash download_scripts/download_lar_2004_2017.sh

bash download_scripts/unzip_and_rename_lar.sh
bash download_scripts/unzip_ts.sh
bash download_scripts/unzip_panel.sh