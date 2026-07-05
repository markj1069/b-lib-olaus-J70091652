#! /usr/bin/env bash

source lib/olslib

PGMID=OLS

OLS_DIR_TMP=$(mktemp -d)
OLS_TMP_FILE=$OLS_DIR_TMP/errors.txt

test_plan 5

xt/sh/ols_err.sh "OLS" 9999 $EX_OK Informational Message 2>$OLS_TMP_FILE
RC=$?
is $RC $EX_OK "EX_OK" "Exit code should be EX_OK." 

xt/sh/ols_err.sh "OLS" 9998 $EX_WARNING Warning Message 2>$OLS_TMP_FILE
RC=$?
is $RC $EX_WARNING "EX_WARNING" "Exit code should be EX_WARNING." 

xt/sh/ols_err.sh "OLS" 9997 $EX_ERROR Error Message 2>$OLS_TMP_FILE
RC=$?
is $RC $EX_ERROR "EX_ERROR" "Exit code should be EX_ERROR." 

xt/sh/ols_err.sh "OLS" 9996 $EX_SEVERE Severe Error Message 2>$OLS_TMP_FILE
RC=$?
is $RC $EX_SEVERE "EX_SEVERE" "Exit code should be EX_SEVERE." 

xt/sh/ols_err.sh "OLS" 9995 $EX_FATAL Fatal Error Message 2>$OLS_TMP_FILE
RC=$?
is $RC $EX_FATAL "EX_FATAL" "Exit code should be EX_FATAL." 
