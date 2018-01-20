# demonstrating syntax
# pattern {action}
# if 3rd column greater than 0, mult the 2nd and 3rd

awk '$3 > 0 { print $1, $2 * $3 }' emp.data

echo '-------'
# print $1 when $3 is 0
awk '$3 == 0 { print $1 }' emp.data

echo '-------'
# print whole row when $3 is 0
awk '$3 == 0' emp.data

echo '-------'
# print first column
awk '{ print $1 }' emp.data


# if you don't give awk a file, you can just type a row of data to test it
# e.g.
# awk '$1 == 0 { print $2}' 
# then type:
# 0 jeff
# it will print:
# jeff



