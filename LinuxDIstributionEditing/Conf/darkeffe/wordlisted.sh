#!/bin/bash

clear

# Lowerise
f_low () {

clear

cat $file | tr '[:upper:]' '[:lower:]' | sed -e 's/ *$//' | sort -u >> $out/$outname

echo "Your Wordlist is in $out/$outname"

}

# Capitalise
f_capitalise () {

clear

cat $file | tr '[:lower:]' '[:upper:]' | sed -e 's/ *$//' | sort -u >> $out/$outname

echo "Your Wordlist is in $out/$outname"

}

# Capitalise The First Letter
f_cap_first () {

clear

cat $file | sed -r 's/\b(.)/\U\1/g' | sed -e 's/ *$//' | sort -u >> $out/$outname

echo "Your Wordlist is in $out/$outname"

}

# Spaces to null
f_spaces_null () {

clear

cat $file | sed -e 's/ //g' | sed -e 's/ *$//' | sort -u >> $out/$outname

echo "Your Wordlist is in $out/$outname"

}

# Spaces to -
f_spaces_dash () {

clear

cat $file | sed -e 's/ /-/g' | sed -e 's/ *$//' | sort -u >> $out/$outname

echo "Your Wordlist is in $out/$outname"

}

# Spaces to _
f_spaces_underscore () {

clear

cat $file | sed -e 's/ /_/g' | sed -e 's/ *$//' | sort -u >> $out/$outname

echo "Your Wordlist is in $out/$outname"

}

# Spaces to return
f_spaces_return () {

clear

cat $file | tr ' ' '\012' | sed -e 's/ *$//' | sort -u >> $out/$outname

echo "Your Wordlist is in $out/$outname"

}

# Add A word at the beginning of every line
f_add_begin () {
	
clear

echo -en "Write the word that you want to add : "
read wordadd

cat $file | sed -e 's/^/'$wordadd'/' | sort -u >> $out/$outname

echo "Your Wordlist is in $out/$outname"

}

# Add A word at the end of every line
f_add_end () {
	
clear

echo -en "Write the word that you want to add : "
read wordadd

cat $file | sed -e 's/$/'$wordadd'/' | sort -u >> $out/$outname

echo "Your Wordlist is in $out/$outname"

}

# Numerise Beginning
f_num_begin () {

clear
echo -en "Insert The first Number of the sequence : "
read firstnum

clear
echo -en "Insert The last Number of the sequence : "
read lastnum

clear
echo -en "Insert the value of the difference beetwen the first and "
echo -en " the second number : "
read pass

sleep 5

until [ -d $tmp ]; do

	clear
	echo -en "Select the tmp dir (es: /tmp) : "
	read tmp

	if [ ! -d $tmp ]; then

		echo
		echo "The directory do not exist !!!!!!!!!!"
		sleep 2

	fi

done

clear

until [ $firstnum -gt $lastnum ]; do

	echo $firstnum
	
	cat $file | sed -e 's/^/'$firstnum'/' >> $tmp/$outname.tmp
	
	firstnum=$[ $firstnum + $pass ]
	
done

clear

echo "[*] Sorting Wordlist ..."
cat $tmp/$outname.tmp | sort -u >> $out/$outname

clear

( rm -f $tmp/$outname.tmp ) &

echo "Your Wordlist is in $out/$outname"

}

# Numerise End
f_num_end () {

clear
echo -en "Insert The first Number of the sequence : "
read firstnum

clear
echo -en "Insert The last Number of the sequence : "
read lastnum

clear
echo -en "Insert the value of the difference beetwen the first and "
echo -en " the second number : "
read pass

tmp = /pppppppppppppppppppp
until [ -d $tmp ]; do

	clear
	echo -en "Select the tmp dir (es: /tmp) : "
	read tmp

	if [ ! -d $tmp ]; then

		echo
		echo "The directory do not exist !!!!!!!!!!"
		sleep 2

	fi

done

clear

until [ $firstnum -gt $lastnum ]; do

	echo $firstnum
	
	cat $file | sed -e 's/$/'$firstnum'/' >> $tmp/$outname.tmp
	
	firstnum=$[ $firstnum + $pass ]
	
done

clear

echo "[*] Sorting Wordlist ..."
cat $tmp/$outname.tmp | sort -u >> $out/$outname

clear

( rm -f $tmp/$outname.tmp ) &

echo "Your Wordlist is in $out/$outname"


}

# All
f_all () {

until [ -d $tmp ]; do

	clear
	echo -en "Select the tmp dir (es: /tmp) : "
	read tmp

	if [ ! -d $tmp ]; then

		echo
		echo "The directory d not exist !!!!!!!!!!"
		sleep 2

	fi

done

clear

echo "[*] Lowerising Wordlist ... "
cat $file | tr '[:upper:]' '[:lower:]' | sed -e 's/ *$//' >> $tmp/lower.txt
echo

echo "[*] Capitalising Wordlist ... "
cat $file | tr '[:lower:]' '[:upper:]' | sed -e 's/ *$//' >> $tmp/capitalised.txt
echo

echo "[*] Capitalising The First Letter ... "
cat $file | sed -r 's/\b(.)/\U\1/g' | sed -e 's/ *$//' >> $tmp/firscapitalised.txt
echo

echo "[*] Merging the Wordlists ... "
cat $tmp/lower.txt $tmp/capitalised.txt $tmp/firscapitalised.txt | sort -u >> $tmp/wordlistedit1.txt
echo

echo "[*] Spaces To Null ... "
cat $tmp/wordlistedit1.txt | sed -e 's/ //g'>> $tmp/wordlistedit2.txt
echo

echo "[*] Spaces to Dash (-) ... "
cat $tmp/wordlistedit1.txt | sed -e 's/ /-/g' >> $tmp/wordlistedit3.txt
echo

echo "[*] Spaces to Underscore (_)... "
cat $tmp/wordlistedit1.txt | sed -e 's/ /_/g' >> $tmp/wordlistedit4.txt
echo

echo "[*] Spaces to Return ... "
cat $tmp/wordlistedit1.txt | tr ' ' '\012' >> $tmp/wordlistedit5.txt
echo

echo "[*] Creating $outname ... "
cat $tmp/wordlistedit1.txt $tmp/wordlistedit2.txt $tmp/wordlistedit3.txt $tmp/wordlistedit4.txt $tmp/wordlistedit5.txt | sort -u >> $out/$outname
echo

echo "[*] Deleting tmp files ... "
rm -f $tmp/lower.txt
rm -f $tmp/capitalised.txt
rm -f $tmp/firstcapitalised.txt
rm -f $tmp/wordlistedit1.txt
rm -f $tmp/wordlistedit2.txt
rm -f $tmp/wordlistedit3.txt
rm -f $tmp/wordlistedit4.txt
rm -f $tmp/wordlistedit5.txt
echo

clear

echo "Your Wordlist is in $out/$outname"

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

until [ $choice == $low ] || [ $choice == $cap ] || [ $choice == $capfirst ] || [ $choice == $spacenull ] || [ $choice == $spacedash ] || [ $choice == $spaceunderscore ] || [ $choice == $spacereturn ] || [ $choice == $wordbegin ] || [ $choice == $wordend ] || [ $choice == $numbegin ] || [ $choice == $numend ] || [ $choice == $all ]; do

clear

echo "Select an Options : 

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

"

echo -en "Selection : "
read choice

done

file=/bin/0

until [ -e $file ]; do

	clear
	echo -en "Select the input file path (es: /home/user/wordlist.txt) : "
	read file

	if [ ! -e $file ]; then

		echo
		echo "The file do not exist !!!!!!!"
		sleep 2

	fi

done

out=/ooooooooooooooooooooooooooo

until [ -d $out ]; do

	clear
	echo -en "Select the output dir (es: /home/user) : "
	read out

	if [ ! -d $out ]; then

		echo
		echo "The directory do not exist !!!!!!!"
		sleep 2

	fi

done

until [ ! -e $out/$outname ]; do

	clear
	echo -en "Select the output file name (es: wordlistedited.txt) : "
	read outname

	if [ -e $out/$outname ]; then

		echo
		echo "The file already exist !!!!!!!"
		sleep 2

	fi

done

if [ $choice == $low ]; then
	f_low
fi

if [ $choice == $cap ]; then
	f_capitalised
fi

if [ $choice == $capfirst ]; then
	f_cap_first
fi

if [ $choice == $spacenull ] ; then
	f_spaces_null
fi

if [ $choice == $spacedash ]; then
	f_space_dash
fi

if [ $choice == $spaceunderscore ]; then
	f_spacess_underscore
fi

if [ $choice == $spacereturn ]; then
	f_spaces_return
fi

if [ $choice == $wordbegin ]; then
	f_add_begin
fi

if [ $choice == $wordend ]; then
	f_add_end
fi

if [ $choice == $numbegin ]; then
	f_num_begin
fi

if [ $choice == $numend ]; then
	f_num_end
fi

if [ $choice == $all ]; then
	f_all
fi

}

f_menu
