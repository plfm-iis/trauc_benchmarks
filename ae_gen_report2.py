#!/usr/bin/env python3

import sys
import os
from operator import add
TOOL_LIST_READ = ['z3-trau', 'cvc4', 'z3seq', 'z3str3']
TOOL_LIST_PRINT = ['z3trau', 'cvc4', 'z3seq', 'z3str3']
# BENCHMARK_LIST = ['PyEx', 'aplas', 'Leetcode', 'stringfuzz', 'cvc4-str-pred', 'cvc4-str-term']
# STR_INT_PARTS = ['leetcode_int-', 'lib_int-']
# JS_BENCHMARK = ['JavaScript']
BENCHMARK_LIST = ['PyEx', 'aplas', 'Leetcode', 'stringfuzz']
CVC4_STR_PARTS = ['str-pred-', 'str-term-']
STR_INT_PARTS = ['leetcode_int-', 'lib_int-']


def main(argv):
    with open('ae.summary2', 'r') as fp_report:
        reports = [r.split() for r in fp_report.readlines()]
    # for r in reports:
    #     print(r)
    # tool_names = list(set([r[0] for r in reports]))
    # benchmarks = list(set([r[1] for r in reports]))
    # print(TOOL_LIST)
    # print(BENCHMARK_LIST)

    # generate full table
    table = []
    for b in BENCHMARK_LIST + CVC4_STR_PARTS + STR_INT_PARTS:
        b_rows = []
        for t in TOOL_LIST_READ:
            # b_rows += [[int(r[2]), int(r[3]), int(r[4]), int(r[5]), int(r[6]), int(r[7])] for r in reports if
            #            (r[0] == t and r[1] == b)]
            b_rows += [[int(c) for c in r[2:]] for r in reports if (r[0] == t and r[1] == b)]
        # b_rows = [[r[0] for r in b_rows], [r[1] for r in b_rows], [r[2] for r in b_rows]]
        # print(b_rows)
        b_rows = [[r[i] for r in b_rows] for i in range(len(b_rows[0]))]
        # print(b_rows)
        table.append(b_rows)
    # print(table)

    table1 = table[:6]  # basic benchmarks
    table2 = table[6:]  # str-int benchmarks
    # print()
    # print(table1)
    # print()
    # print(table2)

    num_res = len(table1[0])
    num_tool = len(TOOL_LIST_READ)
    # add total sum to table1, table2
    b_rows1 = []
    b_rows2 = []
    for i in range(num_res):
        rows1 = []
        rows2 = []
        for j in range(num_tool):
            rows1.append(sum([r[j] for r in [rows[i] for rows in table1]]))
            rows2.append(sum([r[j] for r in [rows[i] for rows in table2]]))
        b_rows1.append(rows1)
        b_rows2.append(rows2)
    table1.append(b_rows1)
    table2.append(b_rows2)

    # print out table1 with format
    format_str = '{0:<13} {1:>7}|{2[0]:>6}|{2[1]:>6}|{2[2]:>6}|{2[3]:>6}'
    hline = '-'*50
    head_res = ['SAT', 'UNSAT', 'UNKNOWN', 'TIMEOUT', 'ERROR', 'WRONG']
    print('Table 1. Results of Basic String Benchmarks.')
    print(hline)
    print(format_str.format('', '', TOOL_LIST_PRINT))
    print(hline)
    row_heads1 = BENCHMARK_LIST + ['cvc4-str-pred', 'cvc4-str-term', 'TOTAL']
    for i in range(len(row_heads1)):
        head_benchmark = [[a] + ['' for k in range(num_res-1)] for a in row_heads1]
        for j in range(num_res):
            print(format_str.format(head_benchmark[i][j], head_res[j], table1[i][j]))
        print(hline)

    # print out table2 with format
    print()
    print('Table 2. Results of String-Number Conversion Benchmarks.')
    print(hline)
    print(format_str.format('', '', TOOL_LIST_PRINT))
    print(hline)
    # row_heads2 = ['Leetcode', 'Python-lib', 'JavaScript', 'TOTAL']
    row_heads2 = ['Leetcode', 'Python-lib', 'TOTAL']
    for i in range(len(row_heads2)):
        head_benchmark = [[a] + ['' for k in range(num_res-1)] for a in row_heads2]
        for j in range(num_res):
            print(format_str.format(head_benchmark[i][j], head_res[j], table2[i][j]))
        print(hline)

    # # Prepare checkLuhn table
    # with open('ae.summary.checkLuhn', 'r') as fp_report:
    #     reports = fp_report.read().splitlines()
    # table3 = []
    # t_col = []
    # for r in reports:
    #     # print(r)
    #     if 'checkLuhn' in r:
    #         if len(t_col) > 0:
    #             table3.append(t_col)
    #         t_col = []
    #     else:
    #         t_col.append(r)
    # table3.append(t_col)
    # # print(table3)
    # # print(table3[0])
    # # print(table3[0][0])
    # checkLuhn_table = []
    # for i in range(11):
    #     row = []
    #     for j in range(4):
    #         row.append(table3[j][i])
    #         # print(row)
    #     checkLuhn_table.append(row)
    # # print(checkLuhn_table)
    #
    # # print out checkLuhn table (table3) with format
    # print()
    # format_str = '{0:>10} |{1[0]:>20}|{1[1]:>20}|{1[2]:>20}|{1[3]:>20}'
    # hline = '-'*95
    # print('Table 3. Results of checkLuhn problems.')
    # print(hline)
    # print(format_str.format('# of Loops', TOOL_LIST))
    # print(hline)
    # row_heads3 = [n for n in range(2, 13)]
    # for i in range(11):
    #     print(format_str.format(row_heads3[i], checkLuhn_table[i]))


if __name__ == '__main__':
    main(sys.argv)

