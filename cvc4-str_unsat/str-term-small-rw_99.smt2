(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.at (int.to.str 0) z) (int.to.str (str.indexof x x z)))))
(check-sat)