(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.at "B" (str.len x)) (str.replace "" x "B"))))
(check-sat)
