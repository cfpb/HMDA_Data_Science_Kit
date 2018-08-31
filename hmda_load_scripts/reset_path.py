import fileinput
import os 
from os import listdir
from os.path import isfile, join

mypath = "SQL/"
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
ts_files = [mypath+f for f in onlyfiles if f[-11:-9]=="ts"]
lar_files = [mypath+f for f in onlyfiles if f[-12:-9]=="lar"]
panel_files = [mypath+f for f in onlyfiles if f[-14:-9]=="panel"]
replacement_text = '{data_path}'

dir_path = os.path.dirname(os.path.realpath(__file__))
dir_path = dir_path[:-39]
text_to_search = dir_path

with fileinput.FileInput(ts_files, inplace=True, backup='') as sql_file:	
	for line in sql_file:
		print(line.replace(text_to_search, replacement_text), end='')

with fileinput.FileInput(lar_files, inplace=True, backup='') as sql_file:	
	for line in sql_file:
		print(line.replace(text_to_search, replacement_text), end='')

with fileinput.FileInput(panel_files, inplace=True, backup='') as sql_file:	
	for line in sql_file:
		print(line.replace(text_to_search, replacement_text), end='')