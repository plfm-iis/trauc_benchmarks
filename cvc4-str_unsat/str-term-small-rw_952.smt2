(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.replace (str.++ x "B") "A" y) (str.++ (str.replace x "A" y) "B"))))
(check-sat)