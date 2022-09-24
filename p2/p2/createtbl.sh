#!/bin/bash

db2 -t -v < createtbl.sql 2>&1 | tee createtbl.log
