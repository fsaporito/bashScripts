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



# Java
f_java () {

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
apt-get install -y --force-yes sun-java7-jre 2> $LOG
apt-get install -y --force-yes sun-java7-jdk 2> $LOG

}



# Repository
f_repo () {

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


# Repository Ubuntu Wily (Base+Universe+Multiverse+Canonical+Backports)
echo -n "      - Added Ubuntu Repositories (Wily) ... "
echo "# Repository Ubuntu [Wily]
deb http://it.archive.ubuntu.com/ubuntu/ xenial main restricted
deb-src http://it.archive.ubuntu.com/ubuntu/ xenial main restricted
deb http://it.archive.ubuntu.com/ubuntu/ xenial universe
deb-src http://it.archive.ubuntu.com/ubuntu/ xenial universe
deb http://it.archive.ubuntu.com/ubuntu/ xenial-updates universe main restricted
deb-src http://it.archive.ubuntu.com/ubuntu/ xenial-updates universe
deb http://it.archive.ubuntu.com/ubuntu/ xenial multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ xenial multiverse
deb http://it.archive.ubuntu.com/ubuntu/ xenial-updates multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ xenial-updates multiverse
deb http://archive.canonical.com/ubuntu xenial partner
deb-src http://archive.canonical.com/ubuntu xenial partner
deb http://it.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu xenial-security main restricted
deb-src http://security.ubuntu.com/ubuntu xenial-security main restricted
deb http://security.ubuntu.com/ubuntu xenial-security universe
deb-src http://security.ubuntu.com/ubuntu xenial-security universe
deb http://security.ubuntu.com/ubuntu xenial-security multiverse
deb-src http://security.ubuntu.com/ubuntu xenial-security multiverse" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo ""


# Repository GetDeb
echo -n "      - Added GetDeb Repositories ... "
echo "# Repository GetDeb
deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""



# Repository PlayDeb
echo -n "      - Added PlayDeb Repositories ... "
echo "# Repository PlayDeb
deb http://archive.getdeb.net/ubuntu xenial-getdeb games" >> /etc/apt/sources.list
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
deb http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu xenial main
deb-src http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu xenial main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 816950D8 1> /dev/null 2> $LOG
echo ""


# Repository Tor
echo -n "      - Added Tor Repositories ... "
echo "# Repository Tor
deb http://deb.torproject.org/torproject.org xenial main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 886DDD89 1> /dev/null 2> $LOG
echo ""


# Repository Firefox
echo -n "      - Added Firefox Repositories ... "
echo "# Repository Firefox
deb http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu xenial main
deb-src http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu xenial main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 247510BE 1> /dev/null 2> $LOG
echo ""


# Repository Opera
# echo -n "      - Added Opera Repositories ... "
# echo "# Repository Opera
# deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list
# echo "" >> /etc/apt/sources.list
# echo "" >> /etc/apt/sources.list
# wget -q -O- http://deb.opera.com/archive.key | sudo apt-key add - 1> /dev/null 2> $LOG
# echo ""


# Midori
# echo -n "      - Added Midori Repositories ... "
# echo "# Midori
# deb http://ppa.launchpad.net/midori/ppa/ubuntu saucy main
# deb-src http://ppa.launchpad.net/midori/ppa/ubuntu saucy main" >> /etc/apt/sources.list
# echo "" >> /etc/apt/sources.list
# echo "" >> /etc/apt/sources.list
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A69241F1 1> /dev/null 2> $LOG
# echo ""


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
deb http://ppa.launchpad.net/cairo-dock-team/ppa/ubuntu vivid main
deb-src http://ppa.launchpad.net/cairo-dock-team/ppa/ubuntu vivid main" >> /etc/apt/sources.list
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


# Repository Ninja IDE
echo -n "      - Added Ninja IDe Repositories ... "
echo "# Repository Ninja IDe
deb http://ppa.launchpad.net/ninja-ide-developers/ninja-ide-stable/ubuntu saucy main
deb-src http://ppa.launchpad.net/ninja-ide-developers/ninja-ide-stable/ubuntu saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E6ADFBE0 1> /dev/null 2> $LOG
echo ""


# Repository Virtualbox
echo -n "      - Added VirtualBox Repositories ... "
echo "# Repository Virtualbox
deb http://download.virtualbox.org/virtualbox/debian xenial non-free" >> /etc/apt/sources.list
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



# Axel Download Manager
f_axel () {

echo -n "[*] Installing Axel Download Manager ... "

timelapsed &

apt-get install -y --force-yes axel 1> /dev/null 2> $LOG

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



# Software&librerie Programmazione (build-essentials | pkg-config | ncurses | git | subversion | mercurial | libssl-dev | cmake | gtk)
f_programming_libraries () {

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



# Programming IDE (eclipse | geany | emacs| glade)
f_programming_IDE () {

echo "[*] Programming IDE"

# Eclipse  -> C | C++ | Java
f_eclipse () {

	echo -n "    - Installing Eclipse ... "

	timelapsed &

	apt-get install -y --force-yes build-essential 1> /dev/null 2> $LOG # Gcc + Make
	apt-get install -y --force-yes g++ 1> /dev/null 2> $LOG # Compilatore C++

	apt-get install -y --force-yes eclipse 1> /dev/null 2> $LOG # Java
	apt-get install -y --force-yes eclipse-cdt 1> /dev/null 2> $LOG # C/C++
	apt-get install -y --force-yes eclipse-egit 1> /dev/null 2> $LOG # Git Plugin
	apt-get install -y --force-yes eclipse-subeclipse 1> /dev/null 2> $LOG # Subversion Plugin
	apt-get install -y --force-yes eclipse-xsd 1> /dev/null 2> $LOG # XML

	time_stop ()

}

f_eclipse


# GDB (Gnu Debugger)
f_gdb () {

	echo -n "    - Installing GDB (Gnu Debugger) ... "

	timelapsed &

	apt-get install -y --force-yes gdb 1> /dev/null 2> $LOG

	time_stop

}

f_gdb


# Geany
f_geany () {

	echo -n "    - Installing Geany ... "

	timelapsed &

	apt-get install -y --force-yes geany 1> /dev/null 2> $LOG # Geany IDE
	apt-get install -y --force-yes geany-plugins 1> /dev/null 2> $LOG # Geany Plugins
	apt-get install -y --force-yes geany-plugin-scope 1> /dev/null 2> $LOG # GDB Graphical Frontend

	time_stop


}

f_geany


# Emacs  -> Lisp / Prolog
f_emacs () {

	echo -n "    - Installing Emacs ... "

	timelapsed &

	apt-get install -y --force-yes emacs 1> /dev/null 2> $LOG
	apt-get install -y --force-yes elib 1> /dev/null 2> $LOG
	apt-get install -y --force-yes emacs-godies-el 1> /dev/null 2> #Godies
	apt-get install -y --force-yes emacs-window-layout 1> /dev/null 2> $LOG


	time_stop


}


f_emacs


# PKG Config
f_pkg_config () {

	echo -n "    - Installing Pkg-Config ... "

	timelapsed &

	apt-get install -y --force-yes pkg-config 1> /dev/null 2> $LOG

	time_stop

}

f_pkg_config



# Lib GTK Dev
f_lib_gtk_dev () {

	echo -n "    - Installing LibGtk ... "

	timelapsed &

	apt-get install -y --force-yes libgtk2.0-dev 1> /dev/null 2> $LOG

	time_stop

}

f_lib_gtk_dev



# Glade
f_glade () {

	echo -n "    - Installing Glade ... "

	timelapsed &

	apt-get install -y --force-yes glade 1> /dev/null 2> $LOG
	apt-get install -y --force-yes python-gtk2 python-glade2 1> /dev/null 2> $LOG

	time_stop ()

}

f_glade



}



# Programming Languages (lisp | perl | prolog | python | ruby)
f_programming_languages () {

echo "[*] Programming Languages"

# Common Lisp
f_lisp () {

	echo -n "    - Installing Lisp () ... "

	timelapsed &

	echo -n "    	=> SBCL, Major Lisp Interpreter ... "
	apt-get install -y --force-yes sbcl 1> /dev/null 2> $LOG

	echo -n "    	=> ECL, C Integration ... "
	apt-get install -y --force-yes ecl 1> /dev/null 2> $LOG

	echo -n "    	=> ABCL, Java Integration ... "
	apt-get install -y --force-yes abcl 1> /dev/null 2> $LOG
	cp /usr/share/abcl/abcl.jar $home/abcl.jar 1> /dev/null 2> $LOG


	time_stop


}

f_lisp

# SWI-Prolog
f_prolog () {

	echo -n "    - Installing Prolog (SwiProlog) ... "

	timelapsed &

	apt-get install -y --force-yes swipl 1> /dev/null 2> $LOG

	time_stop

}

f_python


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

}


# Server
f_server () {

f_sqlite3 () {

	echo -n "[*] Installing Sqlite ... "

	timelapsed &

	apt-get install -y --force -yes sqlite3 1> /dev/null 2> $LOG

	time_stop

}

f_sqlite3

f_mysql () {

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

f_mysql

}


# Pentest
f_pentest () {


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

}



#==============================================================================================================================#

f_install () {

	f_java

	f_repo

	f_axel

	f_dir

	# Programming
	f_programming_libraries
	f_programming_IDE
	f_programming_languages

	# Clean
	f_clean

}


#==============================================================================================================================#

# Menu
f_menu () {

rm -f /darkuntu.sh
cp $0 /darkuntu.sh

clear

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
		echo "2) Firefox"
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
pentest_fullactive=1
pentestdisactive=2
until [ $pentestcho == $pentestactive ] || [ $pentestcho == $pentestdisactive ]; do
	clear
	echo "Pentest Software Selection : "
	echo  ""
	echo "1) Install Pentest Software : "
	echo "3) If You Don't Wanna To Install Pentest Software "
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


f_install


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
