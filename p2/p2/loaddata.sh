#!/bin/bash

db2 -t -v < loaddata.sql 2>&1 | tee loaddata.log
