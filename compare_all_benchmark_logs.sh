#!/bin/bash
# comapres all logs in current directory.
BM_LIST=('full_str_int' 'filtered_str_int' 'cvc4-str-term' 'cvc4-str-pred' 'stringfuzz' 'str_2' 'slog' 'Leetcode' 'PyEx_unsat' 'PyEx_sat' 'PyEx_todo' 'Kaluza_unsat' 'Kaluza_sat' 'Kaluza_todo')

#echo "benchmarks to be checked: " ${BM_LIST[*]}
#read -n 1 -s -r -p "tool_name = ${1}... Press any key to start."

for bm in ${BM_LIST[*]}
do
    compare_benchmark_logs ${bm}
done
