(set-logic QF_S)
(set-option :strings-exp true)
(set-option :produce-models true)
(declare-fun sigmaStar_0 () String)
(declare-fun literal_5 () String)
(declare-fun x_4 () String)
(declare-fun literal_2 () String)
(declare-fun literal_3 () String)
(declare-fun x_6 () String)
(declare-fun literal_7 () String)
(declare-fun x_9 () String)
(declare-fun x_10 () String)
(declare-fun literal_11 () String)
(declare-fun x_12 () String)
(assert (= literal_5 "\x2f"))
(assert (= literal_2 "\x77\x64\x69\x72"))
(assert (= literal_3 "\x2f"))
(assert (or (= x_4 literal_2) (= x_4 literal_3)))
(assert (= x_6 (str.++ literal_5 x_4)))
(assert (= literal_7 "\x20\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x5c\x22\x68\x69\x64\x64\x65\x6e\x5c\x22\x20\x6e\x61\x6d\x65\x3d\x5c\x22\x77\x64\x69\x72\x5c\x22\x20\x76\x61\x6c\x75\x65\x3d\x5c\x22"))
(assert (or (= x_9 literal_2) (= x_9 literal_3) (= x_9 x_6)))
(assert (= x_10 (str.++ literal_7 x_9)))
(assert (= literal_11 "\x5c\x22\x20\x2f\x3e"))
(assert (= x_12 (str.++ x_10 literal_11)))
(assert (str.in.re x_12 (re.++ (re.* re.allchar) (re.++ (str.to.re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(get-model)