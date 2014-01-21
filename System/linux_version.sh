#!/bin/bash

clear

a=$( cat /etc/issue | awk '{print $1}' | tr '[:upper:]' '[:lower:]' | sed -r 's/\b(.)/\U\1/g' )

b=$( cat /etc/issue | awk '{print $2}' )

echo "You Have Installed $a Linux $b"


