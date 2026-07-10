#! /usr/bin/env bash

source lib/newlib

PID=OLS

OLS_DIR_TMP=$(mktemp -d)
OLS_TMP_FILE=$OLS_DIR_TMP/errors.txt


test_plan 9

a=1
b=2
z=0

c="One"
d="Two"
e=""

# Test Usage

xt/sh/assert.sh
RC=$?
is $RC $EX_USAGE "Missing-CONDITION" "Assert catches missing CONDITION." 

xt/sh/assert.sh "$z -eq $z"
RC=$?
is $RC $EX_USAGE "Missing-LINENO" "Assert catches missing LINENO." 

# Numeric test
xt/sh/assert.sh "$a -eq $a" "$LINENO"
RC=$?
is $RC $EX_OK "EX_OK" "Exit code should be EX_OK." 

xt/sh/assert.sh "$a -eq $b" "$LINENO"
RC=$?
is $RC $EX_ASSERTFAIL "Not Equal" "Exit code should be EX_ASSERTFAIL." 

# String Test

xt/sh/assert.sh "$c == $c" "$LINENO"
RC=$?
is $RC $EX_OK "String-Equal" "Exit code should be EX_OK." 

xt/sh/assert.sh "$c != $d" "$LINENO"
RC=$?
is $RC $EX_OK "String-Not-Equal" "Exit code should be EX_OK." 

xt/sh/assert.sh "$c != $c" "$LINENO"
RC=$?
is $RC $EX_ASSERTFAIL "String-Eq-Fail" "Exit code should be EX_ASSERTFAIL." 

xt/sh/assert.sh "-z $e" "$LINENO"
RC=$?
is $RC $EX_OK "Test-Empty-String" "Exit code should be EX_OK." 

xt/sh/assert.sh "-z $c" "$LINENO"
RC=$?
is $RC $EX_ASSERTFAIL "Empty-String" "Exit code should be EX_ASSERTFAIL." 
