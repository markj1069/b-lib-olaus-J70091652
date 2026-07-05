#! /usr/bin/env bash

source lib/olslib

declare -r TST_NO=7297
declare -r TST_NO1=$((TST_NO+1))

    printf "1..1\n"                     # Simulate ols_tst_plan

    ols_wt_tstno $TST_NO                # Should write 7297 to OLS_TSTFILE

    ols_bmp_tstno                       # OLS_TSTFILE should contain 7298.

    NUM=$(ols_rd_tstno)                 # Read the current test number.

    ols_wt_tstno $OLS_TST_INIT          # Reset the test number for prove.

    is $NUM   $TST_NO1 "TST_NO" "The number in OLS_TSTFILE should be $TST_NO1."
