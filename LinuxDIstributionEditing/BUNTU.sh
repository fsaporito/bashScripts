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
f_java_buntu () {

echo "[*] Java ..."

rm -f /etc/apt/sources.list
echo "# Repository Ubuntu trusty
deb http://it.archive.ubuntu.com/ubuntu/ trusty main restricted
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty main restricted
deb http://it.archive.ubuntu.com/ubuntu/ trusty universe
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty universe
deb http://it.archive.ubuntu.com/ubuntu/ trusty-updates universe
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty-updates universe
deb http://it.archive.ubuntu.com/ubuntu/ trusty multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty multiverse
deb http://it.archive.ubuntu.com/ubuntu/ trusty-updates multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty-updates multiverse
deb http://archive.canonical.com/ubuntu trusty partner
deb-src http://archive.canonical.com/ubuntu trusty partner
deb http://it.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu trusty-security main restricted
deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted
deb http://security.ubuntu.com/ubuntu trusty-security universe
deb-src http://security.ubuntu.com/ubuntu trusty-security universe
deb http://security.ubuntu.com/ubuntu trusty-security multiverse
deb-src http://security.ubuntu.com/ubuntu trusty-security multiverse
" >> /etc/apt/sources.list

echo "    - Apt-Get Update ... "
apt-get update 1> /dev/null 2> $LOG
echo "    - Installing Java ... "
apt-get install -y --force-yes sun-java7-jre 2> $LOG
apt-get install -y --force-yes sun-java7-jdk 2> $LOG

}


# Repository
f_repo_buntu () {

echo -n "[*] Repositories "

timelapsed &

echo ""

echo -n "    - Replacing Sources.list ... "

rm -f /etc/apt/sources.list
touch /etc/apt/sources.list
echo "# Repository Ubuntu trusty
deb http://it.archive.ubuntu.com/ubuntu/ trusty main restricted
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty main restricted
deb http://it.archive.ubuntu.com/ubuntu/ trusty universe
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty universe
deb http://it.archive.ubuntu.com/ubuntu/ trusty-updates universe
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty-updates universe
deb http://it.archive.ubuntu.com/ubuntu/ trusty multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty multiverse
deb http://it.archive.ubuntu.com/ubuntu/ trusty-updates multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty-updates multiverse
deb http://archive.canonical.com/ubuntu trusty partner
deb-src http://archive.canonical.com/ubuntu trusty partner
deb http://it.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu trusty-security main restricted
deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted
deb http://security.ubuntu.com/ubuntu trusty-security universe
deb-src http://security.ubuntu.com/ubuntu trusty-security universe
deb http://security.ubuntu.com/ubuntu trusty-security multiverse
deb-src http://security.ubuntu.com/ubuntu trusty-security multiverse


# Repository Mediubuntu
# wget -q http://packages.medibuntu.org/medibuntu-key.gpg -O- | apt-key add -
deb http://packages.medibuntu.org/ saucy free non-free
deb-src http://packages.medibuntu.org/ saucy free non-free

# Repository Tor
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 886DDD89
deb http://deb.torproject.org/torproject.org trusty main

# Repository GetDeb
# wget -q -O- http://archive.getdeb.net/getdeb-archive.key | apt-key add -
deb http://archive.getdeb.net/ubuntu trusty-getdeb apps
deb http://archive.getdeb.net/ubuntu trusty-getdeb games

# Repository Virtualbox
# wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
deb http://download.virtualbox.org/virtualbox/debian trusty non-free

# Repository AWN
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BF810CD5
deb http://ppa.launchpad.net/awn-testing/ppa/ubuntu saucy main

# Repository Roster Cogburn (Volumeicon)
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1A6FE5DF
deb http://ppa.launchpad.net/rstrcogburn/ppa/ubuntu lucid main
deb-src http://ppa.launchpad.net/rstrcogburn/ppa/ubuntu lucid main

# Repository Remastersys
deb http://www.geekconnection.org/remastersys/repository karmic/

" >> /etc/apt/sources.list


# Key Repository Mediubuntu
echo ""
echo -n "    - Downloading Mediuntu Keyserver ... "
wget -q http://packages.medibuntu.org/medibuntu-key.gpg -O- | apt-key add - 1> /dev/null

# Key Repository Tor
echo ""
echo -n "    - Downloading Tor Keyserver ... "
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 886DDD89 1> /dev/null 2> $LOG

# Key Repository GetDeb
echo ""
echo -n "    - Downloading GetDeb Keyserver ... "
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | apt-key add - 1> /dev/null

# Key Repository Virtualbox
echo ""
echo -n "    - Downloading Virtualbox Keyserver ... "
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add - 1> /dev/null 2> $LOG

# Key Repository AWN
echo ""
echo -n "    - Downloading Awn Keyserver ... "
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BF810CD5 1> /dev/null 2> $LOG

# Key Repository Roster Cogburn (Volumeicon)
echo ""
echo -n "    - Downloading Roster Cogburn Keyserver ... "
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1A6FE5DF 1> /dev/null 2> $LOG

# Conky Companions
echo ""
echo -n "    - Downloading Conky Companions PPA ... "
#apt-add-repository ppa:conky-companions 1> /dev/null

# Update
echo ""
echo -n "    - Updating Repositories ... "
apt-get update 1> /dev/null 2> $LOG

 # Upgrade
echo ""
echo -n "    - Upgrading ... "
apt-get upgrade -y --force-yes 1> /dev/null 2> $LOG
apt-get clean 1> /dev/null 2> $LOG
apt-get autoclean 1> /dev/null 2> $LOG

# Dist Upgrade
echo ""
echo -n "    - Dist-Upgrading ... "
apt-get dist-upgrade -y --force-yes 1> /dev/null 2> $LOG

# Autoremove + Clean
echo ""
echo -n "    - Autoremoving and Cleaning ... "
apt-get clean 1> /dev/null 2> $LOG
apt-get autoclean 1> /dev/null 2> $LOG
apt-get autoremove --purge -y --force-yes 1> /dev/null 2> $LOG

time_stop

}


# Axel Download Manager
f_axel_buntu_debian () {

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


# Programming IDE (eclipse | android SDK | anjuta | emacs| glade)
f_programming_IDE () {

echo "[*] Programming IDE"

# Eclipse  -> Java
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


# Android SDK  -> Android
f_android_SDK () {
	
	
	echo -n "    - Installing Android_SDK ... "

	axel http://dl.google.com/android/android-sdk_r22.3-linux.tgz 1> /dev/null
	
	tar xvfz android-sdk_r20-linux.tgz
	
	cd android-sdk-linux
	
	cd ..
	
	rm -f android-sdk_r20-linux.tgz
	
	cd $home
	
}

f_android_SDK &


sleep 3


# Anjuta  -> C / C++
f_anjuta () {

	echo -n "    - Installing Anjuta ... "

	timelapsed &
	
	apt-get install -y --force-yes g++ 1> /dev/null 2> $LOG # Compilatore C++
	
	apt-get install -y --force-yes anjuta 1> /dev/null 2> $LOG 
		
	time_stop


}


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


f_buntu


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
