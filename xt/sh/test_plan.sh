#! /usr/bin/env bash

source lib/olslib

PGMID=OLS

test_plan "$1" 2>/dev/null            # Set the plan from 1st option
