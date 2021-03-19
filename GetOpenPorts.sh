#!/bin/bash

# Parse a greppable nmap file and format as CSV

scandate=$(head -n1 $1 | awk '{print $8 "-" $7 "-" $10}')

awk -F'[/ ]' -v date=$scandate '{host=$2; for(i=1;i<=NF;i++){if ($i=="open"){print (host "," $(i+1) "," $(i-1) "," date)}}}' $1
