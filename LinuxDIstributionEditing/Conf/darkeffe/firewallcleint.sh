#!/bin/bash

# File di configurazione IPtables

#===================DELETE FIREWALL RULES===================#

iptables -F
iptables -F -t nat
iptables -F -t mangle
iptables -X
iptables -X -t nat
iptables -X -t mangle

#===================DROP INPUT===================#

iptables -P INPUT DROP

#===================DROP OUTPUT===================#

iptables -P OUTPUT ACCEPT

#==================ACCEPT INPUT e OUTPUT loopback===================#

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#===================DROP FORWARD===================#

iptables -P FORWARD DROP

#===================ACCEPT REQUESTED INPUT===================#

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#===================Http===================#

# Porta 80 webserver (http)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Porta 443 webserver secure (https)
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT

#===================LOCAL===================#

# Porte Samba 137 138 139 445
iptables -A INPUT -p udp -m udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 138 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 139 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 445 -j ACCEPT

#===================SHARING===================#

# Porte Amule 4662 4665 4672
iptables -A INPUT -p tcp --dport 4662 -j ACCEPT
iptables -A INPUT -p udp --dport 4665 -j ACCEPT
iptables -A INPUT -p udp --dport 4672 -j ACCEPT

# Porta Frostwire 14439
iptables -A INPUT -p tcp --dport 14439 -j ACCEPT

#===================Chat===================#

# Porte amsn 1863 6891 6892
iptables -A INPUT -p udp -m udp --dport 1863 -j ACCEPT
iptables -A INPUT -p tcp --dport 6891 -j ACCEPT
iptables -A INPUT -p tcp --dport 6892 -j ACCEPT

#===================Remote Connection===================#

# Porte Vinagre 5900
iptables -A INPUT -p tcp -m tcp --dport 5900 -j ACCEPT

#===================PROXY===================#

# Porta 8118 Tor
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 8118 -j ACCEPT

# Porta 9050 Socks
iptables -A INPUT -p tcp --dport 9050 -j ACCEPT


# http://www.pcflank.com/
