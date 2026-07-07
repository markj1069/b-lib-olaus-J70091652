#! /usr/bin/env bash

####################################################################################################
# Usage:      70100-build-append.t 
# Purpose:    70100-build-append.t is a test script that tests the build-append.sh script.
#             It is expected to reside in the xt directory of the project tree 
#             and be run from prove.
# Returns:    
# Parameters: None.
# Throws:     None.
# Comments:   70100-build-append.t is designed to be run from prove from
#    the root of the project tree.
#             It can also be run directly as xt/70100-build-append.t.
# See Also:   Perl prove, OLSLIB
####################################################################################################

source lib/olslib

declare    -r    LIB_NAME="$OLS_TMP_DIR/lib_name.txt"  # Use LIB_NAME as library file.

test_plan 6

# Test that the build-append.sh script checks for a missing argument #1 (FILENAME).
bin/build-append.sh
EX_CODE=$?                            # Capture the exit code from the build-append.
is $EX_CODE   $EX_USAGE "Aug_1" "build-append checks for a missing argument #1 (FILENAME)."

# Test that the build-append.sh script checks for a missing argument #2 (LIB_NAME).
bin/build-append.sh xt/lib/tst01.txt
EX_CODE=$?                            # Capture the exit code from the build-append.
is $EX_CODE   $EX_USAGE "Aug_2" "build-append checks for a missing argument #2 (LIB_NAME)."

# Test that the build-append.sh script checks for FILENAME file being missing.
bin/build-append.sh xt/lib/tst9999.txt xt/lib/missing.txt
EX_CODE=$?                            # Capture the exit code from the build-append.
is $EX_CODE   $EX_MISSINGFILE "Aug_1_Missing" "build-append checks for FILENAME being missing."

# Test that the build-append.sh script checks for FILENAME being readable.
bin/build-append.sh xt/lib/tst09_no_read.txt "$LIB_NAME"
EX_CODE=$?                            # Capture the exit code from the build-append.
is $EX_CODE   $EX_NOINPUT "Aug_1_NotReadable" "build-append checks for FILENAME being readable."

# Test that the build-append.sh script checks for LIB_NAME file being missing.
bin/build-append.sh xt/lib/tst01.txt xt/lib/missing.txt
EX_CODE=$?                            # Capture the exit code from the build-append.
is $EX_CODE   $EX_MISSINGFILE "Aug_2_Missing" "build-append checks for LIB_NAME being missing."

# Test that the build-append.sh script checks for LIB_NAME being writeable.
bin/build-append.sh xt/lib/tst01.txt xt/lib/tst10_no_write.txt
EX_CODE=$?                            # Capture the exit code from the build-append.
echo "EX_CODE=$EX_CODE"
echo "EX_CANTCREAT=$EX_CANTCREAT"
is $EX_CODE   $EX_CANTCREAT "Aug_2_NotWriteable" "build-append checks for LIB_NAME being writeable."

ols_end
