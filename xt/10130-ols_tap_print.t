#! /usr/bin/env bash

source lib/newlib

    ONE=$(printf "%s\n" "1..1")
    NULL=$(printf "%s\n" "")
    TEST_LINE1=$(printf "%s" "ok 1 - TRUE: Test that true works")
    TEST_LINE2=$(printf "%s" "not ok 1 - FALSE: Does False really fail?")
    TEST_LINE3=$(printf "%s" "ok 1 - TRUE2")
    TEST_LINE4=$(printf "%s" "not ok 1 - FALSE2")

    test_plan 4

    LINE=$(xt/sh/ols_tap_print.sh $TRUE "TRUE" Test that true works)
    is "$LINE" "$TEST_LINE1" "TRUE_w/diag" "Does $TRUE return ok." 

    LINE=$(xt/sh/ols_tap_print.sh $FALSE "FALSE" Does False really fail?)
    is "$LINE" "$TEST_LINE2" "FAIL_w/diag" "Does $FALSE return not ok." 

    LINE=$(xt/sh/ols_tap_print.sh $TRUE "TRUE2")
    is "$LINE" "$TEST_LINE3" "TRUE_wo/diag" "Does $TRUE return ok wo/diagnostic_message." 

    LINE=$(xt/sh/ols_tap_print.sh $FALSE "FALSE2")
    is "$LINE" "$TEST_LINE4" "FAIL_wo/diag" "Does $FALSE return not ok wo/diagnostic_message." 

    ols_set_excode EX_OK
