#!/usr/bin/python3

import os
import sys
import logging
from datetime import datetime
_base_dir = os.path.dirname(os.path.realpath(__file__))
_child_limit = 4  # max number of running child processes in parallel
# TOOL_LIST = ['z3-trau', 'cvc4', 'z3seq', 'z3str3']
# BENCHMARK_LIST = ['PyEx.8.0', 'full_str_int.8.0', 'cvc4-str-term', 'cvc4-str-pred', 'stringfuzz', 'aplas', 'Leetcode', 'JavaScript']
TOOL_LIST = ['cvc4']
BENCHMARK_LIST = ['PyEx_sat', 'PyEx_unsat', 'PyEx_todo', 'Kaluza_sat', 'Kaluza_unsat', 'Kaluza_todo',
                  'full_str_int_sat', 'full_str_int_unsat', 'full_str_int_todo',
                  'cvc4-str_sat', 'cvc4-str_unsat', 'cvc4-str_todo', 'slog_sat', 'slog_unsat',
                  'stringfuzz_sat', 'stringfuzz_unsat', 'stringfuzz_todo',
                  'aplas_sat', 'aplas_unsat', 'aplas_todo', 'Leetcode_sat', 'Leetcode_unsat', 'Leetcode_todo']


def run_cmds_in_parallel(cmds=[]):  # cmds: list of 3-tuples
    logging.info("Total number of commands: " + str(len(cmds)))
    if len(cmds) == 0:
        return

    children = []
    for cmd in cmds:
        # Check if maximum number of child processes is reached. If yes, wait one to terminate.
        while len(children) >= _child_limit:
            p = os.wait()
            logging.info("terminated process: " + str(p[0]))
            if p[0] in children:
                children.remove(p[0])

        child = os.fork()
        if child:  # parent
            children.append(child)
            logging.info("Child process forked: " + str(child) + ", cmd: " + cmd[0] +
                         ", total child processes: " + str(len(children)))
        else:  # child
            logging.info(cmd[0])
            if os.system(cmd[0]) != 0:
                logging.info("Failed: " + cmd[1] + " " + cmd[2])
            else:
                logging.info("Succeeded: " + cmd[1] + " " + cmd[2])
            os._exit(0)

    # wait for remaining children to terminate
    while len(children) > 0:
        p = os.wait()
        logging.info("terminated process: " + str(p[0]))
        if p[0] in children:
            children.remove(p[0])


def main(argv):
    test = len(argv) == 2 and sys.argv[1] == 'test'  # test

    # Collect commands of checking benchmarks
    tid = -1
    ae_date = datetime.today().strftime('%Y%m%d')
    ae_cmds = []  # a command is a tuple of (cmd, tool_name, benchmark_name)
    for benchmark_name in BENCHMARK_LIST:
        for tname in TOOL_LIST:
            ae_cmd = f'./check_benchmark -c={tname} -d={ae_date} {benchmark_name} > /dev/null'
            ae_cmds.append((ae_cmd, tname, benchmark_name))
    for tname in TOOL_LIST:
        ae_cmd = f'./check_benchmark -c={tname} -d={ae_date} -t=120 checkLuhn > /dev/null'
        ae_cmds.append((ae_cmd, tname, 'checkLuhn'))
    # Run ae_cmds
    if test:
        logging.info("Run benchmarks in parallel...[test]")
        run_cmds_in_parallel(ae_cmds[-8:-3]+ae_cmds[-2:-1])  # run cmds of last 8 tool-benchmark pairs
    else:
        logging.info("Run benchmarks in parallel...")
        run_cmds_in_parallel(ae_cmds)  # run cmds of all tool-benchmark pairs


if __name__ == '__main__':
    # set logging
    logging.basicConfig(stream=sys.stdout, level=logging.INFO, format='%(asctime)s %(message)s')
    # logging.getLogger().addHandler(logging.FileHandler(filename='ae_run.log', format='%(asctime)s %(message)s'))
    rootLogger = logging.getLogger()
    logFormatter = logging.Formatter('%(asctime)s %(message)s')
    fileHandler = logging.FileHandler("ae_run.log")
    fileHandler.setFormatter(logFormatter)
    fileHandler.setLevel(logging.INFO)
    rootLogger.addHandler(fileHandler)

    # Check if previous run exists
    ae_pid = str(os.getpid())
    ae_pidfile = f'{os.environ["HOME"]}/ae.pid'
    if os.path.isfile(ae_pidfile):
        logging.info(f'Previous ae.py ({str(ae_pid)}) is still running, skip this run.')
        logging.info(f'Remove {ae_pidfile} if previous run did not finish normally.')
        sys.exit()
    with open(ae_pidfile, 'w') as fp:
        fp.write(ae_pid)

    main(sys.argv)

    os.unlink(ae_pidfile)
    logging.info("=== That's All !!===")
