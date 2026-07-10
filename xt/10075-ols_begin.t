#! /usr/bin/env bash

printf "%s\n" "OLS0000I Begin"

source lib/newlib

printf "%s\n" "1..4"

if [[ -z "$OLS_DATE" ]]; then
    printf '%s\n' 'not ok 1 - DATE undefined after source command.'
    RC=$EX_ERROR
else
    printf '%s\n' 'ok 1 - DATE, $DATE, is defined.'
fi

if [[ -z "$OLS_YEAR" ]]; then
    printf '%s\n' 'not ok 2 - YEAR undefined after source command.'
    RC=$EX_ERROR
else
    printf '%s\n' 'ok 2 - YEAR, $YEAR, is defined.'
fi

if [[ -z "$OLS_TSTFILE" ]]; then
    printf '%s\n' 'not ok 3 - OLS_TSTFILE undefined after source command.'
    RC=$EX_ERROR
else
    printf '%s\n' 'ok 3 - OLS_TSTFILE, $OLS_TSTFILE, is defined.'
fi

if [[ -z "$OLS_EX_FILE" ]]; then
    printf '%s\n' 'not ok 4 - OLS_EX_FILE undefined after source command.'
    RC=$EX_ERROR
else
    printf '%s\n' 'ok 4 - OLS_EX_FILE, $OLS_EX_FILE, is defined.'
fi

printf "%s\n" "OLS0001I End"
