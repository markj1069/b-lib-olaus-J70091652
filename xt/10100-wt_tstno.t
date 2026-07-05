#! /usr/bin/env bash

source lib/olslib

declare -r TST_NO=7297

    printf "1..1\n"                     # Simulate ols_tst_plan

    ols_wt_tstno $TST_NO                # Should write 7297 to OLS_TSTFILE

    READ_NO=$(cat $OLS_TSTFILE)
    ols_wt_tstno $OLS_TST_INIT        # Reset the tst_no value for prove.
    
    is $READ_NO   $TST_NO "TST_NO" "The number in OLS_TSTFILE should be TST_NO."

    ols_set_excode $EX_OK