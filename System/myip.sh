#!/bin/bash

clear

localip=$( ifconfig | grep "inet " | grep -v "127.0.0.1" | sed -e 's/inet //g' | awk '{printf $1}' )

externalip=$( wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//' )

echo "Local Ip :       $localip "
echo "External Ip :    $externalip "

exit 0


