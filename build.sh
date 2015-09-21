#!/bin/bash

./configure --prefix=${HOME}/pgsql --with-pgport=9090 --enable-cassert --enable-debug
make
