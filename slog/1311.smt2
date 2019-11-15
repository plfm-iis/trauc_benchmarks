(set-logic QF_S)
(set-option :strings-exp true)
(set-option :produce-models true)
(declare-fun sigmaStar_0 () String)
(declare-fun x_3 () String)
(declare-fun epsilon () String)
(declare-fun literal_2 () String)
(declare-fun literal_4 () String)
(declare-fun x_5 () String)
(assert (= epsilon ""))
(assert (= literal_2 "\x72\x61\x74\x69\x6e\x67\x73"))
(assert (or (= x_3 epsilon) (= x_3 literal_2)))
(assert (= literal_4 "\x3a\x20"))
(assert (= x_5 (str.++ x_3 literal_4)))
(assert (str.in.re x_5 (re.++ (re.* re.allchar) (re.++ (str.to.re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(get-model)