#!/bin/bash

rm -f netdiscover.txt
pkill netdiscover

( netdiscover -P -N -i eth0 >> netdiscover.txt ) &

sleep 150

cat netdiscover.txt | sort -u | awk '{print $1}'
