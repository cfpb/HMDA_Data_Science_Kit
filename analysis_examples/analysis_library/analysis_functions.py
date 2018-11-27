import psycopg2 #Imports the Psycopg2 library
import pandas as pd #Imports the Pandas library and renames it "pd"
import matplotlib.pyplot as plt #imports the Matplot library and renames it "plt"
import numpy as np #Imports the Numpy library and renames it "np"
import hmda_library.hmda_functions as hmda

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



