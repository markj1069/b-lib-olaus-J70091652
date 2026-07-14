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

# Construct the project directory structure from the root directory.
# All the bin programs should be run from the top of the project directory.

PROJ_DIR="$(realpath .)"              # The name of the project directory.
PROJ_BIN="$PROJ_DIR/bin"              # The name of the project bin directory.
PROJ_LIB="$PROJ_DIR/lib"              # The name of the project lib directory.
PROJ_OLS="$PROJ_LIB/olslib"           # The name of the project olslib directory.
PROJ_ADM="$PROJ_DIR/adm"              # The name of the project adm directory.
PROJ_XT="$PROJ_DIR/xt"                # The name of the project development test directory.
PROJ_T="$PROJ_DIR/t"                  # The name of the project standard test directory.

source "$PROJ_OLS"                    # Include the local copy of the Olaus Bash Shell Library.

OLS_VERBOSE=0


# Validate arguments
# Do the arguments exist?
if [[ -z "$1" ]]; then                # filename Argument Required
    ols_err $OLSID 7001 $EX_USAGE "build-append: Argument #1 is missing, filename"
    exit
else
    declare FILENAME="$1"
fi

if [[ -z "$2" ]]; then                # LIB_NAME Argument Required
    ols_err $OLSID 7002 $EX_USAGE "build-append: Argument #2 is missing, lib_name"
    exit
else
    declare LIB_NAME="$2"
fi

# Does the member exist?
if [ ! -f "$FILENAME" ]; then         # FILENAME must exist 
    ols_err $OLSID 7072 $EX_MISSINGFILE "build-append: '$FILENAME' is does not exist"
    exit
fi

if [[ ! -r "$FILENAME" ]]; then
    ols_err $OLSID 7072 $EX_NOINPUT  "build-append: '$FILENAME' is not readable"
    exit
fi

if [ ! -f "$LIB_NAME" ]; then         # LIB_NAME must exist 
    ols_err $OLSID 7073 $EX_MISSINGFILE  "build-append: '$LIB_NAME' is does not exist"
    exit
fi

if [[ ! -w "$LIB_NAME" ]]; then       # We need write permission for LIB_NAME
    ols_err $OLSID 7074 $EX_CANTCREAT "build-append: '$LIB_NAME' is not writeable"
    exit
fi

member=$(basename "$FILENAME")

# Get the permissions for this FILENAME
perm=$( stat --printf="%a" "$FILENAME" )

# Get the access time for this FILENAME
atime=$( stat --printf="%x" "$FILENAME" )
atime=${atime/ /T}                    # Insert a "T" in the timestamp.
atime=${atime:0:19}                   # Strip off the nanoseconds.

# Get the modification time for this FILENAME
mtime=$( stat --printf="%y" "$FILENAME" )
mtime=${mtime/ /T}                    # Insert a "T" in the timestamp.
mtime=${mtime:0:19}                   # Strip off the nanoseconds.

# Get the status chenge time for this FILENAME
ctime=$( stat --printf="%z" "$FILENAME" )
ctime=${ctime/ /T}                    # Insert a "T" in the timestamp.
ctime=${ctime:0:19}                   # Strip off the nanoseconds.

# How big is the FILENAME
# wc returns #lines #bytes FILENAME
bct=$(cat "$FILENAME" | wc --bytes)     # Capture the byte count of the FILENAME

# Write shell library member header
builtin printf "%s\n" "#-h- BEGIN $member $bct $perm $atime $mtime $ctime" >> "$LIB_NAME"
member=$(basename "$FILENAME")
/usr/bin/cat   "$FILENAME"                                                 >> "$LIB_NAME"
builtin printf "%s\n" "#-h- END   $member"                                 >> "$LIB_NAME"

ols_end
