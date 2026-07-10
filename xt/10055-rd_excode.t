#! /usr/bin/env bash

source lib/newlib

    printf "1..1\n"                   # Simulate ols_tst_plan

    ols_wt_excode $EX_BASE            # Should write EX_BASE to   OLS_EX_FILE
    NUM=$(ols_rd_excode)              # Should read  EX_BASE from OLS_EX_FILE

    is $NUM   $EX_BASE 1 "The number in OLS_EX_FILE should be EX_BASE."

    ols_wt_excode $EX_OK              # Set exit code to pass.

