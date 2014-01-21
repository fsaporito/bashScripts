#!/bin/bash

# File di configurazione IPtables

#===================ROOT===================#

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#===================DELETE FIREWALL RULES===================#

iptables -F
iptables -F -t nat
iptables -F -t mangle
iptables -X
iptables -X -t nat
iptables -X -t mangle

#===================INPUT ACCEPT===================#

iptables -P INPUT ACCEPT

#===================OUTPUT ACCEPT===================#

iptables -P OUTPUT ACCEPT

#===================FORWARD ACCEPT===================#

iptables -P FORWARD ACCEPT


