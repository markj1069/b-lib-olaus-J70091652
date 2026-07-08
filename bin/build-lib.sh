#! /usr/bin/env bash

# Synopsis: build-lib ols_source_lib ols_target_lib

# Construct the project directory structure from the root directory.
# All the bin programs should be run from the top of the project directory.

PROJ_DIR="$(realpath .)"              # The name of the project directory.
PROJ_BIN="$PROJ_DIR/bin"              # The name of the project bin directory.
PROJ_LIB="$PROJ_DIR/lib"              # The name of the project lib directory.
PROJ_OLS="$PROJ_LIB/olslib"           # The name of the project olslib directory.
PROJ_NEW="$PROJ_LIB/newlib"           # The name of the project newlib directory.
PROJ_ADM="$PROJ_DIR/adm"              # The name of the project adm directory.
PROJ_XT="$PROJ_DIR/xt"                # The name of the project development test directory.
PROJ_T="$PROJ_DIR/t"                  # The name of the project standard test directory.

source "$PROJ_OLS"                    # Include the local copy of the Olaus Bash Shell Library.

OLS_VERBOSE=$FAIL                     # Set verbose output to PASS for this script.

declare    -r -x PGMID="OLS"          # The program ID for this script.   

ols_err $OLSID 0000 $EX_OK "BEGIN $(date +'%H:%M:%S')"




# Build the Olaus Bash Shell Library
#
# if [[ -z "$1" ]]; then
#    ols_err $OLSID 7001 $EX_USAGE "${FUNCNAME}: Augument #1 missing, library_source"
#else
#    OLS_SOURCE_LIB="$1"
#fi

#if [[ -z "$2" ]]; then
#    ols_err $OLSID 7002 $EX_USAGE "${FUNCNAME}: Augument #2 missing, library_target"
#else
#    OLS_TARGET_LIB="$2"
#fi

OLS_FILELIST="$PROJ_ADM/LIB_FILELIST.txt"


library_file="newlib"                 # The name of the interum library file that will be created in the target library directory.
source_lib="lib"                      # The source library is the directory that contains the library members.
target_lib="lib"                      # The temporary library is the directory where the compiled library will be placed.



declare    -r -x LIB_TMP="$OLS_TMP_DIR/initial_library.txt"
declare    -r -x LIB_LS="$OLS_TMP_DIR/ls_sh.txt"
declare    -r -x LIB_WO="$OLS_TMP_DIR/wo_def.txt"
declare    -r -x LIB_SORT="$OLS_TMP_DIR/sorted.txt"
declare    -r -x LIB_FINAL="$OLS_TMP_DIR/final.txt"


#---------------------------------------------------------------------------------------------------

# Build the library header

# printf "\n%s\n" "Build the $library_title."

printf "%s\n" "#---------------------------------------------------------------------------------------------------" >"$PROJ_NEW"

printf "%s\n" "# Library:  $(cat $PROJ_ADM/TITLE.txt)"            >>"$PROJ_NEW"
printf "%s\n" "# Filename: $(cat $PROJ_ADM/LIBRARY_FILENAME.txt)" >>"$PROJ_NEW"
printf "%s\n" "# Released: $(cat $PROJ_ADM/RELEASE_DATE.txt)"     >>"$PROJ_NEW"
printf "%s\n" "# Version:  $(cat $PROJ_ADM/VERSION.txt)"          >>"$PROJ_NEW"
printf "%s\n" "#---------------------------------------------------------------------------------------------------" >>"$PROJ_NEW"
printf " \n" >>"$PROJ_NEW"                                                                                     
printf " \n" >>"$PROJ_NEW"

# The members of the library are listed in adm/LIB_FILELIST.txt.
# Each member is a shell script that is written into the library.

# Read and process every entry in LIB_FINAL
IFS=''                                # No special processing for this file.
while IFS= read -r line; do
    $PROJ_BIN/build-append.sh "$PROJ_LIB/$line" "$PROJ_NEW" || ols_err $OLSID 7005 $EX_ERROR "${FUNCNAME}: Cannot append $line to $PROJ_NEW."
done < "$OLS_FILELIST"



ols_end
