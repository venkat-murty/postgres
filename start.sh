#!/bin/bash


function exit_on_error
{
  if [ "$1" != "0" ]
  then
    echo "exiting ...";
    exit;
  fi
}

BASE=${HOME}/pgsql

status=$(${BASE}/bin/pg_ctl -D ${BASE}/data status | egrep "^pg_ctl:" | sed 's/ *(PID.*$//')

if [ "$status" == "pg_ctl: no server running" ]; then
  ${BASE}/bin/pg_ctl -D ${BASE}/data -l logfile start
  exit_on_error $?

  for i in $(echo "0 1 2 3 4 5 6 7 8 9")
  do
    status=$(${BASE}/bin/pg_ctl -D ${BASE}/data status | egrep "^pg_ctl:" | sed 's/ *(PID.*$//')
    if [ "$status" == "pg_ctl: server is running" ]; then
      ${BASE}/bin/pg_ctl -D ${BASE}/data status | egrep "^pg_ctl:";
      exit 0;
    fi
    sleep 1
  done
fi

${BASE}/bin/pg_ctl -D ${BASE}/data status | egrep "^pg_ctl:";

