#!/usr/bin/env bash

###################################################################################################
# Usage:      build-append filename lib_name
# Purpose:    Append a file to a shell library
# Returns:    
# Parameters: None.
# Throws:     None.
# Comments:    
# See Also:   
###################################################################################################

# Synopsis: build-append filename lib_name

# Pull in the needed functions.

OLSID=OLS

source lib/olslib

# Validate arguments
# Do the arguments exist?
if [[ -z "$1" ]]; then                # filename Argument Required
    ols_err $OLSID 7010 $EX_USAGE "build-append: Argument #1 is missing, filename."
    exit
else
    declare FILENAME="$1"
fi

if [[ -z "$2" ]]; then                # LIB_NAME Argument Required
    ols_err $OLSID 7020 $EX_USAGE "build-append: Argument #2 is missing, lib_name"
    exit
else
    declare LIB_NAME="$2"
fi

# Does the member exist?
if [ ! -f "$FILENAME" ]; then         # FILENAME must exist 
    ols_err $OLSID 7030 $EX_MISSINGFILE  "build-append: '$FILENAME' is does not exist."
    exit
fi

if [[ ! -r "$FILENAME" ]]; then
    ols_err $OLSID 7040 $EX_NOINPUT  "build-append: '$FILENAME' is not readable"
    exit
fi

if [ ! -f "$LIB_NAME" ]; then         # LIB_NAME must exist 
    ols_err $OLSID 7030 $EX_MISSINGFILE  "build-append: '$LIB_NAME' is does not exist."
    exit
fi

if [[ ! -w "$LIB_NAME" ]]; then       # We need write permission for LIB_NAME
    ols_err $OLSID 7050 $EX_CANTCREAT "build-append: '$LIB_NAME' is not writeable"
    exit
fi


TARGET_LIB_DIR=$(readlink -f "$FILENAME")
fname=$( basename "$FILENAME" )


# Get the permissions for this FILENAME
perm=$( stat --printf="%a" "$FILENAME" )

echo "perm: $perm"

# Get the access time for this FILENAME
atime=$( stat --printf="%x" "$FILENAME" )
atime=${atime/ /T}                    # Insert a "T" in the timestamp.
atime=${atime:0:19}                   # Strip off the nanoseconds.

echo "atime: $atime"

# Get the modification time for this FILENAME
mtime=$( stat --printf="%y" "$FILENAME" )
mtime=${mtime/ /T}                    # Insert a "T" in the timestamp.
mtime=${mtime:0:19}                   # Strip off the nanoseconds.

echo "mtime: $mtime"

# Get the status chenge time for this FILENAME
ctime=$( stat --printf="%z" "$FILENAME" )
ctime=${ctime/ /T}                    # Insert a "T" in the timestamp.
ctime=${ctime:0:19}                   # Strip off the nanoseconds.

echo "ctime: $ctime"

# How big is the FILENAME
# wc returns #lines #bytes FILENAME
bct=$(cat "$FILENAME" | wc --bytes)     # Capture the byte count of the FILENAME

echo "bct: $bct"

# Write shell library member header
builtin printf "%s\n" "#-h- BEGIN $fname $bct $perm $atime $mtime $ctime" >> "$LIB_NAME"
/usr/bin/cat   "$FILENAME"                                                >> "$LIB_NAME"
builtin printf "%s\n" "#-h- END   $fname"                                 >> "$LIB_NAME"

ols_end
