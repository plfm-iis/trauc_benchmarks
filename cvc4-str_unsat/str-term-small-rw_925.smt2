(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.replace (str.at "A" z) "B" x) (str.at "A" z))))
(check-sat)