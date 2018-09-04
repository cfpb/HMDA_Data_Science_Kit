#!bin/bash

for f in data/panel/*.zip; do unzip -p "$f" > "${f%.zip}.txt"; done
