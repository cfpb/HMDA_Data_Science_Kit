import fileinput
import os
from os import listdir
from os.path import isfile, join

dir_path = os.path.dirname(os.path.realpath(__file__))
# Back up to the base HMDA_Data_Science_Kit directory
dir_path = os.path.realpath(os.path.join(dir_path, ".."))
# dir_path = dir_path[:-34]
print(dir_path)
text_to_search = dir_path
replacement_text = "{data_path}"

mypath = os.path.join(dir_path, "load_scripts/SQL/")
print(mypath)

onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
ts_files = [mypath + f for f in onlyfiles if f[-11:-9] == "ts"]
lar_files = [mypath + f for f in onlyfiles if f[-12:-9] == "lar"]
panel_files = [mypath + f for f in onlyfiles if f[-14:-9] == "panel"]

print("resetting TS file paths")
with fileinput.FileInput(ts_files, inplace=True, backup="") as sql_file:
    for line in sql_file:
        print(line.replace(text_to_search, replacement_text), end="")

print("resetting LAR file paths")
with fileinput.FileInput(lar_files, inplace=True, backup="") as sql_file:
    for line in sql_file:
        print(line.replace(text_to_search, replacement_text), end="")

print("resetting Panel file paths")
with fileinput.FileInput(panel_files, inplace=True, backup="") as sql_file:
    for line in sql_file:
        print(line.replace(text_to_search, replacement_text), end="")
