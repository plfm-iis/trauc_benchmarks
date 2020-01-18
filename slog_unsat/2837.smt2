(set-logic QF_S)
(set-option :strings-exp true)
(set-option :produce-models true)
(declare-fun literal_0 () String)
(declare-fun x_1 () String)
(declare-fun epsilon () String)
(declare-fun x_2 () String)
(declare-fun literal_3 () String)
(declare-fun x_4 () String)
(assert (= literal_0 "\x2f\x65\x6e\x72\x6f\x6c\x2f"))
(assert (= epsilon ""))
(assert (or (= x_1 epsilon)))
(assert (= x_2 (str.++ literal_0 x_1)))
(assert (= literal_3 "\x2f\x65\x6e\x72\x6f\x6c\x2e\x70\x68\x70"))
(assert (= x_4 (str.++ x_2 literal_3)))
(assert (str.in.re x_4 (re.++ (re.* re.allchar) (re.++ (str.to.re "\x2f\x65\x76\x69\x6c") (re.* re.allchar)))))
(check-sat)
(get-model)