(set-logic QF_S)
(set-option :strings-exp true)
(set-option :produce-models true)
(declare-fun sigmaStar_0 () String)
(declare-fun sigmaStar_1 () String)
(declare-fun sigmaStar_2 () String)
(declare-fun sigmaStar_3 () String)
(declare-fun sigmaStar_4 () String)
(declare-fun sigmaStar_5 () String)
(declare-fun literal_6 () String)
(declare-fun x_7 () String)
(declare-fun literal_8 () String)
(declare-fun x_9 () String)
(declare-fun x_10 () String)
(declare-fun literal_12 () String)
(declare-fun x_14 () String)
(declare-fun literal_11 () String)
(declare-fun x_16 () String)
(declare-fun literal_18 () String)
(declare-fun x_19 () String)
(declare-fun literal_22 () String)
(declare-fun x_24 () String)
(declare-fun literal_23 () String)
(declare-fun x_26 () String)
(declare-fun literal_25 () String)
(declare-fun x_27 () String)
(declare-fun literal_28 () String)
(declare-fun x_29 () String)
(declare-fun x_30 () String)
(declare-fun x_31 () String)
(assert (= literal_6 "\x53\x45\x4c\x45\x43\x54\x20\x74\x61\x2e\x2a\x2c\x74\x61\x63\x2e\x2a\x20\x46\x52\x4f\x4d\x20"))
(assert (= x_7 (str.++ literal_6 sigmaStar_3)))
(assert (= literal_8 "\x61\x72\x74\x69\x63\x6c\x65\x73\x20\x74\x61\x0d\x0a\x09\x49\x4e\x4e\x45\x52\x20\x4a\x4f\x49\x4e\x20"))
(assert (= x_9 (str.++ x_7 literal_8)))
(assert (= x_10 (str.++ x_9 sigmaStar_5)))
(assert (= literal_12 "\x61\x72\x74\x69\x63\x6c\x65\x5f\x63\x61\x74\x73\x20\x74\x61\x63\x20\x4f\x4e\x20\x74\x61\x2e\x61\x72\x74\x69\x63\x6c\x65\x5f\x63\x61\x74\x3d\x74\x61\x63\x2e\x61\x72\x74\x69\x63\x6c\x65\x5f\x63\x61\x74\x5f\x69\x64\x0d\x0a\x09\x57\x48\x45\x52\x45\x20"))
(assert (= x_14 (str.++ x_10 literal_12)))
(assert (= literal_11 "\x61\x72\x74\x69\x63\x6c\x65\x5f\x63\x61\x74\x5f\x61\x63\x63\x65\x73\x73"))
(assert (= x_16 (str.++ x_14 literal_11)))
(assert (= literal_18 "\x20\x4f\x52\x44\x45\x52\x20\x42\x59\x20\x61\x72\x74\x69\x63\x6c\x65\x5f\x64\x61\x74\x65\x73\x74\x61\x6d\x70\x20\x44\x45\x53\x43\x20\x4c\x49\x4d\x49\x54\x20\x30\x2c\x35"))
(assert (= x_19 (str.++ x_16 literal_18)))
(assert (= literal_22 "\x3c\x69\x6d\x67\x20\x73\x72\x63\x3d\x27\x69\x6d\x61\x67\x65\x73\x2f\x62\x75\x6c\x6c\x65\x74\x2e\x67\x69\x66\x27\x20\x61\x6c\x74\x3d\x27\x27\x3e\x20\x3c\x61\x20\x68\x72\x65\x66\x3d\x27\x72\x65\x61\x64\x61\x72\x74\x69\x63\x6c\x65\x2e\x70\x68\x70\x3f\x61\x72\x74\x69\x63\x6c\x65\x5f\x69\x64\x3d"))
(assert (= x_24 (str.++ literal_22 x_19)))
(assert (= literal_23 "\x20\x63\x6c\x61\x73\x73\x3d\x73\x69\x64\x65\x27\x3e"))
(assert (= x_26 (str.++ literal_23 x_19)))
(assert (= literal_25 "\x27\x20\x74\x69\x74\x6c\x65\x3d\x27"))
(assert (= x_27 (str.++ x_24 literal_25)))
(assert (= literal_28 "\x3c\x2f\x61\x3e\x3c\x62\x72\x3e\x5c\x6e"))
(assert (= x_29 (str.++ x_26 literal_28)))
(assert (= x_30 (str.++ x_27 x_19)))
(assert (= x_31 (str.++ x_30 x_29)))
(assert (str.in.re x_31 (re.++ (re.* re.allchar) (re.++ (str.to.re "\x5c\x3c\x53\x43\x52\x49\x50\x54") (re.* re.allchar)))))
(check-sat)
(get-model)