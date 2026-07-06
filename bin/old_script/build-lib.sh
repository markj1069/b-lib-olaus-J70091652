#! /usr/bin/env bash

# Synopsis: build-lib ols_source_lib ols_target_lib

printf "%s\n" "OLS0000I Begin ${0}"

source lib/olslib

OLS_TARGET_LIB=lib/newlib

ols_begin

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

OLS_FILELIST="lib/LIB_FILELIST.txt"
library_file=olslib
library="$OLS_TARGET_LIB"
source_lib="lib"
library_title="Olaus Bash Shell Library"



declare    -r -x LIB_TMP="$OLS_TMP_DIR/initial_library.txt"
declare    -r -x LIB_LS="$OLS_TMP_DIR/ls_sh.txt"
declare    -r -x LIB_WO="$OLS_TMP_DIR/wo_def.txt"
declare    -r -x LIB_SORT="$OLS_TMP_DIR/sorted.txt"
declare    -r -x LIB_FINAL="$OLS_TMP_DIR/final.txt"

echo
pwd
echo

# Build the library header

printf "\n%s\n" "Build the $library_title."

printf "%s\n" "#-------------------------------------------------------------------------------" >$OLS_TARGET_LIB

printf "%s\n" "# Library:  $library_title" >>$OLS_TARGET_LIB

printf "%s\n" "# Filename: $library_file" >>$OLS_TARGET_LIB

printf "%s\n" "# Released: $(cat adm/RELEASE_DATE.txt)" >>$OLS_TARGET_LIB

printf "%s\n" "# Version:  $(cat adm/VERSION.txt)" >>$OLS_TARGET_LIB
printf "%s\n" "#-------------------------------------------------------------------------------" >>$OLS_TARGET_LIB
printf " \n" >>$OLS_TARGET_LIB                                                                                     
printf " \n" >>$OLS_TARGET_LIB

# Calculate the members of the library.
ols_end
# Don't want the path included in the filenames from ls.
pushd $OLS_SOURCE_LIB >/dev/null  # Change to the OLS_SOURCE_LIB directory

# Read and process every entry in LIB_FINAL
IFS=''                                # No special processing for this file.
while IFS= read -r line; do
    cat "$OLS_SOURCE_LIB/$line" >>$OLS_TARGET_LIB
done < "$OLS_FILELIST"

popd >/dev/null                       # Return to the calling directory.       

printf "%s\n" "OLS0000I END"

exit