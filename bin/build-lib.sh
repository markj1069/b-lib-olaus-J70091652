#! /usr/bin/env bash

# Synopsis: build-lib ols_source_lib ols_target_lib

printf "%s\n" "OLS0000I Begin ${0}"

source lib/olslib

OLS_TARGET_LIB=newlib

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

OLS_FILELIST="../adm/LIB_FILELIST.txt"
library_file=newlib
library="$OLS_TARGET_LIB"
source_lib="lib"
library_title="Olaus Bash Shell Library"



declare    -r -x LIB_TMP="$OLS_TMP_DIR/initial_library.txt"
declare    -r -x LIB_LS="$OLS_TMP_DIR/ls_sh.txt"
declare    -r -x LIB_WO="$OLS_TMP_DIR/wo_def.txt"
declare    -r -x LIB_SORT="$OLS_TMP_DIR/sorted.txt"
declare    -r -x LIB_FINAL="$OLS_TMP_DIR/final.txt"

pushd "$source_lib" >/dev/null 2>&1 || ols_err $OLSID 7003 $EX_ERROR "${FUNCNAME}: Cannot change directory to $source_lib."

#---------------------------------------------------------------------------------------------------

# Build the library header

printf "\n%s\n" "Build the $library_title."

printf "%s\n" "#---------------------------------------------------------------------------------------------------" >$OLS_TARGET_LIB

printf "%s\n" "# Library:  $library_title" >>$OLS_TARGET_LIB

printf "%s\n" "# Filename: $library_file" >>$OLS_TARGET_LIB

printf "%s\n" "# Released: $(cat ../adm/RELEASE_DATE.txt)" >>$OLS_TARGET_LIB

printf "%s\n" "# Version:  $(cat ../adm/VERSION.txt)" >>$OLS_TARGET_LIB
printf "%s\n" "#---------------------------------------------------------------------------------------------------" >>$OLS_TARGET_LIB
printf " \n" >>$OLS_TARGET_LIB                                                                                     
printf " \n" >>$OLS_TARGET_LIB

# The members of the library are listed in adm/LIB_FILELIST.txt.
# Each member is a shell script that is written into the library.

# Read and process every entry in LIB_FINAL
IFS=''                                # No special processing for this file.
while IFS= read -r line; do
    ../bin/build-append.sh "$line" "$library" || ols_err $OLSID 7005 $EX_ERROR "${FUNCNAME}: Cannot append $line to $library."
done < "$OLS_FILELIST"

popd || ols_err $OLSID 7004 $EX_ERROR "${FUNCNAME}: Cannot return to previous directory."

printf "%s\n" "OLS0000I END"

ols_end
