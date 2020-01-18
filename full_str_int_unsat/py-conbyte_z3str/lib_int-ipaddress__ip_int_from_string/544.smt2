(declare-fun ip_str () String)
(declare-fun _EXTEND_VAR_0 () String)
(declare-fun _EXTEND_VAR_1 () String)
(declare-fun _EXTEND_VAR_2 () String)


(assert (not ( = ( str.len _EXTEND_VAR_1  ) 0  )))

(assert (not ( > 3 ( + 8 1  )  )))

(assert (not ( str.contains _EXTEND_VAR_2 "."  )))

(assert (not ( < 3 3  )))

(assert (not ( = ( str.len ip_str  ) 0  )))
(assert ( not ( = 0 0  )  ))
(assert (= _EXTEND_VAR_0 ( str.substr ip_str 0 ( - ( str.indexof ip_str ":" 0  ) 0  )  )))
(assert (= _EXTEND_VAR_1 ( str.substr ( str.substr ip_str ( + ( str.indexof ip_str ":" 0  ) 1  ) ( - ( str.len ip_str  ) ( + ( str.indexof ip_str ":" 0  ) 1  )  )  ) 0 ( - ( str.indexof ( str.substr ip_str ( + ( str.indexof ip_str ":" 0  ) 1  ) ( - ( str.len ip_str  ) ( + ( str.indexof ip_str ":" 0  ) 1  )  )  ) ":" 0  ) 0  )  )))
(assert (= _EXTEND_VAR_2 ""))


(check-sat)


(get-value (ip_str))