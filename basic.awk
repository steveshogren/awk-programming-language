#!/bin/sh
set -v

# demonstrating syntax
# pattern {action}
# if 3rd column greater than 0, mult the 2nd and 3rd

awk '$3 > 0 { print $1, $2 * $3 }' emp.data

echo '# print \$1 when \$3 is 0'
awk '$3 == 0 { print $1 }' emp.data

echo '# print whole row when \$3 is 0'
awk '$3 == 0' emp.data

echo '# print first column'
awk '{ print $1 }' emp.data


echo '#if you dont give awk a file, you can just type a row of data to test it'
echo '# e.g.'
echo "# awk '\$1 == 0 { print \$2}' "
echo '# then type:'
echo '# 0 jeff'
echo '# it will print:'
echo '# jeff'

echo '# \$0 is whole line so these are equivalent'
awk '{ print $0}' emp.data
awk '{ print }' emp.data

echo '# print first and third columns:'
awk '{ print  $1, $3 }' emp.data

echo ' #NF print the last field '
awk '{ print NF, $1, $NF }' emp.data


echo ' #NR print the current row '
awk '{ print NR, $0 }' emp.data

echo '# text is printed with commas'
awk '{ print "total pay for", $1, "is", $2 * $3 }' emp.data

echo '# printf (format, value 1 , value 2 , ••• , value,) '
echo '# when % is replaced with the nth argument'
echo '# and .2f is the format'
awk '{ printf("total pay for %s is $%.2f\n", $1, $2 * $3) }' emp.data

echo '# the width can also be set with -Xs and X.X'
awk '{ printf("%-8s $%6.2f\n", $1, $2 * $3) }' emp.data

echo '# to sort the data, put the column to sort by as the first column and specify to use human sortable'
echo '# this differs from the book, perhaps that was the old default'
awk '{ printf("%6.2f %s\n", $2 * $3, $0) }' emp.data | sort -h

echo '# select those with a calculation'
awk '$2 * $3 > 50 { printf("$%.2f for %s\n", $2 * $3, $1) }' emp.data

echo '# select for regex anywhere'
awk '/Susie/ { print }' emp.data

echo '# or selection'
awk '$2 >= 4 || $3 >= 20 { print }' emp.data

echo '# separate criteria selection, will print lines twice'
awk '$2 >= 4
     $3 >= 20 { print }' emp.data

echo '# logical not'
awk '!( $2 < 4 && $3 < 20)' emp.data


echo '# basic data validation, print lines that match'
awk 'NF != 3 { print $0, "number of fields is not equal to 3" }
     $2 < 3.35 { print SO, "rate is below minimum wage" }
     $2 > 10 { print $0, "rate exceeds $10 per hour" }
     $3 < 0 { print $0, "negative hours worked" }
     $3 > 60 { print $0, "too many hours worked" }' emp.data

set OFS="\t"
echo '# header and footer selectors, also setting an output format separator'
awk 'BEGIN { OFS="\t"; print "NAME","RATE","HOURS"; print "" }
           { print $1,$2,$3} ' emp.data


echo '# count emps with more than x hours'
awk '$3 > 15 { emp = emp + 1 }
     END { print emp, "employees worked more than 15 hours" }' emp.data

echo '# count total lines'
awk 'END { print NR, "employees" }' emp.data

echo '# basic variables'
awk ' { pay = pay + $2 * $3 } 
    END { print NR, "employees"
    print "total pay is", pay
    print "average pay is", pay/NR }' emp.data

echo '#  variables with strings, also first call on a variable is falsey?'
awk '$2 > maxrate { maxrate = $2; maxemp = $1 }
    END { print "highest hourly rate:", maxrate, "for", maxemp } ' emp.data

echo '# string concats into a variable'
awk '{ names = names $1 " " } 
     END { print names } ' emp.data

echo '# print last input line by overwriting the variable'
awk '{ last = $0 }
    END { print last }' emp.data

echo '# length function'
awk '{ print $1, length($1) }' emp.data

echo '# count words and characters'
awk '{ nc = nc + length($0) + 1
    nw = nw + NF
    END print NR, "lines," , nw, "words,", nc, "Characters" } ' emp.data

