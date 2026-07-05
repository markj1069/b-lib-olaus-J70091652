#! /usr/bin/env bash

source lib/olslib

# Create temporary CSV file
cat >$OLS_TMP_DIR/test.csv <</*
one,two,three
four,five,six
seven,eight,nine
/*

# Create temporary text file
cat >$OLS_TMP_DIR/test.txt <</*
one
two
three
four
/*

test_plan 5

xt/sh/is_csv.sh $OLS_TMP_DIR/test.csv
EX=$?
is $EX   $EX_OK "Works" "Does is_csv pass a normal test?"

xt/sh/is_csv.sh
EX=$?
is $EX   $EX_USAGE "Missing" "Does is_csv set EX_USAGE for a missing argument?"

xt/sh/is_csv.sh $OLS_TMP_DIR/test.txt
EX=$?
is $EX    $EX_USAGE "NonCSV" "Does is_csv catch the non-CSV extention?"

xt/sh/is_csv.sh $OLS_TMP_DIR/test.missing
EX=$?
is $EX    $EX_MISSINGFILE "Missing" "Does is_csv catch a non-existant file?"

xt/sh/is_csv.sh $OLS_TMP_DIR
EX=$?
is $EX    $EX_MISSINGFILE "Directory" "Does is_csv catch a non-normal file?"

ols_wt_excode $EX_OK
