(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.contains (str.at x z) y) (str.prefixof y (str.at x z)))))
(check-sat)