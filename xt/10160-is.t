#! /usr/bin/env bash

source lib/newlib

i=0
j=0
k=1
l=1
m=-1
n=-1
o=-2
p=2

a="tuv"
b="tuv"
c="wxy"
d="abc def"
e="abc def"
f='ghi jkl'

test_plan 12

expected="ok 1 - equal-zero: Test 0 == 0"
got=$( xt/sh/is.sh $i $j equal-zero "Test 0 == 0" )
is "$got" "$expected" equal-zero "Test 0 == 0"

expected="ok 1 - equal-one: Test 1 == 1"
got=$( xt/sh/is.sh $k $l equal-one "Test 1 == 1" )
is "$got" "$expected" equal-one "Test 1 == 1"

expected="ok 1 - equal-mone: Test -1 == -1"
got=$( xt/sh/is.sh $m $n equal-mone "Test -1 == -1" )
is "$got" "$expected" equal-mone "Test -1 == -1"

expected="not ok 1 - equal-zero-one: Test 0 == 1"
got=$( xt/sh/is.sh $i $k equal-zero-one "Test 0 == 1" )
is "$got" "$expected" equal-zero-one  "Test 0 == 1"

expected="not ok 1 - equal-zero-mone: Test 0 == -1"
got=$( xt/sh/is.sh $i $k equal-zero-mone "Test 0 == -1" )
is "$got" "$expected" equal-zero-mone  "Test 0 == -1"

expected="not ok 1 - equal-one-mone: Test 1 == -1"
got=$( xt/sh/is.sh $i $k equal-one-mone "Test 1 == -1" )
is "$got" "$expected" equal-one-mone  "Test 1 == -1"

expected="not ok 1 - equal-one-two: Test 2 == 2"
got=$( xt/sh/is.sh $i $k equal-one-two "Test 2 == 2" )
is "$got" "$expected" equal-one-two  "Test 2 == 2"

expected="not ok 1 - equal-two-two: Test 2 == -2"
got=$( xt/sh/is.sh $i $k equal-two-two "Test 2 == -2" )
is "$got" "$expected" equal-two-two  "Test 2 == -2"

expected="ok 1 - equal-tuv-tuv: Test tuv == tuv"
got=$( xt/sh/is.sh "$a" "$b" equal-tuv-tuv "Test tuv == tuv" )
is "$got" "$expected" equal-tuv-tuv  "Test tuv == tuv"

expected="not ok 1 - equal-tuv-wxy: Test tuv == wxy"
got=$( xt/sh/is.sh "$a" "$c" equal-tuv-wxy "Test tuv == wxy" )
is "$got" "$expected" equal-tuv-wxy  "Test tuv == wxy"

expected="ok 1 - equal-def-def: Test def == def w/blanks"
got=$( xt/sh/is.sh "$d" "$e" equal-def-def "Test def == def w/blanks" )
is "$got" "$expected" equal-def-def  "Test def == def w/blanks"

expected="not ok 1 - equal-def-ghi: Test def == ghi w/blanks"
got=$( xt/sh/is.sh "$d" "$f" equal-def-ghi "Test def == ghi w/blanks" )
is "$got" "$expected" equal-def-ghi "Test def == ghi w/blanks"
