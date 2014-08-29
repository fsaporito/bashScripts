#!/bin/bash

##Begin Functions##


##Sort a list in alphabetice order##

f_forwardsort () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read fsortin
echo
while [ ! -f $fsortin ]
do
                echo         
                echo "File cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read fsortin         

done
echo
echo -en "\nEnter the name of the output file: "
read fsortout
echo        
echo -en "\nHit return to proccess the file: "
read return    
if [ "$return" == "" ]; then
echo
/bin/cat $fsortin |sort > $fsortout
fi                  
cat $fsortout | while read line
do

        count=$[ $count + 1 ]
done
echo -e "\n$fsortout should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}   

##Sort a list in reverse alphabeticle order##

f_reversesort () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read rsortin
echo
while [ ! -f $rsortin ]
do
                echo
                echo "File cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read rsortin

done
echo
echo -en "\nEnter the name of the output file: "
read rsortout
echo
echo -en "\nHit return to proccess the file: "
read return
if [ "$return" == "" ]; then
echo
/bin/cat $rsortin |sort -r > $rsortout
fi
cat $rsortout | while read line
do

        count=$[ $count + 1 ]
done
echo -e "\n$rsortout should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}
 
##Remove all duplicate lines##

f_removedups () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read indups
echo
while [ ! -f $indups ]
do
                echo
                echo "File cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read indups

done
echo
echo -en "\nEnter the name of the output file: "
read outdups
echo
echo -en "\nHit return to proccess the file: "
read return
if [ "$return" == "" ]; then
echo
sed -n 'G; s/\n/&&/; /^\([ -~]*\n\).*\n\1/d; s/\n//; h; P' $indups > $outdups
fi  
cat $outdups | while read line
do         

        count=$[ $count + 1 ]
done
echo -e "\n$outdups should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}


##l33ting Section##

f_leet () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read leetin
echo
while [ ! -f $leetin ]
do
                echo
                echo "File cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read leetin

done
echo
echo -en "\nEnter the name of the output file: "
read leetout
echo
echo -e "\nPlease note that this will create a very large file"
echo
echo -en "\nHit return to leetify the file: "
read return
if [ "$return" == "" ]; then
echo
/bin/cat $leetin | /bin/egrep -v .\{20\} | awk '{c=0;for(i=1;i<=length;i++)if(substr($0,i,1)~/[AaBbEeGgIiLlOoSsTtZz]/)c++;if(c<6)print}' | leeting A 4 | leeting a 4 |leeting B 8 | leeting b 8 | leeting E 3 | leeting e 3 | leeting G 9 | leeting g 9 | leeting I 1 | leeting i 1 | leeting L 1 |leeting l 1 | leeting O 0 | leeting o 0 | leeting S 5 | leeting s 5 | leeting T 7 | leeting t 7 | leeting Z 2 | leeting z 2 > $leetout
fi
cat $leetout | while read line
do
        
        count=$[ $count + 1 ]
done
echo -e "\n$leetout should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}

##John rules Section##

f_rules () {	

echo	
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "	
read manglefile	
echo
while [ ! -f $manglefile ]
do
                echo
                echo "File cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read manglefile

done
echo	
echo -en "\nEnter the name of the output file: "	
read mangleout	
echo	
echo -e "\nPlease note that this will create a very large file"	
echo	
echo -e "\nThe rules option will mangle each word about 50 times"	
echo	
echo -en "\nHit return to mangle the file: "	
read return	
if [ "$return" == "" ]; then	
echo
/usr/sbin/john --rules -w:$manglefile -stdout:63  > $mangleout	
fi	
cat $mangleout | while read line	
do		
	count=$[ $count + 1 ]	
done	
echo -e "\n$mangleout should be located in the current directory"	
echo
echo "Returning to main menu ......"
sleep 2
echo
} 

##Remove begining white space##

f_beginwhite () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read inbeginwhite
echo
while [ ! -f $inbeginwhite ]
do
                echo
                echo "File cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read inbeginwhite

done
echo
echo -en "\nEnter the name of the output file: "
read outbeginwhite
echo
echo -en "\nHit return to proccess the file: "
read return
if [ "$return" == "" ]; then
echo
sed -e 's/^[ \t]*//' $inbeginwhite > $outbeginwhite
fi  
cat $outbeginwhite | while read line
do         

        count=$[ $count + 1 ]
done
echo -e "\n$outbeginwhite should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}

##strip all non ascii chars##

f_removenonascii () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read innonascii
echo
while [ ! -f $incontrolm ]
do
                echo            
                echo "File cannot be found or does not exist"
                echo         
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read innonascii

done
echo   
echo -en "\nEnter the name of the output file: "
read outnonascii
echo
echo -en "\nHit return to proccess the file: "
read return
if [ "$return" == "" ]; then
echo
/usr/bin/tr -cd '\11\12\40-\176' < $innonascii > $outnonascii
fi  
cat $outnonascii | while read line
do               

        count=$[ $count + 1 ]

done
echo -e "\n$outnonascii should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}

##Delete all lines that match a pattern##

f_deletepattern () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read inpattern
echo
while [ ! -f $inpattern ]
do
                echo            
                echo "File cannot be found or does not exist"
                echo         
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read inpattern

done
echo   
echo -en "\nEnter the name of the output file: "
read outpattern
echo
echo -en "\nEnter the pattern: "
read pattern 
echo
echo -en "\nHit return to proccess the file: "
read return
if [ "$return" == "" ]; then
echo
/bin/sed "/$pattern/d" $inpattern > $outpattern
fi  
cat $outpattern | while read line
do               

        count=$[ $count + 1 ]

done
echo -e "\n$outpattern should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}

##phone number crunch section##
function f_phonelist () {
        echo
        echo -e "\nLets set up some options:"
        echo
        echo -en "\nEnter the areacode to use: "
        read areacode
        echo
        echo -en "\nEnter a name for your output file: "
        read phonefile
        echo
        echo -e "\n\t1. 2125551234"
        echo -e "\n\t2. (212)5551234"
        echo -e "\n\t3. 212-555-1234"
        echo -e "\n\t4. (212)555-1234"
        echo -en "\n\tSelect an areacode format: "
        read phone
        echo
        echo -en "\nHit return to create the list: "
        read return
        if [ "$return" == "" ]; then
        echo -e "\nPlease wait while the list is being generated" 

        if [ "$phone" = "1" ]; then
               /pentest/passwords/crunch/crunch 10 10 1234567890 -t $areacode@@@@@@@ -o $phonefile
        elif [ "$phone" = "2" ]; then
                /pentest/passwords/crunch/crunch 12 12 1234567890 -t "($areacode)@@@@@@@" -o $phonefile
        elif [ "$phone" = "3" ]; then
                /pentest/passwords/crunch/crunch 12 12 1234567890 -t $areacode-@@@-@@@@ -o $phonefile
        elif [ "$phone" = "4" ]; then
                /pentest/passwords/crunch/crunch 13 13 1234567890 -t "($areacode)@@@-@@@@" -o $phonefile
        fi
        cat "$phonefile" | while read line
        do
                count=$[ $count + 1 ]
        done
        echo -e "\nFinished processing $phonefile"

        fi
         
}
 
##Delete comments##

f_removecomments () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read incomments
echo
while [ ! -f $incomments ]
do
                echo            
                echo "File cannot be found or does not exist"
                echo         
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read incomments

done
echo   
echo -en "\nEnter the name of the output file: "
read outcomments
echo
echo -en "\nHit return to proccess the file: "
read return
if [ "$return" == "" ]; then
echo
/bin/sed '1p; /^[[:blank:]]*#/d; s/[[:blank:]][[:blank:]]*#.*//' $incomments > $outcomments
fi  
cat $outcomments | while read line
do               

        count=$[ $count + 1 ]

done
echo -e "\n$outcomments should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}

##Specify a min and max password length##

f_minmax () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read minmaxin
echo
while [ ! -f $minmaxin ]
do
                echo         
                echo "File cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read minmaxin         

done
echo
echo -en "\nEnter the name of the output file: "
read minmaxout
echo        
echo
echo -en "\nEnter a minimum password length: "
read minlen
echo
echo
echo -en "\nEnter a maximum password length: "
read maxlen
echo

echo -en "\nHit return to proccess the file: "
read return    
if [ "$return" == "" ]; then
echo
pw-inspector -i $minmaxin -o $minmaxout -m $minlen -M $maxlen
fi                  
cat $minmaxout | while read line
do

        count=$[ $count + 1 ]
done
echo -e "\n$minmaxout should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}   

##full optimize##

f_full () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read passfile
echo
while [ ! -f $passfile ]
do
                echo
                echo "File cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read passfile

done
echo
echo -en "\nEnter the name of the output file: "
read passout
echo
echo
echo -en "\nEnter a minimum password length: "
read min
echo
echo
echo -en "\nEnter a maximum password length: "
read max
echo
echo -en "\nHit return to proccess the file: "
read return
if [ "$return" == "" ]; then
echo
echo "Removing duplicates from the file..."
cat $passfile |uniq > working.txt
echo
echo "Sorting the list..."
cat working.txt |sort > working2.txt
echo
echo "Deleting passwords which do not meet length requirment..."
pw-inspector -i working2.txt -o working3.txt -m $min -M $max
echo
echo "Removing all non ascii chars if they exist..."
/usr/bin/tr -cd '\11\12\40-\176' < working3.txt > working4.txt
echo
echo "Removing all comments..."
/bin/sed '1p; /^[[:blank:]]*#/d; s/[[:blank:]][[:blank:]]*#.*//' working4.txt > working5.txt
echo
echo "Removing any leading white spaces and tabs from the file..."
sed -e 's/^[ \t]*//' working5.txt > working6.txt
echo
echo "One more pass to sort and weed out the duplicates..."
cat working6.txt | sort | uniq > working7.txt
mv working7.txt $passout
echo
echo "Cleaning up the mess..."
rm -rf working*.txt
fi
cat $passout | while read line
do

        count=$[ $count + 1 ]
done
echo -e "\n$passout should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}


##wyd section##

function f_wyd () {
        
        echo
        echo -e "\nEnter the domain name of the website"
        echo -e "\nthat you would like to download and create"
        echo -en "\na password list from. ex. hatedomain.com: "
        read domain
        echo
        echo -en "\nEnter a name for your password file: "
        read wydfile
        echo -en "\nHit return to execute: "
        read return
        if [ "$return" == "" ]; then
                mkdir /tmp/TARGET
                cd /tmp/TARGET
                wget -r http://$domain
                cd /pentest/passwords/wyd
                perl wyd.pl -n -o ~/$wydfile /tmp/TARGET

        fi
        echo
        echo -e "\n$wydfile should be loacated in you home directory"

echo
echo "Returning to main menu ......"
sleep 2
echo
}

##Crunch Section##

function f_crunch () {
        echo
        echo -e "\nLets set up some options:"
        echo
        echo -en "\nEnter a minumum word length: "
        read min
        echo -en "\nEnter a maximum word length: "
        read max
        echo -en "\nEnter a set of characters: "
        read charset
        echo -en "\nEnter a name for your output file: "
        read output
        echo -e "\nYour wordlist will be generated with the following options:\n"
        echo -e "Minimum word length= $min\n"
        echo -e "Maximum word length= $max\n"
        echo -e "Using the characters= $charset\n"
        echo -e "The file will be named $output\n"
        echo -e "and located in the $PWD directory\n"
        echo -en "Hit return to create the list: "
        read return
        if [ "$return" = "" ]; then
                echo -e "\nPlease wait while you list is being generated"

                /pentest/passwords/crunch/crunch "$min" "$max" "$charset" > "$output"

        cat $output | while read line
        do
                
                count=$[ $count + 1 ]
        done
        echo -e "\nFinished processing $output"
        fi
        echo
        echo "Returning to main menu ......"
        sleep 2
        echo
}  

##CUPP##

function f_cupp () {
        echo
        echo -en "Hit return to launch the CUPP interactive tool: "
        read return
        if [ "$return" = "" ]; then
                cd /pentest/passwords/cupp; python cupp.py -i

                

        fi
        echo
        echo "The file will be located in the /pentest/passwords/cupp directory"
        echo
        echo "Returning to main menu ......"
        sleep 2
        echo
}  

##Combine all text files in a directory##

f_combine () {

echo
echo -en "\nEnter the full path to the directory that contains the text files to merge: (ex. /home/loser/): "
read path
echo
while [ ! -d $path ]
do
                echo
                echo "Directory cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the directory that contains the files to merge: (ex. /home/loser/):"
                read path

done
echo
echo -en "\nEnter the name of the output file: "
read dictout
echo
echo -en "\nHit return to create the file: "
read return
if [ "$return" == "" ]; then
echo
cat $path/*.* > $dictout
fi
cat $dictout | while read line
do
        count=$[ $count + 1 ]
done
echo -e "\n$dictout should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}


##Split a large text file into  smaller files##

f_split () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read insplit
echo
while [ ! -f $insplit ]
do
                echo
                echo "File cannot be found or does not exist"
                echo
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read insplit

done
echo
echo -en "\nEnter the number of lines for each of the split files: "
read lines
echo
echo -en "\nEnter the name of the output directory: "
read outdir
echo
echo -en "\nHit return to proccess the file: "
read return
if [ "$return" == "" ]; then
echo
mkdir $outdir
echo
echo "creating $outdir..."
echo
split -l $lines $insplit $outdir/part
fi  
cat $outdir/part* | while read line
do         

        count=$[ $count + 1 ]
done
echo -e "\nThe split files are located in the $outdir"
echo
echo "Returning to main menu ......"
sleep 2
echo
}

##Capitalize the first letter of every word in a file##
f_capital () {

echo
echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt): "
read incapital
echo
while [ ! -f $incapital ]
do
                echo            
                echo "File cannot be found or does not exist"
                echo         
                echo -en "\nEnter the full path to the password file: (ex. /home/loser/password.txt):"
                read incapital

done
echo   
echo -en "\nEnter the name of the output file: "
read outcapital
echo
echo -en "\nHit return to proccess the file: "
read return
if [ "$return" == "" ]; then
echo
sed -r 's/\b(.)/\U\1/g' $incapital > $outcapital
fi  
cat $outcapital | while read line
do               

        count=$[ $count + 1 ]

done
echo -e "\n$outcapital should be located in the current directory"
echo
echo "Returning to main menu ......"
sleep 2
echo
}


##Begin Menu & Loop Forever

while :

do

cat << !

---------------- W O R D L I S T  T O O L S  M E N U --------------------
|                                                                       |
|                              V.2                                      |
|                          By Purehate                                  |
|                                                                       |
| 1. Run the entire otimization script                                  |
|                                                                       |
| 2. Sort a wordlist in alphabetical order                              |
|                                                                       |
| 3. Sort a wordlist in reverse alphabetical order                      |
|                                                                       |
| 4. Remove all duplicates form a wordlist                              |
|                                                                       |
| 5. Remove all whitespace from the begining of each line               |
|                                                                       |
| 6. Remove all non ascii chars from a wordlist                         |
|                                                                       |
| 7. Remove all comments from a wordlist (except first line)            |                    
|                                                                       |
| 8. Specify a min and max password length in a wordlist                |
|                                                                       |
| 9. Manipulate a wordlist with the --rules fuction of john the ripper  |
|                                                                       |
| 10. L33tify a wordlist                                                |
|                                                                       |
| 11. Delete all lines that match a specific pattern from a file        |
|                                                                       |
| 12. Create a wordlist with crunch                                     |
|                                                                       |
| 13. Create a wordlist with wyd.pl                                     |
|                                                                       |
| 14. Create a wordlist wordlist with CUPP                              |
|                                                                       |
| 15. Create a wordlist based on phonenumbers                           | 
|                                                                       |
| 16. Combine a directory full of files into one big list               |
|                                                                       |
| 17. Split a large text file into smaller files                        |
|                                                                       |
| 18. Capitalize the first letter of each line in a file                |
|                                                                       |
| 19. Quit                                                              |
-------------------------------------------------------------------------
!
echo
echo
echo -n " Select a operation from the menu: "

read choice

case $choice in

1) f_full ;;

2) f_forwardsort ;;

3) f_reversesort ;;

4) f_removedups ;;

5) f_beginwhite ;;

6) f_removenonascii ;;

7) f_removecomments ;;

8) f_minmax ;;

9) f_rules ;;

10) f_leet ;;

11) f_deletepattern ;;

12) f_crunch ;;

13) f_wyd ;;

14) f_cupp ;;

15) f_phonelist ;;

16) f_combine ;;

17) f_split ;;

18) f_capital ;;

19) exit ;;

*) echo "\"$choice\" is not valid "; sleep 2 ;;

esac

done

