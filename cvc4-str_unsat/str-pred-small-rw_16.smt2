(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.suffixof x (int.to.str 0)) (str.prefixof x (int.to.str 0)))))
(check-sat)
