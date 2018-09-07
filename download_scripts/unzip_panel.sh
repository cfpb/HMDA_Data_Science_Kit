#!bin/bash
#This file unzips the compressed Panel files in the data/panel directory.
for f in data/panel/*.zip; do unzip -p "$f" > "${f%.zip}.txt"; done
