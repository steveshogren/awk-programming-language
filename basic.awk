# demonstrating syntax
# pattern {action}
# if 3rd column greater than 0, mult the 2nd and 3rd
awk '$3 > 0 { print $1, $2 * $3 }' emp.data
# print $1 when $3 is 0
awk '$3 == 0 { print $1 }' emp.data
