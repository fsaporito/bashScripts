#!/bin/bash

clear

# Personal
Amotep="https://github.com/sapo93/amotep.git"
Bash="https://github.com/sapo93/bashScripts.git"
Dijkstra="https://github.com/sapo93/dijkstralog.git"
Euler="https://github.com/sapo93/EulerOdeSolver.git"
JADS="https://github.com/sapo93/JADS.git"
mathParser="https://github.com/sapo93/mathParser.git"
numC="https://github.com/sapo93/numC.git"
numDiploma="https://github.com/sapo93/num_diploma.git"
Octave="https://github.com/UniversityProjects/Octave.git"
OOL="https://github.com/sapo93/OOL.git"
ParallelR="https://github.com/sapo93/ParallelRandomGenerator.git"
TicTacToe="https://github.com/sapo93/TicTacToe.git"


# University
Algo="https://github.com/UniversityProjects/Algorithms.git"
Dist="https://github.com/UniversityProjects/DistributedSystems.git"
Prolog="https://github.com/UniversityProjects/Prolog.git"
ProgI="https://github.com/UniversityProjects/ProgrammingI.git"
ProgII="https://github.com/UniversityProjects/ProgrammingII.git"
RubyBio="https://github.com/UniversityProjects/rubyBio.git"



hash git &> /dev/null

if [ $? -eq 1 ]; then
    echo "Git Not Installed!!!"
    exit 0
fi

mkdir -p GitHub

cd GitHub

echo "###############################################"
echo "Amotep:"
git clone ${Amotep}

echo ""
echo ""
echo "##############################################"
echo "BashScripts:"
git clone ${Bash}

echo ""
echo ""
echo "##############################################"
echo "Dijkstra Prolog:"
git clone ${Dijkstra}

echo ""
echo ""
echo "##############################################"
echo "Euler:"
git clone ${Euler}

echo ""
echo ""
echo "##############################################"
echo "JADS:"
git clone ${JADS}

echo ""
echo ""
echo "##############################################"
echo "Math Parser:"
git clone ${mathParser}

echo ""
echo ""
echo "##############################################"
echo "numC:"
git clone ${numC}

echo ""
echo ""
echo "##############################################"
echo "numDiploma:"
git clone ${numDiploma}

echo ""
echo ""
echo "##############################################"
echo "Octave Scripts:"
git clone ${Octave}

echo ""
echo ""
echo "##############################################"
echo "Lisp OOL:"
git clone ${OOL}

echo ""
echo ""
echo "##############################################"
echo "Parallel Random Generator:"
git clone ${ParallelR}

echo ""
echo ""
echo "##############################################"
echo "Tic Tac Toe:"
git clone ${TicTacToe}


clear

mkdir UniversityProject

cd UniversityProject

echo ""
echo ""
echo "##############################################"
echo "University Projects:"
git clone ${Algo}
git clone ${Dist}
git clone ${ProgI}
git clone ${ProgII}
git clone ${RubyBio}

cd ..

cd ..
