(set-logic QF_S)
(set-option :strings-exp true)
(set-option :produce-models true)
(declare-fun sigmaStar_0 () String)
(declare-fun literal_5 () String)
(assert (= literal_5 "\x0d\x0a\x3c\x69\x6e\x70\x75\x74\x20\x74\x79\x70\x65\x3d\x22\x68\x69\x64\x64\x65\x6e\x22\x20\x6e\x61\x6d\x65\x3d\x22\x63\x73\x73\x64\x6f\x74\x22\x20\x76\x61\x6c\x75\x65\x3d\x22\x72\x65\x64\x64\x6f\x74\x2e\x67\x69\x66\x22\x3e\x0d\x0a\x0d\x0a\x3c\x74\x61\x62\x6c\x65\x3e\x3c\x74\x72\x3e\x0d\x0a\x0d\x0a\x3c\x74\x64\x3e\x53\x68\x61\x70\x65\x3a\x3c\x2f\x74\x64\x3e\x3c\x74\x64\x3e\x3c\x73\x65\x6c\x65\x63\x74\x20\x6e\x61\x6d\x65\x3d\x22\x73\x68\x61\x70\x65\x22\x3e\x0d\x0a"))
(assert (str.in.re literal_5 (re.++ (re.* re.allchar) (re.++ (str.to.re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(get-model)