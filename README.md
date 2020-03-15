# TRAU BENCHMARKS

### APLAS'18 paper (aplas benchmark reference)

Le Q.L., He M. (2018) A Decision Procedure for String Logic with Quadratic Equations, Regular Expressions and Length Constraints.
In: Ryu S. (eds) Programming Languages and Systems. APLAS 2018. Lecture Notes in Computer Science, vol 11275. Springer, Cham

### Update (March 14~16, 2020)

Further separate `_todo` benchmarks based on:
- cvc4 : `3e7c4419a` (2020-03-12)
- z3   : `a6fcdecfd` (2020-03-12)
- Trau : `9831ad0cd` (2020-03-10)

timeout is set to max 30 sec. and 300 sec. to get sat/unsat as more as possible.

Strategy of separation:
1. Move cases to _sat/_unsat based on cvc4's log
2. For the remaining cases, compare logs of z3 and Trau:
    - both sat/unsat : move to `_sat`/`_unsat`
    - only one sat/unsat (the other timeout or exception): move to `_sat`/`_unsat`
    - both timeout or inconsisent: stay in `_todo`
