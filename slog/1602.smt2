(set-logic QF_S)
(set-option :strings-exp true)
(set-option :produce-models true)
(declare-fun sigmaStar_0 () String)
(declare-fun sigmaStar_1 () String)
(declare-fun literal_13 () String)
(assert (= literal_13 "\x3c\x61\x20\x74\x69\x74\x6c\x65\x3d\x5c\x22\x73\x65\x65\x6d\x6f\x72\x65\x64\x65\x74\x61\x69\x6c\x5c\x22\x20\x68\x72\x65\x66\x3d\x5c\x22\x72\x65\x70\x6f\x72\x74\x2e\x70\x68\x70\x3f\x61\x63\x74\x69\x6f\x6e\x3d\x71\x75\x65\x73\x74\x69\x6f\x6e\x26\x61\x6d\x70\x3b\x69\x64\x3d\x69\x64\x26\x61\x6d\x70\x3b\x71\x69\x64\x3d\x5c\x22\x3e"))
(assert (str.in.re literal_13 (re.++ (re.* re.allchar) (re.++ (str.to.re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(get-model)