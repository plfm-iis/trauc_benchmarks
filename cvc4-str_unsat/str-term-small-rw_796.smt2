(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.replace "B" (str.++ y x) "A") (str.replace "B" (str.++ x y) "A"))))
(check-sat)
