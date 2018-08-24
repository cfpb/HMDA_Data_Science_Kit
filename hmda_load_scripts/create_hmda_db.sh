#!/bin/bash

#This script is designed to quickly set up a local database
#Caution: using this script to develop applications or set up a database on a network will create security vulnerabilities.

#this script should:
# create a hmda database
# create a hmda_public schema

set -e
set -u

# Set these environmental variables to override them,
# but they have safe defaults.
export PGHOST=${PGHOST-localhost}
export PGPORT=${PGPORT-5432}
export PGDATABASE=${PGDATABASE-postgres} #initial connection database, HMDA db will be created in this script
export PGUSER=${PGUSER-postgres} #enter your PG username
export PGPASSWORD=${PGPASSWORD-} #PG password


echo "creating HMDA database and hmda_public schema"
psql $PGUSER $PGDATABASE << EOF
	CREATE DATABASE hmda;
	\c hmda
	CREATE SCHEMA hmda_public;
EOF