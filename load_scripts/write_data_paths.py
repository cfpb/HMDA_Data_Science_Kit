#!/usr/bin/env python3
import fileinput
import os 
from os import listdir
from os.path import isfile, join


dir_path = os.path.dirname(os.path.realpath(__file__))
dir_path = dir_path[:-34]

mypath = dir_path+"HMDA_Data_Science_Kit/load_scripts/SQL/"
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
ts_files = [mypath+f for f in onlyfiles if f[-11:-9]=="ts"]
lar_files = [mypath+f for f in onlyfiles if f[-12:-9]=="lar"]
panel_files = [mypath+f for f in onlyfiles if f[-14:-9]=="panel"]


ts_replacement_text = dir_path
lar_replacement_text = dir_path
panel_replacement_text = dir_path
text_to_search = '{data_path}'


with fileinput.FileInput(ts_files, inplace=True, backup='') as sql_file:	
	for line in sql_file:
		print(line.replace(text_to_search, ts_replacement_text), end='')

with fileinput.FileInput(lar_files, inplace=True, backup='') as sql_file:	
	for line in sql_file:
		print(line.replace(text_to_search, lar_replacement_text), end='')

with fileinput.FileInput(panel_files, inplace=True, backup='') as sql_file:	
	for line in sql_file:
		print(line.replace(text_to_search, panel_replacement_text), end='')
