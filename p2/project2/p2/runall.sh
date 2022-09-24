#!/bin/bash

# This script is only for your convenience, so that you can "cleanup" and setup the database schema
# 	and data quickly instead of having to run all the scripts separately.

./droptbl.sh
./createtbl.sh
./loaddata.sh
