#!/bin/bash

clear

DIR=""


until test -d "${DIR}"
do
	
	echo -n "Input The GitHub Directory: "
	read DIR
	
	if [ ! -d "${DIR}" ]; then
		
		echo "Error: Not A Directory!!!"
		
	fi
	
done
	


cd $DIR

for i in *
do

	echo "${i}"
	
	if [ -d "${i}" ]; then

		cd ${i}

		if [ "${i}" == "UniversityProjects" ]; then
		 			
			for j in *
			do	
				
				if [ -d "${j}" ]; then
					
					echo "University: ${j}"	
					cd ${j}
					git pull
					
					if [ "${i}" == "2014-15" ]; then
					
						cd karp-rabin
						cd miller-rabin
						git submodule update
						cd ..
						cd klib
						git submodule update
						cd ..
						cd ..
					
					fi

					cd ..
					
					echo ""
					echo ""

				fi

			done

		else		

			git pull
			cd ..
			
			echo ""
			echo ""

		fi

	fi
	
done

cd ..
