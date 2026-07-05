#! /usr/bin/env bash

source lib/olslib

declare -r TST_NO=7297

    printf "1..1\n"                     # Simulate ols_tst_plan

    ols_wt_tstno $TST_NO                # Should write 7297 to OLS_TSTFILE
    NUM=$(ols_rd_tstno)                 # Should read  7297 from OLS_TSTFILE

    ols_wt_tstno $OLS_TST_INIT        # Reset the test number for prove.

    is $NUM   $TST_NO TST_NOP "The number in OLS_TSTFILE should be TST_NO."
