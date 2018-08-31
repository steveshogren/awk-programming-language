#!/bin/sh
set -v


: <<'COMMENT'

COMMENT

awk -f countriesqueries/prep1.awk countries | awk -f countriesqueries/form1.awk

awk -f countriesqueries/prep1.awk countries | awk -f countriesqueries/form2.awk

awk -f countriesqueries/prep3.awk pass=1 countries pass=2 countries | awk -f countriesqueries/form3.awk

awk -f countriesqueries/prep3.awk pass=1 countries pass=2 countries | awk -f countriesqueries/form4.awk | tbl -Tascii

awk -f table.awk countries

. countriesqueries/info.sh 'Can|USA'

set +v
