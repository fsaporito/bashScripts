#!/bin/bash
clear

( perl /opt/nikto-2.1.4/nikto.pl -update ) &

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

f_aircrack_ng_cuda () {

cd /opt
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

cd /opt
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
echo "default_storage = sqlite:///pyrit.db" >> config
echo "limit_ncpus = 0" >> config
echo "rpc_announce = true" >> config
echo "rpc_announce_broadcast" = false >> config
echo "rpc_knownclients =" >> config
echo "rpc_server = false" >> config
echo "workunit_size = 75000" >> config
cd $HOME
cd /opt/pyrit_svn
cd cpyrit_cuda
python setup.py build
python setup.py install
cd ..
cd $HOME

}

f_pyrit_cuda

f_airoscript () {

cd /opt
rm -fr airoscript-ng
svn co http://trac.aircrack-ng.org/svn/branch/airoscript-ng/ airoscript-ng
cd airoscript-ng
make
cd ..
cd $HOME

}

( f_airoscript ) &

f_hexor_base () { 
	
cd /opt
mkdir -p Database

cd Database

rm -f hexorbase
svn checkout http://hexorbase.googlecode.com/svn/HexorBase/ hexorbase

cd $HOME

}

f_hexor_base

f_metasploit () {

cd /opt
rm -fr metasploit
svn co http://metasploit.com/svn/framework3/trunk/ metasploit
cd $HOME
msfupdate

}

( f_metasploit ) &

f_set () {

cd /opt
rm -f set
svn co http://svn.secmaniac.com/social_engineering_toolkit set/
cd $HOME

}

f_set

f_openvas () {

cd /opt
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
openvas-mkcert-client -n darkeffe -i  # linking User "darkeffe" With Certificates [Creating The Key]
openvassd  # Start Openvas Scanner
openvasmd --rebuild  # Initialise The Database
kill all openvassd
cd $HOME
rm -f omp.config
touch omp.config
echo "[Connection]" >> omp.config
echo "host=localhost" >> omp.config
echo "port=9390" >> omp.config
echo "username=darkeffe" >> omp.config
echo "password=darkeffe" >> omp.config
cd $HOME

}

f_openvas

f_nmap () {
	
cd /opt
rm -fr nmap
svn co --username guest --password "" svn://svn.insecure.org/nmap/.
cd nmap
./configure
make
make install
cd ..
rm -fr nmap
cd $HOME

}

f_nmap
