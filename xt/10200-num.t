#!/usr/bin/env bash

# Test is_real, is_ureal, is_int is_uint

source lib/olslib

declare -i       pint=+7
declare -i       nint=-7
declare -i       uint=7
declare          preal=+7.5
declare          nreal=-7.5
declare          ureal=7.5

export PGMID=OLS

test_plan 8


# is_uint
if is_uint $uint; then
    ols_tap_print $TRUE  "UNIT" "Does is_unit recognize a unsigned real number."
else
    ols_tap_print $FALSE "UNIT" "Does is_unit recognize a unsigned real number."
fi

if ! is_uint pint; then
    ols_tap_print $TRUE  "SUINT" "Does is_unit reject a signed integer number."
else
    ols_tap_print $FALSE "SUINT" "Does is_unit reject a signed integer number."
fi

if ! is_uint ureal; then
    ols_tap_print $TRUE  "UNITR" "Does is_unit reject a unsigned real number."
else
    ols_tap_print $FALSE "UNITR" "Does is_unit reject a unsigned real number."
fi

# is_int
if is_int $pint; then
    ols_tap_print $TRUE  "PNIT" "Does is_nit recognize a positive signed integer."
else
    ols_tap_print $FALSE "PNIT" "Does is_nit recognize a positive signed integer."
fi

if is_int $nint; then
    ols_tap_print $TRUE  "NINT" "Does is_unit recognize a unsigned real number."
else
    ols_tap_print $FALSE "NINT" "Does is_unit recognize a unsigned real number."
fi
if ! is_int ureal; then
    ols_tap_print $TRUE  "IREAL" "Does is_nit reject a unsigned real number."
else
    ols_tap_print $FALSE "IREAL" "Does is_nit reject a unsigned real number."
fi

# is_ureal
if is_ureal $ureal; then
    ols_tap_print $TRUE  "UREAL" "Does is_ureal recognize a unsigned real number."
else
    ols_tap_print $FALSE "UREAL" "Does is_ureal recognize a unsigned real number."
fi

if ! is_real preal; then
    ols_tap_print $TRUE  "SREAL" "Does is_real reject a signed real number."
else
    ols_tap_print $FALSE "SREAL" "Does is_nit reject a unsigned real number."
fi

ols_wt_excode $EX_OK
