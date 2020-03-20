#!/bin/bash

TOOL_LIST=('z3-trau' 'cvc4' 'z3seq' 'z3str3')
#BENCHMARK_LIST=('PyEx' 'aplas' 'Leetcode' 'stringfuzz' 'cvc4-str-pred' 'cvc4-str-term' 'full_str_int' 'checkLuhn')
#BENCHMARK_LIST=('PyEx' 'aplas' 'Leetcode' 'stringfuzz' 'cvc4-str-pred' 'cvc4-str-term' 'JavaScript')
BENCHMARK_LIST=('PyEx' 'aplas' 'Leetcode' 'stringfuzz')
STR_INT_SEP=('leetcode_int-' 'lib_int-')
CVC4_STR_SEP=('str-pred-' 'str-term-')

echo -n "" > ae.summary2
for tool in ${TOOL_LIST[*]}; do
    for bm in ${BENCHMARK_LIST[*]}; do
        echo "counting:" ${tool}-${bm}
        _sat=$(cat ${bm}*.${tool}.log | grep ', sat' | wc -l)
        _unsat=$(cat ${bm}*.${tool}.log | grep ', unsat' | wc -l)
        _unknown=$(cat ${bm}*.${tool}.log | grep ', unknown' | wc -l)
        _timeout=$(cat ${bm}*.${tool}.log | grep ', timeout' | wc -l)
        _error=$(cat ${bm}*.${tool}.log | grep ', error' | wc -l)
        _misc=$(cat ${bm}*.${tool}.log | grep ', ???' | wc -l)
        _wrong1=$(cat ${bm}*.${tool}.log | grep ', sat' | grep ${bm}_unsat/ | wc -l)
        _wrong2=$(cat ${bm}*.${tool}.log | grep ', unsat' | grep ${bm}_sat/ | wc -l)
        echo ${tool} ${bm} ${_sat} ${_unsat} ${_unknown} ${_timeout} $((${_error}+${_misc})) $((${_wrong1}+${_wrong2}))>> ae.summary2
    done
    for bm in ${CVC4_STR_SEP[*]}; do
        echo "counting:" ${tool}-cvc4-${bm}
        _sat=$(cat cvc4-str*.${tool}.log | grep ${bm} | grep ', sat' | wc -l)
        _unsat=$(cat cvc4-str*.${tool}.log | grep ${bm} | grep ', unsat' | wc -l)
        _unknown=$(cat cvc4-str*.${tool}.log | grep ${bm} | grep ', unknown' | wc -l)
        _timeout=$(cat cvc4-str*.${tool}.log | grep ${bm} | grep ', timeout' | wc -l)
        _error=$(cat cvc4-str*.${tool}.log | grep ${bm} | grep ', error' | wc -l)
        _misc=$(cat cvc4-str*.${tool}.log | grep ${bm} | grep ', misc' | wc -l)
        _wrong1=$(cat cvc4-str*.${tool}.log | grep ${bm} | grep ', sat' | grep cvc4-str_unsat/ | wc -l)
        _wrong2=$(cat cvc4-str*.${tool}.log | grep ${bm} | grep ', unsat' | grep cvc4-str_sat/ | wc -l)
        echo ${tool} ${bm} ${_sat} ${_unsat} ${_unknown} ${_timeout} $((${_error}+${_misc})) $((${_wrong1}+${_wrong2}))>> ae.summary2
    done
    for bm in ${STR_INT_SEP[*]}; do
        echo "counting:" ${tool}-full_str_int-${bm}
        _sat=$(cat full_str_int*.${tool}.log | grep ${bm} | grep ', sat' | wc -l)
        _unsat=$(cat full_str_int*.${tool}.log | grep ${bm} | grep ', unsat' | wc -l)
        _unknown=$(cat full_str_int*.${tool}.log | grep ${bm} | grep ', unknown' | wc -l)
        _timeout=$(cat full_str_int*.${tool}.log | grep ${bm} | grep ', timeout' | wc -l)
        _error=$(cat full_str_int*.${tool}.log | grep ${bm} | grep ', error' | wc -l)
        _misc=$(cat full_str_int*.${tool}.log | grep ${bm} | grep ', ???' | wc -l)
        _wrong1=$(cat full_str_int*.${tool}.log | grep ${bm} | grep ', sat' | grep full_str_int_unsat/ | wc -l)
        _wrong2=$(cat full_str_int*.${tool}.log | grep ${bm} | grep ', unsat' | grep full_str_int_sat/ | wc -l)
        echo ${tool} ${bm} ${_sat} ${_unsat} ${_unknown} ${_timeout} $((${_error}+${_misc})) $((${_wrong1}+${_wrong2}))>> ae.summary2
    done
done
#echo "counting: checkluhn"
#echo -n "" > ae.summary.checkLuhn
#for tool in ${TOOL_LIST[*]}; do
#    echo "checkLuhn ${tool}" >> ae.summary.checkLuhn
#    cat checkLuhn.*.${tool}.log | grep smt2 | cut -d' ' -f3,4 >> ae.summary.checkLuhn
#done
