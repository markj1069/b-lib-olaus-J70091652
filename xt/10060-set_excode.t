#! /usr/bin/env bash

source lib/olslib

    printf "1..1\n"                   # Simulate ols_tst_plan

    ols_wt_excode $EX_BASE            # Should write 7297 to OLS_TSTFILE
    
    NUM=$(ols_rd_excode)              # OLS_TSTFILE should contain 7298

    is $NUM   $EX_BASE 1 "The number in OLS_EX_FILE should be EX_BASE."

    ols_wt_excode $EX_OK              # Set the exit code
