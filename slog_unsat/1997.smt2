(set-logic QF_S)
(set-option :strings-exp true)
(set-option :produce-models true)
(declare-fun sigmaStar_0 () String)
(declare-fun sigmaStar_1 () String)
(declare-fun sigmaStar_2 () String)
(declare-fun sigmaStar_3 () String)
(declare-fun sigmaStar_4 () String)
(declare-fun sigmaStar_14 () String)
(declare-fun x_21 () String)
(declare-fun epsilon () String)
(declare-fun literal_18 () String)
(declare-fun literal_11 () String)
(assert (= epsilon ""))
(assert (= literal_18 "\x71\x75\x65\x73\x74\x69\x6f\x6e\x5f\x63\x61\x74\x65\x67\x6f\x72\x69\x65\x73"))
(assert (= literal_11 "\x71\x75\x65\x73\x74\x69\x6f\x6e\x5f\x63\x61\x74\x65\x67\x6f\x72\x69\x65\x73"))
(assert (or (= x_21 epsilon) (= x_21 literal_18) (= x_21 literal_11)))
(assert (str.in.re x_21 (re.++ (re.* re.allchar) (re.++ (str.to.re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(get-model)