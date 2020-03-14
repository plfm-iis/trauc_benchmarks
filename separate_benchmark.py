#!/usr/bin/env python3

import sys
import os
from typing import List
_base_dir = os.path.dirname(os.path.realpath(__file__))
_SCORE = {'sat': 1, 'unsat': 10, 'unknown': 0, 'timeout': 0, 'error': 0, '???': 0}


def main(argv):
    # get arguments (two log files)
    assert(len(argv) == 3)
    filename1 = argv[1]
    filename2 = argv[2]

    with open(filename1, 'r') as fp1:
        log1 = fp1.readlines()

    with open(filename2, 'r') as fp2:
        log2 = fp2.readlines()

    # make sure two logs from the same benchmark but different tools
    assert(log1[0] == log2[0])  # same benchmark path
    assert(log1[3] != log2[3])  # different tools
    benchmark_path = log1[0].split()[1]
    fp_out = open(f'{benchmark_path[benchmark_path.rfind("/")+1:]}.{log1[3].split()[1]}.{log2[3].split()[1]}.log', 'w')
    fp_out.write(f'{log1[0]}')
    fp_out.write(f'{log1[1]}')
    fp_out.write(f'{log1[2]}')
    fp_out.write(f'{log1[3].strip()}#{log2[3].split()[1]}\n')
    assert(len(log1) == len(log2))  # same length
    log1 = log1[4:]  # ignore first 4 lines
    log2 = log2[4:]  # ignore first 4 lines

    files2sat = []
    files2unsat = []
    files2todo = []

    for i in range(len(log1)):
        [f1, c1, r1, t1] = [s.strip() for s in log1[i].split(',')]
        [f2, c2, r2, t2] = [s.strip() for s in log2[i].split(',')]
        assert(f1 == f2)
        score = _SCORE[r1] + _SCORE[r2]
        if score == 2 or score == 1:  # (sat,sat) or (sat, timeout)
            files2sat.append(f1)
            print(f'{f1}, {r1}({c1}) - {r2}({c2}) - SAT')
            fp_out.write(f'{f1}, {c1}#{c2}, sat, 000\n')
        elif score == 20 or score == 10:  # (unsat, unsat) or (unsat, timeout)
            files2unsat.append(f1)
            print(f'{f1}, {r1}({c1}) - {r2}({c2}) - UNSAT')
            fp_out.write(f'{f1}, {c1}#{c2}, unsat, 000\n')
        else:  # (timeout, timeout) or (sat, unsat)
            files2todo.append(f1)
            print(f'{f1}, {r1}({c1}) - {r2}({c2}) - TODO')
            fp_out.write(f'{f1}, {c1}#{c2}, timeout, 000\n')
    fp_out.close()


if __name__ == '__main__':
    main(sys.argv)

