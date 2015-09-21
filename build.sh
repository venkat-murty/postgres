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

./configure --prefix=${BASE} --with-pgport=9090 --enable-cassert --enable-debug
exit_on_error $?

make
exit_on_error $?

make install
exit_on_error $?

rm -rf ${BASE}/data
exit_on_error $?

mkdir  ${BASE}/data
exit_on_error $?

${BASE}/bin/initdb -D ${BASE}/data -A trust
exit_on_error $?

${BASE}/bin/pg_ctl -D ${BASE}/data -l logfile start
exit_on_error $?

sleep 15
${BASE}/bin/createdb test
exit_on_error $?

sql=""
sql="CREATE TABLE foobar(id integer, t text);"

echo $sql | ${BASE}/bin/psql test

${BASE}/bin/pg_ctl -D ${BASE}/data stop

