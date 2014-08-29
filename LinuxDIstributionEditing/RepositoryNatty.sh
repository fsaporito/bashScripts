#!/bin/bash

# Repository Ubuntu saucy (Base+Universe+Multiverse+Canonical+Backports)
sudo rm /etc/apt/sources.list 
sudo touch /etc/apt/sources.list
sudo chmod 775 /etc/apt/sources.list
deb http://it.archive.ubuntu.com/ubuntu/ saucy main restricted
deb-src http://it.archive.ubuntu.com/ubuntu/ saucy main restricted
deb http://it.archive.ubuntu.com/ubuntu/ saucy universe
deb-src http://it.archive.ubuntu.com/ubuntu/ saucy universe
deb http://it.archive.ubuntu.com/ubuntu/ saucy-updates universe
deb-src http://it.archive.ubuntu.com/ubuntu/ saucy-updates universe
deb http://it.archive.ubuntu.com/ubuntu/ saucy multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ saucy multiverse
deb http://it.archive.ubuntu.com/ubuntu/ saucy-updates multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ saucy-updates multiverse
deb http://archive.canonical.com/ubuntu saucy partner
deb-src http://archive.canonical.com/ubuntu saucy partner
deb http://it.archive.ubuntu.com/ubuntu/ saucy-backports main restricted universe multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ saucy-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu saucy-security main restricted
deb-src http://security.ubuntu.com/ubuntu saucy-security main restricted
deb http://security.ubuntu.com/ubuntu saucy-security universe
deb-src http://security.ubuntu.com/ubuntu saucy-security universe
deb http://security.ubuntu.com/ubuntu saucy-security multiverse
deb-src http://security.ubuntu.com/ubuntu saucy-security multiverse
# Repository Lubuntu
deb http://ppa.launchpad.net/lubuntu-desktop/ppa/ubuntu saucy main
deb-src http://ppa.launchpad.net/lubuntu-desktop/ppa/ubuntu saucy main
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CF57B0F4 
# Repository Mediubuntu
deb http://packages.medibuntu.org/ saucy free non-free
deb-src http://packages.medibuntu.org/ saucy free non-free
sudo wget -q http://packages.medibuntu.org/medibuntu-key.gpg -O- | sudo apt-key add -
# Repository Nvidia-Vdpau
deb http://ppa.launchpad.net/nvidia-vdpau/ppa/ubuntu saucy main 
deb-src http://ppa.launchpad.net/nvidia-vdpau/ppa/ubuntu saucy main
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CEC06767
# Repository Tualatrix
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com FE85409EEAB40ECCB65740816AF0E1940624A220
deb http://ppa.launchpad.net/tualatrix/ubuntu saucy main
deb-src http://ppa.launchpad.net/tualatrix/ubuntu saucy main
# Repository Tor
deb http://deb.torproject.org/torproject.org lucid main
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 886DDD89
# Repository Remastersys
deb http://www.geekconnection.org/remastersys/repository karmic/
# Repository Chromium
deb http://ppa.launchpad.net/chromium-daily/ppa/ubuntu saucy main
deb-src http://ppa.launchpad.net/chromium-daily/ppa/ubuntu saucy main
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E5E17B5
# Repository Firefox 4
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 247510BE
deb http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu saucy main
deb-src http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu saucy main
# Repository Opera
deb http://deb.opera.com/opera/ stable non-free
sudo wget -O - http://deb.opera.com/archive.key | sudo apt-key add -
# Repository Icecat
sudo add-apt-repository ppa:gnuzilla-team/ppa
# Midori
deb http://ppa.launchpad.net/midori/ppa/ubuntu saucy main 
deb-src http://ppa.launchpad.net/midori/ppa/ubuntu saucy main
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A69241F1
# Conky Companions
sudo apt-add-repository ppa:conky-companions
# Repository GetDeb
deb http://archive.getdeb.net/ubuntu saucy-getdeb apps
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
# Repository PlayDeb
deb http://archive.getdeb.net/ubuntu saucy-getdeb games
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
# Repository Cairo-Dock
add-apt-repository ppa:cairo-dock-team/ppa  
apt-get install -y --force-yes cairo-dock cairo-dock-plug-ins
# Repository Unity
sudo add-apt-repository ppa:canonical-dx-team/une
# sudo apt-get install unity
# Repository AWN
deb http://ppa.launchpad.net/awn-testing/ppa/ubuntu saucy main
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BF810CD5
# Repository Virtualbox
deb http://download.virtualbox.org/virtualbox/debian maverick non-free
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
# Repository Roster Cogburn (Volumeicon)
deb http://ppa.launchpad.net/rstrcogburn/ppa/ubuntu lucid main 
deb-src http://ppa.launchpad.net/rstrcogburn/ppa/ubuntu lucid main 
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1A6FE5DF
# Repository X
deb http://ppa.launchpad.net/ubuntu-x-swat/x-updates/ubuntu saucy main
deb-src http://ppa.launchpad.net/ubuntu-x-swat/x-updates/ubuntu saucy main
gpg --recv-keys AF1CDFA9 && gpg --export AF1CDFA9 | sudo key add
# Repository Akirad
sudo wget http://repository.akirad.net/dists/lucid.list -O /etc/apt/sources.list.d/akirad.list
wget -q http://repository.akirad.net/dists/akirad.key -O- | sudo apt-key add -
# Repository Backtrack4
deb http://archive.offensive-security.com pwnsauce main microverse macroverse restricted universe multiverse
deb http://archive.offensive-security.com/repotest/ ./
deb http://sun.backtrack-linux.org pwnsauce main
sudo wget -q http://archive.offensive-security.com/backtrack.gpg -O- | sudo apt-key add -
sudo rm /etc/apt/apt.conf.d/20archive
sudo touch /etc/apt/apt.conf.d/20archive
sudo echo "
APT::Archives::MaxAge ""30"";
APT::Archives::MinAge ""2"";
APT::Archives::MaxSize ""500"";
APT::Cache-Limit 43554432;
" >> /etc/apt/apt.conf.d/20archive
