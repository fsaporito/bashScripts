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

iptables -A INPUT -p tcp --dport 80 -j ACCEPT # HTTP
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT # HTTPS

#===================MAIL===================#

iptables -A INPUT -p tcp --dport 25 -j ACCEPT # SMTP
iptables -A INPUT -p tcp --dport 110 -j ACCEPT # POP3
iptables -A INPUT -p tcp --dport 465 -j ACCEPT # SMTP SSL
iptables -A INPUT -p tcp --dport 993 -j ACCEPT # IMAP4 SSL
iptables -A INPUT -p tcp --dport 995 -j ACCEPT # POP3 SSL

#===================STMP===================#

iptables -A INPUT -p udp -m udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 138 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 139 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 445 -j ACCEPT

#===================FTP===================#

iptables -A INPUT -p tcp --dport 21 -j ACCEPT # FTP
iptables -A INPUT -p tcp --dport 990 -j ACCEPT # FTPS

#===================SSH===================#

iptables -N SSHBRUTEDEF
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SSHBRUTEDEF
iptables -A SSHBRUTEDEF -m recent --set --name SSH
iptables -A SSHBRUTEDEFN -m recent --update --seconds 60 --hitcount 5 --name SSH -j LOG --log-level info --log-prefix SSH BRUTE ATTACK blocked: 
iptables -A SSHBRUTEDEF -m recent --update --seconds 60 --hitcount 5 --name SSH -j DROP

#===================VNC===================#

iptables -A INPUT -p tcp -m tcp --dport 1080 -j ACCEPT

#===================CUPS===================#

iptables -A INPUT -p udp --dport 631 -j ACCEPT # CUPS


# Sistes to check the firewall
# http://www.pcflank.com/
# https://www.grc.com/x/ne.dll?bh0bkyd2


