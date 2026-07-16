#! /usr/bin/env bash

source lib/newlib

    ONE=$(printf "%s\n" "1..1")
    echo "ONE: '$ONE'"
    NULL=$(printf "%s\n" "")
    echo "NULL: '$NULL'"

    printf "%s\n" "1..5"          

    pl=$(bash xt/sh/test_plan.sh 1)
    RC=$?
    is  $RC   $EX_OK      "One"            "RC='$RC' Plan exit code should be 0"
    is "$pl" "$ONE"       "Test-plan-1..1" "pl='$pl' Plan Tap output should be 1..1"

    pl=$(bash xt/sh/test_plan.sh 0)
    RC=$?
    is  $RC   $EX_USAGE   "Zero"      "RC='$RC' TAP Version 14 does not support NO Test Plan."


    pl=$(bash xt/sh/test_plan.sh -1)
    RC=$?
    is  $RC  $EX_USAGE   "Minus One" "RC='$RC' Negative Plan exit code should be EX_ERROR"

    pl=$(bash xt/sh/test_plan.sh abc)
    RC=$?
    is  $RC  $EX_USAGE    "ABC"      "RC='$RC' Non natural number exit code should be EX_ERROR"
