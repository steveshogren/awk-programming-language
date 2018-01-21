# demonstrating syntax
# pattern {action}
# if 3rd column greater than 0, mult the 2nd and 3rd

awk '$3 > 0 { print $1, $2 * $3 }' emp.data

echo '-------'
# print $1 when $3 is 0
awk '$3 == 0 { print $1 }' emp.data

echo '# print whole row when $3 is 0'
awk '$3 == 0' emp.data

echo '# print first column'
awk '{ print $1 }' emp.data


echo '#if you dont give awk a file, you can just type a row of data to test it'
echo '# e.g.'
echo "# awk '$1 == 0 { print $2}' "
echo '# then type:'
echo '# 0 jeff'
echo '# it will print:'
echo '# jeff'

echo '# $0 is whole line so these are equivalent'
awk '{ print $0}' emp.data
awk '{ print }' emp.data

echo '# print first and third columns:'
awk '{ print  $1, $3 }' emp.data
