# /usr/bin/env bash

###################################################################################################
# Usage:      assert.sh condition lineno
# Purpose:    Short script to test the assert function.
# Returns:    None.
# Parameters: condition
#             lineno
# Throws:     None.
# Comments:   n/a
# See Also:   Perl prove, OLSLIB
###################################################################################################

source lib/newlib

condition="$1"

lineno="$2"

assert "$condition" "$lineno"
