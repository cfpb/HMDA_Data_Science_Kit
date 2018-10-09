#!/usr/bin/env python
# coding: utf-8

# # Plotting a Time Series of HMDA Filers by Category

# ### Scope of Notebook
# This notebook will build on the [previous analysis example](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/analysis_examples/1.%20Plotting%20a%20Time%20Series%20of%20HMDA%20Filers%20from%202004-2017.ipynb) of counting the number of institutions that have filed HMDA data from 2004-2017, by demonstrating how to filter counts by a particular category. The code below will focus on counts taken from the Transmittal Sheet dataset inside the HMDA collections.
# 
# The example will show how to pull Transmittal Sheet data from a local Postgres database, filter by a particular category, write the data to a pipe-delimited text file, and produce a graph in the Jupyter notebook as well as save the graph to a .png file.
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
# - Filter by a particular category
# - Load the data into a Pandas dataframe
# - Graph the data in the Jupyter notebook and save the graph to a .PNG file

# ## Import Python Libraries

# In[ ]:


import psycopg2 #Imports the Psycopg2 library
import pandas as pd #Imports the Pandas library and renames it "pd"
import matplotlib.pyplot as plt #imports the Matplot library and renames it "plt"


# ### Connect to the Database
# The connection to the database, which was demonstrated in the [previous example](https://github.com/cfpb/HMDA_Data_Science_Kit/blob/master/analysis_examples/1.%20Plotting%20a%20Time%20Series%20of%20HMDA%20Filers%20from%202004-2017.ipynb), will use a locally hosted database and the hmda database created during initial setup. Please see Analysis Example 1 for further details on connecting using a locally hosted database. 

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


# ### Variabalizing a SQL Command String for Filtering
# As demonstrated in the previous example, Python strings can contain markers which enable substitution of values. This allows use of the .format() command to change the table reference for the SQL query. The string below selects the activity year and the filer count, variabalizing the year.   

# In[ ]:


sql_command = """SELECT 
                    activity_year, 
                    COUNT (*) AS filer_count
                 FROM 
                    hmda_public.ts_{year} 
                 GROUP BY 
                    activity_year;"""


# A SQL command string may be modified to select a count of filers by a given category. The command string below not only variabalizes the year of the file to be selected but also creates an extention to the query that may be modified by the user.  

# In[ ]:


sql_base = """SELECT 
                activity_year, 
                COUNT (*) AS filer_count
              FROM 
                hmda_public.ts_{year} 
                {extention}
               ;"""


# ### Selecting the Number of Filers by a Particular State
# The code above may be placed in another sql file, which may be called by the the time series function defined in the previous example. The code below may be used to select for the number of filers who have their headquarters in New York. Respondent_state refers to the headquarters location of the institution and does not necessarily reflect lending patterns in that geography.

# In[ ]:


cur = connect(connection_params) #Establishes cursor object and connect to the database
year = 2017 #Provides the year of the file 

#Sets the extention variable so that it selects filers in the state of New York
extention = "WHERE respondent_state = 'NY' GROUP BY activity_year, respondent_state"
 
#Executes the query text against the database, formatting for the year and the extention
cur.execute(sql_base.format(year=year, extention=extention))
results = cur.fetchall() #Returns the query results.

#Converts the results_list into a Pandas dataframe with names pulled from the SQL query.
results_df = pd.DataFrame(results, columns=[desc[0] for desc in cur.description])
cur.close() #Closes the connection and remove the cursor object.
results_df.head() #Shows the top 5 rows of the dataframe


# ### Using A Function to Create a Timeseries of Counts by Category
# A function may defined to create a Pandas dataframe of filer counts by a category. The sql command above that variabalizes by category may be placed in file. 
# 
# The code below demonstrates a function that passes in a sql_command file, a start-year, an end-year, and an extention to the sql_command file. The default for the function produces a time series between years 2004 and 2017 in the form of a Pandas dataframe.
# 
# As shown below, the Pandas "loc" function may be used to reorder columns.

# In[ ]:


def time_series_by_category(sql_file=None, cur=None, extention=None, start=2004, end=2017):
    """ 
    This function requires a path to a SQL file and a cursor object. 
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
        #Replace the year and extention placeholder and execute the query.
        cur.execute(sql_base.format(year=year,extention=extention)) 
        results = cur.fetchall() #Return results from the cursor.
        results_list.append(results[0]) #Append results to list.
    #Convert results list to a dataframe with column names from the query.
    results_df = pd.DataFrame(results_list, columns=[desc[0] for desc in cur.description])
    return results_df #return a dataframe of the results


# In[ ]:


#Using the function to return data.
cur = connect(connection_params) #Create a database connection and cursor object.
#Call the function.
time_series_df = time_series_by_category(sql_file="sql_commands/2_filer_count_by_category.sql", 
                             cur=cur, 
                             extention="WHERE respondent_state = 'NY' GROUP BY activity_year, respondent_state")
time_series_df #Show the dataframe.


# ### Saving a Dataframe to a Pipe-Delimited File
# The dataframe created in the previous step can be saved to a file in a single command using the to_csv() command in Pandas.
# 
# The first argument passed is the desired path and name of the file.
# If the passed directory path does not exist an error will be thrown. For programmatic creation of file paths, see documentation of the OS module. 
# 
# The delimiter used in file creation can be changed by passing sep="delimiter".  
# By default, the dataframe index is saved to the file. To change this behavior pass index=False.

# In[ ]:


#Save the dataframe to a file
time_series_df.to_csv("analysis_output/tables/2_filer_count_by_category.txt", 
                      index=False, sep="|")


# ### Visualizing Data From Dataframes
# The below example will use Matplotlib (imported as plt) to do some basic visualization.  
# 
# Drawing from the previous example, a function may be defined to plot using information from a pandas dataframe. 

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
#Save the graph output to a PNG file.
plt = bar_chart(x_data=time_series_df['activity_year'], y_data=time_series_df['filer_count'],
         title="Number of HMDA Filers in NY, 2004-2017", figsize=(10,5))
plt.savefig('analysis_output/charts/2_filer_count_by_category.png') 

