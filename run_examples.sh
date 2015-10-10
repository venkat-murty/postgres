#!/bin/bash

files=$(find examples -name "*.sql" | egrep -v "^examples/data" | sed 's/examples\///' | sort -u)

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
  local ot=$(echo $in | sed 's/\.sql$/.out/')
  local ex=$(echo $in | sed 's/\.sql$/.exp/')
  local df=$(echo $in | sed 's/\.sql$/.dif/')
  local er=$(echo $in | sed 's/\.sql$/.err/')
  local st=$(date +"%s")
  local tm=$(egrep "^### Time taken : " examples/$ex 2> /dev/null | sed 's/### Time taken : //')

  echo "Running $in";

  ${BASE}/bin/psql test <  examples/$in > examples/$ot 2> examples/$er;

  st=$(( $(date +"%s")-$st ));
  echo "### Time taken : $st" >> examples/$ot;

  if [ -f examples/$ex ]; then
    if ! diff -I "^###" examples/$ex  examples/$ot > examples/$df 2> /dev/null
    then
      echo "Failed  $in in $st seconds expected time $tm"
    else
      echo "Passed  $in in $st seconds expected time $tm"
      rm  examples/$ot
      rm  examples/$df
      rm  examples/$er
    fi
  else
    echo "Generating expected file $ex";
    rm examples/$er
    mv examples/$ot examples/$ex;
  fi
}

BASE=${HOME}/pgsql

status=$(${BASE}/bin/pg_ctl -D ${BASE}/data status | egrep "^pg_ctl:")

stop="false";

if [ "$status" == "pg_ctl: no server running" ]; then
  sh start.sh
  stop="true";
fi

for i in $(echo $files)
do
  run_example $i
done


if [ "$stop" == "true" ]; then
  ${BASE}/bin/pg_ctl -D ${BASE}/data stop
fi
