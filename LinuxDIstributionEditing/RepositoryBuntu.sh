#!/bin/bash

LOG="$home/errorinstallation.log"

# Time Elapsed Functions
timelapsed () {

	k=1
	until [ -e $home/pio.txt ]; do
		sleep 1
		if [ $k -lt 10 ]; then
			echo -en  "[$k s]\b\b\b\b\b\c"
		elif [ $k -ge 10 ]; then
			echo -en  "[$k s]\b\b\b\b\b\b\c"
		elif [ $k -ge 100 ]; then
			echo -en  "[$k s]\b\b\b\b\b\b\b\c"
		elif [ $k -ge 1000 ]; then
			echo -en  "[$k s]\b\b\b\b\b\b\b\b\c"
		elif [ $k -ge 10000 ]; then
			echo -en  "[$k s]\b\b\b\b\b\b\b\b\b\c"
		else [ $k -ge 100000 ]
			echo -en  "[$k s]\b\b\b\b\b\b\b\b\b\b\c"
		fi
		k=$[ $k + 1 ]
	done
	# use:
	# echo -n "what i am doing "
	# timelapsed &
	# operation ...
	# time_stop

}

time_stop () {

	touch $home/pio.txt
	sleep 1
	rm -f $home/pio.txt
	echo ""

}


clear

echo -n "[*] Repositories "

echo ""

timelapsed &

echo ""

echo -n "    - Replacing Sources.list ... "
echo ""

# Cleaning sources.list
sudo rm /etc/apt/sources.list 
sudo touch /etc/apt/sources.list
sudo chmod 775 /etc/apt/sources.list


# Repository Ubuntu Utopic (Base+Universe+Multiverse+Canonical+Backports)
echo -n "      - Added Ubuntu Repositories (Utopic) ... "
echo "# Repository Ubuntu [Utopic]
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
echo ""


# Repository GetDeb
echo -n "      - Added GetDeb Repositories ... "
echo "# Repository GetDeb
deb http://archive.getdeb.net/ubuntu utopic-getdeb apps" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""



# Repository PlayDeb
echo -n "      - Added PlayDeb Repositories ... "
echo "# Repository PlayDeb
deb http://archive.getdeb.net/ubuntu utopic-getdeb games" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""


# Repository Tualatrix (UbuntuTweak)
echo -n "      - Added Tualatrix Repositories (Ubuntu Tweak) ... "
echo "# Repository Tualatrix (UbuntuTweak)
deb http://ppa.launchpad.net/tualatrix/next/ubuntu utopic main 
deb-src http://ppa.launchpad.net/tualatrix/next/ubuntu utopic main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com FE85409EEAB40ECCB65740816AF0E1940624A220 1> /dev/null 2> $LOG
echo ""


# Repository HandBrake
echo -n "      - Added HandBrake Repositories ... "
echo "# Repository HandBrake
deb http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu raring main 
deb-src http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu raring main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 816950D8 1> /dev/null 2> $LOG
echo ""


# Repository Tor
echo -n "      - Added Tor Repositories ... "
echo "# Repository Tor
deb http://deb.torproject.org/torproject.org saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 886DDD89 1> /dev/null 2> $LOG
echo ""


# Repository Remastersys
echo -n "      - Added RematerSys Repositories ... "
echo "# Repository Remastersys
deb http://www.geekconnection.org/remastersys/repository karmic/" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo ""


# Repository Firefox 4
echo -n "      - Added Firefox Repositories ... "
echo "# Repository Firefox 4
deb http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu saucy main
deb-src http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 247510BE 1> /dev/null 2> $LOG
echo ""


# Repository Opera
echo -n "      - Added Opera Repositories ... "
echo "# Repository Opera
deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://deb.opera.com/archive.key | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""


# Midori
echo -n "      - Added Midori Repositories ... "
echo "# Midori
deb http://ppa.launchpad.net/midori/ppa/ubuntu saucy main 
deb-src http://ppa.launchpad.net/midori/ppa/ubuntu saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A69241F1 1> /dev/null 2> $LOG
echo ""


# Repository I-Next (System Hardware Info)
echo -n "      - Added I-Next Repositories (System Hardware Info) ... "
echo "# Repository I-Next (System Hardware Info)
deb http://ppa.launchpad.net/i-nex-development-team/stable/ubuntu utopic main 
deb-src http://ppa.launchpad.net/i-nex-development-team/stable/ubuntu utopic main" >> /etc/apt/sources.list 
echo ""  >> /etc/apt/sources.list
echo ""  >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F34CDDAD 1> /dev/null 2> $LOG
echo ""


# Repository Conky-Companions
echo -n "      - Added Conky-Companions Repositories ... "
echo "# Repository Conky-Companions
deb http://ppa.launchpad.net/conky-companions/ppa/ubuntu quantal main 
deb-src http://ppa.launchpad.net/conky-companions/ppa/ubuntu quantal main" >> /etc/apt/sources.list 
echo ""  >> /etc/apt/sources.list
echo ""  >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9BF2D8AB 1> /dev/null 2> $LOG
echo ""


# Repository Cairo-Dock
echo -n "      - Added Cairo-Dock Repositories ... "
echo "# Repository Cairo-Dock
deb http://ppa.launchpad.net/cairo-dock-team/ppa/ubuntu utopic main 
deb-src http://ppa.launchpad.net/cairo-dock-team/ppa/ubuntu utopic main" >> /etc/apt/sources.list 
echo ""  >> /etc/apt/sources.list
echo ""  >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E80D6BF5 1> /dev/null 2> $LOG
echo ""
# sudo apt-get install -y --force-yes cairo-dock cairo-dock-plug-ins


# Repository AWN
echo -n "      - Added Awn Repositories ... "
echo "# Repository AWN
deb http://ppa.launchpad.net/awn-testing/ppa/ubuntu saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BF810CD5 1> /dev/null 2> $LOG
echo ""


# Repository Virtualbox
echo -n "      - Added VirtualBox Repositories ... "
echo "# Repository Virtualbox
deb http://download.virtualbox.org/virtualbox/debian trusty non-free" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""


# Repository Akirad (Cinelerra)
echo -n "      - Added Akirad Repositories (Cinelerra) ... "
echo "# Repository Akirad (Cinelerra)
deb http://ppa.launchpad.net/akirad/akirad/ubuntu lucid main 
deb-src http://ppa.launchpad.net/akirad/akirad/ubuntu lucid main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q http://repository.akirad.net/dists/akirad.key -O- | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""


# Update
echo ""
echo -n "    - Updating Repositories ... "
apt-get update 1> /dev/null 2> $LOG
echo ""

 # Upgrade
echo ""
echo -n "    - Upgrading ... "
apt-get upgrade -y --force-yes 1> /dev/null 2> $LOG
apt-get clean 1> /dev/null 2> $LOG
apt-get autoclean 1> /dev/null 2> $LOG
echo ""

# Dist Upgrade
echo ""
echo -n "    - Dist-Upgrading ... "
apt-get dist-upgrade -y --force-yes 1> /dev/null 2> $LOG
echo ""

# Autoremove + Clean
echo ""
echo -n "    - Autoremoving and Cleaning ... "
apt-get clean 1> /dev/null 2> $LOG
apt-get autoclean 1> /dev/null 2> $LOG
apt-get autoremove --purge -y --force-yes 1> /dev/null 2> $LOG
echo ""

time_stop

echo ""
