# ols_tap_assertion - Write TAP assertion results to stdout.

# Synopsis: ols_tap_assertion test_result test_name [diagnostic_message]

function ols_tap_print_assertion() {

    # Check for missing arguments.

    if [[ -z "$1" ]]; then
        ols_err $OLSID 7001 $EX_USAGE "ols_tap_print_assertion: Missing Argument #1, test_result"
    else
        local -i test_result=$1
    fi

    if [[ -z "$2" ]]; then
        ols_err $OLSID 7002 $EX_WARNING "ols_tap_print_assertion: Missing Argument #2, test_name"
    else
        local -i test_result=$1
    fi

    if [[ -z "$3" ]]; then
        ols_err $OLSID 7001 $EX_INFO "ols_tap_print_assertion: Missing Argument #1, test_result"
    else
        local -i test_result=$1
    fi

    if [[ $# -eq 0 ]]
    then
        olserr $OLSID 7000 $EX_USAGE "ols_tap_print_assertion: Arguments 1-3 missing, test_result, test_name and diagnostic_message"
    fi
    if [[ $# -eq 1 ]]
    then
        olserr $OLSID 7000 $EX_SOFTWARE "ols_tap_print_assertion: Arguments 2-3 missing, test_name and diagnostic_message"
    fi

    test_result="$1"
    test_name="$2"

    # Process test results
echo "ols_tap_print test_result: $test_result"
set -xv
    if [[ $test_result ]]; then
        tap_result="ok"
    else
        tap_result="not ok"
    fi
set +xv
    # Process diagnostic message if present.
    if [[ $# -ge 3 ]]                            # Diagnostic message argument is optional.
    then
        shift 3
        local diagnostic_message=": $*"          # Add the colon between the test number
    else                                         # and diagnostic message here.
        local diagnostic_message=""
    fi

    tst_no=$(ols_bmp_tstno)             # Increment TAP test number.

    printf "%s\n" "$tap_result - $tst_no $test_name$diagnostic_message"
 
    return $EX_OK

} # end ols_tap_print_assertion
