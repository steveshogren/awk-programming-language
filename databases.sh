#!/bin/sh
set -v


: <<'COMMENT'

COMMENT

awk -f countriesqueries/prep1.awk countries | awk -f countriesqueries/form1.awk

set +v
