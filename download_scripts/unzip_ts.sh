#!bin/bash
#this file unzips the compressed Transmittal Sheet files in the data/ts directory
for f in data/ts/*.zip; do unzip -p "$f" > "${f%.zip}.txt"; done