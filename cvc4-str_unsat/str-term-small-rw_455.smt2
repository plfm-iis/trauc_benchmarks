(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.replace x y (str.replace y y x)) (str.replace x y x))))
(check-sat)