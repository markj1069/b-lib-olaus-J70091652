#! /usr/bin/env bash

source lib/olslib

declare -r TST_NO=0
declare -r TST_NO1=$((TST_NO+1))
declare -r TST_NO4=$((TST_NO+4))

    printf "1..5\n"                     # Simulate ols_tst_plan

    LINES=$(cat $OLS_TSTFILE | wc -l)  # Get the line count of OLS_TSTFILE
    is $LINES   1  "LINES" "The number of lines in OLS_TSTFILE should be 1."

    N=$(cat $OLS_TSTFILE)

    is $N       $TST_NO1 "TST_NO1" The TAP test number should be 1.

    WORDS=$(cat $OLS_TSTFILE | wc -w)  # Get the number of words in OLS_TSTFILE
    is  $WORDS   1      "WORDS" "The number of words in OLS_TSTFILE should be 1."

    CHARS=$(cat $OLS_TSTFILE | wc --bytes)  # Get the number of characters in OLS_TSTFILE
    is  $CHARS   2      "BYTES" "The number of characters in OLS_TSTFILE should be 2."

    READ_NO=$(cat $OLS_TSTFILE)
    is $READ_NO   $TST_NO4 "TST_NO4" "The number in OLS_TSTFILE, $READ_NO, should be $TST_NO4."

    ols_set_excode $EX_OK