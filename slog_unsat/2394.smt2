(set-logic QF_S)
(set-option :strings-exp true)
(set-option :produce-models true)
(declare-fun sigmaStar_0 () String)
(declare-fun literal_3 () String)
(declare-fun x_2 () String)
(declare-fun epsilon () String)
(declare-fun literal_1 () String)
(declare-fun x_4 () String)
(declare-fun literal_5 () String)
(declare-fun x_6 () String)
(declare-fun literal_7 () String)
(declare-fun x_8 () String)
(assert (= literal_3 "\x3c\x69\x6d\x67\x20\x68\x73\x70\x61\x63\x65\x3d\x22\x31\x22\x20\x61\x6c\x74\x3d\x22"))
(assert (= epsilon ""))
(assert (= literal_1 "\x72\x65\x71\x75\x69\x72\x65\x73\x6b\x65\x79"))
(assert (or (= x_2 epsilon) (= x_2 literal_1)))
(assert (= x_4 (str.++ literal_3 x_2)))
(assert (= literal_5 "\x22\x20\x68\x65\x69\x67\x68\x74\x3d\x22\x31\x36\x22\x20\x77\x69\x64\x74\x68\x3d\x22\x31\x36\x22\x20\x62\x6f\x72\x64\x65\x72\x3d\x22\x30\x22\x20\x73\x72\x63\x3d\x22"))
(assert (= x_6 (str.++ x_4 literal_5)))
(assert (= literal_7 "\x2f\x69\x2f\x6b\x65\x79\x2e\x67\x69\x66\x22\x20\x2f\x3e\x3c\x2f\x61\x3e"))
(assert (= x_8 (str.++ x_6 literal_7)))
(assert (str.in.re x_8 (re.++ (re.* re.allchar) (re.++ (str.to.re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(get-model)