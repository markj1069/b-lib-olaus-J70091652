# /usr/bin/env bash

###################################################################################################
# Usage:      20110-is_csv.sh csv_file_name
# Purpose:    Invoke is_csv with the csv_file_name argument.
# Returns:    None.
# Parameters: csv_file_name - The name of the file to be tested for CSV format.
# Throws:     None.
# Comments:   n/a
# See Also:   Perl prove, OLSLIB
###################################################################################################

source lib/newlib

csv_file_name="$1"

is_csv "$csv_file_name"
