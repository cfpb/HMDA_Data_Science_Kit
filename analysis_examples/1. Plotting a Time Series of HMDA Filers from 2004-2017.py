#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
import psycopg2


# ## Plotting a Time Series of HMDA Filers from 2004 - 2017

# 
# ### Scope of Notebook
# This notebook will demonstrate an approach to counting the number of institutions that have filed HMDA data from 2004-2017. While there are several approaches that can be used to do this, the code below will focus on counts taken from the Transmittal Sheet dataset inside the HMDA collections.
# 
# The example will show how to pull Transmittal Sheet data from a local Postgres database, write the data to a pipe-delimited text file, and produce a graph in the Jupyter notebook as well as save the graph to a .png file.
# 
# Additionally, more advanced methods using functions will be shown as an introduction to a library of functions that can be used to interact with the HMDA data.
# 
# While these examples provide some commentary on the use of SQL and Python, they should not be considered a replacement for more full fledged tutorials on how to use these tools. 
# 
# ### Setup Requirements
# In order to run this example locally several software packages need to be installed and configured. 
# Please see [these instructions](https://github.com/Kibrael/HMDA_Data_Science_Kit#creating-postgres-tables-and-loading-data) to get a local Postgres database set up and populated with HMDA data. 
# Please see [these instructions](https://github.com/Kibrael/HMDA_Data_Science_Kit#requirements) for setting up a Python development environment. Python 3.5 or higher is required as well as several libraries.
# 
# 
# ### Python Libraries Used
# - [Pandas](https://pandas.pydata.org/pandas-docs/stable/): a data manipulation and analysis package.
# - [Psycopg2](http://initd.org/psycopg/docs/): a database driver library providing APIs for connecting Python to Postgres.
# - [Matplotlib](https://matplotlib.org/): a library to enable inline plotting with Pandas and Jupyter notebooks.
# - [Jupyter](http://jupyter.org/documentation): a development tool that supports multiple formats for display such as Markdown and Python. Allows segmentation of code into cells for easy data manipulation trials.
# 
# ### Approach
# This notebook will leverage Postgres SQL as a data store and aggregation tool. Python will be used to interact with the database through the Psycopg2 library. The Pandas library will be used for data handling after pulling from Postgres. This includes cleaning, analysis, and visualization with the Matplotlib library (which integrates with Pandas).
# 
# The procss for this analysis will be:
# - Establish a connection to the database using psycopg2
# - Call a SQL file through Python to pull Transmittal Sheet counts by year
# - Load the data into a Pandas dataframe
# - Graph the data in the Jupyter notebook and save the graph to a .PNG file

# ### Import Python Libraries
# 
# 

# In[ ]:


import psycopg2 #Imports the Psycopg2 library
import pandas as pd #Imports the Pandas library and renames it "pd"
import matplotlib.pyplot as plt #imports the Matplot library and renames it "plt"


# ### Connect to the Database
# The connection logic is best defined in a function which allows it to be reused multiple times.
# 
# In order to use the connect function (defined below) some parameters must be passed to let the connection know the following:
# - the username
# - the password for the specified user
# - the database to be used
# - the host location of the database
# 
# In this example we will use a locally hosted database and the hmda database created during initial setup.
# 
# When Postgres installs, it creates a postgres user account. This account can be used, but it is a best practice to set up your own username as the postgres role is a superuser and can pose some security risks to your database.

# In[ ]:


#Establish connection parameters
#If you have established a username and password, change user and password below to your own username and password.
connection_params = {"user":"postgres", 
                     "password":"", 
                     "dbname":"hmda", 
                     "host":"localhost"}


# In[ ]:


def connect(params):
    """
    This function accepts a dictionary of connection parameters that must include:
    - user: the username to be used for the database session
    - password: the user's password
    - dbname: the name of the database for connection
    - host: the host location of the database
    """
    #attempt a connection with the supplied parameters
    try:
        conn = psycopg2.connect(**params)
        print("I'm connected") #print a success message
        return conn.cursor() #return a cursor object
    except psycopg2.Error as e: 
        print("I am unable to connect to the database: ", e) #print a fail message and the error, if any


# In[ ]:


#Test the connection function, if everything is correct, it will print "I'm connected."
cur = connect(params=connection_params)
#Close the cursor. This is important as open cursors can interfere with updates to data tables.
cur.close()

#When using Jupyter, it is best to open and close the cursor in the same code cell. 
#If there are coding errors that interrupt the execution, the cursor will need to be reestablished. 


# ### Establishing a SQL Command String
# In Python, SQL commands are handled as multi-line strings, denoted by three double quotes at the beginning 
# and 3 double quotes at the end for example: 
# ``` 
# """SELECT  
#         things
#    FROM  
#         data table""" ```
#        
# These strings are then passed through a Psycopg2 cursor object (the connection function defined above) and executed by the Postgres database.

# In[ ]:


#The SQL statement below will retrieve the year and count of institutions for the 2017 Transmittal Sheet.
sql_command = """SELECT 
                    activity_year, 
                    COUNT (*) AS filer_count
                 FROM 
                    hmda_public.ts_2017 
                 GROUP BY 
                    activity_year;"""


# ### Passing a SQL Query to the Database and Handling Results
# 

# In[ ]:


cur = connect(connection_params) #Connects to the database using parameters established above. 

cur.execute(sql_command) #Uses the SQL statement above to pull year and count of filers for 2017. 

results = cur.fetchall() #Saves the query results.

cur.close() #Closes the connection to the database. 

#Converts the output to a Pandas dataframe. 
#The cursor object contains information about the SQL query.
#In this instance we use the column names from the data table to name the columns in our dataframe.
#the use of the _df in naming variables indicates that it is of a dataframe type.
results_df = pd.DataFrame(results, columns=[desc[0] for desc in cur.description])

#Displays the top 10 rows of the dataframe.  
results_df.head(10)


# ### Variabalizing SQL Queries for Reuse
# 
# Python strings can contain markers which enable substitution of values.   
# In the case below "2017," has been replaced with {year}. This allows use of the .format() command to change the table reference for the SQL query.

# In[ ]:


sql_command = """SELECT 
                    activity_year, 
                    COUNT (*) AS filer_count
                 FROM 
                    hmda_public.ts_{year} 
                 GROUP BY 
                    activity_year;"""


# In[ ]:


cur = connect(connection_params) #Opens a database connection and instantiates a cursor object.
results_list = [] #A list to hold returns from multiple queries.
years = [2016, 2017] #The list of years for which data will be returned

for year in years: #Iterates over each year in the list.
    cur.execute(sql_command.format(year=year)) #Executes the SQL query replacing the {year} with a year from the list.
    results = cur.fetchall() #Returns the query results.
    #The results from the query will be returned as a list of tuples, for example: [('2016', 6762)]
    
    results_list.append(results[0]) #Appends the tuple, but not the list, from the results data.
    
cur.close() #Closes the database connection and removes the cursor object.
#Converts the results_list into a Pandas dataframe using SQL names for column names.
results_df = pd.DataFrame(results_list, columns=[desc[0] for desc in cur.description])
results_df.head() #Shows the top 5 rows of the dataframe.


# ### Using a .SQL File Instead of a Multi-Line String
# Instead of using a multi-line string, a text file (usually with a .sql extension to denote the type of code) can be used.   
# The code below demonstrates how to load a SQL file and convert it to a string, and convert placeholders to the desired text.

# In[ ]:


cur = connect(connection_params) #Establishes cursor object and connect to the database
results_list = [] #Instantiates an empty list to hold query results.
years = [2016, 2017] #List of years for the counts. 

#Sets the filepath and filename to be used as a SQL query.
sql_file = "sql_commands/1_filer_count_time_series.sql" 

for year in years: #Iterates over the years list.
    sql_base = "" #Creates a blank string to format into the query.
    with open(sql_file) as in_sql: #Opens the specified file.
        for line in in_sql.readlines(): #Reads all lines from the file.
            #Concatenates lines and removes newline characters.
            sql_base = sql_base + line.strip("\n") 
            
    print(sql_base) #Prints the full SQL query, this is normally done only for debugging.

    cur.execute(sql_base.format(year=year)) #Executes the query text against the database.
    results = cur.fetchall() #Returns the query results.
    results_list.append(results[0]) #Appends results to the list.

#Converts the results_list into a Pandas dataframe with names pulled from the SQL query.
results_df = pd.DataFrame(results_list, columns=[desc[0] for desc in cur.description])
cur.close() #Closes the connection and remove the cursor object.
results_df.head() #Shows the top 5 rows of the dataframe


# 
# ### Using a Function to Create a Timeseries of Counts
# The code below demonstrates a function that passes in a sql_command file, a start-year, and an end-year, producing a dataframe of output. The default for the function produces a time series between years 2004 and 2017.
# 
# As shown below, the Pandas "loc" function may be used to reorder columns.

# In[ ]:


def time_series(sql_file=None, cur=None, start=2004, end=2017):
    """ 
    This function requires a path to a SQL and a cursor object. 
    The default start year is 2004, the default end year is 2017.
    
    This function will call the passed SQL file against each of the years 
    from start to end.
    
    The results will be returned as a Pandas dataframe.
    """
    years = list(range(start, (end+1))) #Convert start and stop points to a list for iteration.
    results_list = [] #Create an empty list to hold query results.
    for year in years: #Iterate over desired years.
        sql_base = "" #Create blank string to modify into SQL query.
        with open(sql_file) as in_sql: #Open the SQL file.
            for line in in_sql.readlines(): #Read all lines in the SQL file.
                sql_base = sql_base + line.strip("\n") #Concatenate lines and remove newline characters.
        cur.execute(sql_base.format(year=year)) #Replace the year placeholder and execute the query.
        results = cur.fetchall() #Return results from the cursor.
        results_list.append(results[0]) #Append results to list.
    #Convert results list to a dataframe with column names from the query.
    results_df = pd.DataFrame(results_list, columns=[desc[0] for desc in cur.description])
    return results_df #return a dataframe of the results


# In[ ]:


#Using the function to return data.
cur = connect(connection_params) #Create a database connection and cursor object.
#Call the function.
time_series_df = time_series(sql_file="sql_commands/1_filer_count_time_series.sql" , cur=cur)
time_series_df #Show the dataframe.


# ### Saving a Dataframe to a Pipe-Delimited File
# The dataframe created in the previous step can be saved to a file in a single command using the to_csv() command in Pandas.
# 
# The first argument passed is the desired path and name of the file.
# If the passed directory path does not exist an error will be thrown. For programmatic creation of file paths, see documentation of the OS module. 
# 
# The delimiter used in file creation can be changed by passing sep="delimiter".  
# By default, the dataframe index is saved to the file. To change this behavior pass index=False.
#     
#     

# In[ ]:


#Save the dataframe to a file
time_series_df.to_csv("analysis_output/tables/1_filer_count_time_series.txt", 
                      index=False, sep="|")


# ### Visualizing Data From DataFrames
# The below example will use Matplotlib (imported as plt) to do some basic visualization.  
# 
# The Pandas library provides some basic plotting APIs built on top of Matplotlib. These APIs may be limited in functionality, but are useful for quick graphs. A basic example will be provided, but the majority of this example will focus on using Matplotlib.
# 
# Plots are displayed inline in the Jupyter notebook and can also be saved to disk. The example below will save the chart to analysis_output/charts/1_filer_count_time_series.png.

# In[ ]:


#A basic Pandas dataframe plot example using the time-series dataframe.
time_series_df.plot(kind="bar", color="blue", figsize=(10,5), 
                    title="Number of HMDA Filers, 2004-2017", 
                    x="activity_year", y="count")


# In[ ]:


#A Matplotlib bar chart example using the time-series dataframe.
x = time_series_df['activity_year'] #Set the data values for the x axis.
y = time_series_df['count'] #Set the data values for the y axis.

fig = plt.figure(figsize=(10,5)) #Adjusts the size of the bar chart. 
plt.bar(x, y, color='blue') #Creat a bar chart of x and y and set the color as blue. 
plt.title("Number of HMDA Filers, 2004-2017") #Set title of the chart. 
plt.xlabel("Year") #Set x-axis label
plt.ylabel("Filers") #Set y-axis label.
plt.xticks(x, x, rotation='45') #Set the x-tick labels to 45 degree rotation. 

#Save the graph output to a PNG file. 
fig.savefig('analysis_output/charts/1_filer_count_time_series.png') 


# ### Plotting Using a Function
# The same plot can be created using a function. Using a function allows standardization, reuse, and easy manipulation of set parameters.

# In[ ]:


def bar_chart(x_data=None, y_data=None, title="Chart Title", x_label=None, y_label=None, 
              color="blue", figsize=(10,5)):
    """
    This function requires two Pandas data series for x and y data.
    Optionally: the x label, y label, color, title, and size may be set. 

    This function returns a bar chart with the specified parameters.
    """
    if x_data is None or y_data is None:
        print("No data passed.")
        return None
    if x_label is None:
        x_label = x_data.name
    if y_label is None:
            y_label = y_data.name

    fig = plt.figure(figsize=figsize) #Sets size of the bar chart. 
    plt.bar(x_data, y_data, color=color) #Plots x and y and set the color.
    plt.title(title) #Sets title of the chart.
    plt.xlabel(x_label) #Sets x-axis label.
    plt.ylabel(y_label) #Sets y-axis label. 
    plt.xticks(x_data, rotation='45') #Setting x-tick labels and rotating 45 degrees.  
    return plt


# In[ ]:


#Create a bar chart using the function defined above.
bar_chart(x_data=time_series_df['activity_year'], y_data=time_series_df['count'],
         title="Number of HMDA Filers, 2004-2017", figsize=(10,5))

