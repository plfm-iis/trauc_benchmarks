(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.at (str.replace "B" x "") 0) (str.replace "B" x ""))))
(check-sat)