(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.substr x 1 (str.indexof "B" y 1)) (str.at x (str.indexof "A" y 1)))))
(check-sat)