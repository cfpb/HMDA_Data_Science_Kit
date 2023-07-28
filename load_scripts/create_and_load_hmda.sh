#!/bin/bash

#Set default PSQL connection variables
USER="nongarda" #the postgres username for the connection
PASSWORD="" #user's password for the connection
DATABASE="postgres" #Sets connection database
HOST="localhost" #host address of the database
PORT="5432" #connection port of the database

if [ $# -gt 0 ]; then
	for var in "$@"
	do #iterate over passed command line arguments as long as one remains
	    case $1 in
	        -u | --user )           shift
	                                USER=$1
	                                echo "user: $USER"
	                                ;;

	        -p | --password )       shift
									PASSWORD=$1
	                                ;;

	        -d | --database )		shift
									DATABASE=$1
									echo "database: $DATABASE"
									;;

			-h | --host )			shift
									HOST=$1
									echo "HOST: $HOST"
									;;

			-o | --port ) 			shift
									PORT=$1
									;;

	        --help )           		echo
									echo "*****************"
									echo "This section explains the command line arguments available in this script"
									echo ""
									echo "-u <username> or --user <username> sets the username for connection to database"
									echo "-p <password> or --password <password> sets the password for the connection"
									echo "-d <database> or --database <database> sets the database for connection"
									echo "-h <host address> or --host <host address> sets the connection address for the database"
									echo "-o <port> or --port <port> sets the connection port for the database"
									echo "--help calls this output"
	                                exit
	                                ;;
	    esac
	done
fi

# Set these environmental variables to override them,
# but they have safe defaults.
export PGUSER="${PGUSER-${USER}}" #postgres user for the connection
export PGPASSWORD="${PGPASSWORD-${PASSWORD}}" #PG password for the user
export PGDATABASE="${PGDATABASE-${DATABASE}}" #Sets connection database
export PGHOST="${PGHOST-${HOST}}" #host address of the database
export PGPORT="${PGPORT-${PORT}}" #connection port of the database

echo "creating HMDA database and hmda_public schema"
echo ""
psql $PGDATABASE $PGUSER << EOF
	CREATE DATABASE hmda;
	\c hmda
	CREATE SCHEMA hmda_public;
EOF

echo "setting data paths for SQL load"
echo ""
bash load_scripts/write_data_paths.sh

echo "removing extra tab in ts 2016"
echo ""
python3 load_scripts/remove_tab_ts_2016.py

echo "creating HMDA tables for 2004-2022"
echo ""
psql $PGDATABASE $PGUSER  << EOF
	\c hmda;
	set schema 'hmda_public';
	\i 'load_scripts/SQL/create_and_load_ts_2004.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2005.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2006.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2007.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2008.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2009.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2010.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2011.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2012.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2013.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2014.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2015.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2016.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2017.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2018.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2019.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2020.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2021.sql'
	\i 'load_scripts/SQL/create_and_load_ts_2022.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2004.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2005.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2006.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2007.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2008.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2009.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2010.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2011.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2012.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2013.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2014.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2015.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2016.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2017.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2018.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2019.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2020.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2021.sql'
	\i 'load_scripts/SQL/create_and_load_panel_2022.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2004.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2005.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2006.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2007.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2008.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2009.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2010.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2011.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2012.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2013.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2014.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2015.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2016.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2017.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2018.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2019.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2020.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2021.sql'
	\i 'load_scripts/SQL/create_and_load_lar_2022.sql'
EOF
