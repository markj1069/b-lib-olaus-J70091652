# plan - declare number of tests you are going to run

function test_plan() {

    if [[ -z "$1" ]]; then
        ols_err "$OLSID" 7201 $EX_ERROR "test_plan: Argument #1 missing, tst_no"
        plan=""
        return $EX_ERROR
    else
        local -i tst_no="$1"
        local    plan="1..$tst_no"
    fi

    if ! [[ $tst_no =~ ^[[:digit:]]+$ ]]; then
        ols_err "$OLSID" 7206 $EX_ERROR "test_plan: Test number, tst_no, must be a natural number."
        local plan=""
    fi

    if (( $tst_no <= 0 )); then
        ols_err "$OLSID" 7202 $EX_ERROR "test_plan: Test number, tst_no, must be greater than 0."
        local plan=""
    fi

    printf "%s\n" "$plan"             # Send the TAP test plan to STDOUT.

    return $EX_OK

} # end test_plan
