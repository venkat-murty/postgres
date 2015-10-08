#!/bin/bash

files="in.sql"

function exit_on_error
{
  if [ "$1" != "0" ]
  then
    echo "exiting ...";
    exit;
  fi
}

function run_example
{
  local in=$1
  local ot=$(echo $in | sed 's/.sql/.out/')
  local ex=$(echo $in | sed 's/.sql/.exp/')

  echo "Running $in";

  if [ -f examples/$ex ]; then
    cat examples/$in | ${BASE}/bin/psql test > examples/$ot;
    if ! diff examples/$ex  examples/$ot 2>&1 > /dev/null
    then
      echo "Failed $in"
    else
      rm  examples/$ot
    fi
  else
    echo "Generating expected file";
    cat examples/$in | ${BASE}/bin/psql test > examples/$ex;
  fi
}

BASE=${HOME}/pgsql

status=$(${BASE}/bin/pg_ctl -D ${BASE}/data status | egrep "^pg_ctl:")

stop="false";

if [ "$status" == "pg_ctl: no server running" ]; then
  ${BASE}/bin/pg_ctl -D ${BASE}/data -l logfile start
  exit_on_error $?

  sleep 10

  stop="true";
fi

for i in $(echo $files)
do
  run_example $i
done


if [ "$stop" == "true" ]; then
  ${BASE}/bin/pg_ctl -D ${BASE}/data stop
fi
