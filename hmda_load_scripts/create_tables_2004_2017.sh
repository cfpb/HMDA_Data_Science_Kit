
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

python3 write_data_paths.py

echo "creating HMDA tables for 2004-2017"
psql $PGUSER $PGDATABASE << EOF
	\c hmda;
	set schema 'hmda_public';
	\i 'SQL/create_and_load_panel_2004.sql'
	\i 'SQL/create_and_load_panel_2005.sql'
	\i 'SQL/create_and_load_panel_2006.sql'
	\i 'SQL/create_and_load_panel_2007.sql'
	\i 'SQL/create_and_load_panel_2008.sql'
	\i 'SQL/create_and_load_panel_2009.sql'
	\i 'SQL/create_and_load_panel_2010.sql'
	\i 'SQL/create_and_load_panel_2011.sql'
	\i 'SQL/create_and_load_panel_2012.sql'
	\i 'SQL/create_and_load_panel_2013.sql'
	\i 'SQL/create_and_load_panel_2014.sql'
	\i 'SQL/create_and_load_panel_2015.sql'
	\i 'SQL/create_and_load_panel_2016.sql'
	\i 'SQL/create_and_load_panel_2017.sql'

	\i 'SQL/create_and_load_ts_2004.sql'
	\i 'SQL/create_and_load_ts_2005.sql'
	\i 'SQL/create_and_load_ts_2006.sql'
	\i 'SQL/create_and_load_ts_2007.sql'
	\i 'SQL/create_and_load_ts_2008.sql'
	\i 'SQL/create_and_load_ts_2009.sql'
	\i 'SQL/create_and_load_ts_2010.sql'
	\i 'SQL/create_and_load_ts_2011.sql'
	\i 'SQL/create_and_load_ts_2012.sql'
	\i 'SQL/create_and_load_ts_2013.sql'
	\i 'SQL/create_and_load_ts_2014.sql'
	\i 'SQL/create_and_load_ts_2015.sql'
	\i 'SQL/create_and_load_ts_2016.sql'
	\i 'SQL/create_and_load_ts_2017.sql'

	\i 'SQL/create_and_load_lar_2004.sql'
	\i 'SQL/create_and_load_lar_2005.sql'
	\i 'SQL/create_and_load_lar_2006.sql'
	\i 'SQL/create_and_load_lar_2007.sql'
	\i 'SQL/create_and_load_lar_2008.sql'
	\i 'SQL/create_and_load_lar_2009.sql'
	\i 'SQL/create_and_load_lar_2010.sql'
	\i 'SQL/create_and_load_lar_2011.sql'
	\i 'SQL/create_and_load_lar_2012.sql'
	\i 'SQL/create_and_load_lar_2013.sql'
	\i 'SQL/create_and_load_lar_2014.sql'
	\i 'SQL/create_and_load_lar_2015.sql'
	\i 'SQL/create_and_load_lar_2016.sql'
	\i 'SQL/create_and_load_lar_2017.sql'

EOF

#check file line count with wc -l
#check table count with select count(*)