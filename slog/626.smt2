(set-logic QF_S)
(set-option :strings-exp true)
(set-option :produce-models true)
(declare-fun sigmaStar_0 () String)
(declare-fun sigmaStar_1 () String)
(declare-fun sigmaStar_2 () String)
(declare-fun sigmaStar_3 () String)
(declare-fun literal_27 () String)
(assert (= literal_27 "\x3c\x63\x65\x6e\x74\x65\x72\x3e\x3c\x69\x6d\x67\x20\x73\x72\x63\x3d\x22\x2f\x63\x6f\x75\x72\x73\x65\x2f\x72\x65\x70\x6f\x72\x74\x2f\x73\x74\x61\x74\x73\x2f\x67\x72\x61\x70\x68\x2e\x70\x68\x70\x3f\x6d\x6f\x64\x65\x3d\x6d\x6f\x64\x65\x26\x63\x6f\x75\x72\x73\x65\x3d\x26\x74\x69\x6d\x65\x3d\x74\x69\x6d\x65\x26\x72\x65\x70\x6f\x72\x74\x3d\x72\x65\x70\x6f\x72\x74\x26\x75\x73\x65\x72\x69\x64\x3d\x75\x73\x65\x72\x69\x64\x22\x20\x2f\x3e\x3c\x2f\x63\x65\x6e\x74\x65\x72\x3e"))
(assert (str.in.re literal_27 (re.++ (re.* re.allchar) (re.++ (str.to.re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(get-model)