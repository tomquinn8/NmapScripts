#!/bin/bash
#Script to parse an .nmap file and find/replace IPs in another file with hostnames

#Show usage
if [ "$#" -lt 1 ] || [ "$#" -gt 3 ]
then
	echo "Usage: .ReplaceIPsWithHostsnames.sh nmap-results.nmap Footprint.csv"
	exit
fi

#Loop through any results in the .nmap file which contain brakcets, this indicates a hostname was used as input not an IP address,
#extract the IP with cut and do a find/replace using sed
for i in $(cat $1 | awk '/Nmap scan report for .*\(/{print $5":"$6}'); 
	do sed -i s/$(echo $i | cut -d: -f2 | tr -d "()")/$(echo $i | cut -d: -f1)/g $2; 
done
