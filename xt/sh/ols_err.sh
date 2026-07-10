#!/usr/bin/env bash

source lib/newlib

PGMID=OLS

got="$1"
exp="$2"
tst="$3"

shift 3

msg="$@"
    
ols_err "$got" "$exp" "$tst" "$msg"
