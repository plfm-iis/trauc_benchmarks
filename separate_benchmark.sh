#!/bin/bash
# This script is to separate a benchmark to unsat/sat/todo according to a checking log
# usage:
#  ./separate_benchmark ${benchmark} ${checking_log}
# Note:
#  This script is designed to be run at the root of the benchmark repository.
#  Make sure the ${behcnmark}_unsat, ${benchmark}_sat, and ${benchmark}_todo exist.
#      1. These directories are not necessary to be empty.
#      2. ${benchmark} does not have to be the same name as the benchmark in ${checking_log}.

echo "benchmarks to be separated: " ${1}
echo "with checking log: " ${2}
if [ ! -d "${1}_unsat" ] || [ ! -d "${1}_sat" ] || [ ! -d "${1}_todo" ]
then
    printf "\nError: Target directories (${1}_unsat/sat/todo) do not exist.\n"
    exit 1;
fi
read -n 1 -s -r -p "Press any key to start...."

mkdir ${1}_unsat
mkdir ${1}_sat
mkdir ${1}_todo

ST=0;

while IFS= read -r line
do
    if [ ${ST} == 1 ]
    then
        echo "log read: ${line}"
        IFS=", " read -r filename toolname result timed <<< ${line}
        if [ ${result} == 'unsat' ]
        then
            echo "Copying ${filename} to ${1}_unsat"
            cp --parents ${filename} ${1}_unsat
        elif [ ${result} == 'sat' ]
        then
            echo "Copying ${filename} to ${1}_sat"
            cp --parents ${filename} ${1}_sat
        else
            echo "Copying ${filename} to ${1}_todo"
            cp --parents ${filename} ${1}_todo
        fi
    elif [[ $line =~ "tool:" ]]
    then
        ST=${ST+1}
    fi
done < ${2}
exit 0
