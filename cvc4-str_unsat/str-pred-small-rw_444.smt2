(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.prefixof "B" (str.substr "A" 0 z)) false)))
(check-sat)