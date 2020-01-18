(declare-fun ip_str () String)
(declare-fun _EXTEND_VAR_0 () String)


(assert (not ( = ( str.len ip_str  ) 0  )))
(assert (not ( < 1 3  )))
(assert (= _EXTEND_VAR_0 ip_str))


(check-sat)


(get-value (ip_str))