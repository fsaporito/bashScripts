#!/bin/bash

# Cleaning sources.list
sudo rm /etc/apt/sources.list 
sudo touch /etc/apt/sources.list
sudo chmod 775 /etc/apt/sources.list


# Repository Ubuntu Utopic (Base+Universe+Multiverse+Canonical+Backports)
echo "# Repository Ubuntu
deb http://it.archive.ubuntu.com/ubuntu/ utopic main restricted
deb-src http://it.archive.ubuntu.com/ubuntu/ utopic main restricted
deb http://it.archive.ubuntu.com/ubuntu/ utopic universe
deb-src http://it.archive.ubuntu.com/ubuntu/ utopic universe
deb http://it.archive.ubuntu.com/ubuntu/ utopic-updates universe
deb-src http://it.archive.ubuntu.com/ubuntu/ utopic-updates universe
deb http://it.archive.ubuntu.com/ubuntu/ utopic multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ utopic multiverse
deb http://it.archive.ubuntu.com/ubuntu/ utopic-updates multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ utopic-updates multiverse
deb http://archive.canonical.com/ubuntu utopic partner
deb-src http://archive.canonical.com/ubuntu utopic partner
deb http://it.archive.ubuntu.com/ubuntu/ utopic-backports main restricted universe multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ utopic-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu utopic-security main restricted
deb-src http://security.ubuntu.com/ubuntu utopic-security main restricted
deb http://security.ubuntu.com/ubuntu utopic-security universe
deb-src http://security.ubuntu.com/ubuntu utopic-security universe
deb http://security.ubuntu.com/ubuntu utopic-security multiverse
deb-src http://security.ubuntu.com/ubuntu utopic-security multiverse" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list


# Repository GetDeb
echo "# Repository GetDeb
deb http://archive.getdeb.net/ubuntu utopic-getdeb apps" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -


# Repository PlayDeb
echo "# Repository PlayDeb
deb http://archive.getdeb.net/ubuntu utopic-getdeb games" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -


# Repository Tualatrix (UbuntuTweak)
echo "# Repository Tualatrix (UbuntuTweak)
deb http://ppa.launchpad.net/tualatrix/next/ubuntu utopic main 
deb-src http://ppa.launchpad.net/tualatrix/next/ubuntu utopic main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com FE85409EEAB40ECCB65740816AF0E1940624A220


# Repository HandBrake
echo "# Repository HandBrake
deb http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu raring main 
deb-src http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu raring main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 816950D8


# Repository Tor
echo "# Repository Tor
deb http://deb.torproject.org/torproject.org saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 886DDD89


# Repository Remastersys
echo "# Repository Remastersys
deb http://www.geekconnection.org/remastersys/repository karmic/" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list


# Repository Firefox 4
echo "# Repository Firefox 4
deb http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu saucy main
deb-src http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 247510BE


# Repository Opera
echo "# Repository Opera
deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo wget -O - http://deb.opera.com/archive.key | sudo apt-key add -


# Midori
echo "# Midori
deb http://ppa.launchpad.net/midori/ppa/ubuntu saucy main 
deb-src http://ppa.launchpad.net/midori/ppa/ubuntu saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A69241F1


# Repository I-Next (System Hardware Info)
echo "# Repository I-Next (System Hardware Info)
deb http://ppa.launchpad.net/i-nex-development-team/stable/ubuntu utopic main 
deb-src http://ppa.launchpad.net/i-nex-development-team/stable/ubuntu utopic main" >> /etc/apt/sources.list 
echo ""  >> /etc/apt/sources.list
echo ""  >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F34CDDAD 


# Repository Conky-Companions
echo "# Repository Conky-Companions
deb http://ppa.launchpad.net/conky-companions/ppa/ubuntu quantal main 
deb-src http://ppa.launchpad.net/conky-companions/ppa/ubuntu quantal main" >> /etc/apt/sources.list 
echo ""  >> /etc/apt/sources.list
echo ""  >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9BF2D8AB 


# Repository Cairo-Dock
echo "# Repository Cairo-Dock
deb http://ppa.launchpad.net/cairo-dock-team/ppa/ubuntu utopic main 
deb-src http://ppa.launchpad.net/cairo-dock-team/ppa/ubuntu utopic main" >> /etc/apt/sources.list 
echo ""  >> /etc/apt/sources.list
echo ""  >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E80D6BF5
# sudo apt-get install -y --force-yes cairo-dock cairo-dock-plug-ins


# Repository AWN
echo "# Repository AWN
deb http://ppa.launchpad.net/awn-testing/ppa/ubuntu saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BF810CD5


# Repository Virtualbox
echo "# Repository Virtualbox
deb http://download.virtualbox.org/virtualbox/debian trusty non-free" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -


# Repository Akirad (Cinelerra)
echo "# Repository Akirad (Cinelerra)
deb http://ppa.launchpad.net/akirad/akirad/ubuntu lucid main 
deb-src http://ppa.launchpad.net/akirad/akirad/ubuntu lucid main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q http://repository.akirad.net/dists/akirad.key -O- | sudo apt-key add -


# Update
sudo apt-get update
sudo apt-get clean
sudo apt-get autoclean
