(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.replace (str.replace x "B" "A") x "A") (str.replace (str.replace x "B" x) x "A"))))
(check-sat)