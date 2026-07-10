#! /usr/bin/env bash

# Test that a leading zero does not show up in OLS_TSTFILE.

source lib/newlib

declare -r TST_NO=7297
declare -r TST_NO1=$((TST_NO+1))
declare -i i

    printf "1..16\n"                     # Simulate ols_tst_plan

    for i in {1..16}; do

        NUM=$(ols_rd_tstno)                 # Read the current test number.
        NUM=$((NUM+1))

        if [[ $NUM -eq  $i ]]; then
            ols_tap_print $TRUE  "TST_NO" "Counting up to 16."
        else
            ols_tap_print $FALSE "TST_NO" "Counting up to 16."
        fi
    done


