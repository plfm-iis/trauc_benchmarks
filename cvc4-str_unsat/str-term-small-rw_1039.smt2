(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.replace (str.replace "" x "B") y "") (str.replace "" x (str.replace "B" y x)))))
(check-sat)