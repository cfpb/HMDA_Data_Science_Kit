#!bin/bash
for f in data/ts/*.zip; do unzip -p "$f" > "${f%.zip}.txt"; done