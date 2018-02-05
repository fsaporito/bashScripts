#!/bin/bash

clear

# Personal
Amotep="https://github.com/fsaporito/amotep.git"
Bash="https://github.com/fsaporito/bashScripts.git"
Dijkstra="https://github.com/fsaporito/dijkstralog.git"
Euler="https://github.com/fsaporito/EulerOdeSolver.git"
Hangman="https://github.com/fsaporito/hangman.git"
JADS="https://github.com/fsaporito/JADS.git"
JGMail="https://github.com/fsaporito/JGMail.git"
JnODE="https://github.com/fsaporito/JnODE.git"
mathParser="https://github.com/fsaporito/MathParser.git"
numC="https://github.com/fsaporito/numC.git"
numDiploma="https://github.com/fsaporito/num_diploma.git"
Octave="https://github.com/fsaporito/OctaveMatlab"
OOL="https://github.com/fsaporito/OOL.git"
ParallelR="https://github.com/fsaporito/ParallelRandomGenerator.git"
pyTriangle="https://github.com/fsaporito/pyTriangle.git"
RMplates="https://github.com/fsaporito/RMplates.git"
TicTacToe="https://github.com/fsaporito/TicTacToe.git"


# University
Algo="https://github.com/UniversityProjects/Algorithms.git"
BioC="https://github.com/UniversityProjects/2014-15.git"
Cineca_Parallel="https://github.com/UniversityProjects/Cineca_Parallel_Computing.git"
Dist="https://github.com/UniversityProjects/DistributedSystems.git"
FEM1="https://github.com/UniversityProjects/FEM1.git"
FEM2="https://github.com/UniversityProjects/FEM2.git"
Numerical="https://github.com/UniversityProjects/NumericalAnalysis.git"
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
echo "Hangman:"
git clone ${Hangman}

echo ""
echo ""
echo "##############################################"
echo "JADS:"
git clone ${JADS}

echo ""
echo ""
echo "##############################################"
echo "JADS:"
git clone ${JGMail}

echo ""
echo ""
echo "##############################################"
echo "JnODE:"
git clone ${JnODE}

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
echo "pyTriangle:"
git clone ${pyTriangle}

echo ""
echo ""
echo "##############################################"
echo "RM plates:"
git clone ${RMplates}


echo ""
echo ""
echo "##############################################"
echo "Tic Tac Toe:"
git clone ${TicTacToe}


clear

mkdir UniversityProjects

cd UniversityProjects


echo "##############################################"
echo "[University] Algorithms:"
git clone ${Algo}

echo ""
echo ""
echo "##############################################"
echo "[University] Bioinformatics Course Projects:"
git clone ${BioC}
cd 2014-15
cd karp-rabin
cd miller-rabin
git submodule init
git submodule update
cd ..
cd klib
git submodule init
git submodule update
cd ..
cd ..
cd ..


echo ""
echo ""
echo "##############################################"
echo "[University] Cineca Parallel Computing Course:"
git clone ${Cineca_Parallel}


echo ""
echo ""
echo "##############################################"
echo "[University] Distributed Systems:"
git clone ${Dist}


echo ""
echo ""
echo "##############################################"
echo "[University] FEM 1:"
git clone ${FEM1}

echo ""
echo ""
echo "##############################################"
echo "[University] FEM 2:"
git clone ${FEM2}

echo ""
echo ""
echo "##############################################"
echo "[University] Numerical:"
git clone ${Numerical}


echo ""
echo ""
echo "##############################################"
echo "[University] Programming I:"
git clone ${ProgI}

echo ""
echo ""
echo "##############################################"
echo "[University] Programming II:"
git clone ${ProgII}

echo ""
echo ""
echo "##############################################"
echo "[University] Ruby For Bioinformatics:"
git clone ${RubyBio}



cd ..

cd ..
