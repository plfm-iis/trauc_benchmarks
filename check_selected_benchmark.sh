#!/bin/bash
# usage:
#  ./check_all_benchmark ${tool_name}
# tool_name available: trauc, z3-trau, z3seq, z3str3, cvc4, abc, ostrich, trauplus
# Modify the benchmark list to customize tests
#BM_LIST=('full_str_int' 'filtered_str_int' 'cvc4-str-term' 'cvc4-str-pred' 'stringfuzz' 'str_2' 'slog' 'Leetcode' 'PyEx_unsat' 'PyEx_sat' 'PyEx_todo' 'Kaluza_unsat' 'Kaluza_sat' 'Kaluza_todo')
BM_LIST=('full_str_int' 'cvc4-str-term' 'cvc4-str-pred' 'stringfuzz' 'str_2' 'Leetcode' 'PyEx_unsat' 'PyEx_sat' 'PyEx_todo') # for selected benchmark only

echo "benchmarks to be checked: " ${BM_LIST[*]}
read -n 1 -s -r -p "tool_name = ${1}... Press any key to start."

for bm in ${BM_LIST[*]}
do
    ./check_benchmark -c=${1} -t=30 ${bm}
done
