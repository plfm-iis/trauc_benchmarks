(set-logic QF_S)
(declare-fun x () String)
(declare-fun y () String)
(declare-fun z () Int)
(assert (not (= (str.suffixof (str.substr x z 1) x) (str.suffixof (str.at x z) x))))
(check-sat)
