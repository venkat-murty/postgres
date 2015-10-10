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

${BASE}/bin/pg_ctl -D ${BASE}/data stop
