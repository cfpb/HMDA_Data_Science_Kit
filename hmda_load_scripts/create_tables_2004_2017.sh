
#!/bin/bash

set -e
set -u

# Set these environmental variables to override them,
# but they have safe defaults.
export PGHOST=${PGHOST-localhost}
export PGPORT=${PGPORT-5432} #default port for localhost
export PGDATABASE=${PGDATABASE-postgres} #initial connection database, HMDA db will be created in this script
export PGUSER=${PGUSER-postgres} #enter your PG username
export PGPASSWORD=${PGPASSWORD-} #PG password


echo "creating HMDA table for 2004"
psql $PGUSER $PGDATABASE << EOF
	\c hmda;
	set schema 'hmda_public';
	\i 'SQL/create_and_load_lar_2004.sql'


EOF

#check file line count with wc -l
#check table count with select count(*)