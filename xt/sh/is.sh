# /usr/bin/env bash

###################################################################################################
# Usage:      is.sh got expected test_name [diagnostic_message]
# Purpose:    Test script for lib/is.sh
# Returns:    None.
# Parameters: got - The value that was obtained from a function or command.
#             expected - The value that was expected from a function or command.
#             test_name - The name of the test being performed.
#             diagnostic_message - An optional message to be printed if the test fails.     
# Throws:     None.
# Comments:   n/a
# See Also:   Perl prove, OLSLIB
###################################################################################################

source lib/newlib

got="$1"
expected="$2"
test_name="$3"

shift 3

diagnostic_message="$@"

is "$got" "$expected" "$test_name" "$diagnostic_message"
