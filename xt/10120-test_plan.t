#! /usr/bin/env bash

source lib/olslib

    ONE=$(printf "%s\n" "1..1")
    NULL=$(printf "%s\n" "")

    printf "%s\n" "1..8"          

    pl=$(bash xt/sh/test_plan.sh 1)
    RC=$?
    is  $RC   $EX_OK      "One"            "RC='$RC' Plan exit code should be 0"
    is "$pl" "$ONE"       "Test-plan-1..1" "pl='$pl' Plan Tap output should be 1..1"

    pl=$(bash xt/sh/test_plan.sh 0)
    RC=$?
    is  $RC   $EX_ERROR   "Zero"      "RC='$RC' TAP Version 14 does not support NO Test Plan."
    is "$pl" "$NULL"      "NULL-TP1"  "pl='$pl' No Plan Tap output should be the null string"

    pl=$(bash xt/sh/test_plan.sh -1)
    RC=$?
    is  $RC  $EX_ERROR   "Minus One" "RC='$RC' Negative Plan exit code should be EX_ERROR"
    is "$pl" "$NULL"     "NULL-TP2"  "pl='$pl' Negative Plan Tap output should be the null string"

    pl=$(bash xt/sh/test_plan.sh abc)
    RC=$?
    is  $RC  $EX_ERROR    "ABC"      "RC='$RC' Non natural number exit code should be EX_ERROR"

    cat $OLS_TSTFILE

    is "$pl" "$NULL"      "NULL-TP3" "pl='$pl' Negative Plan Tap output should be the null string"

    cat $OLS_TSTFILE

    
