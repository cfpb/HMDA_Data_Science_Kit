#!/usr/bin/env python3
import fileinput
import os 
from os import listdir
from os.path import isfile, join

mypath = "SQL/"
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
ts_files = [f for f in onlyfiles if f[-11:-9]=="ts"]
lar_files = [f for f in onlyfiles if f[-12:-9]=="lar"]
panel_files = [f for f in onlyfiles if f[-14:-9]=="panel"]
ts_files = ["SQL/"+f for f in ts_files]

dir_path = os.path.dirname(os.path.realpath(__file__))
dir_path = dir_path[:-39]

ts_replacement_text = dir_path
lar_replacement_text = dir_path
panel_replacement_text = dir_path
text_to_search = '{data_path}'

with fileinput.FileInput(ts_files, inplace=True, backup='') as sql_file:	
	for line in sql_file:
		print(line.replace(text_to_search, ts_replacement_text), end='')

#with fileinput.FileInput(filename, inplace=True, backup=None) as file:
#    for line in file:
#        print(line.replace(text_to_search, replacement_text), end='')