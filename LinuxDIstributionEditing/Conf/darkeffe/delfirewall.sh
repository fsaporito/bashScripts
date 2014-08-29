#!/bin/bash

# File di configurazione IPtables

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
