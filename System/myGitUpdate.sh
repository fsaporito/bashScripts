#!/bin/bash

clear

for i in *
do

	echo "${i}"
	
	if [ -d "${i}" ]; then

		echo "${i} is a DIR :)"
		cd ${i}
		ls
		echo ""
		echo ""

		if [ "${i}" == "UniversityProjects" ]; then
		 			
			for j in *
			do	
				
				if [ -d "${j}" ]; then
					
					echo "University: ${j}"	
					echo "${j} is a DIR :)"
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