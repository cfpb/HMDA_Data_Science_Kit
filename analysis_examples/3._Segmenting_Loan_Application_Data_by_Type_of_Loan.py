#!/usr/bin/env python
# coding: utf-8

# # Segmenting Loan Application Data by Category
# ## Scope of Notebook
# This notebook demonstrates how to segment Loan Application Register 
# (LAR) data by mortgage product. 
# 
# The example below presents a set of functions that pass 
# in SQL statments to execute against a local database, and convert
# output to a Pandas dataframe.  A dataframe of output is returned 
# that can be saved as a pipe-delimited csv file or used in a 
# visualization. 
# 
# A custom library of functions was made to store ones used in 
# previous notebooks. This library can be imported to support the 
# analysis work in the notebook.

# ### Importing Previously-Defined Functions to Support Setup
# The presense of an empty "init.py" file indicates that its 
# directory contains importable functions. 
# The function library used in this example is 
# called "analysis_library."
# 
# The code below calls function libraries. 
# According to the [PEP 8 -- Style Guide for Python Code]
# (https://www.python.org/dev/peps/pep-0008/#imports), 
# imports are done first from the standard library, 
# then third party libraries, and then custom libraries. 
# The analysis_library is a custom library and is imported last.

# Please note that data field values and categorical designations
# specified in this notebook are based on how loan applications are 
# described in the [2017 Filing Instruction Guide]
# (https://www.consumerfinance.gov/data-research/
# hmda/static/for-filers/2017/2017-hmda-fig.pdf)

# In[ ]:


import os
#Imports the Psycopg2 library
import psycopg2 
#Imports the Pandas library and renames it "pd"
import pandas as pd 
#Imports the Numpy library and renames it "np"
import numpy as np 
#Imports the Matplot library and renames it "plt"
import matplotlib.pyplot as plt 

#Imports the function definitions contained 
#in the analysis_functions file within the analysis_library directory.
import analysis_library.analysis_functions as analysis 


# ### Connect to the Database
# To establish a connection to the database, the connect() 
# function can be called from the analysis_library. 
# Connection parameters are established below, and then 
# passed through the connection function. 

# In[ ]:


# "User" and "password" can be changed
#below to one's own username and password.
connection_params = {"user":"fureym", 
                     "password":"", 
                     "dbname":"hmda", 
                     "host":"localhost"}


# In[ ]:


#Connecting to the database using the analysis function library
cur = analysis.connect(connection_params)


# ### Selecting LAR Data by Category and Transforming Non-Categorical 
# Variables
# 
# Categorical designations for the type of loan product include 
# loan type, property type, occupancy, lien status, and loan purpose. 
# According to the [2017 Filing Instruction Guide]
# (https://www.consumerfinance.gov/data-research/
# hmda/static/for-filers/2017/2017-hmda-fig.pdf), 
# pages 16-17, each category is broken down to the following codes.   
# 
# Loan Type (Codes: 1, 2, 3, 4)
#     - 1: Conventional (any loan other than FHA, VA, FSA, or 
# RHS loans)
#     - 2: FHA-insured (Federal Housing Administration)
#     - 3: VA - guaranteed (Veterans Administration)
#     - 4: FSA/RHS-guaranteed (Farm Service Agency or Rural Housing 
# Service)
# 
# Property Type (Codes: 1, 2, 3)
#     - 1: One to four-family (other than manufactured housing)
#     - 2: Manufactured housing
#     - 3: Multifamily
# 
# Owner Occupancy (Codes: 1, 2, 3)
#     - 1: Owner-occupied as a principal dwelling
#     - 2: Not owner-occupied
#     - 3: Not applicable
# 
# Lien Status (Codes: 1, 2, 3, 4)
#     - 1: Secured by a first lien
#     - 2: Secured by a subordinate lien
#     - 3: Not secured by a lien
#     - 4: Not applicable (purchased loans)
# 
# Loan Purpose (Codes: 1, 2, 3)
#     - 1: Home purchase
#     - 2: Home improvement
#     - 3: Refinancing
# 
# The combination of these codes determines the subset of LAR data 
# returned in the select_by_product function, shown below. 
# Additional measures should be taken to ensure that the desired data 
# subset matches the filter parameters supplied. 

# ### Like-Product Comparisons
# When analyzing economic, demographic, or geographic changes, 
# it can be useful to examine trends within a set of 
# like-products. Like-product comparisons can be used to analyze 
# trends more faithfully by isolating the effects of a specific
# product type.
#
# The default parameters return LAR data for applications and 
# originations for first-lien, owner-occupied, one to four-family, 
# conventional home purchase loans. In this case: Loan Type = 1, 
# Loan Purpose = 1, Property Type = 1, Owner Occupancy = 1 and 
# Lien Status = 1. These filters may be changed to alter the 
# subset of returned data.
# 
# Additional filter codes may be used such as:
# 
# #### One to four-family home refinancings:
#     Loan Purpose: 3
#     Loan Type: 1
#     Property Type: 1
#     Occupancy: 1
#     Lien Status: 1
# 
# #### FHA-insured home purchases:
#     Loan Type: 2
#     Loan Purpose: 1
#     Property Type: 1
#     Occupancy: 1
#     Lien Status: 1
# 
# #### Non-owner-occupied multifamily housing purchases:
#     Property Type: 3
#     Occupancy: 2
#     Loan Type: 1
#     Loan Purpose: 1
#     Lien Status: 1
#     
# 
# ### Defining Functions to Segment by Loan Product. 
# 
# Below are a set of functions that aid in analyzing LAR data by 
# mortgage product. 
# 
# With the lar_select_by_product function, users can pull LAR data by 
# a specific loan product specification and have the option to segment 
# data further by categories such as action type or geographic 
# location. The select_by_product function outputs a SQL command 
# in the form of a string. The string can be saved as a file with a 
# SQL extention.  
# 
# The lar_sql_to_df and the lar_sql_file_to_df function executes a sql 
# query against a database, passing in a year or a set of years, 
# and outputs a dataframe. The lar_time_series function is used to 
# create a time series of data for multiple years. Users can choose to 
# save the resulting dataframe output in a specified file path. 

# In[ ]:


def categories_to_sql_input(var=None):
"""
A helper function to convert the loan product codes in the 
select_by product function from integers to strings. 
For example, converts the integer 1 to ('1') or the list
[1,2] to ('1', '2').  
"""
#The case if multiple product codes are passed in a list. 
if type(var) == list: 
    #Creates a new list. 
    new_list = [] 
    #Takes each product code and converts it to a string. 
    for num in var: 
            #Appends each string to the new list.
            new_list.append(str(num))  
        #Creates a tuple of the string or set of strings. 
        var = tuple(new_list) 
        #Returns the tuple. 
        return var 
    #The case for one product code.
    else:  
        #Converts to a string with parentheses. 
        var = "(" + "'"+ str(var)+ "'" + ")" 
        #Returns the product code as a string. 
        return var 

def lar_select_by_product(
    schema_name="hmda_public", 
    table_name="lar_{year}", 
    select="*", 
    loan_type=1, 
    property_type=1, 
    occupancy=1, 
    lien_status=1, 
    loan_purpose=1, 
    where_ext=None, 
    filepath=None):
    """
    Outputs a SQL command in the form of a string that pulls LAR 
    data by a specific loan product specification. 
    The resulting string output can be saved as a file with a SQL 
    extention. 
    """ 
    #Converts each specification from integers to strings. 
    loan_type = categories_to_sql_input(loan_type) 
    
    property_type = categories_to_sql_input(property_type)
    
    occupancy = categories_to_sql_input(occupancy)
    
    lien_status = categories_to_sql_input(lien_status)
    
    loan_purpose = categories_to_sql_input(loan_purpose)
    
    #Passes in a blank string if where_ext = None. 
    if where_ext == None:
        where_ext = ""
    
    #Stores a multiline string of the SQL statement to be formatted 
    #with the parameters defined in the function. 
    
    sql_base = """
                 SELECT 
                    {select}
                 FROM 
                    {schema_name}.{table_name}
                 
                 WHERE
                    loan_type IN {loan_type}
                 AND  
                    property_type IN {property_type}
                 AND 
                    occupancy IN {occupancy}
                 AND 
                    lien_status IN {lien_status}
                 AND 
                    loan_purpose IN {loan_purpose}
   
                 {where_ext}
                   ;
                   """
    #Formats the statement with the parameters defined 
    #in the function. 
    sql_base=sql_base.format(schema_name=schema_name,
                             table_name=table_name,
                             select=select,
                             where_ext=where_ext,
                             loan_type=loan_type, 
                             property_type=property_type,
                             occupancy=occupancy,
                             lien_status=lien_status,
                             loan_purpose=loan_purpose)
    
    #The case when a filepath is specified. 
    if filepath != None:
        #Creates the directory if the directory did not 
        #previously exist. 
        os.makedirs(os.path.dirname(filepath), exist_ok=True)
        #Writes the text of the SQL command to the filepath.  
        with open(filepath, 'w' ) as f:
            f.writelines(sql_base)
        #Prints the location of the filepath. 
        print("Command has been saved to: " + filepath)
    
    return sql_base #Returns the SQL statement as a string. 

def lar_time_series(sql_base=None, start=None, end=None):
    """
    Executes a sql query against a LAR database. 
    Pulls data for each year between the start and end year specified.
    Returns a dataframe of results. 
    
    """
    #Converting start and stop points to a list for iteration.
    years = list(range(start, (end+1))) 
    #Creating an empty list to hold query results.
    results_list = [] 
    for year in years:
        #Creating an empty string sql variable. 
        sql = "" 
        #Storing the command as the sql variable. 
        sql = sql_base.format(year=year) 
        #Executing the command against the database. 
        cur.execute(sql) 
        lar_df = pd.DataFrame(cur.fetchall(), 
            columns=[desc[0] for desc in cur.description])
        #Appending results to results_list. 
        results_list.append(lar_df) 
        #Prints the year of data added. 
        print("Data added for " + str(year)) 
    
    #Concatenates the dataframes in the list. 
    results_df = pd.concat(results_list) 
    #Returns a dataframe of the results. 
    return results_df 

def lar_sql_to_df(cur=None, year=None, sql_base=None, filepath=None):
    """
    Executes a SQL query against a database of LAR rows, 
    passing in a year or a list of years. 
    """
    #The case when a list of years are passed. 
    if type(year) == list: 
        #Uses the time_series function to generate the resulting 
        #dataframe. 
        lar_df = lar_time_series(sql_base=sql_base, start=year[0], 
            end=year[-1])
    #The case when a single year is passed. 
    else: 
        #Formats the SQL statement for the year. 
        sql_base = sql_base.format(year=year) 
        #Executes the SQL statement against the database. 
        cur.execute(sql_base) 
        lar_df = pd.DataFrame(cur.fetchall(), 
            columns=[desc[0] for desc in cur.description])  
    
    #The case when a filepath specified. 
    if filepath != None: 
        #Writes to the filepath specified as a csv. 
        lar_df.to_csv(filepath, sep="|", index=False, header=None)
        #Prints the location of the saved file. 
        print("Dataframe has been saved to: " + filepath)
    return lar_df

def lar_sql_file_to_df(cur=None, year=None, sql_file=None, 
    filepath=None):
    """
    Reads in a file with a SQL statement, and 
    executes the SQL statement against a LAR database. 
    """
    #Create blank string to modify into SQL query.
    sql_base = "" 
    #Open the SQL file.
    with open(sql_file) as in_sql: 
        #Reads all lines in the SQL file.
        for line in in_sql.readlines(): 
            #Concatenates lines and removes newline characters.
            #Stores resulting string to a sql_base variable. 
            sql_base = sql_base + line.strip("\n") 
    #Executes sql_base against the LAR database with 
    #the sql_to_df function. 
    lar_df = lar_sql_to_df(sql_base=sql_base, year=year, 
        filepath=filepath)
    return lar_df


# ### Creating SQL Command Files for Loan Products
# The following code generates a SQL command that pulls loans 
# originated for conventional one to four-family home purchases. 
# Action Type is the outcome of the loan application where 
# Action Type = 1 indicates that the loan had been originated. 

# In[ ]:


sql_base = lar_select_by_product(where_ext = "AND action_type = '1'", 
    filepath="sql_commands/4_conv_home_orig.sql")

print(sql_base)


# ### Executing a SQL Command Against a Database.
# The following code uses the sql_base defined above to create a 
# Pandas dataframe, executing the command against the database. 

# In[ ]:


conv_home_orig_df = lar_sql_to_df(
    cur=cur, 
    year=2017, 
    sql_base=sql_base, 
    filepath="analysis_output/data/3_conv_home_orig.txt")

conv_home_orig_df


# ### Converting to Numerics
# The load scripts store all LAR variables as character-varying 
# strings in SQL. The code below transforms the dataframe output 
# into numerics so that operations such as aggregations and averages 
# can be performed. 

# In[ ]:

#Takes the column names. 
columns = conv_home_orig_df.columns.get_values() 
#Places column names in a list. 
columns = columns.tolist() 

#Converts each column value to numerics. 
for column in columns:
    conv_home_orig_df[column] = pd.to_numeric(
        conv_home_orig_df[column], errors='ignore') 


# A table of LAR data can be transformed into numerics by casting 
# variables individually in the select statement. Non-categorical 
# variables, such as loan amount or income, can be converted to 
# numerics while maintaining non-categorical variables, such as 
# state code as strings. The code below demonstrates this by
# casting variables in the SQL query of the 
# select_by_product function. 

# In[ ]:


print(lar_select_by_product(
    select = "CAST(loan_amount as int), state_code", 
    where_ext = "LIMIT 100"))


# ### Aggregating Data
# The code below demonstrates how to take the average loan amount 
# for one to four-family conventional home mortgage originations, and 
# group them by state code. These average loan amounts are saved in a 
# dataframe called loan_means_by_state. 

# In[ ]:


#Takes average loan amounts, groups by state code, and saves to a 
#loan_means_by_state_df variable. 
loan_means_by_state_df = conv_home_orig_df.groupby(
    'state_code')['loan_amount'].mean() 
#Results are transformed into a Pandas dataframe. 
loan_means_by_state_df = pd.DataFrame(loan_means_by_state_df) 
#Results are rounded.
loan_means_by_state_df = loan_means_by_state_df.round(0)
#Resetting index so that state_code is its own column
loan_means_by_state_df.reset_index(inplace=True)
loan_means_by_state_df


# ### Visualizing Data From Dataframes
# Using the Matplot library, data can be presented in the form of a 
# visualization. The tick labels can be adjustedto provide space 
# between labels. The code below adjusts the x-tick labels, 
# displaying every other state code to avoid crowding the labels. 

# In[ ]:

#Sets size of the bar chart. 
fig = plt.figure(figsize=(20,5)) 
#Plots x and y and sets the color.
x_data = loan_means_by_state_df.state_code
y_data = loan_means_by_state_df.loan_amount,
plt.bar(x_data, y_data, color='green') 

#Sets title of the chart.
plt.title("Average Loan Amounts: One to Four-Family Home Originations") 
#Sets x-axis label.
plt.xlabel("State Code") 
#Sets y-axis label. 
plt.ylabel("Average Loan Amount") 
#Setting x-tick labels and rotating 45 degrees.  
plt.xticks(loan_means_by_state_df.state_code, rotation='45') 
plt.show()


# ### Creating a Time Series by Product
# The code below demonstrates selecting LAR data by loan product for 
# multiple years. In the function below, a user can pass in a list of 
# years to produce a timeseries dataset. The code below pulls loan 
# amount, activity year, and state code for years 2004 through 2017. 

# In[ ]:


# Using the select by product function and variabalizing year. 
sql_base = lar_select_by_product(
    select = """activity_year, 
                loan_amount, 
                state_code """,
    where_ext = """AND action_type = '1' """, 
    filepath="sql_commands/5_conv_home_orig_time_series.sql" 
                                )

time_series = lar_sql_file_to_df(
    sql_file = "sql_commands/5_conv_home_orig_time_series.sql",
    cur=cur,
    year=[2004, 2017])


# ### Aggregating Data by Two Groups
# The code below demonstrates taking the average loan amount 
# for one to four-family conventional home mortgage originations, 
# and grouping them by state code. These average loan amounts are 
# saved in a dataframe called loan_means_by_state. 

# In[ ]:


#Converts loan_amount to numerics. 
time_series.loan_amount = pd.to_numeric(
    time_series.loan_amount, 
    errors='ignore') 

#Takes average loan amounts, groups by state code, 
#and saves to a loan_means_by_state_df variable.
loan_means_by_state_df = time_series.groupby(
    ['activity_year', 'state_code'])['loan_amount'].mean() 

#Results are transformed into a Pandas dataframe. 
loan_means_by_state_df = pd.DataFrame(loan_means_by_state_df) 

#Results are rounded.
loan_means_by_state_df = loan_means_by_state_df.round(0)

#Resetting index so that state_code is its own column
loan_means_by_state_df.reset_index(inplace=True)
loan_means_by_state_df.sort_values('activity_year')
loan_means_by_state_df.sort_values('state_code')


# ### Creating a Time Series Visualization 
# The timeseries of average loan amounts by state code can be 
# displayed in the form of a bar chart, using the function defined 
# in the analysis_library. Below is code that displays the average loan 
# amounts by year for a particular state code. 

# In[ ]:


#Creating a bar chart of average loan amounts for state code '01' 
#between 2004 and 2017. 

#Sets size of the bar chart. 
fig = plt.figure(figsize=(20,10))
bar_data = loan_means_by_state_df[
    loan_means_by_state_df['state_code']== '01']
x_data = bar_data.activity_year
y_data = bar_data.loan_amount
 
#Plots x and y and set the color.
plt.bar(x_data, y_data, color='green') 
#Sets title of the chart.
plt.title("Average Loan Amounts: One to Four-Family Home Originations") 
#Sets x-axis label.
plt.xlabel("Year") 
#Sets y-axis label. 
plt.ylabel("Loan Amount") 
#Setting x-tick labels and rotating 45 degrees.
plt.xticks(x_data, rotation='45')   
plt.show()

