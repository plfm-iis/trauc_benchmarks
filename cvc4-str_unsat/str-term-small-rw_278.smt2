(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.substr x (str.indexof "B" y 1) z) (str.substr x (str.indexof "A" y 1) z))))
(check-sat)