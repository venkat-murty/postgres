#!/bin/bash

files="create_tables.sql create_indexes.sql load.sql reset_seq.sql"

function exit_on_error
{
  if [ "$1" != "0" ]
  then
    echo "exiting ...";
    exit;
  fi
}


BASE=${HOME}/pgsql

${BASE}/bin/pg_ctl -D ${BASE}/data -l logfile start
exit_on_error $?

sleep 15

${BASE}/bin/dropdb test


${BASE}/bin/createdb test
exit_on_error $?

for i in $(echo $files)
do
  cat examples/data/$i | ${BASE}/bin/psql test
done

echo "ANALYZE;" | ${BASE}/bin/psql test

${BASE}/bin/pg_ctl -D ${BASE}/data stop

