#!/bin/bash

clear

until test -d "$DIR"
do
	
	echo -n "Input The GitHub Directory: "
	read DIR
	
done
	


cd $DIR

for i in *
do

	echo "$i"
	
	if [ -d $i ]; then
	
		cd $i
		git pull
		cd ..
	fi
	
done

cd ..
