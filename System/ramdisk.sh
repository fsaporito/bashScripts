#!/bin/bash

URAND=/dev/urandom
RAMDISK=/mnt/.ramdisk
MAPPER=/dev/mapper


# Ramisk Create
f_ramdisk_create () {

	clear

	echo -n "Inserisci La Dimensione Del RamDisk (KB) : "
	read SIZEKB

	echo -n "Inserisci La Dimensione Del RamDisk (MB) : "
	read SIZEMB

	echo -n "Inserisci Il Nome Del RamDisk (es: CRYPTDISK) : "
	read CRYPT

	echo ""

	echo "[*] Dir Generation ... "
	mkdir -p $RAMDISK
	mount -t ramfs none $RAMDISK -o maxsize=$SIZEKB # ramfs ---> don't swap on the hard drive
	chmod 777 $RAMDISK # permission to non root users to /read/write/execute

	echo "[*] File Container Generation ... "
	dd if=$URAND of=$RAMDISK/cryptainer bs=1M count=$SIZEMB 1> /dev/null 2> /dev/null # creating a file container and mounting it

	echo "[*] Mountig Loop Device ... "
	loop=$(sudo losetup -f | head -n 1) # finding the first loop device
	losetup $loop $RAMDISK/cryptainer  1> /dev/null 2> /dev/null # mount loop device to ramdisk

	echo "[*] Cryptation ... "
	cryptsetup create --cipher aes-xts-plain --key-size 512 $CRYPT $loop -d $URAND 1> /dev/null 2> /dev/null # criptazione con algoritmo AES-XTS e con chiave da 512b causale da /dev/urandom
	badblocks -swt random $MAPPER/$CRYPT 1> /dev/null 2> /dev/null # enhance entropy

	echo "[*] Mounting ... "
	mkfs.ext2 $MAPPER/$CRYPT # create filesystem
	mkdir /media/$CRYPT # create MountPoint
	mount $MAPPER/$CRYPT /mnt/$CRYPT # Mount RamDisk

	chmod 777 /media/$CRYPT # permission to non root users to /read/write/execute

	cd /media/$CRYPT

	rm -rf ./lost+found

	clear

	echo "/media/$CRYPT was created with success !!!!!"

	A=2
	until [ $A == "0" ] || [ $A == "1" ]; do
		echo ""
		echo "Now Press 0 If You Wanna Close The Programm"
		echo "Or Wait Until You Wanna Delete The Crypted RamDisk, And Press 1"
		echo ""
		echo -n "Choice : "
		read A
	done

	if [ $A == "0" ]; then
		exit 0
	fi

	if [ $A == "1" ]; then
		umount /media/$CRIPT # unmount the cryptdisk
		cryptsetup remove $CRYPT # remove the cryptdisk
		losetup -d $loop # unmount the loop device
		shred -ufv $RAMDISK/cryptainer # overwrite the cryptainer
		umount $RAMDISK # unmount the ramdisk
		rm -fr $RAMDISK # delete the ramdisk
		clear
		echo "/mnt/$CRYPT eliminato !!!!!"
		exit 0
	fi

}


# Ramdisk Delete
f_ramdisk_delete () {

	clear

	echo -n "Input the ramdisk name to delet (es: CRYPTDISK) : "
	read CRYPT

	umount /mnt/$CRIPT # unmount the cryptdisk
	cryptsetup remove $CRYPT # remove the cryptdisk
	losetup -d $loop # unmount the loop device
	shred -ufv $RAMDISK/cryptainer # overwrite the cryptainer
	umount $RAMDISK # unmount the ramdisk
	rm -fr $RAMDISK # delete the ramdisk

	clear

	echo "$CRYPT deleted !!!!!"

	exit 0
}


# Script As Root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Menu

rmdcreate=1
rmddelete=2
rmdcho=3

until [ ${rmdcho} == ${rmdcreate} ] || [ ${rmdcho} == ${rmddelete} ]; do
	
	clear
	
	echo "This Script Let You Word With Crypted RamDisk"
	echo ""
	echo "Select Operation : "
	echo ""
	echo "1) Create A RamDisk"
	echo "2) Delete An Esisting RamDisk"
	echo ""
	
	echo -n "Choice : "
	read rmdcho

done

case ${rmdcho} in

1) f_ramdisk_create ;;

2) f_ramdisk_delete ;;

esac


