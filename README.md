# TRAU BENCHMARKS

### Update March 14, 2020

Further separate todo benchmarks based on:
cvc4 : `3e7c4419a` (2020-03-12)
z3   : `a6fcdecfd` (2020-03-12)
Trau : `9831ad0cd` (2020-03-10)

timeout is set to max 30 sec. and 300 sec. to get sat/unsat as more as possible.

Strategy of separation:
1. Move cases to _sat/_unsat based on cvc4's log
2. Compare logs of z3 and Trau:
    - both sat or unsat : move to `_sat`/`_unsat`
    - only one sat or unsat (timout the other): move to `_sat`/`_unsat`
    - both timeout or inconsisent: stay in `_todo`
