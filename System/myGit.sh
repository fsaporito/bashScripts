#!/bin/bash

clear

#Personal
Bash="https://github.com/sapo93/bashScripts.git"
Dijkstra="https://github.com/sapo93/dijkstralog.git"
Euler="https://github.com/sapo93/EulerOdeSolver.git"
JADS="https://github.com/sapo93/JADS.git"
numC="https://github.com/sapo93/numC.git"
numDiploma="https://github.com/sapo93/num_diploma.git"
OOL="https://github.com/sapo93/OOL.git"
Parallel="https://github.com/sapo93/ParallelRandomGenerator.git"
TicTacToe="https://github.com/sapo93/TicTacToe.git"


#University
Algo="https://github.com/UniversityProjects/Algorithms.git"
Dist="https://github.com/UniversityProjects/DistributedSystems.git"
ProgI="https://github.com/UniversityProjects/ProgrammingI.git"
ProgII="https://github.com/UniversityProjects/ProgrammingII.git"



hash git &> /dev/null
if [ $? -eq 1 ]; then
    echo "Git Not Installed!!!"
    exit 0
fi

mkdir GitHub

cd GitHub

git clone ${Bash}
git clone ${Dijkstra}
git clone ${Euler}
git clone ${JADS}
git clone ${numC}
git clone ${numDiploma}
git clone ${OOL}
git clone ${Parallel}
git clone ${TicTacToe}


clear

mkdir UniversityProject

cd UniversityProject

git clone ${Algo}
git clone ${Dist}
git clone ${ProgI}
git clone ${ProgII}

cd ..

cd ..
