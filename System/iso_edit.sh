#!/bin/bash


clear

echo "]*] This program lets you edit a system linux live ISO"
echo ""

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo ""
echo ""

echo -n "Enter The Iso Path (es : /home/user/) : "
read isopath

echo -n "Enter The Iso Name (es: pask.iso) : "
read isoname

echo -n "Enter The Modified Iso Name (es edited.iso) : "
read editedisoname

clear
echo "[*] Installing Uck ..."
apt-get install -y --force-yes uck 1> /dev/null 2> /dev/null

echo ""
echo -n "[*] Scompatting $isoname ..."
timelapsed &
uck-remaster-unpack-iso ${isopath}/${isoname} 1> /dev/null 2> /dev/null


echo "Now You Will Enter The Chrooted Iso, when you finish enter : "
echo "update-initramfs -u"
echo "exit"

sleep 10

uck-remaster-chroot-rootfs

clear

echo "[*] Adjusting Files ..."
rm -f ~/tmp/remaster-iso/casper/initrd.lz 1> /dev/null 2> /dev/null
cp ~/tmp/remaster-root/boot/initrd.img-* ~/tmp/remaster-iso/casper/initrd.gz 1> /dev/null 2> /dev/null
cp ~/tmp/remaster-root/boot/vmlinuz-* ~/tmp/remaster-iso/casper/vmlinuz 1> /dev/null 2> /dev/null
uck-remaster-pack-rootfs -c 1> /dev/null 2> /dev/null

echo ""
echo -n "[*] Creating The Edited Iso Image ..."
timelapsed &
uck-remaster-pack-iso ${isopath}/${editedisoname} 1> /dev/null 2> /dev/null

clear

echo "Your Edited Iso Is In ${isopath}/${editedisoname}"

sleep 2

exit 0

