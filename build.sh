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

