(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.replace y (str.replace y y x) "B") (str.replace x x (str.replace y x "B")))))
(check-sat)