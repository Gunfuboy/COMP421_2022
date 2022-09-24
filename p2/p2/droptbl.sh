#!/bin/bash

db2 -t -v < droptbl.sql 2>&1 | tee droptbl.log
