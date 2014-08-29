#!/bin/bash

rm /etc/apt/sources.list 
touch /etc/apt/sources.list
chmod 775 /etc/apt/sources.list

# Debian Unstable (Sid)
deb http://ftp.it.debian.org/debian/ sid main non-free contrib
deb-src http://ftp.it.debian.org/debian/ sid main non-free contrib
# Marillat Sid (unstable) Architetture: alpha, amd64, armel, hppa, i386, ia64, mipsel, powerpc, sparc
deb http://www.debian-multimedia.org sid main non-free
deb-src http://www.debian-multimedia.org sid main
sudo apt-get install -y --force-yes debian-multimedia-keyring
# Maxer Multimedia
deb http://repos.knio.it/ sid main contrib non-free 
deb-src http://repos.knio.it/ sid main contrib non-free 
# HWraid 
deb http://hwraid.le-vert.net/debian sid main
deb-src http://hwraid.le-vert.net/debian sid main
# Unofficial Debian Repository 
deb http://unofficial.debian-maintainers.org/ sid main contrib non-free restricted
deb-src http://unofficial.debian-maintainers.org/ sid main contrib non-free restricted
# Frostwire
deb http://apt.debianchile.org/frostwire wheezy main
deb-src http://apt.debianchile.org/frostwire wheezy main
gpg --keyserver hkp://subkeys.pgp.net --recv-keys EFD17969
# Cairo Comprmg
deb http://download.tuxfamily.org/ccm/debian/ sid main
# Skype
deb http://download.skype.com/linux/repos/debian/ unstable non-free
# Opera Browser
deb http://deb.opera.com/opera/ sid non-free 
wget -O - http://deb.opera.com/archive.key | apt-key add -
#Java 6 JRE/SDK (From Official Debian Repository)
deb http://ftp.bononia.it/debian unstable main contrib non-free  
# Enlightment E17 Official Repository
deb http://edevelop.org/debian/ unstable main 
# Cairo Comprmg
deb http://download.tuxfamily.org/ccm/debian/ sid main
# TOR
deb http://mirror.noreply.org/pub/tor sid main
deb-src http://mirror.noreply.org/pub/tor sid main 
# VirtualBox
deb http://www.virtualbox.org/debian sid non-free 
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
# Google software repository
deb http://dl.google.com/linux/deb/ unstable non-free
# Wine HQ Repository
deb http://www.lamaresh.net/apt sid main
# aMule CVS Repository
deb http://www.vollstreckernet.de/debian/ unstable amule wx
