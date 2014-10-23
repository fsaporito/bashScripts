#!/bin/bash

clear

DIR = ""


until test -d "${DIR}"
do
	
	echo -n "Input The GitHub Directory: "
	read DIR
	
	if [ -nd ${DIR}]; then
		
		echo "Error: Not A Directory!!!"
		
	fi
	
done
	


cd $DIR

for i in *
do

	echo "${i}"
	
	if [ -d "${i}" ]; then

		cd ${i}
		ls
		cho ""
		echo ""

		if [ "${i}" == "UniversityProjects" ]; then
		 			
			for j in *
			do	
				
				if [ -d "${j}" ]; then
					
					echo "University: ${j}"	
					cd ${j}
					ls
					echo ""
					echo ""
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

				fi

			done

		else		

			git pull
			cd ..

		fi

	fi
	
done

cd ..
